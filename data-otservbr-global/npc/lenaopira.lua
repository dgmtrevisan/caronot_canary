local internalNpcName = "Lenao Pira"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 1

npcConfig.outfit = {
	lookType = 132,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 86,
	lookFeet = 114,
	lookAddons = 3,
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

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {	
	{ itemName = "sun catcher", clientId = 25977, buy = 1 },
	{ itemName = "starlight vial", clientId = 25976, buy = 1 },
	{ itemName = "scarab ocarina", clientId = 43740, buy = 1 },
	{ itemName = "moon mirror", clientId = 25975, buy = 1 },
	{ itemName = "lit torch", clientId = 34016, buy = 1 },
	{ itemName = "conch shell horn", clientId = 43863, buy = 1 },
	{ itemName = "bone fiddle", clientId = 28493, buy = 1 },
	{ itemName = "prismatic necklace", clientId = 16113, buy = 1 },
	{ itemName = "gill necklace", clientId = 16108, buy = 1 },
	{ itemName = "protection amulet", clientId = 3084, buy = 1 },
	{ itemName = "terra amulet", clientId = 814, buy = 1 },
	{ itemName = "strange talisman", clientId = 3045, buy = 1 },
	{ itemName = "silver amulet", clientId = 3054, buy = 1 },
	{ itemName = "magma amulet", clientId = 817, buy = 1 },
	{ itemName = "lightning pendant", clientId = 816, buy = 1 },
	{ itemName = "glacier amulet", clientId = 815, buy = 1 },
	{ itemName = "dragon necklace", clientId = 3085, buy = 1 },
	{ itemName = "bronze amulet", clientId = 3056, buy = 1 },
	{ itemName = "garlic necklace", clientId = 3083, buy = 1 },
	{ itemName = "necklace of the deep", clientId = 13990, buy = 1 },
	{ itemName = "elven amulet", clientId = 3082, buy = 1 },
	{ itemName = "glooth amulet", clientId = 21183, buy = 1 },
	{ itemName = "stone skin amulet", clientId = 3081, buy = 1 },
	{ itemName = "shockwave amulet", clientId = 9304, buy = 1 },
	{ itemName = "sacred tree amulet", clientId = 9302, buy = 1 },
	{ itemName = "leviathan's amulet", clientId = 9303, buy = 1 },
	{ itemName = "bonfire amulet", clientId = 9301, buy = 1 },
	{ itemName = "time ring", clientId = 3090, buy = 1 },
	{ itemName = "stealth ring", clientId = 3086, buy = 1 },
	{ itemName = "ring of healing", clientId = 3100, buy = 1 },
	{ itemName = "might ring", clientId = 3048, buy = 1 },
	{ itemName = "life ring", clientId = 3089, buy = 1 },
	{ itemName = "dwarven ring", clientId = 3099, buy = 1 },
	{ itemName = "ring of red plasma", clientId = 23534, buy = 1 },
	{ itemName = "collar of red plasma", clientId = 23528, buy = 1 },
	{ itemName = "ring of green plasma", clientId = 23532, buy = 1 },
	{ itemName = "collar of green plasma", clientId = 23527, buy = 1 },
	{ itemName = "ring of blue plasma", clientId = 23530, buy = 1 },
	{ itemName = "collar of blue plasma", clientId = 23526, buy = 1 },
	{ itemName = "sword ring", clientId = 3094, buy = 1 },
	{ itemName = "axe ring", clientId = 3095, buy = 1 },
	{ itemName = "club ring", clientId = 3096, buy = 1 },
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
