local internalNpcName = "Lord Varys"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = "the Master of Whispers"
npcConfig.health = 100
npcConfig.maxHealth = 100

npcConfig.walkInterval = 2500
npcConfig.walkRadius = 7

npcConfig.outfit = {
	lookType = 153, -- Nobleman
	lookHead = 0,
	lookBody = 114,
	lookLegs = 114,
	lookFeet = 114,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = true,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

-- =========================
-- EVENTOS PADRÃO
-- =========================
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

-- =========================
-- MENSAGENS E CONFIGURAÇÃO
-- =========================
npcHandler:setMessage(MESSAGE_GREET, "Shhh... nem todos devem me ouvir, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "O silêncio guarda mais verdades do que o barulho.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Alguns segredos não gostam de despedidas.")

-- Desabilitamos o greetCallback automático do FocusModule para remover hi/hello
npcHandler:addModule(FocusModule:new(), npcConfig.name, false, true, true)

-- Adicionado manualmente APENAS as palavras secretas para focar o NPC
keywordHandler:addKeyword({ "shhh" }, StdModule.greet, { npcHandler = npcHandler })
keywordHandler:addKeyword({ "shh" }, StdModule.greet, { npcHandler = npcHandler })

-- =========================
-- STORAGE E ENDINGS
-- =========================
local STORAGE_VARYS = 90100

local endings = {
	"No Gordons, o poder não está nas espadas… está em quem sabe quando usá-las.",
	"Meus pequenos pássaros voam até os lugares onde nem a magia ousa entrar.",
	"Há heróis famosos neste mundo… e traidores ainda mais bem escondidos.",
	"Nem todo inimigo vem armado. Alguns vêm sorrindo.",
	"O reino sobrevive não pela força, mas pela informação.",
	"Em Gordons, quem fala demais costuma desaparecer cedo.",
	"As guerras começam muito antes do primeiro golpe.",
	"A verdade é valiosa… por isso quase nunca é gratuita.",
	"Observe quem evita o olhar — ali costuma morar o perigo.",
	"Quando todos correm para a batalha, alguém precisa observar das sombras.",
}

local function sayEnd(npc, creature, text)
	npcHandler:say(text .. "\n\n" .. endings[math.random(#endings)], npc, creature)
end

-- =========================
-- CALLBACK PRINCIPAL
-- =========================
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, function(npc, creature, type, message)
	local player = Player(creature)
	local msg = message:lower()

	if msg == "sussurro" then
		if player:getStorageValue(STORAGE_VARYS) < 1 then
			player:setStorageValue(STORAGE_VARYS, 1)
			sayEnd(
				npc,
				creature,
				"Então você conhece o sussurro... agora fazemos parte da mesma história. Observe seu diário."
			)
		else
			sayEnd(npc, creature, "Os sussurros ainda ecoam. Pergunte com cuidado.")
		end
		return true
	end

	if msg == "cachoeira" then
		sayEnd(
			npc,
			creature,
			"Após as montanhas, depois do dragão, existe uma trilha esquecida. "
				.. "Ela leva ao topo de uma cachoeira, onde uma antiga estátua observa o mundo. "
				.. "Somente os corajosos pulam… e os que sobrevivem encontram algo. "
				.. "Ainda não sei o que é, mas meus pássaros logo descobrirão."
		)
		return true
	end

	if msg == "quest" or msg == "segredo" or msg == "segredos" then
		if player:getStorageValue(STORAGE_VARYS) < 1 then
			sayEnd(npc, creature, "Palavras vazias não abrem bocas seladas.")
		else
			sayEnd(npc, creature, "Onde reis caíram, o destino aguarda.")
		end
		return true
	end

	return false
end)

npcType:register(npcConfig)
