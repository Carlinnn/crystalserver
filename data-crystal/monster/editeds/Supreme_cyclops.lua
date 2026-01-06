local mType = Game.createMonsterType("Supreme Cyclops")
local monster = {}

monster.description = "a Supreme Cyclops"
monster.experience = 255
monster.outfit = {
	lookType = 277,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 389
monster.Bestiary = {
	class = "Giant",
	race = BESTY_RACE_GIANT,
	toKill = 10000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Cyclopolis second floor and below, Mistrock, Mount Sternum, \z
		Cyclops Camp second floor and in the Cyclops version of the Forsaken Mine.",
}

monster.health = 4350
monster.maxHealth = 4350
monster.race = "blood"
monster.corpse = 656
monster.speed = 1020
monster.manaCost = 695

monster.changeTarget = {
	interval = 2000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Outis emoi g' onoma.", yell = false },
	{ text = "Whack da humy!", yell = false },
	{ text = "Ai humy phary ty kaynon", yell = false },
}

monster.loot = {
    { id = 3031, chance = 66026, minCount = 1, maxCount = 800 }, -- gold coin
    { id = 3035, chance = 39694, minCount = 1, maxCount = 55 }, -- platinum coin
    { id = 3577, chance = 38263, minCount = 1, maxCount = 52 }, -- meat
    { id = 11447, chance = 8034 }, -- battle stone
    { id = 3275, chance = 6606 }, -- double axe
    { id = 7368, chance = 7066, minCount = 1, maxCount = 100 }, -- assassin star
    { id = 3033, chance = 7237, minCount = 1, maxCount = 50 }, -- small amethyst
    { id = 3265, chance = 8772 }, -- two handed sword
    { id = 239, chance = 354 }, -- great health potion
    { id = 3383, chance = 258 }, -- dark armor
    { id = 3357, chance = 357 }, -- plate armor
    { id = 3008, chance = 401 }, -- crystal necklace
    { id = 3281, chance = 205 }, -- giant sword
    { id = 3058, chance = 54 }, -- strange symbol
    { id = 3116, chance = 220 }, -- big bone
    { id = 3456, chance = 150 }, -- pick
    { id = 3554, chance = 97 }, -- steel boots
    { id = 2893, chance = 90 }, -- amphora
    { id = 3304, chance = 26 }, -- crowbar
    { id = 7413, chance = 16 }, -- titan axe
    { id = 3342, chance = 29 }, -- war axe
}

monster.attacks = {
	{ name = "melee", interval = 1000, chance = 400, minDamage = 0, maxDamage = -1500 },
	{ name = "combat", interval = 1000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -2000, range = 9, shootEffect = CONST_ANI_WHIRLWINDCLUB, target = false },
	{ name = "drunk", interval = 500, chance = 80, shootEffect = CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_STUN, target = false, duration = 4000 },
}
monster.defenses = {
	defense = 2000,
	armor = 500,
	mitigation = 6.74,
	{ name = "speed", interval = 1000, chance = 85, speedChange = 900, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
}


monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
