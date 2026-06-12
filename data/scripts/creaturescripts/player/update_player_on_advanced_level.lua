local rewardTable = {
	[{4, 8}] = { -- Knight / Elite Knight
		[200] = {
			items = {
				{ itemid = 10385, count = 1 }, -- zaoan helmet
				{ itemid = 13993, count = 1 }, -- ornate chestplate
				{ itemid = 3398,  count = 1 }, -- dwarven legs
				{ itemid = 13997, count = 1 }, -- depth calcei
				{ itemid = 23528, count = 1 }, -- collar of red plasma
				{ itemid = 23533, count = 1 }, -- ring of red plasma
				{ itemid = 27449, count = 1 }, -- blade of destruction (sword)
				{ itemid = 27451, count = 1 }, -- axe of destruction
				{ itemid = 27454, count = 1 }, -- hammer of destruction
			},
			storage = 70200,
			msg = "Parabens por atingir o nivel 200! Voce recebeu o set de Elite Knight e 2.000.000 de gold!",
		},
	},
	[{3, 7}] = { -- Paladin / Royal Paladin
		[200] = {
			items = {
				{ itemid = 29427, count = 1 }, -- dark whispers
				{ itemid = 16110, count = 1 }, -- prismatic armor
				{ itemid = 16111, count = 1 }, -- prismatic legs
				{ itemid = 10323, count = 1 }, -- guardian boots
				{ itemid = 27565, count = 1 }, -- foxtail amulet
				{ itemid = 23529, count = 1 }, -- ring of blue plasma
				{ itemid = 36666, count = 1 }, -- eldritch quiver
				{ itemid = 27455, count = 1 }, -- bow of destruction
				{ itemid = 27456, count = 1 }, -- crossbow of destruction
			},
			storage = 70200,
			msg = "Parabens por atingir o nivel 200! Voce recebeu o set de Royal Paladin e 2.000.000 de gold!",
		},
	},
	[{1, 5}] = { -- Sorcerer / Master Sorcerer
		[200] = {
			items = {
				{ itemid = 27647, count = 1 }, -- gnome helmet
				{ itemid = 22534, count = 1 }, -- firemind raiment
				{ itemid = 16106, count = 1 }, -- gill legs
				{ itemid = 29424, count = 1 }, -- pair of dreamwalkers
				{ itemid = 34153, count = 1 }, -- lion spellbook
				{ itemid = 30401, count = 1 }, -- amulet of theurgy
				{ itemid = 23531, count = 1 }, -- ring of green plasma
				{ itemid = 27457, count = 1 }, -- wand of destruction
			},
			storage = 70200,
			msg = "Parabens por atingir o nivel 200! Voce recebeu o set de Master Sorcerer e 2.000.000 de gold!",
		},
	},
	[{2, 6}] = { -- Druid / Elder Druid
		[200] = {
			items = {
				{ itemid = 27647, count = 1 }, -- gnome helmet
				{ itemid = 22534, count = 1 }, -- firemind raiment
				{ itemid = 16106, count = 1 }, -- gill legs
				{ itemid = 29424, count = 1 }, -- pair of dreamwalkers
				{ itemid = 34153, count = 1 }, -- lion spellbook
				{ itemid = 30401, count = 1 }, -- amulet of theurgy
				{ itemid = 23531, count = 1 }, -- ring of green plasma
				{ itemid = 27458, count = 1 }, -- rod of destruction
			},
			storage = 70200,
			msg = "Parabens por atingir o nivel 200! Voce recebeu o set de Elder Druid e 2.000.000 de gold!",
		},
	},
	[{9, 10}] = { -- Monk / Exalted Monk
		[200] = {
			items = {
				{ itemid = 29427, count = 1 }, -- dark whispers
				{ itemid = 27648, count = 1 }, -- gnome armor (gnomurai's armor substitute)
				{ itemid = 3398,  count = 1 }, -- dwarven legs
				{ itemid = 50289, count = 1 }, -- yalahari footwraps
				{ itemid = 22060, count = 1 }, -- werewolf amulet (wolf amulet substitute)
				{ itemid = 23529, count = 1 }, -- ring of blue plasma
				{ itemid = 50168, count = 1 }, -- nunchaku of destruction
			},
			storage = 70200,
			msg = "Parabens por atingir o nivel 200! Voce recebeu o set de Exalted Monk e 2.000.000 de gold!",
		},
	},
}

local updatePlayerOnAdvancedLevel = CreatureEvent("UpdatePlayerOnAdvancedLevel")

function updatePlayerOnAdvancedLevel.onAdvance(player, skill, oldLevel, newLevel)
	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	player:addHealth(player:getMaxHealth())
	player:addMana(player:getMaxMana())
	player:getFinalLowLevelBonus()

	for voc, levels in pairs(rewardTable) do
		if isInArray(voc, player:getVocation():getId()) then
			for level, z in pairs(levels) do
				if newLevel >= level and player:getStorageValue(z.storage) ~= 1 then
					local bp = player:addItem(2871, 1)
					if bp then
						for v = 1, #z.items do
							bp:addItem(z.items[v].itemid, z.items[v].count)
						end
					else
						for v = 1, #z.items do
							player:addItem(z.items[v].itemid, z.items[v].count)
						end
					end
					Bank.credit(player:getName(), 2000000)
					player:setStorageValue(z.storage, 1)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, z.msg)
					player:save()
				end
			end
		end
	end

	return true
end

updatePlayerOnAdvancedLevel:register()
