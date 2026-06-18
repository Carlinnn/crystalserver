-- =============================================================================
-- VOCATION BALANCE — Arquivo único de balanceamento por vocação
-- Edite este arquivo para ajustar: dano PVE, dano PVP, defesa e cura
-- =============================================================================

-- =============================================================================
-- SEÇÃO 1: ESCALONAMENTO POR NÍVEL
-- Multiplica o dano base conforme o nível do jogador
-- heal_factor: cura escala a X% do multiplicador de dano (0.65 = 65%)
-- =============================================================================
local LEVEL_STAGES = {
    { min = 1,     max = 200,   multiplier = 1.00 },
    { min = 201,   max = 500,   multiplier = 1.30 },
    { min = 501,   max = 1000,  multiplier = 1.70 },
    { min = 1001,  max = 2000,  multiplier = 2.20 },
    { min = 2001,  max = 3000,  multiplier = 2.80 },
    { min = 3001,  max = 5000,  multiplier = 3.50 },
    { min = 5001,  max = 7000,  multiplier = 4.50 },
    { min = 7001,  max = 9000,  multiplier = 5.50 },
    { min = 9001,  max = 10000, multiplier = 7.00 },
    { min = 10001,              multiplier = 9.00 },
}

local HEAL_FACTOR = 0.65  -- cura escala a 65% do multiplicador de dano

-- =============================================================================
-- SEÇÃO 2: CONFIG PVP GLOBAL
-- pvpFactor : multiplicador fixo de dano em PVP (0.75 = 75% do dano PVE)
--             Não depende do nível do alvo — só do SEU nível via level stages.
--             10k bate igual em 1k e em 10k. 1k bate igual em 1k e em 10k.
-- =============================================================================
local PVP_FACTOR = 0.75

-- =============================================================================
-- SEÇÃO 3: BALANCEAMENTO POR VOCAÇÃO
--
-- ID das vocações (conforme vocations.xml):
--   0  = None         1  = Sorcerer       2  = Druid
--   3  = Paladin       4  = Knight         5  = Master Sorcerer
--   6  = Elder Druid   7  = Royal Paladin   8  = Elite Knight
--   9  = Monk          10 = Exalted Monk
--
-- Campos por vocação:
--   pve_damage  : multiplicador de dano contra monstros (1.0 = padrão)
--   pvp_dealt   : multiplicador adicional de dano causado em PVP (1.0 = padrão)
--   pvp_recv    : multiplicador de dano recebido em PVP (1.0 = padrão, <1 = mais tanque)
--   heal_mult   : multiplicador de cura (nil = usa escala de nível padrão)
-- =============================================================================
local VOC_BALANCE = {
    -- -------------------------------------------------------------------------
    -- Sorcerer / Master Sorcerer
    -- Alto dano mágico, frágil no PVP
    -- -------------------------------------------------------------------------
    [1] = {  -- Sorcerer
        pve_damage = 1.00,
        pvp_dealt  = 1.00,
        pvp_recv   = 1.00,
        heal_mult  = nil,
    },
    [5] = {  -- Master Sorcerer
        pve_damage = 1.00,
        pvp_dealt  = 1.00,
        pvp_recv   = 1.00,
        heal_mult  = nil,
    },

    -- -------------------------------------------------------------------------
    -- Druid / Elder Druid
    -- Suporte e dano moderado, boa cura
    -- -------------------------------------------------------------------------
    [2] = {  -- Druid
        pve_damage = 1.00,
        pvp_dealt  = 1.00,
        pvp_recv   = 1.00,
        heal_mult  = nil,
    },
    [6] = {  -- Elder Druid
        pve_damage = 1.00,
        pvp_dealt  = 1.00,
        pvp_recv   = 1.00,
        heal_mult  = nil,
    },

    -- -------------------------------------------------------------------------
    -- Paladin / Royal Paladin
    -- Dano físico/distância equilibrado, sobrevivência média
    -- -------------------------------------------------------------------------
    [3] = {  -- Paladin
        pve_damage = 1.00,
        pvp_dealt  = 1.00,
        pvp_recv   = 1.00,
        heal_mult  = nil,
    },
    [7] = {  -- Royal Paladin
        pve_damage = 1.00,
        pvp_dealt  = 1.00,
        pvp_recv   = 1.00,
        heal_mult  = nil,
    },

    -- -------------------------------------------------------------------------
    -- Knight / Elite Knight
    -- Dano físico corpo a corpo, alta defesa/mitigação
    -- -------------------------------------------------------------------------
    [4] = {  -- Knight
        pve_damage = 1.00,
        pvp_dealt  = 1.00,
        pvp_recv   = 1.00,
        heal_mult  = nil,
    },
    [8] = {  -- Elite Knight
        pve_damage = 1.00,
        pvp_dealt  = 1.00,
        pvp_recv   = 1.00,
        heal_mult  = nil,
    },

    -- -------------------------------------------------------------------------
    -- Monk / Exalted Monk
    -- Melee especializado com bônus de 1.3x (definido no vocations.xml)
    -- -------------------------------------------------------------------------
    [9] = {  -- Monk
        pve_damage = 1.00,
        pvp_dealt  = 1.00,
        pvp_recv   = 1.00,
        heal_mult  = nil,
    },
    [10] = {  -- Exalted Monk
        pve_damage = 1.00,
        pvp_dealt  = 1.00,
        pvp_recv   = 1.00,
        heal_mult  = nil,
    },
}

