local internalNpcName = "King Caronot"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 332,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Eu tenho uma missão pra você! Me ajude e será recompensado.", yell = false },
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

	if MsgContains(message, "mission") then
		if player:getStorageValue(Storage.Quest.Caronot.TheFourGuardians.QuestLine) == -1 then			
			npcHandler:say({ "Four guardians in distant corners. Bring me their hearts, fragments of power, and your destiny will be reborn." }, npc, creature)
			player:setStorageValue(Storage.Quest.Caronot.TheFourGuardians.QuestLine, 1)
			player:setStorageValue(Storage.Quest.Caronot.TheFourGuardians.Firstheart, 1)
			player:setStorageValue(Storage.Quest.Caronot.TheFourGuardians.Secondheart, 1)
			player:setStorageValue(Storage.Quest.Caronot.TheFourGuardians.Thirdheart, 1)
			player:setStorageValue(Storage.Quest.Caronot.TheFourGuardians.Fourthheart, 1)
		elseif player:getStorageValue(Storage.Quest.Caronot.TheFourGuardians.QuestLine) == 1 then
			if player:getItemCount(44604) >= 1 and player:getItemCount(44607) >= 1 and player:getItemCount(44613) >= 1 and player:getItemCount(44610) >= 1 then
				npcHandler:say("You have managed to prove your worth. As a reward you can now use the big bald man's forge.", npc, creature)
				player:setStorageValue(Storage.Quest.Caronot.TheFourGuardians.Firstheart, 2)
				player:setStorageValue(Storage.Quest.Caronot.TheFourGuardians.Secondheart, 2)
				player:setStorageValue(Storage.Quest.Caronot.TheFourGuardians.Thirdheart, 2)
				player:setStorageValue(Storage.Quest.Caronot.TheFourGuardians.Fourthheart, 2)
                player:removeItem(44604, 1)
				player:removeItem(44607, 1)
				player:removeItem(44613, 1)
				player:removeItem(44610, 1)
                player:setStorageValue(Storage.Quest.Caronot.TheFourGuardians.QuestLine, 2)
                npcHandler:setTopic(playerId, 0)
            else
                npcHandler:say("You still haven't brought me the 4 hearts. I will just accept them all at once.", npc, creature)
				npcHandler:setTopic(playerId, 0)
            end
		elseif player:getStorageValue(Storage.Quest.Caronot.TheFourGuardians.QuestLine) == 2 then
			npcHandler:say("You have managed to prove your worth. As a reward you can now use the big bald man's forge.", npc, creature)
			npcHandler:setTopic(playerId, 0)
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