local internalNpcName = "Lenao Protein"
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

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

local products = {
	["blockade"] = {
		[1] = { id = 9641, amount = 20 },
		[2] = { id = 11703, amount = 25 },
		[3] = { id = 20199, amount = 25 },
	},
	["chop"] = {
		[1] = { id = 10196, amount = 20 },
		[2] = { id = 11447, amount = 25 },
		[3] = { id = 21200, amount = 20 },
	},
	["epiphany"] = {
		[1] = { id = 9635, amount = 25 },
		[2] = { id = 11452, amount = 15 },
		[3] = { id = 10309, amount = 15 },
	},
	["precision"] = {
		[1] = { id = 11464, amount = 25 },
		[2] = { id = 18994, amount = 20 },
		[3] = { id = 10298, amount = 10 },
	},
	["slash"] = {
		[1] = { id = 9691, amount = 25 },
		[2] = { id = 21202, amount = 25 },
		[3] = { id = 9654, amount = 5 },
	},
	["bash"] = {
		[1] = { id = 9657, amount = 20 },
		[2] = { id = 22189, amount = 15 },
		[3] = { id = 10405, amount = 10 },
	},
	["reap"] = {
		[1] = { id = 11484, amount = 25 },
		[2] = { id = 9647, amount = 20 },
		[3] = { id = 10420, amount = 5 },
	},
	["lectrify"] = {
		[1] = { id = 18993, amount = 25 },
		[2] = { id = 21975, amount = 5 },
		[3] = { id = 23508, amount = 1 },
	},
	["venom"] = {
		[1] = { id = 9686, amount = 25 },
		[2] = { id = 9640, amount = 20 },
		[3] = { id = 21194, amount = 2 },
	},
	["frost"] = {
		[1] = { id = 9661, amount = 25 },
		[2] = { id = 21801, amount = 10 },
		[3] = { id = 9650, amount = 5 },
	},
	["scorch"] = {
		[1] = { id = 9636, amount = 25 },
		[2] = { id = 5920, amount = 5 },
		[3] = { id = 5954, amount = 5 },
	},
	["cloud fabric"] = {
		[1] = { id = 9644, amount = 20 },
		[2] = { id = 14079, amount = 15 },
		[3] = { id = 9665, amount = 10 },
	},
	["demon presence"] = {
		[1] = { id = 9639, amount = 25 },
		[2] = { id = 9638, amount = 25 },
		[3] = { id = 10304, amount = 20 },
	},
	["dragon hide"] = {
		[1] = { id = 5877, amount = 20 },
		[2] = { id = 16131, amount = 10 },
		[3] = { id = 11658, amount = 5 },
	},
	["lich shroud"] = {
		[1] = { id = 11466, amount = 25 },
		[2] = { id = 22007, amount = 20 },
		[3] = { id = 9660, amount = 5 },
	},
	["quara scale"] = {
		[1] = { id = 10295, amount = 25 },
		[2] = { id = 10307, amount = 15 },
		[3] = { id = 14012, amount = 10 },
	},
	["snake skin"] = {
		[1] = { id = 17823, amount = 25 },
		[2] = { id = 9694, amount = 20 },
		[3] = { id = 11702, amount = 10 },
	},
	["featherweight"] = {
		[1] = { id = 25694, amount = 20 },
		[2] = { id = 25702, amount = 10 },
		[3] = { id = 20205, amount = 5 },
	},
	["strike"] = {
		[1] = { id = 11444, amount = 20 },
		[2] = { id = 10311, amount = 25 },
		[3] = { id = 22728, amount = 5 },
	},
	["swiftness"] = {
		[1] = { id = 17458, amount = 15 },
		[2] = { id = 10302, amount = 25 },
		[3] = { id = 14081, amount = 20 },
	},
	["vampirism"] = {
		[1] = { id = 9685, amount = 25 },
		[2] = { id = 9633, amount = 15 },
		[3] = { id = 9663, amount = 5 },
	},
	["vibrancy"] = {
		[1] = { id = 22053, amount = 20 },
		[2] = { id = 23507, amount = 15 },
		[3] = { id = 28567, amount = 5 },
	},
	["void"] = {
		[1] = { id = 11492, amount = 25 },
		[2] = { id = 20200, amount = 25 },
		[3] = { id = 22730, amount = 5 },
	},
}

local answerType = {}
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

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	npcHandler:setTopic(playerId, 0)
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "trade") then
		npcHandler:say({ "I have creature products for the imbuements {Blockade}, {Chop}, {Epiphany}, {Precision}, {Slash}, {Bash}, {Reap}, {Lectrify}, {Venom}, {Frost}, {Scorch}, {Cloud Fabric}, {Demon Presence}, {Dragon Hide}, {Lich Shroud}, {Quara Scale}, {Snake Skin}, {Featherweight}, {Strike}, {Swiftness}, {Vampirism}, {Vibrancy} and {Void}. Make your choice, please!" }, npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif npcHandler:getTopic(playerId) == 1 then
		local imbueType = products[message:lower()]
		answerType[playerId] = message:lower()
		if imbueType then
			player:addItem(products[answerType[playerId]][1].id, products[answerType[playerId]][1].amount)
			player:addItem(products[answerType[playerId]][2].id, products[answerType[playerId]][2].amount)
			player:addItem(products[answerType[playerId]][3].id, products[answerType[playerId]][3].amount)
			npcHandler:say("There it is.", npc, creature)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_SET_INTERACTION, onAddFocus)
npcHandler:setCallback(CALLBACK_REMOVE_INTERACTION, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, false)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
