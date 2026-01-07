local effects = {
    {position = Position(480, 494, 7), text = 'Bem Vindo ao GordonsOT', effect = CONST_ME_HOLYAREA},
    {position = Position(482, 488, 7), text = 'TRAINERS', effect = CONST_ME_WATERCREATURE},
    {position = Position(480, 487, 7), text = 'HUNTS', effect = CONST_ME_GREENSMOKE},
    {position = Position(478, 488, 7), text = 'RAID', effect = CONST_ME_PURPLEENERGY},
    {position = Position(477, 492, 6), text = 'FORJA', effect = CONST_ME_WATERCREATURE},
}

local animatedText = GlobalEvent("AnimatedText") 
function animatedText.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

animatedText:interval(4550)
animatedText:register()