local mType = Game.createMonsterType("Senhor do tempo")
local monster = {}

monster.description = "Senhor do tempo"
monster.experience = 0

monster.outfit = {
	lookType = 423,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {}

monster.health = 150500
monster.maxHealth = 150500
monster.race = "blood"
monster.corpse = 0
monster.speed = 10000
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
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 300,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 10,
	color = 655,
}

monster.summon = {
	maxSummons = 1,
	summons = {
		{ name = "Supreme Cyclops", chance = 80, interval = 2000, count = 10 },
		{ name = "Orshabaal", chance = 5, interval = 2000, count = 1 },
		{ name = "Morgaroth", chance = 1, interval = 2000, count = 1 },
		{ name = "Warlock", chance = 100, interval = 100, count = 15 },
		{ name = "Sword Of Vengeance", chance = 90, interval = 2000, count = 7 },
		{ name = "SNightmare Tendril", chance = 50, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Behold the all permeating powers I draw from this gate!!", yell = false },
	{ text = "ENERGY!!", yell = true },
	{ text = "I FEEL, I FEEEEEL... OMNIPOTENCE!!", yell = true },
	{ text = "MWAAAHAHAAA!! NO ONE!! NO ONE CAN DEFEAT MEEE!!!", yell = true },
}

monster.loot = {}

monster.attacks = {
	{ name = "energized raging mage skill reducer", interval = 1000, chance = 80, target = true },
	{ name = "energyfield", interval = 3000, chance = 60, range = 13, radius = 15, shootEffect = CONST_ANI_ENERGY, target = true },
	{ name = "magic wall rune", interval = 3000, chance = 35, range = 7, target = true },
	{ name = "melee", interval = 1000, chance = 100, skill = 322, attack = 327 },
	{ name = "thunderstorm rune", interval = 2000, chance = 60, minDamage = 1500, maxDamage = 3230, range = 10, target = true },
	{ name = "combat", interval = 400, chance = 70, type = COMBAT_MANADRAIN, minDamage = 1000, maxDamage = 5210, range = 9, target = true },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = 4200, maxDamage = 6300, length = 10, spread = 9, effect = CONST_ME_BIGCLOUDS, target = true },
	{ name = "warlock skill reducer", interval = 1000, chance = 40, range = 6, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -120, range = 7, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -180, range = 7, radius = 3, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_FIREAREA, target = true },
	{ name = "firefield", interval = 2000, chance = 10, range = 7, radius = 2, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -150, maxDamage = -230, length = 8, spread = 0, effect = CONST_ME_BIGCLOUDS, target = false },
	{ name = "speed", interval = 100, chance = 100, speedChange = -53000, range = 1, effect = CONST_ME_MAGIC_RED, target = false, duration = 2000 },
	{ name = "speed", interval = 200, chance = 100, speedChange = -100000, range = 1, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = true, duration = 1500 },
}

}

monster.defenses = {
	defense = 99,
	armor = 1200,
	{ name = "combat", interval = 1200, chance = 70, type = COMBAT_HEALING, minDamage = 1550, maxDamage = 10000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 4000, chance = 60, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 150 },
	{ type = COMBAT_EARTHDAMAGE, percent = 150 },
	{ type = COMBAT_FIREDAMAGE, percent = 150 },
	{ type = COMBAT_LIFEDRAIN, percent = 50 },
	{ type = COMBAT_MANADRAIN, percent = 50 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = true },
}

mType:register(monster)
