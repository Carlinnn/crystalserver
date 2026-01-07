local raidbosses = TalkAction("/raidbosses")

local positions = {
	Position(104, 388, 7),
	Position(104, 407, 7),
	Position(128, 410, 7),
	Position(128, 388, 7),
	Position(148, 386, 7),
	Position(177, 388, 7),
	Position(169, 409, 7),
	Position(151, 409, 7),
	Position(200, 410, 7),
	Position(226, 410, 7),
	Position(202, 387, 7),
	Position(226, 387, 7)
}

local bosses = {
	-- Group 1
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
	"Vashresamun", "Xogixath", "Zugurosh",
	-- Group 2
	"Abyssador", "Ahau", "Amenef The Burning", "Ancient Spawn of Morgathla", "Anomaly", "Arbaziloth",
	"Ayana the Crimson Curse", "Bibby Bloodbath", "Black Vixen", "Blight Mariner", "Bloodback",
	"Brain Head", "Brokul", "Chagorz", "Count Vlarkorth", "Darkfang", "Deathstrike", "Despor",
	"Drume", "Duke Krule", "Earl Osam", "Ekatrix", "Eradicator", "Essence Of Malice", "Faceless Bane",
	"Gelidrazah the Frozen", "Ghulosh", "Gnomevil", "Gorzindel", "Goshnar's Cruelty", "Goshnar's Greed",
	"Goshnar's Hatred", "Goshnar's Malice", "Goshnar's Spite", "Grand Master Oberon", "Ichgahal",
	"Irgix the Flimsy", "Kalyassa", "Katex Blood Tongue", "King Zelos", "Kusuma", "Lady Tenebris",
	"Lloyd", "Lokathmor", "Lord Azaram", "Lord of the Elements", "Lord Retro", "Magma Bubble",
	"Mawhawk", "Mazoran", "Mazzinor", "Megasylvan Yselda", "Melting Frozen Horror", "Mitmah Vanguard",
	"Murcion", "Neferi The Spy", "Outburst", "Owin", "Plagirath", "Ragiaz", "Raging Mage",
	"Ratmiral Blackwhiskers", "Ravenous Hunger", "Razzagorn", "Realityquake", "Rupture",
	"Scarlett Etzel", "Shadowpelt", "Sharpclaw", "Shulgrax", "Sir Baeloc", "Sir Nictros",
	"Sister Hetai", "Soul of Dragonking Zyrtarch", "Srezz Yellow Eyes", "Tamru the Black",
	"Tarbaz", "Tazhadur", "Tentugly's Head", "Thaian", "The Blazing Rose", "The Brainstealer",
	"The Diamond Blossom", "The Dread Maiden", "The Enraged Thorn Knight", "The False God",
	"The Fear Feaster", "The Flaming Orchid", "The Lily Of Night", "The Mega Magmaoid",
	"The Monster", "The Moonlight Aster", "The Nightmare Beast", "The Pale Worm", "The Rootkraken",
	"The Sandking", "The Scourge of Oblivion", "The Souldespoiler", "The Source Of Corruption",
	"The Time Guardian", "The Unarmored Voidborn", "The Unwelcome", "The Winter Bloom",
	"Timira the Many-Headed", "Tropical Desolator", "Unaz the Mean", "Urmahlullu the Weakened",
	"Utua Stone Sting", "Vemiath", "Vladrukh", "Vok the Freakish", "Wrathful Archivist",
	"Yirkas Blue Scales", "Zamulosh", "Zorvorax",
	-- Group 3
	"Alptramun", "Anmothra", "Arachir the Ancient One", "Arthom the Hunter", "Bakragore", "Bane Lord",
	"Barbaria", "Battlemaster Zunzu", "Big Boss Trolliver", "Burster", "Captain Jones", "Chikhaton",
	"Chizzoron the Distorter", "Countess Sorrow", "Cublarc the Plunderer", "Devovorga", "Dharalion",
	"Diblis the Fair", "Dracola", "Dreadful Disruptor", "Dreadmaw", "Elvira Hammerthrust",
	"Feroxa (Mortal)", "Ferumbras", "Ferumbras Mortal Shell", "Flamecaller Zazrak", "Fleabringer",
	"Foreman Kneebiter", "Furyosa", "Gaz'Haragoth", "General Murius", "Ghazbaran",
	"Goshnar's Megalomania", "Grand Mother Foulscale", "Grandfather Tridian", "Gravelord Oshuran",
	"Groam", "Grorlam", "Hairman the Huge", "Hatebreeder", "High Templar Cobrass", "Hirintror",
	"Horestis", "Irahsae", "Izcandar Champion of Summer", "Izcandar Champion of Winter",
	"Izcandar the Banished", "Jesse the Wicked", "King Chuck", "Lizard Gate Guardian", "Mahatheb",
	"Malofur Mangrinder", "Man In The Cave", "Massacre", "Maxxenius", "Morgaroth", "Mornenion",
	"Morshabaal", "Mr. Punish", "Ocyakao", "Omrafir", "Oodok Witchmaster", "Orshabaal", "Phrodomo",
	"Plagueroot", "Raxias", "Robby the Reckless", "Rotrender", "Rotworm Queen", "Rukor Zad",
	"Shlorg", "Sir Leopold", "Sir Valorcrest", "Smuggler Baron Silvertoe", "Teneshpar",
	"The Abomination", "The Big Bad One", "The Blightfather", "The Evil Eye", "The First Dragon",
	"The Frog Prince", "The Handmaiden", "The Hungerer", "The Imperor", "The Last Lore Keeper",
	"The Manhunter", "The Mean Masher", "The Mutated Pumpkin", "The Old Whopper", "The Pale Count",
	"The Percht Queen", "The Plasmother", "The Voice of Ruin", "The Welter", "Tyrn",
	"Tzumrah the Dazzler", "Warlord Ruzad", "White Pale", "Willi Wasp", "World Devourer",
	"Xenia", "Yaga the Crone", "Yakchal"
}

