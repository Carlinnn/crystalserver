local effectsConfig = {
    { position = Position(475, 489, 7), effect = CONST_ME_EXPLOSIONAREA,  text = "Hunts",     interval = 5000 },
    { position = Position(475,  488, 7), effect = CONST_ME_GROUNDSHAKER,   text = "Bosses",    interval = 5000 },
    { position = Position(475, 487, 7), effect = CONST_ME_FIREWORK_BLUE,  text = "Quests",    interval = 5000 },
    { position = Position(485, 488, 7), effect = CONST_ME_ENERGYAREA,     text = "Trainers",  interval = 5000 },
    { position = Position(477, 492, 6), effect = CONST_ME_FIREAREA,       text = "Forja",     interval = 5000 },
    { position = Position(480, 494, 7), effect = CONST_ME_HOLYAREA,       text = "GordonsOT", interval = 5000 },
    { position = Position(481, 498, 6), effect = CONST_ME_HOLYAREA,       text = "GordonsOT", interval = 5000 },
    { position = Position(463, 497, 7), effect = CONST_ME_HOLYAREA,       text = "GordonsOT", interval = 5000 },
    { position = Position(76,  561, 8), effect = CONST_ME_EXPLOSIONAREA,  text = "Easy",      interval = 5000 },
    { position = Position(84,  561, 8), effect = CONST_ME_EXPLOSIONAREA,  text = "Medium",    interval = 5000 },
    { position = Position(80,  565, 8), effect = CONST_ME_EXPLOSIONAREA,  text = "Hard",      interval = 5000 },
}

local MagicEffects = GlobalEvent("MagicEffects")

function MagicEffects.onThink(interval)
    local now = os.time() * 1000 -- milliseconds

    for _, entry in ipairs(effectsConfig) do
        if not entry.lastRun then
            entry.lastRun = 0
        end

        local intervalMs = entry.interval or 5000
        if now - entry.lastRun >= intervalMs then
            local spectators = Game.getSpectators(entry.position, false, false, 7, 7, 5, 5)
            local sameFloor = {}
            for _, spectator in ipairs(spectators) do
                if spectator:getPosition().z == entry.position.z then
                    sameFloor[#sameFloor + 1] = spectator
                end
            end

            if #sameFloor > 0 then
                if entry.effect then
                    entry.position:sendMagicEffect(entry.effect)
                end

                if entry.text and entry.text ~= "" then
                    for _, spectator in ipairs(sameFloor) do
                        spectator:say(entry.text, TALKTYPE_MONSTER_SAY, false, spectator, entry.position)
                    end
                end
            end

            entry.lastRun = now
        end
    end

    return true
end

MagicEffects:interval(1000)
MagicEffects:register()