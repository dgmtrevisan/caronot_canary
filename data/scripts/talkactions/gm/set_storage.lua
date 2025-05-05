local setstorage = TalkAction("/setstorage")

function setstorage.onSay(player, words, param)
	-- create log
	logCommand(player, words, param)

    local split = param:split(",")
    local storage = tonumber(split[1])
    local value = tonumber(split[2])

    if storage == "" then
		player:sendCancelMessage("Command storage required.")
		return true
	end

    if value == "" then
		player:sendCancelMessage("Command value required.")
		return true
	end

    for _, pid in ipairs(Game.getPlayers()) do
        pid:setStorageValue(storage, value)
    end

    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Storage seted.")

    return true
end

setstorage:separator(" ")
setstorage:groupType("gamemaster")
setstorage:register()