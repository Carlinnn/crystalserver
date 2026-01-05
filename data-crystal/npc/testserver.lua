local internalNpcName = "TestServer"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 430,
	lookHead = 78,
	lookBody = 69,
	lookLegs = 58,
	lookFeet = 76,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcConfig.shop = {
	{ itemName = "bag you covet", clientId = 43895, buy = 1 }, -- Sanguine Bag
	{ itemName = "primal bag", clientId = 39546, buy = 1 },    -- Gnomprona Bag
	{ itemName = "bag you desire", clientId = 34109, buy = 1 }, -- Soul War Bag
	{ itemName = "greater guardian gem", clientId = 44604, buy = 1 },
	{ itemName = "greater marksman gem", clientId = 44607, buy = 1 },
	{ itemName = "greater sage gem", clientId = 44610, buy = 1 },
	{ itemName = "greater mystic gem", clientId = 44613, buy = 1 },
	{ itemName = "lesser fragment", clientId = 46625, buy = 1 },
	{ itemName = "greater fragment", clientId = 46626, buy = 1 }
}

local function onDinheiro(npc, creature, type, message)
	if not npcHandler:isFocused(creature) then
		return false
	end

	local player = creature:getPlayer()
	if player then
		player:addMoney(1000000)
		npcHandler:say("Aqui está 1kk de ouro para você, aventureiro!", creature)
	end
	return true
end

keywordHandler:addKeyword({'dinheiro'}, onDinheiro, {npcHandler = npcHandler})
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, text = "Com certeza, veja minhas ofertas de bags especiais!"})

npcHandler:setMessage(MESSAGE_GREET, "Olá, |PLAYERNAME|. Este é o NPC do Test Server. Se precisar de {dinheiro} ou quiser ver meu {trade}, é só pedir.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até logo, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Até logo, |PLAYERNAME|.")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
npcHandler:addModule(ShopModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)
