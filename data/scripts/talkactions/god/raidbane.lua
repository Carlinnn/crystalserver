local raidbane = TalkAction("/raidbane")

local positions = {
	Position(104, 388, 7),
	Position(104, 407, 7),
	Position(128, 410, 7),
	Position(128, 388, 7)
}

local bosses = {
	"Annihilon", "Ashmunrah", "Black Knight", "Boogey", "Bragrumol", "Bullwark", "Custodian",
	"Dazed Leaf Golem", "Death Priest Shargon", "Deep Terror", "Dipthrah", "Dirtbeard",
	"Diseased Bill", "Diseased Dan", "Diseased Fred", "Doctor Perhaps", "Evil Mastermind",
	"Fleshslicer", "Gaffir", "Glitterscale", "Glooth Fairy", "Golgordan", "Gorga", "Gralvalon",
	"Grand Canon Dominus", "Grand Chaplain Gaunder", "Grand Commander Soeren", "Guard Captain Quaid",
	"Hellgorak", "Heoni", "Jailer", "Jaul", "Kroazur", "Latrivan", "Lisa", "Mad Mage", "Madareth",
	"Mahrdis", "Mephiles", "Monstor", "Morguthis", "Mozradek", "Obujos", "Omruc", "Preceptor Lazare",
	"Professor Maxxen", "Rahemos", "Sugar Daddy", "Sugar Mommy", "Tanjis", "Thalas",
	"Thawing Dragon Lord", "The Baron from Below", "The Count Of The Core", "The Duke Of The Depths",
	"The Lord of the Lice", "The Ravager", "The Shatterer", "Twisterror", "Ushuriel",
	"Vashresamun", "Xogixath", "Zugurosh"
}

local function spawnNextBoss(index)
	if index > #bosses then
		Game.broadcastMessage("Todas as raids na sala de bosses foram finalizadas!", MESSAGE_EVENT_ADVANCE)
		return
	end

	local bossName = bosses[index]
	-- Split 63 bosses: 16, 16, 16, 15
	local positionIndex = 1
	if index > 48 then
		positionIndex = 4
	elseif index > 32 then
		positionIndex = 3
	elseif index > 16 then
		positionIndex = 2
	end

	local pos = positions[positionIndex]
	if pos then
		Game.createMonster(bossName, pos, true, true)
	end

	-- After spawning the last boss of a position, broadcast a transition message
	-- Positions end at indices: 16, 32, 48
	if index == 16 or index == 32 or index == 48 then
		Game.broadcastMessage("Raid na posição " .. positionIndex .. " finalizada! Siga para a próxima raid!", MESSAGE_EVENT_ADVANCE)
	end

	addEvent(spawnNextBoss, 1000, index + 1)
end

function raidbane.onSay(player, words, param)
	logCommand(player, words, param)

	Game.broadcastMessage("A raid na sala de bosses começará em 10 segundos! Preparem-se!", MESSAGE_EVENT_ADVANCE)
	player:sendTextMessage(MESSAGE_ADMINISTRATOR, "Comando /raidbane executado.")
	
	addEvent(function()
		Game.broadcastMessage("A sala de bosses foi invadida!", MESSAGE_EVENT_ADVANCE)
		spawnNextBoss(1)
	end, 10000)

	return true
end

raidbane:groupType("god")
raidbane:register()
