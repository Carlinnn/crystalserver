local config = {
	items = {
		{ id = 35284, charges = 64400 },
		{ id = 35279, charges = 64400 },
		{ id = 35281, charges = 64400 },
		{ id = 35283, charges = 64400 },
		{ id = 35282, charges = 64400 },
		{ id = 35280, charges = 64400 },
		{ id = 44066, charges = 64400 },
		{ id = 50294, charges = 64400 },
	},
	storage = 70201, -- saves os.time() of last reward received
}

-- in-memory guard: prevents opening multiple modals before confirming
local pendingReward = {}

local function sendExerciseRewardModal(player)
	local playerId = player:getId()
	local window = ModalWindow({
		title = "Exercise Reward",
		message = "choose a item",
	})
	for _, it in pairs(config.items) do
		local iType = ItemType(it.id)
		if iType then
			window:addChoice(iType:getName(), function(player, button, choice)
				pendingReward[playerId] = nil

				if button.name ~= "Select" then
					return true
				end

				local inbox = player:getStoreInbox()
				local inboxItems = inbox:getItems()
				if inbox and #inboxItems < inbox:getMaxCapacity() and player:getFreeCapacity() >= iType:getWeight() then
					local item = inbox:addItem(it.id, it.charges)
					if item then
						item:setActionId(IMMOVABLE_ACTION_ID)
						item:setAttribute(ITEM_ATTRIBUTE_STORE, systemTime())
						item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, string.format("You won this exercise weapon as a reward to be a %s player. Use it in a dummy!\nHave a nice game..", configManager.getString(configKeys.SERVER_NAME)))
						player:setStorageValue(config.storage, os.time())
						player:sendTextMessage(MESSAGE_LOOK, string.format("Congratulations, you received a %s with %i charges in your store inbox.", iType:getName(), it.charges))
					else
						player:sendTextMessage(MESSAGE_LOOK, "You need to have capacity and empty slots to receive.")
					end
				else
					player:sendTextMessage(MESSAGE_LOOK, "You need to have capacity and empty slots to receive.")
				end
			end)
		end
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
end

local exerciseRewardModal = TalkAction("!reward")
function exerciseRewardModal.onSay(player, words, param)
	if not configManager.getBoolean(configKeys.TOGGLE_RECEIVE_REWARD) then
		return true
	end

	local lastUse = player:getStorageValue(config.storage)
	if lastUse > 0 then
		local remaining = (lastUse + 86400) - os.time()
		if remaining > 0 then
			local hours = math.floor(remaining / 3600)
			local minutes = math.floor((remaining % 3600) / 60)
			local seconds = remaining % 60
			player:sendTextMessage(MESSAGE_LOOK, string.format("You can use !reward again in %d hours, %d minutes and %d seconds.", hours, minutes, seconds))
			return true
		end
	end

	local playerId = player:getId()
	if pendingReward[playerId] then
		player:sendTextMessage(MESSAGE_LOOK, "You already have a reward window open.")
		return true
	end

	pendingReward[playerId] = true
	sendExerciseRewardModal(player)
	return true
end

exerciseRewardModal:separator(" ")
exerciseRewardModal:groupType("normal")
exerciseRewardModal:register()
