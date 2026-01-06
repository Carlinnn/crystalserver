local raidbane = TalkAction("/raidbane")

local positions = {
	Position(104, 388, 7),
	Position(104, 407, 7),
	Position(128, 410, 7),
	Position(128, 388, 7)
}

local bosses = {
	"Adlerauge", "Annihilon", "Arthei", "Ashmunrah", "Atab", "Black Knight", "Boogey", "Boreth",
	"Bragrumol", "Bullwark", "Chopper", "Custodian", "Dazed Leaf Golem", "Death Priest Shargon",
	"Deep Terror", "Dipthrah", "Dirtbeard", "Diseased Bill", "Diseased Dan", "Diseased Fred",
	"Doctor Perhaps", "Enusat The Onyx Wing", "Evil Mastermind", "Fleshslicer", "Gaffir",
	"Glitterscale", "Glooth Fairy", "Golgordan", "Gorga", "Gralvalon", "Grand Canon Dominus",
	"Grand Chaplain Gaunder", "Grand Commander Soeren", "Guard Captain Quaid", "Hellgorak",
	"Heoni", "Inkwing", "Jailer", "Jaul", "Kroazur", "Latrivan", "Lersatio", "Lisa", "Mad Mage",
	"Madareth", "Mahrdis", "Marziel", "Maw", "Mephiles", "Mindmasher", "Monstor", "Morguthis",
	"Mozradek", "Obujos", "Omruc", "Preceptor Lazare", "Professor Maxxen", "Rahemos", "Rotspit",
	"Shadowstalker", "Sir Leonard", "Sugar Daddy", "Sugar Mommy", "Tanjis", "Thalas",
	"Thawing Dragon Lord", "The Baron from Below", "The Count Of The Core", "The Duke Of The Depths",
	"The Lord of the Lice", "The Ravager", "The Shatterer", "Twisterror", "Ushuriel",
	"Vashresamun", "Xogixath", "Zugurosh"
}

local function spawnRaid(index)
	local pos = positions[index]
	if not pos then
		return
	end

	-- Divide bosses (77 total)
	-- Index 1: 1-19 (19)
	-- Index 2: 20-38 (19)
	-- Index 3: 39-57 (19)
	-- Index 4: 58-77 (20)
	local startIdx = (index - 1) * 19 + 1
	local endIdx = index * 19
	if index == 4 then
		endIdx = #bosses
	end

	for i = startIdx, endIdx do
		local bossName = bosses[i]
		if bossName then
			Game.createMonster(bossName, pos, true, true)
		end
	end

	if index < 4 then
		Game.broadcastMessage("Raid na posição " .. index .. " finalizada! Siga para a próxima raid!", MESSAGE_EVENT_ADVANCE)
		addEvent(spawnRaid, 1000, index + 1)
	else
		Game.broadcastMessage("Todas as raids na sala de bosses foram finalizadas!", MESSAGE_EVENT_ADVANCE)
	end
end

function raidbane.onSay(player, words, param)
	-- Check for god group (access 1 in groups.xml means some staff access, but group "god" is id 6)
	-- TalkAction:groupType("god") handles this restriction during registration in modern TFS.
	
	logCommand(player, words, param)

	player:sendTextMessage(MESSAGE_ADMINISTRATOR, "Comando /raidbane executado. A raid começará em 10 segundos.")
	
	addEvent(function()
		Game.broadcastMessage("A sala de bosses foi invadida!", MESSAGE_EVENT_ADVANCE)
		spawnRaid(1)
	end, 10000)

	return true
end

raidbane:groupType("god")
raidbane:register()
