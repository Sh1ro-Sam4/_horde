itemstore.Language = {}

LANGUAGE = {}
include( "languages/" .. itemstore.config.Language .. ".lua" )
if SERVER then AddCSLuaFile( "languages/" .. itemstore.config.Language .. ".lua" ) end
itemstore.Language = LANGUAGE
LANGUAGE = nil

assert( itemstore.Language, "[ItemStore] Language not found" )

function itemstore.Translate( trans, ... )
	return string.format( itemstore.Language[ trans ] or trans, ... )
end