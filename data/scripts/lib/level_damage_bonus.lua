local damageStages = {
	{ minlevel = 1,     maxlevel = 200,   multiplier = 1.0  },
	{ minlevel = 201,   maxlevel = 500,   multiplier = 1.30 },
	{ minlevel = 501,   maxlevel = 1000,  multiplier = 1.70 },
	{ minlevel = 1001,  maxlevel = 2000,  multiplier = 2.20 },
	{ minlevel = 2001,  maxlevel = 3000,  multiplier = 2.80 },
	{ minlevel = 3001,  maxlevel = 5000,  multiplier = 3.50 },
	{ minlevel = 5001,  maxlevel = 7000,  multiplier = 4.50 },
	{ minlevel = 7001,  maxlevel = 9000,  multiplier = 5.50 },
	{ minlevel = 9001,  maxlevel = 10000, multiplier = 7.00 },
	{ minlevel = 10001,                   multiplier = 9.00 },
}

local function getPlayerMultiplier(level)
	for _, stage in ipairs(damageStages) do
		if level >= stage.minlevel and (not stage.maxlevel or level <= stage.maxlevel) then
			return stage.multiplier
		end
	end
	return 1.0
end

function getLevelDamageMultiplier(player)
	if not player or not player:isPlayer() then
		return 1.0
	end
	return getPlayerMultiplier(player:getLevel())
end

function getLevelHealMultiplier(player)
	if not player or not player:isPlayer() then
		return 1.0
	end
	local dmgMult = getPlayerMultiplier(player:getLevel())
	-- Healing scales at 65% of damage to keep players survivable but not unkillable
	return 1.0 + (dmgMult - 1.0) * 0.65
end
