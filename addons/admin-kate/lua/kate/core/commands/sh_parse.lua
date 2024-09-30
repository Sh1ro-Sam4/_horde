function kate.SplitArgs( args )
  args = string.Trim( args )
  if string.len( args ) == 0 then
    return {}
  end

  return string.Explode( ' ', args )
end

function kate.ExplodeQuotes( str )
  str = ' ' .. str .. ' '

  local res = {}

  local i = 1
  while true do
    local si = string.find( str, '[^%s]', i )
    if si == nil then
      break
    end

    i = si + 1

    local quoted = string.match( string.sub( str, si, si ), '["\']' ) and true or false
    local fi = string.find( str, quoted and '["\']' or '[%s]', i )

    if fi == nil then
      break
    end

    local qstr = string.sub( str, quoted and ( si + 1 ) or si, fi - 1 )
    res[#res + 1] = qstr
  end

  return res
end

function kate.Parse( caller, cmdObj, argString )
  local cmdParams = cmdObj:GetParams()
  local args = kate.SplitArgs( argString )

  local parsedArgs = {}
  for k, v in ipairs( cmdParams ) do
    local paramObj = kate.Commands.StoredParams[v.Enum]

    if ( args[1] == nil ) and ( not v.Optional ) then
      hook.Run( 'Kate_OnCommandError', caller, cmdObj, 'ERROR_MISSING_PARAM', { k, paramObj:GetName() } )

      return false
    elseif args[1] ~= nil then
      local succ, value, used = paramObj:Parse( caller, cmdObj, args[1], args, k )
      if succ == false then
        hook.Run( 'Kate_OnCommandError', caller, cmdObj, value, used )

        return false
      end

      if hook.Run( 'Kate_CanParamParse', caller, cmdObj, v.Enum, value ) == false then
        return false
      end

      for _ = 1, ( used or 1 ) do
        table.remove( args, 1 )
      end

      parsedArgs[#parsedArgs + 1] = value
    end
  end

  return true, parsedArgs
end