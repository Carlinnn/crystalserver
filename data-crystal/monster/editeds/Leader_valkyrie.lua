local mType = Game.createMonsterType("Valkyrie")
local monster = {}

monster.description = "a Leader valkyrie"
monster.experience = 851
monster.outfit = {
	look type="139" head="77" body="114" legs="114" feet="96" addons="3" mount="426"
}

monster.raceId = 12
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Amazon Camp (Venore), Amazon Camp (Carlin), Amazonia, \z
		single respawn to the north west of Thais, Foreigner Quarter in Yalahar.",
}

monster.health = 5900
monster.maxHealth = 5900
monster.race = "blood"
monster.corpse = 18242
monster.speed = 88
monster.manaCost = 450

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 10,
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
	{ text = "Another head for me!", yell = false },
	{ text = "Vem ni mim nenem", yell = false },
	{ text = "Your head will be mine!", yell = false },
	{ text = "Stand still!", yell = false },
	{ text = "One more head for me!", yell = false },
}

monster.loot = {
	{ id = 3031, chance = 377, minCount = 0, maxCount = 136}, -- gold coin
	{ id = 3277, chance = 366, minCount = 0, maxCount = 3}, -- spear
	{ id = 3602, chance = 224, minCount = 0, maxCount = 2}, -- brown bread
	{ id = 3003, chance = 91}, -- rope
	{ id = 3372, chance = 274}, -- brass legs
	{ id = 3383, chance = 132}, -- dark armor
	{ id = 3305, chance = 114}, -- battle hammer
	{ id = 3384, chance = 471}, -- dark helmet
	{ id = 3269, chance = 482}, -- halberd
	{ id = 3357, chance = 174}, -- plate armor
	{ id = 3351, chance = 196}, -- steel helmet
	{ id = 3265, chance = 241}, -- two handed sword
	{ id = 3318, chance = 212}, -- knight axe
	{ id = 3369, chance = 406}, -- warrior helmet
	{ id = 3371, chance = 209}, -- knight legs
	{ id = 3016, chance = 156}, -- ruby necklace
	{ id = 3370, chance = 233}, -- knight armor
	{ id = 3302, chance = 16}, -- dragon lance
	{ id = 822, chance = 75}, -- lightning legs
	{ id = 2995, chance = 86}, -- piggy bank
	{ id = 3079, chance = 10}, -- boots of haste
}

monster.attacks = {  
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -70 },  
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -50, range = 5, shootEffect = CONST_ANI_SPEAR, target = false },  
	{ name = "exori amp kor", interval = 2000, chance = 15 },  
}

monster.defenses = {
	defense = 12,
	armor = 12,
	mitigation = 0.36,
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
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
