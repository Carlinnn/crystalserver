local mType = Game.createMonsterType("Titan of the Wild")  
local monster = {}  
  
monster.description = "a Titan of the Wild"  
monster.experience = 60  
monster.outfit = {  
	lookType = 131,  
	lookHead = 38,  
	lookBody = 0,  
	lookLegs = 0,  
	lookFeet = 0,  
	lookAddons = 3,  
	lookMount = 372  
}  
  
monster.raceId = 47  
monster.Bestiary = {  
	class = "Human",  
	race = BESTY_RACE_HUMAN,  
	toKill = 5000,  
	FirstUnlock = 25,  
	SecondUnlock = 250,  
	CharmsPoints = 105,  
	Stars = 2,  
	Occurrence = 0,  
	Locations = "Dark Cathedral, Outlaw Camp, North of Thais, Cyclopolis, in Edron Hero Cave and around it, \z  
		the small camp near Femor Hills, in Ghostlands disguised as a statue.",  
}  
  
monster.health = 13005  
monster.maxHealth = 13005  
monster.race = "blood"  
monster.corpse = 18250  
monster.speed = 95  
monster.manaCost = 420  
  
monster.changeTarget = {  
	interval = 4000,  
	chance = 0,  
}  
  
monster.strategiesTarget = {  
	nearest = 100,  
}  
  
monster.flags = {  
	summonable = true,  
	attackable = true,  
	hostile = true,  
	convinceable = true,  
	pushable = true,  
	rewardBoss = false,  
	illusionable = true,  
	canPushItems = false,  
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
	level = 10,  
	color = 100,  
}  
  
monster.voices = {  
	interval = 2000,  
	chance = 80,  
	{ text = "u sou o Titã das Terras Selvagens — a terra se curva, ou se parte!", yell = true },  
	{ text = "Onde meus passos caem, impérios viram pó.!", yell = true },  
}  
  
monster.loot = {  
	{ id = 2991, chance = 520 }, -- doll  
	{ name = "gold coin", chance = 49070, maxCount = 900 },  
	{ name = "axe", chance = 30710 },  
	{ name = "mace", chance = 9800 },  
	{ name = "golden helmet", chance = 100 },  
	{ name = "warrior helmet", chance = 580 },  
	{ name = "steel boots", chance = 2540 },  
	{ name = "golden legs", chance = 910 },  
	{ name = "Magic plate legs", chance = 17000 },  
	{ id = 3606, chance = 9730, maxCount = 2 }, -- egg  
	{ name = "platinum coin", chance = 89725, maxCount = 5 },  
	{ name = "leather legs", chance = 27060 },  
	{ name = "meat", chance = 16582 },  
	{ name = "lion cloak patch", chance = 11190 },  
	{ name = "violet gem", chance = 6002 },  
	{ name = "gold ingot", chance = 5799 },  
	{ name = "lion crest", chance = 5697 },  
	{ name = "knight legs", chance = 5290 },  
	{ name = "great mana potion", chance = 4680 },  
	{ name = "blue gem", chance = 4171 },  
	{ name = "green gem", chance = 2238 },  
	{ name = "magma legs", chance = 610 },  
}  
  
monster.attacks = {  
	{ name = "melee", interval = 2000, chance = 100, minDamage = 1000, maxDamage = -4000 },  
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, range = 15, shootEffect = CONST_ANI_SPEAR, target = false },  
}  
  
monster.defenses = {  
	defense = 2000,  
	armor = 1598,  
	mitigation = 9.46,  
	{ name = "speed", interval = 1000, chance = 100, speedChange = 5000, effect = CONST_ME_MAGIC_RED, target = true, duration = 15000 },  
	{ name = "combat", interval = 1000, chance = 40, type = COMBAT_HEALING, minDamage = 2000, maxDamage = 3500, effect = CONST_ME_MAGIC_BLUE, target = true },  
}  
  
monster.elements = {  
	{ type = COMBAT_PHYSICALDAMAGE, percent = 60 },  
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },  
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },  
	{ type = COMBAT_FIREDAMAGE, percent = 20 },  
	{ type = COMBAT_LIFEDRAIN, percent = 20 },  
	{ type = COMBAT_MANADRAIN, percent = 20 },  
	{ type = COMBAT_DROWNDAMAGE, percent = 20 },  
	{ type = COMBAT_ICEDAMAGE, percent = 20 },  
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },  
	{ type = COMBAT_DEATHDAMAGE, percent = 40 },  
}  
  
monster.immunities = {  
	{ type = "paralyze", condition = false },  
	{ type = "outfit", condition = false },  
	{ type = "invisible", condition = false },  
	{ type = "bleed", condition = false },  
}  
  
mType:register(monster)