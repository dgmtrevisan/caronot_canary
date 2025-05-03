local teleportToCity = TalkAction("/city")

function teleportToCity.onSay(player, words, param)
	-- create log
	logCommand(player, words, param)

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return true
	end

	local town = Town(param) or Town(tonumber(param))
	if town then
		local inPz = player:getTile():hasFlag(TILESTATE_PROTECTIONZONE)
	    local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)
	    if not inPz and inFight then
            player:sendCancelMessage("You can't use travel in fight!")
			return true
	    end
		player:teleportTo(town:getTemplePosition())
	else
		player:sendCancelMessage("Town not found.")
	end
	return true
end

teleportToCity:separator(" ")
teleportToCity:groupType("normal")
teleportToCity:register()