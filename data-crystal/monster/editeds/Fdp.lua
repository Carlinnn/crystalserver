local mType = Game.createMonsterType("Fdp")
local monster = {}

monster.description = "a Fdp"
monster.experience = 0
monster.outfit = {
	lookType = 294,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 462
monster.Bestiary = {
	class = "Fey",
	race = BESTY_RACE_FEY,
	toKill = 250,
	FirstUnlock = 10,
	SecondUnlock = 100,
	CharmsPoints = 5,
	Stars = 1,
	Occurrence = 0,
	Locations = "All around Tiquanda and Feyrist. Several groups of Wisps can be found in and around \z
		the forests north of Edron. West of Hardek. Inside the Cyclops Camp. North of the triple \z
		Wyvern spawn outside Kazordoon. West of Ab'Dendriel. West of Venore Amazon Camp. \z
		A few spawns around Venore, 2 spawn on the Formorgar Glacier, and on Krimhorn."
}

monster.health = 11500
monster.maxHealth = 11500
monster.race = "undead"
monster.corpse = 6323
monster.speed = 81000
monster.manaCost = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 15,
	targetDistance = 7,
	runHealth = 115,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	isPreyExclusive = true,
}

monster.light = {
	level = 4,
	color = 204,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Crackle!", yell = false },
	{ text = "Tsshh", yell = false },
}

monster.loot = {
	{ name = "moon backpack", chance = 220 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 10, maxDamage = 1 },
	{ name = "combat", interval = 2000, chance = 100, type = COMBAT_LIFEDRAIN, minDamage = -3, maxDamage = -10, range = 1, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "drunk", interval = 500, chance = 100, shootEffect = CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_STUN, target = false, duration = 4000 },
	{ name = "wild growth rune", interval = 1000, chance = 70, range = 10, target = false },
}

monster.summon = {
	maxSummons = 3,
	summons = {
		{ name = "Fdp", chance = 100, interval = 1000, count = 6 },
	}
}

monster.defenses = {
	defense = 10,
	armor = 7,
	mitigation = 0.43,
	{ name = "speed", interval = 2000, chance = 15, speedChange = 200, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 15, maxDamage = 25, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 3000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 60 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 40 },
	{ type = COMBAT_EARTHDAMAGE, percent = 90 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
