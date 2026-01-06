local mType = Game.createMonsterType("Leader Valkyrie")
local monster = {}

monster.description = "a Leader Valkyrie"
monster.experience = 899

monster.outfit = {
	lookType = 139,
	lookHead = 77,
	lookBody = 114,
	lookLegs = 114,
	lookFeet = 96,
	lookAddons = 3,
	lookMount = 426
}

monster.raceId = 12

monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 5000,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 100,
	Stars = 3,
	Occurrence = 0,
	Locations = "Amazon Camp (Venore), Amazon Camp (Carlin), Amazonia, \
	single respawn to the north west of Thais, Foreigner Quarter in Yalahar."
}

monster.health = 5900
monster.maxHealth = 5900
monster.race = "blood"
monster.corpse = 18242
monster.speed = 888
monster.manaCost = 450

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 20,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 10,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Another head for me!", yell = false },
	{ text = "Vem ni mim nenem", yell = false },
	{ text = "Your head will be mine!", yell = false },
	{ text = "Stand still!", yell = false },
	{ text = "One more head for me!", yell = false }
}

monster.loot = {
	{ id = 3031, chance = 37700, minCount = 1, maxCount = 136 },
	{ id = 3277, chance = 36600, minCount = 1, maxCount = 3 },
	{ id = 3602, chance = 22400, minCount = 1, maxCount = 2 },
	{ id = 3003, chance = 9100 },
	{ id = 3372, chance = 27400 },
	{ id = 3383, chance = 13200 },
	{ id = 3305, chance = 11400 },
	{ id = 3384, chance = 47100 },
	{ id = 3269, chance = 48200 },
	{ id = 3357, chance = 17400 },
	{ id = 3351, chance = 19600 },
	{ id = 3265, chance = 24100 },
	{ id = 3318, chance = 21200 },
	{ id = 3369, chance = 40600 },
	{ id = 3371, chance = 20900 },
	{ id = 3016, chance = 15600 },
	{ id = 3370, chance = 23300 },
	{ id = 3302, chance = 1600 },
	{ id = 822, chance = 7500 },
	{ id = 2995, chance = 8600 },
	{ id = 3079, chance = 1000 }
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -350, maxDamage = -750 },
	{
		name = "combat",
		interval = 2000,
		chance = 20,
		type = COMBAT_PHYSICALDAMAGE,
		minDamage = -300,
		maxDamage = -1550,
		range = 10,
		shootEffect = CONST_ANI_SPEAR,
		target = true
	}
}

monster.defenses = {
	defense = 152,
	armor = 152,
	mitigation = 0.86
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 5 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 }
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false }
}

mType:register(monster)
