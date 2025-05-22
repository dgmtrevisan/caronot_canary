-- Usage talkaction: "!refill will refill all your amulets and rings for silver tokens"
local refill = TalkAction("!refill")

local chargeItem = {
	["pendulet"] = { noChargeID = 29429, ChargeID = 30344 },
	["sleep shawl"] = { noChargeID = 29428, ChargeID = 30342 },
	["blister ring"] = { noChargeID = 31621, ChargeID = 31557 },
	["theurgic amulet"] = { noChargeID = 30401, ChargeID = 30403 },
	["ring of souls"] = { noChargeID = 32636, ChargeID = 32621 },
	["turtle amulet"] = { noChargeID = 39235, ChargeID = 39233 },
	["spiritthorn ring"] = { noChargeID = 39179, ChargeID = 39177 },
	["alicorn ring"] = { noChargeID = 39182, ChargeID = 39180 },
	["arcanomancer sigil"] = { noChargeID = 39185, ChargeID = 39183 },
	["arboreal ring"] = { noChargeID = 39188, ChargeID = 39187 },
}

function refill.onSay(player, words, param)
	logger.debug("!refill executed")
	local refilledItems = {}
	for itemName, itemData in pairs(chargeItem) do
		local chargeableCount = player:getItemCount(itemData.noChargeID)
		if chargeableCount >= 1 then
			table.insert(refilledItems, itemName)
			player:removeItem(itemData.noChargeID, 1)
			player:addItem(itemData.ChargeID, 1)
		end
	end
	if #refilledItems == 0 then
		player:sendTextMessage(MESSAGE_LOOK, "You do not have any items to refill.")
	else
		local itemList = table.concat(refilledItems, ", ")
		player:sendTextMessage(MESSAGE_LOOK, "Refilled " .. itemList .. ".")
	end
	return true
end

refill:separator(" ")
refill:groupType("normal")
refill:register()
