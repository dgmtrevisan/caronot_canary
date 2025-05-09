local internalNpcName = "Lenao be Brave"
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

npcConfig.currency = 22516

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

addons = {
    ['citizen'] = {
        [1] = { outfit_female = 136, outfit_male = 128 },
        [2] = { outfit_female = 136, outfit_male = 128 },
    },
    ['hunter'] = {
        [1] = { outfit_female = 137, outfit_male = 129 },
        [2] = { outfit_female = 137, outfit_male = 129 },
    },
    ['knight'] = {
        [1] = { outfit_female = 139, outfit_male = 131 },
        [2] = { outfit_female = 139, outfit_male = 131 },
    },
    ['mage'] = {
        [1] = { outfit_female = 138, outfit_male = 130 },
        [2] = { outfit_female = 138, outfit_male = 130 },
    },
    ['summoner'] = {
        [1] = { outfit_female = 141, outfit_male = 133 },
        [2] = { outfit_female = 141, outfit_male = 133 },
    },
    ['barbarian'] = {
        [1] = { outfit_female = 147, outfit_male = 143 },
        [2] = { outfit_female = 147, outfit_male = 143 },
    },
    ['druid'] = {
        [1] = { outfit_female = 148, outfit_male = 144 },
        [2] = { outfit_female = 148, outfit_male = 144 },
    },
    ['nobleman'] = {
        [1] = { outfit_female = 140, outfit_male = 132 },
        [2] = { outfit_female = 140, outfit_male = 132 },
    },
    ['oriental'] = {
        [1] = { outfit_female = 150, outfit_male = 146 },
        [2] = { outfit_female = 150, outfit_male = 146 },
    },
    ['warrior'] = {
        [1] = { outfit_female = 142, outfit_male = 134 },
        [2] = { outfit_female = 142, outfit_male = 134 },
    },
    ['wizard'] = {
        [1] = { outfit_female = 149, outfit_male = 145 },
        [2] = { outfit_female = 149, outfit_male = 145 },
    },
    ['assassin'] = {
        [1] = { outfit_female = 156, outfit_male = 152 },
        [2] = { outfit_female = 156, outfit_male = 152 },
    },
    ['beggar'] = {
        [1] = { outfit_female = 157, outfit_male = 153 },
        [2] = { outfit_female = 157, outfit_male = 153 },
    },
    ['pirate'] = {
        [1] = { outfit_female = 155, outfit_male = 151 },
        [2] = { outfit_female = 155, outfit_male = 151 },
    },
    ['shaman'] = {
        [1] = { outfit_female = 158, outfit_male = 154 },
        [2] = { outfit_female = 158, outfit_male = 154 },
    },
    ['norseman'] = {
        [1] = { outfit_female = 252, outfit_male = 251 },
        [2] = { outfit_female = 252, outfit_male = 251 },
    },
}

gems = {
    ['lesser guardian gem'] = { item = 44602, price = 10 },
    ['guardian gem'] = { item = 44603, price = 20 },
    ['greater guardian gem'] = { item = 44604, price = 30 },
    ['lesser marksman gem'] = { item = 44605, price = 10 },
    ['marksman gem'] = { item = 44606, price = 20 },
    ['greater marksman gem'] = { item = 44607, price = 30 },
    ['lesser mystic gem'] = { item = 44611, price = 10 },
    ['mystic gem'] = { item = 44612, price = 20 },
    ['greater mystic gem'] = { item = 44613, price = 30 },
    ['lesser sage gem'] = { item = 44608, price = 10 },
    ['sage gem'] = { item = 44609, price = 20 },
    ['greater sage gem'] = { item = 44610, price = 30 },
}

local answerAddonType = {}
local answerGemType = {}
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

	if MsgContains(message, "addon") then
		npcHandler:say({ "I have this addons {Citizen}, {Hunter}, {Knight}, {Mage}, {Summoner}, {Barbarian}, {Druid}, {Nobleman}, {Oriental}, {Warrior}, {Wizard}, {Assassin}, {Beggar}, {Pirate}, {Shaman}, and {Norseman}. Make your choice, please!" }, npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif npcHandler:getTopic(playerId) == 1 then
		local addonType = addons[message:lower()]
		answerAddonType[playerId] = message:lower()
		if addonType then
            doPlayerAddOutfit(creature, addons[answerAddonType[playerId]][1].outfit_male, 1)
            doPlayerAddOutfit(creature, addons[answerAddonType[playerId]][2].outfit_male, 2)
            doPlayerAddOutfit(creature, addons[answerAddonType[playerId]][1].outfit_female, 1)
            doPlayerAddOutfit(creature, addons[answerAddonType[playerId]][2].outfit_female, 2)
			npcHandler:say("There it is.", npc, creature)
		end
    elseif MsgContains(message, "trade") then
		npcHandler:say({ "Do you want to {buy} or {sell} gems?" }, npc, creature)
		npcHandler:setTopic(playerId, 2)
    elseif npcHandler:getTopic(playerId) == 2 then
        if MsgContains(message, "buy") then
			npcHandler:say({ "I have this gems {Lesser Guardian Gem}, {Guardian Gem}, {Greater Guardian Gem}, {Lesser Marksman Gem}, {Marksman Gem}, {Greater Marksman Gem}, {Lesser Mystic Gem}, {Mystic Gem}, {Greater Mystic Gem}, {Lesser Sage Gem}, {Sage Gem} and {Greater Sage Gem}. Make your choice, please!" }, npc, creature)
		    npcHandler:setTopic(playerId, 3)
		elseif MsgContains(message, "sell") then
			npcHandler:say({ "I can buy these gems {Lesser Guardian Gem}, {Guardian Gem}, {Greater Guardian Gem}, {Lesser Marksman Gem}, {Marksman Gem}, {Greater Marksman Gem}, {Lesser Mystic Gem}, {Mystic Gem}, {Greater Mystic Gem}, {Lesser Sage Gem}, {Sage Gem} and {Greater Sage Gem}. Make your choice, please!" }, npc, creature)
		    npcHandler:setTopic(playerId, 4)
		end
	elseif npcHandler:getTopic(playerId) == 3 then
        local gemType = gems[message:lower()]
		answerGemType[playerId] = message:lower()
		if gemType then
            if player:getItemCount(npc:getCurrency()) >= gems[answerGemType[playerId]].price then
                player:addItem(gems[answerGemType[playerId]].item, 1)
                player:removeItem(npc:getCurrency(), gems[answerGemType[playerId]].price)
                npcHandler:say("There it is.", npc, creature)
                npcHandler:setTopic(playerId, 0)
            else
                npcHandler:say("I'm sorry but it seems you don't have enough " .. ItemType(npc:getCurrency()):getPluralName():lower() .. ". Bring me " .. gems[answerGemType[playerId]].price .. " of them and we'll make a trade.", npc, creature)
            end
		end
    elseif npcHandler:getTopic(playerId) == 4 then
        local gemType = gems[message:lower()]
        answerGemType[playerId] = message:lower()
        if gemType then
            if player:getItemCount(gems[answerGemType[playerId]].item) >= 1 then
                player:removeItem(gems[answerGemType[playerId]].item, 1)
                player:addItem(npc:getCurrency(), gems[answerGemType[playerId]].price)
                npcHandler:say("There it is.", npc, creature)
                npcHandler:setTopic(playerId, 0)
            else
                npcHandler:say("I'm sorry but it seems you don't have a " .. answerGemType[playerId] .. ". Bring me one of them and we'll make a trade.", npc, creature)
            end
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
