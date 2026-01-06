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
monster.speed = 100000
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
    maxSummons = 10,
    summons = {
        { name = "Fdp", chance = 100, interval = 500, count = 6 },
    }
}

monster.voices = {
    interval = 3000,
    chance = 60,
    { text = "O tempo me obedece, e você… você mal consegue existir entre seus segundos!!", yell = false },
    { text = "PARAAAA SEU CORNO", yell = true },
    { text = "Enquanto você corre atrás do futuro, eu já o vi morrer no passado", yell = true },
    { text = "PEGUEI A SUA MÃE", yell = true }
}

monster.loot = {}

-- Função custom para maldição que faz o player andar sozinho
local function cursePlayer(target)
    if not target then return end
    local cid = target:getId()
    addEvent(function()
        if isPlayer(cid) then
            local player = Player(cid)
            if player then
                local directions = {NORTH, SOUTH, EAST, WEST}
                local dir = directions[math.random(#directions)]
                player:move(dir)
            end
        end
    end, 500)
end

monster.attacks = {
    -- Ataque corpo a corpo
    { name = "melee", interval = 1000, chance = 100, skill = 150, attack = 1200 },

    -- Energy field
    { name = "energyfield", interval = 2000, chance = 60, range = 13, radius = 6, target = true },

    -- Maldição / Player anda sozinho
    { name = "curse", interval = 1000, chance = 100, target = true, action = cursePlayer },

    { name = "dread intruder wave", interval = 2000, chance = 65, minDamage = -350, maxDamage = -450, target = false },
    { name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -2500, length = 8, spread = 0, effect = 244, target = false },
    { name = "condition", type = CONDITION_ENERGY, interval = 2000, chance = 20, minDamage = -400, maxDamage = -800, radius = 5, effect = CONST_ME_STUN, target = false },

    -- Runes
    { name = "magic wall rune", interval = 1000, chance = 65, range = 7, target = true},
    { name = "wild growth rune", interval = 2000, chance = 65, range = 7, target = false },
    { name = "thunderstorm rune", interval = 2000, chance = 60, range = 10, target = true },
    { name = "firefield", interval = 2000, chance = 10, range = 7, radius = 2, target = true },
    { name = "magic wall rune", interval = 1500, chance = 60, range = 9, target = true },

    -- Dano direto equilibrado
	{ name = "reality reaver wave", interval = 2000, chance = 70, minDamage = -200, maxDamage = -350, target = false },
    { name = "combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = 4200, maxDamage = 6300, effect = CONST_ME_BIGCLOUDS, target = true },
    { name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = 500, maxDamage = 1800, radius = 3, effect = CONST_ME_FIREAREA, target = true },

    -- Reduz velocidade do jogador
    { name = "speed", interval = 500, chance = 90, speedChange = -100000, duration = 50000, effect = CONST_ME_MAGIC_RED, target = true },

    -- Stun / Drunk
    { name = "drunk", interval = 500, chance = 80, effect = CONST_ME_STUN, target = false, duration = 3000 }
}

monster.defenses = {
    defense = 0,
    armor = 0,
    { name = "combat", interval = 1200, chance = 70, type = COMBAT_HEALING, minDamage = 1550, maxDamage = 10000, effect = CONST_ME_MAGIC_BLUE, target = false },
    { name = "invisible", interval = 2000, chance = 50, effect = CONST_ME_MAGIC_BLUE }
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
    { type = "invisible", condition = false },
    { type = "bleed", condition = true }
}

mType:register(monster)
