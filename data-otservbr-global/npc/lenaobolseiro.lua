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
	{ itemName = "red wall hangings", clientId = 32166, buy = 1 },
	{ itemName = "green wall hangings", clientId = 32165, buy = 1 },
	{ itemName = "blue wall hangings", clientId = 32164, buy = 1 },
	{ itemName = "blank Zaoan panel", clientId = 37777, buy = 1 },
	{ itemName = "bale of yellowed cloth", clientId = 143, buy = 1 },
	{ itemName = "bale of white cloth", clientId = 142, buy = 1 },
	{ itemName = "observer tapestry", clientId = 38706, buy = 1 },
	{ itemName = "tapestry of honour", clientId = 37546, buy = 1 },
	{ itemName = "morbid tapestry", clientId = 34170, buy = 1 },
	{ itemName = "brocade tapestry", clientId = 23725, buy = 1 },
	{ itemName = "sword tapestry", clientId = 23724, buy = 1 },
	{ itemName = "golden dragon tapestry", clientId = 23723, buy = 1 },
	{ itemName = "all-seeing tapestry", clientId = 23450, buy = 1 },
	{ itemName = "menacing tapestry", clientId = 23449, buy = 1 },
	{ itemName = "lordly tapestry", clientId = 23448, buy = 1 },
	{ itemName = "rift tapestry", clientId = 22731, buy = 1 },
	{ itemName = "cake tapestry", clientId = 20350, buy = 1 },
	{ itemName = "snow flake tapestry", clientId = 20315, buy = 1 },
	{ itemName = "demonic tapestry", clientId = 20278, buy = 1 },
	{ itemName = "psychedelic tapestry", clientId = 20277, buy = 1 },
	{ itemName = "dragon tapestry", clientId = 10347, buy = 1 },
	{ itemName = "silky tapestry", clientId = 9046, buy = 1 },
	{ itemName = "royal tapestry", clientId = 9045, buy = 1 },
	{ itemName = "velvet tapestry", clientId = 8923, buy = 1 },
	{ itemName = "blue tapestry", clientId = 6433, buy = 1 },
	{ itemName = "pirate tapestry", clientId = 5615, buy = 1 },
	{ itemName = "white tapestry", clientId = 2667, buy = 1 },
	{ itemName = "blue tapestry", clientId = 2659, buy = 1 },
	{ itemName = "red tapestry", clientId = 2656, buy = 1 },
	{ itemName = "orange tapestry", clientId = 2653, buy = 1 },
	{ itemName = "yellow tapestry", clientId = 2650, buy = 1 },
	{ itemName = "green tapestry", clientId = 2647, buy = 1 },
	{ itemName = "purple tapestry", clientId = 2644, buy = 1 },
	{ itemName = "folded pink Tibia carpet", clientId = 37396, buy = 1 },
	{ itemName = "folded purple Tibia carpet", clientId = 37395, buy = 1 },
	{ itemName = "folded blue Tibia carpet", clientId = 37394, buy = 1 },
	{ itemName = "folded sky Tibia carpet", clientId = 37393, buy = 1 },
	{ itemName = "folded green Tibia carpet", clientId = 37392, buy = 1 },
	{ itemName = "folded yellow Tibia carpet", clientId = 37391, buy = 1 },
	{ itemName = "folded orange Tibia carpet", clientId = 37390, buy = 1 },
	{ itemName = "folded red Tibia carpet", clientId = 37382, buy = 1 },
	{ itemName = "folded pink cake carpet", clientId = 37380, buy = 1 },
	{ itemName = "folded purple cake carpet", clientId = 37379, buy = 1 },
	{ itemName = "folded blue cake carpet", clientId = 37378, buy = 1 },
	{ itemName = "folded sky cake carpet", clientId = 37377, buy = 1 },
	{ itemName = "folded green cake carpet", clientId = 37376, buy = 1 },
	{ itemName = "folded yellow cake carpet", clientId = 37375, buy = 1 },
	{ itemName = "folded orange cake carpet", clientId = 37374, buy = 1 },
	{ itemName = "folded red cake carpet", clientId = 37366, buy = 1 },
	{ itemName = "folded Orshabaal carpet", clientId = 37364, buy = 1 },
	{ itemName = "folded Ghazbaran carpet", clientId = 37362, buy = 1 },
	{ itemName = "folded Morgaroth carpet", clientId = 37360, buy = 1 },
	{ itemName = "folded elemental carpet", clientId = 37358, buy = 1 },
	{ itemName = "folded dragon carpet", clientId = 37357, buy = 1 },
	{ itemName = "folded dragon lord carpet", clientId = 37354, buy = 1 },
	{ itemName = "folded artefact carpet VI", clientId = 36956, buy = 1 },
	{ itemName = "folded artefact carpet V", clientId = 36955, buy = 1 },
	{ itemName = "folded artefact carpet IV", clientId = 36954, buy = 1 },
	{ itemName = "folded artefact carpet III", clientId = 36953, buy = 1 },
	{ itemName = "folded artefact carpet II", clientId = 36952, buy = 1 },
	{ itemName = "folded artefact carpet I", clientId = 36951, buy = 1 },
	{ itemName = "folded eldritch carpet", clientId = 36838, buy = 1 },
	{ itemName = "folded void carpet", clientId = 23536, buy = 1 },
	{ itemName = "folded rift carpet", clientId = 22737, buy = 1 },
	{ itemName = "rolled-up opulent carpet", clientId = 42340, buy = 1 },
	{ itemName = "rolled-up sublime tournament carpet", clientId = 31467, buy = 1 },
	{ itemName = "rolled-up tournament carpet", clientId = 31466, buy = 1 },
	{ itemName = "rolled-up wheat carpet", clientId = 26151, buy = 1 },
	{ itemName = "rolled-up mystic carpet", clientId = 26118, buy = 1 },
	{ itemName = "rolled-up shaggy carpet", clientId = 26116, buy = 1 },
	{ itemName = "rolled-up verdant carpet", clientId = 26114, buy = 1 },
	{ itemName = "rolled-up star carpet", clientId = 24423, buy = 1 },
	{ itemName = "rolled-up night sky carpet", clientId = 24422, buy = 1 },
	{ itemName = "rolled-up patterned carpet", clientId = 24421, buy = 1 },
	{ itemName = "rolled-up diamond carpet", clientId = 24420, buy = 1 },
	{ itemName = "rolled-up fur carpet", clientId = 24419, buy = 1 },
	{ itemName = "rolled-up striped carpet", clientId = 24418, buy = 1 },
	{ itemName = "rolled-up flowery carpet", clientId = 24417, buy = 1 },
	{ itemName = "rolled-up colourful carpet", clientId = 24416, buy = 1 },
	{ itemName = "rolled-up emerald carpet", clientId = 23711, buy = 1 },
	{ itemName = "rolled-up azure carpet", clientId = 23710, buy = 1 },
	{ itemName = "rolled-up crimson carpet", clientId = 23707, buy = 1 },
	{ itemName = "rolled-up bamboo mat", clientId = 23433, buy = 1 },
	{ itemName = "rolled-up white fur carpet", clientId = 23432, buy = 1 },
	{ itemName = "rolled-up yalaharian carpet", clientId = 23431, buy = 1 },
	{ itemName = "rolled-up parchment", clientId = 22706, buy = 1 },
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
