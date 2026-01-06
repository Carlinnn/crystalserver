local mType = Game.createMonsterType("Senhor do tempo")
local monster = {}

monster.description = "Senhor do tempo"
monster.experience = 0

monster.outfit = {
	lookType = 423
}

monster.events = {}

monster.health = 150500
monster.maxHealth = 150500
monster.race = "blood"
monster.corpse = 0
monster.speed = 1000
monster.manaCost = 0

monster.changeTarget = {
	interval = 1000,
	chance = 100
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10
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
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 10,
	color = 65
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Supreme Cyclops", chance = 100, interval = 1000, count = 10 },
		{ name = "Warlock", chance = 80, interval = 5000, count = 2 }
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "O tempo me obedece, e você… você mal consegue existir entre seus segundos!!", yell = false },
	{ text = "STOPPP CORNO", yell = true },
	{ text = "Enquanto você corre atrás do futuro, eu já o vi morrer no passado", yell = true },
	{ text = "PEGUEI A SUA MÃE", yell = true }
}

monster.loot = {}

monster.attacks = {
	-- Ataque corpo a corpo
	{ name = "melee", interval = 1000, chance = 100, skill = 3022, attack = 7027 },

	-- Energy field
	{ name = "energyfield", interval = 2000, chance = 60, range = 13, radius = 6, target = true },

	-- Runes
	{ name = "magic wall rune", interval = 1000, chance = 85, range = 7, target = false },
	{ name = "wild growth rune", interval = 2000, chance = 65, range = 7, target = false },
	{ name = "thunderstorm rune", interval = 2000, chance = 60, range = 10, target = true },
	{ name = "firefield", interval = 2000, chance = 10, range = 7, radius = 2, target = true },

	-- Dano direto
	{ name = "combat", interval = 2000, chance = 25,
	type = COMBAT_ENERGYDAMAGE, minDamage = 4200, maxDamage = 6300,
	effect = CONST_ME_BIGCLOUDS, target = true }  -- sem length/spread


	{ name = "combat", interval = 2000, chance = 20,
		type = COMBAT_FIREDAMAGE, minDamage = 500, maxDamage = 1800,
		radius = 3, effect = CONST_ME_FIREAREA, target = true },

	-- Reduz velocidade do jogador
	{ name = "speed", interval = 500, chance = 90,
		speedChange = -10000, duration = 5000, effect = CONST_ME_MAGIC_RED, target = false },

	-- Stun / Drunk
	{ name = "drunk", interval = 1000, chance = 70,
		effect = CONST_ME_STUN, target = false, duration = 3000 }
}


monster.defenses = {
	defense = 99,
	armor = 1200,
	{ name = "combat", interval = 1200, chance = 70,
		type = COMBAT_HEALING, minDamage = 1550, maxDamage = 10000,
		effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 4000, chance = 30,
		effect = CONST_ME_MAGIC_BLUE }
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 150 },
	{ type = COMBAT_EARTHDAMAGE, percent = 150 },
	{ type = COMBAT_FIREDAMAGE, percent = 150 },
	{ type = COMBAT_LIFEDRAIN, percent = 50 },
	{ type = COMBAT_MANADRAIN, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 }
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = true }
}

mType:register(monster)
