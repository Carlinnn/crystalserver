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

-- Batching definition: [comodoIndex] = {startIdx, endIdx}
local batches = {
	{1, 16},
	{17, 32},
	{33, 48},
	{49, 63}
}

if not RaidBaneStore then
	RaidBaneStore = {
		aliveCount = 0,
		currentComodo = 0,
		isSpawning = false
	}
end

local function spawnNextBoss(index)
	if index > #bosses then
		return
	end

	local comodoConfig = batches[RaidBaneStore.currentComodo]
	if not comodoConfig then return end

	local bossName = bosses[index]
	local pos = positions[RaidBaneStore.currentComodo]

	if pos then
		local monster = Game.createMonster(bossName, pos, true, true)
		if monster then
			RaidBaneStore.aliveCount = RaidBaneStore.aliveCount + 1
			monster:registerEvent("RaidBaneDeath")
		end
	end

	if index < comodoConfig[2] then
		addEvent(spawnNextBoss, 1000, index + 1)
	else
		RaidBaneStore.isSpawning = false
		Game.broadcastMessage("Todos os bosses do cômodo " .. RaidBaneStore.currentComodo .. " foram spawnados! Derrote-os para abrir o próximo cômodo.", MESSAGE_EVENT_ADVANCE)
	end
end

local function startComodo(comodoIndex)
	RaidBaneStore.currentComodo = comodoIndex
	RaidBaneStore.isSpawning = true
	
	local config = batches[comodoIndex]
	spawnNextBoss(config[1])
end

local raidDeath = CreatureEvent("RaidBaneDeath")
function raidDeath.onDeath(creature)
	RaidBaneStore.aliveCount = math.max(0, RaidBaneStore.aliveCount - 1)
	
	if RaidBaneStore.aliveCount == 0 and not RaidBaneStore.isSpawning then
		if RaidBaneStore.currentComodo < 4 then
			Game.broadcastMessage("Raid no cômodo " .. RaidBaneStore.currentComodo .. " finalizada! Siga para o próximo cômodo!", MESSAGE_EVENT_ADVANCE)
			addEvent(startComodo, 3000, RaidBaneStore.currentComodo + 1)
		else
			Game.broadcastMessage("Todas as raids na sala de bosses foram finalizadas! Parabéns!", MESSAGE_EVENT_ADVANCE)
			RaidBaneStore.currentComodo = 0
		end
	end
	return true
end
raidDeath:register()

function raidbane.onSay(player, words, param)
	logCommand(player, words, param)

	-- Reset state
	RaidBaneStore.aliveCount = 0
	RaidBaneStore.currentComodo = 0
	RaidBaneStore.isSpawning = false

	Game.broadcastMessage("A raid na sala de bosses começará em 10 segundos! Preparem-se!", MESSAGE_EVENT_ADVANCE)
	player:sendTextMessage(MESSAGE_ADMINISTRATOR, "Comando /raidbane executado.")
	
	addEvent(function()
		Game.broadcastMessage("A sala de bosses foi invadida!", MESSAGE_EVENT_ADVANCE)
		addEvent(startComodo, 1000, 1)
	end, 10000)

	return true
end

raidbane:groupType("god")
raidbane:register()
