--[[
    PvP Balance System

    Base PvP damage = 75% of PvM damage.
    Same level fights are completely viable — takes ~4-6 good combos to kill.

    Level ratio bonus scales gradually from 0 to +25%:
      ratio 1.00 → 75%  (even fight, both can kill each other)
      ratio 1.25 → 80%
      ratio 1.50 → 85%
      ratio 2.00 → 95%
      ratio 3.00+ → 100% (full damage, dominant)

    This mirrors FuriaOT balance: skill and build matter,
    level gives progressive advantage without making low levels unkillable.
--]]

local BASE_PVP_FACTOR   = 0.75
local RATIO_BONUS_PER_STEP = 0.05  -- +5% per level ratio step
local RATIO_STEP        = 0.25     -- every 0.25x ratio = one step
local MAX_PVP_FACTOR    = 1.00

local function getPvpFactor(attackerLevel, targetLevel)
	local ratio = attackerLevel / math.max(1, targetLevel)
	if ratio <= 1.0 then
		return BASE_PVP_FACTOR
	end
	local steps = math.floor((ratio - 1.0) / RATIO_STEP)
	local factor = BASE_PVP_FACTOR + (steps * RATIO_BONUS_PER_STEP)
	return math.min(factor, MAX_PVP_FACTOR)
end

local pvpBalance = CreatureEvent("PvPBalance")

function pvpBalance.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	-- Only intercept actual damage (negative values), not healing
	if primaryDamage >= 0 and secondaryDamage >= 0 then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	-- Only player vs player
	if not attacker or not attacker:isPlayer() or not creature:isPlayer() then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	-- Skip self-damage
	if attacker:getId() == creature:getId() then
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	local factor = getPvpFactor(attacker:getLevel(), creature:getLevel())

	if primaryDamage < 0 then
		primaryDamage = math.floor(primaryDamage * factor)
	end
	if secondaryDamage < 0 then
		secondaryDamage = math.floor(secondaryDamage * factor)
	end

	return primaryDamage, primaryType, secondaryDamage, secondaryType
end

pvpBalance:register()
