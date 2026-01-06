local mType = Game.createMonsterType("Senhor do tempo")
local monster = {}

monster.description = "Senhor do tempo"
monster.experience = 0

monster.outfit = {
	lookType = 423,
}

monster.events = {
	"SenhorDoTempoThink",
	"SenhorDoTempoHealth"
}

monster.health = 150500
monster.maxHealth = 150500
monster.race = "blood"
monster.speed = 1000
monster.manaCost = 0

monster.changeTarget = {
	interval = 1000,
	chance = 100,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	attackable = true,
	hostile = true,
	rewardBoss = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 10,
	color = 65,
}

monster.attacks = {
	{ name = "melee", interval = 1000, chance = 100, skill = 3022, attack = 7027 },

	{ name = "energyfield", interval = 3000, chance = 60, range = 13, radius = 6, target = true },
	{ name = "magic wall rune", interval = 3000, chance = 40, range = 7, target = true },
	{ name = "wild growth rune", interval = 3000, chance = 30, range = 7, target = true },

	{ name = "thunderstorm rune", interval = 2000, chance = 50, range = 10, target = true },

	{ name = "sudden death rune", interval = 2000, chance = 35,
		minDamage = 3500, maxDamage = 9000, range = 7, target = true },

}

monster.defenses = {
	defense = 120,
	armor = 1500,
	{ name = "combat", interval = 2000, chance = 60, type = COMBAT_HEALING,
		minDamage = 3000, maxDamage = 9000, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -40 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 150 },
	{ type = COMBAT_FIREDAMAGE, percent = 150 },
	{ type = COMBAT_EARTHDAMAGE, percent = 150 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "invisible", condition = true },
}

mType:register(monster)
