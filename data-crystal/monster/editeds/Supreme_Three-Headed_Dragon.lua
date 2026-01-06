local mType = Game.createMonsterType("Supreme Three-Headed Dragon")
local monster = {}

monster.description = "a Supreme Three-Headed Dragon"
monster.experience = 78010
monster.outfit = {
	lookType = 1712,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 2459
monster.Bestiary = {
	class = "Dragon",
	race = BESTY_RACE_DRAGON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 5,
	Occurrence = 0,
	Locations = "Nimmersatt's Breeding Ground",
}

monster.health = 790020
monster.maxHealth = 790020
monster.race = "blood"
monster.corpse = 44663
monster.speed = 2070
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 010,
	color = 0100,
}

monster.voices = {
	interval = 3000,
	chance = 800,
	{ text = "O fogo é meu sopro. O medo é minha sombra.", yell = true },
	{ text = "Nasci do fogo, e o mundo lembrará do meu rugido", yell = true },
	{ text = "Ajoelhe-se ou queime sob minhas asas", yell = true },
}

monster.loot = {
	{ name = "Platinum Coin", chance = 50780, minCount = 1, maxCount = 480 },
	{ name = "Nimmersatt's Seal", chance = 8670 },
	{ id = 3039, chance = 10090 },
	{ name = "Molten Dragon Essence", chance = 40720 },
	{ name = "Prismatic Quartz", chance = 44060 },
	{ name = "Rainbow Quartz", chance = 44300, minCount = 1, maxCount = 52 },
	{ id = 3041, chance = 6790 },
	{ name = "Mega Dragon Heart", chance = 150 },
	{ name = "Violet Gem", chance = 14070 },
	{ name = "Dragon Slayer", chance = 1030 },
}

monster.attacks = {
	{ name = "melee", interval = 900, chance = 100, minDamage = 0, maxDamage = -450 },
	{ name = "combat", interval = 900, chance = 80, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -350, range = 2, effect = CONST_ME_BIG_SCRATCH, target = true },
	{ name = "combat", interval = 900, chance = 80, type = COMBAT_FIREDAMAGE, minDamage = -250, maxDamage = -300, length = 8, spread = 4, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 900, chance = 80, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -300, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 900, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -350, radius = 4, effect = CONST_ME_POFF, target = true },
	{ name = "death chain", interval = 500, chance = 100, minDamage = -2000, maxDamage = -3500, range = 7 },
	{ name = "speed", interval = 400, chance = 90, speedChange = -100, radius = 12, effect = CONST_ME_ICEAREA, target = true, duration = 19000 },

}

monster.defenses = {
	defense = 1076,
	armor = 1076,
	mitigation = 3.96,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