-- =============================================================================
-- FUNÇÕES INTERNAS
-- =============================================================================

local function getLevelStageMultiplier(level)
    for _, stage in ipairs(LEVEL_STAGES) do
        if level >= stage.min and (not stage.max or level <= stage.max) then
            return stage.multiplier
        end
    end
    return 1.0
end

local function getVocConfig(player)
    if not player or not player:isPlayer() then return nil end
    return VOC_BALANCE[player:getVocation():getId()]
end

local function getPvpFactor()
    return PVP_FACTOR
end

-- =============================================================================
-- FUNÇÕES GLOBAIS (usadas pelos spells)
-- Substitui level_damage_bonus.lua — não é necessário mais esse arquivo
-- =============================================================================

function getLevelDamageMultiplier(player)
    if not player or not player:isPlayer() then return 1.0 end
    return getLevelStageMultiplier(player:getLevel())
end

function getLevelHealMultiplier(player)
    if not player or not player:isPlayer() then return 1.0 end
    local cfg = getVocConfig(player)
    if cfg and cfg.heal_mult then
        return cfg.heal_mult
    end
    local dmgMult = getLevelStageMultiplier(player:getLevel())
    return 1.0 + (dmgMult - 1.0) * HEAL_FACTOR
end

-- =============================================================================
-- EVENTO: onHealthChange
-- Aplica multiplicadores PVP e PVE por vocação
-- =============================================================================

local vocBalance = CreatureEvent("VocationBalance")

function vocBalance.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    -- Só intercepta dano real (valores negativos)
    if primaryDamage >= 0 and secondaryDamage >= 0 then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if not attacker or not attacker:isPlayer() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    local attackerCfg = getVocConfig(attacker)
    local factor = 1.0

    if creature:isPlayer() then
        -- ----------------------------------------------------------------
        -- PVP: jogador vs jogador
        -- ----------------------------------------------------------------
        if attacker:getId() == creature:getId() then
            return primaryDamage, primaryType, secondaryDamage, secondaryType
        end

        local pvpFactor  = getPvpFactor()
        local dealtMult  = (attackerCfg and attackerCfg.pvp_dealt) or 1.0

        local targetCfg  = getVocConfig(creature)
        local recvMult   = (targetCfg and targetCfg.pvp_recv) or 1.0

        factor = pvpFactor * dealtMult * recvMult

    else
        -- ----------------------------------------------------------------
        -- PVE: jogador vs monstro
        -- ----------------------------------------------------------------
        local pveMult = (attackerCfg and attackerCfg.pve_damage) or 1.0
        factor = pveMult
    end

    if factor == 1.0 then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if primaryDamage < 0 then
        primaryDamage = math.floor(primaryDamage * factor)
    end
    if secondaryDamage < 0 then
        secondaryDamage = math.floor(secondaryDamage * factor)
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

vocBalance:register()