-- Batching definition: [comodoIndex] = {startIdx, endIdx}
-- Total bosses: 281
local batches = {
	{1, 23},
	{24, 46},
	{47, 69},
	{70, 92},
	{93, 115},
	{116, 138},
	{139, 161},
	{162, 185},
	{186, 209},
	{210, 233},
	{234, 257},
	{258, 281}
}

if not RaidBossesStore then
	RaidBossesStore = {
		aliveCount = 0,
		currentComodo = 0,
		isSpawning = false
	}
end

local function spawnNextBoss(index)
	if index > #bosses then
		return
	end

	local comodoConfig = batches[RaidBossesStore.currentComodo]
	if not comodoConfig then return end

	local bossName = bosses[index]
	local pos = positions[RaidBossesStore.currentComodo]

	if pos then
		local monster = Game.createMonster(bossName, pos, true, true)
		if monster then
			RaidBossesStore.aliveCount = RaidBossesStore.aliveCount + 1
			monster:registerEvent("RaidBossesDeath")
		end
	end

	if index < comodoConfig[2] then
		addEvent(spawnNextBoss, 1000, index + 1)
	else
		RaidBossesStore.isSpawning = false
		Game.broadcastMessage("Todos os bosses do cômodo " .. RaidBossesStore.currentComodo .. " foram spawnados! Derrote-os para abrir o próximo cômodo.", MESSAGE_EVENT_ADVANCE)
	end
end

local function startComodo(comodoIndex)
	RaidBossesStore.currentComodo = comodoIndex
	RaidBossesStore.isSpawning = true
	
	local config = batches[comodoIndex]
	spawnNextBoss(config[1])
end

local raidDeath = CreatureEvent("RaidBossesDeath")
function raidDeath.onDeath(creature)
	RaidBossesStore.aliveCount = math.max(0, RaidBossesStore.aliveCount - 1)
	
	if RaidBossesStore.aliveCount == 0 and not RaidBossesStore.isSpawning then
		if RaidBossesStore.currentComodo < 12 then
			Game.broadcastMessage("Raid no cômodo " .. RaidBossesStore.currentComodo .. " finalizada! Siga para o próximo cômodo!", MESSAGE_EVENT_ADVANCE)
			addEvent(startComodo, 3000, RaidBossesStore.currentComodo + 1)
		else
			Game.broadcastMessage("Todas as raids na sala de bosses foram finalizadas! Parabéns!", MESSAGE_EVENT_ADVANCE)
			RaidBossesStore.currentComodo = 0
		end
	end
	return true
end
raidDeath:register()

function raidbosses.onSay(player, words, param)
	logCommand(player, words, param)

	-- Reset state
	RaidBossesStore.aliveCount = 0
	RaidBossesStore.currentComodo = 0
	RaidBossesStore.isSpawning = false

	Game.broadcastMessage("A raid na sala de bosses começará em 10 segundos! Preparem-se!", MESSAGE_EVENT_ADVANCE)
	player:sendTextMessage(MESSAGE_ADMINISTRATOR, "Comando /raidbosses executado.")
	
	addEvent(function()
		Game.broadcastMessage("A sala de bosses foi invadida!", MESSAGE_EVENT_ADVANCE)
		addEvent(startComodo, 1000, 1)
	end, 10000)

	return true
end

raidbosses:groupType("god")
raidbosses:register()
