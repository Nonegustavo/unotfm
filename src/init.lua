MAP = {"@7094274", "@7108608", "@6149054", "@7131131", "@7131143", "@7146157", "@5494959", "@7000495", "@7157619", "@7157805", "@7158484", "@7147082", "@7158627", "@7146872", "@7176840", "@7225526", "@7312590", "@7491588", "@7516436", {"@7283094", "@7283521"}}
MUSIC = {"@7295158"}
COMMAND = {"chair", "np", "random", "rule", "settings", "ban", "kick", "unban", "adm", "new", "map", "reset", "start", "pw", "p", "profile", "stats", "ranking", "boss", "power", "history", "fake", "color", "bell", "nolag", "shadow", "test", "custom", "givechair", "givebadge", "givescore", "giverule", "isranked", "rulenow", "limit", "spectator", "flag", "faustao", "rules"}

VERSION = "v1.0.12 [21/03/21]"

-- progress
OWNER = "Ninguem#0095"

BANNED = {}

ADM = {}

SCORE = {}

MATCH = {}

LOG = ""

CONST = {
	maxHand = 31,
}

BOT = {}

TITLE = {
	foul_play = "T_499",
	king_of_thrones = "T_500",
	uno = "T_501"
}

CONFIG = {
	UNO = "UNO!",
	discord = "https://discord.gg/xu5GVuj",
	rule = {},
	banned = {},
	chair = {},
	custom = {
		action={
			{action="DRAW",who="NEXT",amount="2"},
		},
		color={red=1,blue=1,yellow=1,green=1}},
	fixedChair = false,
	newPlayers = true,
	autoStart = true,
	test = false,
	scoreBy = "SCORE_1",
	random = false,
	ranked = true,
	music = false,
	noRules = true,
	tribeHouse = false,
	mapEvent = {"@7312582", "@7578073"},
	--mapEvent = {"@7312582", "@7578073"}, -- bagunça
	--mapEvent = "@7279009", -- halloween (drekkemaus)
	--mapEvent = "@7322204", -- natal (jingle, papaille)
	--mapEvent = "@7366545" -- natal (snnowy, icemice)
	--mapEvent = "@7366545", -- dia da marmota (charlotte)
	--mapEvent = "@7432492", -- aniversario (elisah)
	pityTimer = 15, -- evento: 8, casual: 15
	eventRate = 0.04, -- evento: 0.07, casual: 0.04
	actualTimer = 0,
	qtdRule = 72,
}

ROUND = {}

PLAYER = {}

PARADOX = {}