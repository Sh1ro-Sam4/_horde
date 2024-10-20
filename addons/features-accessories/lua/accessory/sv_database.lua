-- Configure your MySQL database here
SH_ACC.MySQLConfig = {
	host = "localhost",
	username = "root",
	password = "",
	database = "default",
	port = 3306,
}

-----------------

pcall(function()
	require("mysqloo")
	require("tmysql4")
end)

SH_ACC.TableName = "sh_accessory"

local DB_DEFAULT = 0
local DB_MYSQLOO = 1
local DB_TMYSQL4 = 2

local function db_mode()
	return SH_ACC.DatabaseMode
end

function SH_ACC:InitializeDB()
	local mode = db_mode()

	self:ConnectToDB(function(ok, err)
		if (mode == DB_MYSQLOO or mode == DB_TMYSQL4) then
			if (!ok) then
				MsgC(Color(52, 152, 219), "SH Accessories", Color(255, 0, 0), ": Failed to connect to MySQL database! (" .. err .. ")\n")
				return
			end

			MsgC(Color(52, 152, 219), "SH Accessories", Color(0, 255, 0), ": Connected to MySQL database!\n")
		else
			MsgC(Color(52, 152, 219), "SH Accessories", Color(0, 255, 0), ": Using sv.db for data.\n")
		end

		self:TableExists(self.TableName, function(exists)
			if (exists) then
				return end

			if (mode == DB_MYSQLOO or mode == DB_TMYSQL4) then
				self:Query("CREATE TABLE " .. self.TableName .. " ( id VARCHAR(50) PRIMARY KEY, inventory TEXT, equipped TEXT )")
			else
				self:Query("CREATE TABLE " .. self.TableName .. " ( id string, inventory string, equipped string )")
			end

			MsgC(Color(52, 152, 219), "SH Accessories", Color(0, 255, 0), ": Created " .. self.TableName .. " table.\n")
		end)
	end)
end

function SH_ACC:ConnectToDB(callback)
	local cfg = self.MySQLConfig

	callback = callback or function(ok, err) end

	local mode = db_mode()
	if (mode == DB_MYSQLOO) then
		local db = mysqloo.connect(cfg.host, cfg.username, cfg.password, cfg.database, cfg.port)
		db:setAutoReconnect(true)
		db:setMultiStatements(true)
		db.onConnected = function()
			callback(true)
		end
		db.onConnectionFailed = function(me, err)
			callback(false, err)
		end
		db:connect()
		_SH_ACC_DATABASE = db
	elseif (mode == DB_TMYSQL4) then
		local db, err = tmysql.initialize(cfg.host, cfg.username, cfg.password, cfg.database, 3306, nil, CLIENT_MULTI_STATEMENTS)
		if (db) then
			_SH_ACC_DATABASE = db
			callback(true)
		else
			callback(false, err)
		end
	else
		callback(true)
	end
end

function SH_ACC:Query(q, args, callback)
	callback = callback or function() end

	for k, v in pairs (args or {}) do
		if (type(v) == "Player" and IsValid(v)) then -- cast player into formatted steamid
			v = v:SteamID():Replace(":", "_"):sub(7)
		end

		q = q:Replace(":" .. k, self:EscapeString(v))
	end

	q = q:Replace(":db", self.TableName)

	self:ExecuteQuery(q, callback)
end

-- override me
function SH_ACC:TableExists(s, callback)
	local mode = db_mode()
	if (mode == DB_MYSQLOO or mode == DB_TMYSQL4) then
		self:Query("DESCRIBE " .. s, {}, function(data, ok)
			callback(ok)
			return true
		end)
	else
		callback(sql.TableExists(s))
	end
end

function SH_ACC:ExecuteQuery(query, callback)
	local mode = db_mode()
	if (mode == DB_MYSQLOO) then
		local q = _SH_ACC_DATABASE:query(query)
		q.onSuccess = function(me, data)
			callback(data, true)
		end
		q.onError = function(me, err, fq)
			local mute = callback(data, false)
			if (mute ~= true) then
				error("failed to run query '" .. query .. "' (" .. err .. ")")
			end
		end
		q:start()
	elseif (mode == DB_TMYSQL4) then
		_SH_ACC_DATABASE:Query(query, function(result)
			if (result[1]["status"]) then
				callback(result[1].data, true)
			else
				local mute = callback(result[1].data, false)
				if (mute ~= true) then
					error("failed to run query '" .. query .. "' (" .. result[1]["error"] .. ")")
				end
			end
		end, QUERY_FLAG_ASSOC)
	else
		local olderr = sql.m_strError
		local res = sql.Query(query)
		local err = sql.m_strError
		if (err and err ~= olderr) then
			error("failed to run query '" .. query .. "' (" .. err .. ")")
			return
		end

		if (callback) then
			callback(res)
		end
	end
end

function SH_ACC:EscapeString(s)
	local mode = db_mode()
	if (mode == DB_MYSQLOO) then
		return "\"" .. _SH_ACC_DATABASE:escape(s) .. "\""
	elseif (mode == DB_TMYSQL4) then
		return "\"" .. _SH_ACC_DATABASE:Escape(s) .. "\""
	else
		return sql.SQLStr(s)
	end
end

function SH_ACC:BeginCommit()
	local mode = db_mode()
	if (mode == DB_MYSQLOO or mode == DB_TMYSQL) then
		self:Query("BEGIN")
	else
		sql.Begin()
	end
end

function SH_ACC:FinishCommit()
	local mode = db_mode()
	if (mode == DB_MYSQLOO or mode == DB_TMYSQL) then
		self:Query("COMMIT")
	else
		sql.Commit()
	end
end