local internalNpcName = "Lenao de Osasco"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 99,
}

npcConfig.flags = {
	floorchange = false,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

-- Travel
local function addTravelKeyword(keyword, cost, destination, action)
	local travelKeyword = keywordHandler:addKeyword({ keyword }, StdModule.say, { npcHandler = npcHandler, text = "Do you seek a seek a passage to " .. keyword:titleCase() .. " for |TRAVELCOST|?", cost = cost, discount = "postman" })
	travelKeyword:addChildKeyword({ "yes" }, StdModule.travel, { npcHandler = npcHandler, premium = false, cost = cost, discount = "postman", destination = destination }, nil, action)
	travelKeyword:addChildKeyword({ "no" }, StdModule.say, { npcHandler = npcHandler, text = "We would like to serve you some time.", reset = true })
end

addTravelKeyword("venore", 1, Position(32954, 32022, 6), function(player)
	if player:getStorageValue(Storage.Quest.U7_24.ThePostmanMissions.Mission01) == 3 then
		player:setStorageValue(Storage.Quest.U7_24.ThePostmanMissions.Mission01, 4)
	end
end)
addTravelKeyword("ab'dendriel", 1, Position(32734, 31668, 6))
addTravelKeyword("edron", 1, Position(33175, 31764, 6))
addTravelKeyword("port hope", 1, Position(32527, 32784, 6))
addTravelKeyword("roshamuul", 1, Position(33494, 32567, 7))
addTravelKeyword("svargrond", 1, Position(32341, 31108, 6))
addTravelKeyword("liberty bay", 1, Position(32285, 32892, 6))
addTravelKeyword("yalahar", 1, Position(32816, 31272, 6))
addTravelKeyword("oramond", 1, Position(33479, 31985, 7))
addTravelKeyword("krailos", 1, Position(33492, 31712, 6))
addTravelKeyword("farmine", 1, Position(33025, 31553, 14))
addTravelKeyword("cormaya", 1, Position(33311, 31989, 15))
addTravelKeyword("gnomprona", 1, Position(33516, 32856, 14))
addTravelKeyword("issavi", 1, Position(33900, 31463, 6))
addTravelKeyword("gray island", 1, Position(33196, 31984, 7))
addTravelKeyword("treasure island", 1, Position(32346, 32625, 7))
addTravelKeyword("isle of the kings", 1, Position(32190, 31957, 6))
addTravelKeyword("ingol", 1, Position(33710, 32602, 6))
addTravelKeyword("goroma", 1, Position(32161, 32558, 6))
addTravelKeyword("ankrahmun", 1, Position(33092, 32883, 6))
addTravelKeyword("robsons isle", 1, Position(32527, 32036, 14))
addTravelKeyword("fenrock", 1, Position(32563, 31313, 7))
addTravelKeyword("mistrock", 1, Position(32640, 31439, 7))
addTravelKeyword("eremo", 1, Position(33314, 31883, 7))
addTravelKeyword("nargor", 1, Position(32024, 32813, 7))
addTravelKeyword("kazordoon", 1, Position(32659, 31957, 15))
addTravelKeyword("chazorai", 1, Position(33102, 31056, 7))
addTravelKeyword("tyrsung", 1, Position(32333, 31227, 7))
addTravelKeyword("Murcion hunt", 1, Position(33842, 31651, 13))
addTravelKeyword("Chagorz hunt", 1, Position(33809, 31815, 13))
addTravelKeyword("Ichgahal hunt", 1, Position(34101, 31678, 13))
addTravelKeyword("Vemiath hunt", 1, Position(34119, 31876, 14))

-- Kick
keywordHandler:addKeyword({ "kick" }, StdModule.kick, { npcHandler = npcHandler, destination = { Position(33174, 31773, 6), Position(33175, 31771, 6), Position(33177, 31772, 6) } })

-- Basic
keywordHandler:addKeyword({ "sail" }, StdModule.say, { npcHandler = npcHandler, text = "Where do you want to go? To {ab'dendriel}, {edron}, {venore}, {port hope}, {roshamuul}, {svargrond}, {liberty bay}, {yalahar}, {oramond}, {krailos}, {farmine}, {cormaya}, {gnomprona}, {issavi}, {gray island}, {treasure island}, {isle of the kings}, {ingol}, {goroma}, {ankrahmun}, {robsons isle}, {fenrock}, {mistrock}, {eremo}, {nargor}, {kazordoon}, {tyrsung}, {Murcion hunt}, {Chagorz hunt}, {Ichgahal hunt}, {Vemiath hunt} and {chazorai}?" })
keywordHandler:addKeyword({ "passage" }, StdModule.say, { npcHandler = npcHandler, text = "Where do you want to go? To {ab'dendriel}, {edron}, {venore}, {port hope}, {roshamuul}, {svargrond}, {liberty bay}, {yalahar}, {oramond}, {krailos}, {farmine}, {cormaya}, {gnomprona}, {issavi}, {gray island}, {treasure island}, {isle of the kings}, {ingol}, {goroma}, {ankrahmun}, {robsons isle}, {fenrock}, {mistrock}, {eremo}, {nargor}, {kazordoon}, {tyrsung}, {Murcion hunt}, {Chagorz hunt}, {Ichgahal hunt}, {Vemiath hunt} and {chazorai}?" })
npcHandler:setMessage(MESSAGE_GREET, "Welcome on board, |PLAYERNAME|. Where may I {sail} you today?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye. Recommend us if you were satisfied with our service.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye then.")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
