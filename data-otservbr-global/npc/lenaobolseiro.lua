local internalNpcName = "Lenao Bolseiro"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 1

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

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {	
	{ itemName = "blossom bag", clientId = 25780, buy = 1 },
	{ itemName = "feedbag", clientId = 21292, buy = 1 },
	{ itemName = "jewel case", clientId = 7527, buy = 1 },
	{ itemName = "jewel case", clientId = 6104, buy = 1 },
	{ itemName = "Zaoan chess box", clientId = 31282, buy = 1 },
	{ itemName = "Zaoan chess box", clientId = 18339, buy = 1 },
	{ itemName = "lilypad backpack", clientId = 39754, buy = 1 },
	{ itemName = "25 years backpack", clientId = 39693, buy = 1 },
	{ itemName = "changing backpack", clientId = 37536, buy = 1 },
	{ itemName = "raccoon backpack", clientId = 35577, buy = 1 },
	{ itemName = "ghost backpack", clientId = 32620, buy = 1 },
	{ itemName = "winged backpack", clientId = 31625, buy = 1 },
	{ itemName = "festive backpack", clientId = 30197, buy = 1 },
	{ itemName = "book backpack", clientId = 28571, buy = 1 },
	{ itemName = "birthday backpack", clientId = 24395, buy = 1 },
	{ itemName = "pillow backpack", clientId = 24393, buy = 1 },
	{ itemName = "energetic backpack", clientId = 23525, buy = 1 },
	{ itemName = "wolf backpack", clientId = 22084, buy = 1 },
	{ itemName = "war backpack", clientId = 21445, buy = 1 },
	{ itemName = "glooth backpack", clientId = 21295, buy = 1 },
	{ itemName = "cake backpack", clientId = 20347, buy = 1 },
	{ itemName = "pannier backpack", clientId = 19159, buy = 1 },
	{ itemName = "crystal backpack", clientId = 16100, buy = 1 },
	{ itemName = "mushroom backpack", clientId = 16099, buy = 1 },
	{ itemName = "anniversary backpack", clientId = 14674, buy = 1 },
	{ itemName = "buggy backpack", clientId = 14249, buy = 1 },
	{ itemName = "deepling backpack", clientId = 14248, buy = 1 },
	{ itemName = "santa backpack", clientId = 10346, buy = 1 },
	{ itemName = "minotaur backpack", clientId = 10327, buy = 1 },
	{ itemName = "dragon backpack", clientId = 10326, buy = 1 },
	{ itemName = "expedition backpack", clientId = 10324, buy = 1 },
	{ itemName = "heart backpack", clientId = 10202, buy = 1 },
	{ itemName = "crown backpack", clientId = 9605, buy = 1 },
	{ itemName = "moon backpack", clientId = 9604, buy = 1 },
	{ itemName = "orange backpack", clientId = 9602, buy = 1 },
	{ itemName = "demon backpack", clientId = 9601, buy = 1 },
	{ itemName = "brocade backpack", clientId = 8860, buy = 1 },
	{ itemName = "fur backpack", clientId = 7342, buy = 1 },
	{ itemName = "beach backpack", clientId = 5949, buy = 1 },
	{ itemName = "pirate backpack", clientId = 5926, buy = 1 },
	{ itemName = "jewelled backpack", clientId = 5801, buy = 1 },
	{ itemName = "backpack of holding", clientId = 3253, buy = 1 },
	{ itemName = "old and used backpack", clientId = 3244, buy = 1 },
	{ itemName = "camouflage backpack", clientId = 2872, buy = 1 },
	{ itemName = "golden backpack", clientId = 2871, buy = 1 },
	{ itemName = "grey backpack", clientId = 2870, buy = 1 },
	{ itemName = "blue backpack", clientId = 2869, buy = 1 },
	{ itemName = "purple backpack", clientId = 2868, buy = 1 },
	{ itemName = "red backpack", clientId = 2867, buy = 1 },
	{ itemName = "yellow backpack", clientId = 2866, buy = 1 },
	{ itemName = "green backpack", clientId = 2865, buy = 1 },
	{ itemName = "backpack", clientId = 2854, buy = 1 },
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
