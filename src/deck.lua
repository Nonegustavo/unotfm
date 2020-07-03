DECK = {
	vanilla = {
		-- 108 cartas
		-- 2 cópias de 1 a 9 de cada cor
		-- 2 cópias de draw2 de cada cor
		-- 2 cópias de skip de cada cor
		-- 2 cópias de reverse de cada cor
		-- 1 cópia de 0 de cada cor
		-- 4 cópias de wild
		-- 4 cópias de draw4
		{"red","n0"},
		{"red","n1"},{"red","n2"},{"red","n3"},{"red","n4"},{"red","n5"},{"red","n6"},{"red","n7"},{"red","n8"},{"red","n9"},
		{"red","n1"},{"red","n2"},{"red","n3"},{"red","n4"},{"red","n5"},{"red","n6"},{"red","n7"},{"red","n8"},{"red","n9"},
		{"red","draw2"},{"red","draw2"},{"red","skip"},{"red","skip"},{"red","reverse"},{"red","reverse"},
		{"blue","n0"},
		{"blue","n1"},{"blue","n2"},{"blue","n3"},{"blue","n4"},{"blue","n5"},{"blue","n6"},{"blue","n7"},{"blue","n8"},{"blue","n9"},
		{"blue","n1"},{"blue","n2"},{"blue","n3"},{"blue","n4"},{"blue","n5"},{"blue","n6"},{"blue","n7"},{"blue","n8"},{"blue","n9"},
		{"blue","draw2"},{"blue","draw2"},{"blue","skip"},{"blue","skip"},{"blue","reverse"},{"blue","reverse"},
		{"yellow","n0"},
		{"yellow","n1"},{"yellow","n2"},{"yellow","n3"},{"yellow","n4"},{"yellow","n5"},{"yellow","n6"},{"yellow","n7"},{"yellow","n8"},{"yellow","n9"},
		{"yellow","n1"},{"yellow","n2"},{"yellow","n3"},{"yellow","n4"},{"yellow","n5"},{"yellow","n6"},{"yellow","n7"},{"yellow","n8"},{"yellow","n9"},
		{"yellow","draw2"},{"yellow","draw2"},{"yellow","skip"},{"yellow","skip"},{"yellow","reverse"},{"yellow","reverse"},
		{"green","n0"},
		{"green","n1"},{"green","n2"},{"green","n3"},{"green","n4"},{"green","n5"},{"green","n6"},{"green","n7"},{"green","n8"},{"green","n9"},
		{"green","n1"},{"green","n2"},{"green","n3"},{"green","n4"},{"green","n5"},{"green","n6"},{"green","n7"},{"green","n8"},{"green","n9"},
		{"green","draw2"},{"green","draw2"},{"green","skip"},{"green","skip"},{"green","reverse"},{"green","reverse"},
		{"black","wild"},{"black","wild"},{"black","wild"},{"black","wild"},
		{"black","draw4"},{"black","draw4"},{"black","draw4"},{"black","draw4"}
	},
	numbers = {
		-- 80 cartas
		-- 2 cópias de 1 a 9 de cada cor
		-- 1 cópia de 0 de cada cor
		-- 4 cópias de wild
		{"red","n0"},
		{"red","n1"},{"red","n2"},{"red","n3"},{"red","n4"},{"red","n5"},{"red","n6"},{"red","n7"},{"red","n8"},{"red","n9"},
		{"red","n1"},{"red","n2"},{"red","n3"},{"red","n4"},{"red","n5"},{"red","n6"},{"red","n7"},{"red","n8"},{"red","n9"},
		{"blue","n0"},
		{"blue","n1"},{"blue","n2"},{"blue","n3"},{"blue","n4"},{"blue","n5"},{"blue","n6"},{"blue","n7"},{"blue","n8"},{"blue","n9"},
		{"blue","n1"},{"blue","n2"},{"blue","n3"},{"blue","n4"},{"blue","n5"},{"blue","n6"},{"blue","n7"},{"blue","n8"},{"blue","n9"},
		{"yellow","n0"},
		{"yellow","n1"},{"yellow","n2"},{"yellow","n3"},{"yellow","n4"},{"yellow","n5"},{"yellow","n6"},{"yellow","n7"},{"yellow","n8"},{"yellow","n9"},
		{"yellow","n1"},{"yellow","n2"},{"yellow","n3"},{"yellow","n4"},{"yellow","n5"},{"yellow","n6"},{"yellow","n7"},{"yellow","n8"},{"yellow","n9"},
		{"green","n0"},
		{"green","n1"},{"green","n2"},{"green","n3"},{"green","n4"},{"green","n5"},{"green","n6"},{"green","n7"},{"green","n8"},{"green","n9"},
		{"green","n1"},{"green","n2"},{"green","n3"},{"green","n4"},{"green","n5"},{"green","n6"},{"green","n7"},{"green","n8"},{"green","n9"},
		{"black","wild"},{"black","wild"},{"black","wild"},{"black","wild"},
	},
	mess = {
		-- 32 cartas
		-- 2 cópias de cada carta de ação
		-- 4 curingas comuns
		-- 4 curingas +4
		-- é preenchido por cartas de todas as regras
		{"red","skip"},{"red","reverse"},{"red","draw2"},
		{"red","skip"},{"red","reverse"},{"red","draw2"},
		{"blue","skip"},{"blue","reverse"},{"blue","draw2"},
		{"blue","skip"},{"blue","reverse"},{"blue","draw2"},
		{"yellow","skip"},{"yellow","reverse"},{"yellow","draw2"},
		{"yellow","skip"},{"yellow","reverse"},{"yellow","draw2"},
		{"green","skip"},{"green","reverse"},{"green","draw2"},
		{"green","skip"},{"green","reverse"},{"green","draw2"},
		{"black","wild"},{"black","wild"},{"black","wild"},{"black","wild"},
		{"black","draw4"},{"black","draw4"},{"black","draw4"},{"black","draw4"}
	},
	peace = {
		-- 4 cartas
		-- 1 cópias de peace de cada cor
		{"red","peace"},{"blue","peace"},{"yellow","peace"},{"green","peace"}
	},
	confuse = {
		-- 8 cartas
		-- 2 cópias de confuse de cada cor
		{"red","confuse"},{"blue","confuse"},{"yellow","confuse"},{"green","confuse"},
		{"red","confuse"},{"blue","confuse"},{"yellow","confuse"},{"green","confuse"}
	},
	death = {
		-- 2 cartas
		-- 1 cópia de death de cada cor
		{"red","death"},{"blue","death"}
	},
	carousel = {
		-- 4 cartas
		-- 1 cópia de carousel de cada cor
		{"red","carousel"},{"blue","carousel"},{"yellow","carousel"},{"green","carousel"}
	},
	tornado = {
		-- 8 cartas
		-- 2 cópias de tornado de cada cor
		{"red","tornado"},{"blue","tornado"},{"yellow","tornado"},{"green","tornado"},
		{"red","tornado"},{"blue","tornado"},{"yellow","tornado"},{"green","tornado"},
	},
	trade = {
		-- 4 cartas
		-- 1 cópia de trade de cada cor
		{"red","trade"},{"blue","trade"},{"yellow","trade"},{"green","trade"}
	},
	gift = {
		-- 4 cartas
		-- 1 cópia de gift de cada cor
		{"red","gift"},{"blue","gift"},{"yellow","gift"},{"green","gift"}
	},
	ban = {
		-- 4 cartas
		-- 1 cópia de ban de cada cor
		{"red","ban"},{"blue","ban"},{"yellow","ban"},{"green","ban"}
	},
	magnet = {
		-- 8 cartas
		-- 2 cópias de magnet de cada cor
		{"red","magnet"},{"blue","magnet"},{"yellow","magnet"},{"green","magnet"},
		{"red","magnet"},{"blue","magnet"},{"yellow","magnet"},{"green","magnet"},
	},
	random = {
		-- 4 cartas pretas
		{"black","random"},{"black","random"},{"black","random"},{"black","random"}
	},
	clone = {
		-- 4 cartas pretas
		{"black","clone"},{"black","clone"},{"black","clone"},{"black","clone"}
	},
	spy = {
		-- 8 cartas
		-- 2 cópias de spy de cada cor
		{"red","spy"},{"blue","spy"},{"yellow","spy"},{"green","spy"},
		{"red","spy"},{"blue","spy"},{"yellow","spy"},{"green","spy"}
	},
	compass = {
		-- 8 cartas
		-- 2 cópias de compass de cada cor
		{"red","compass"},{"blue","compass"},{"yellow","compass"},{"green","compass"},
		{"red","compass"},{"blue","compass"},{"yellow","compass"},{"green","compass"}
	},
	chair = {
		-- 4 cartas
		-- 1 cópia de chair de cada cor
		{"red","chair"},{"blue","chair"},{"yellow","chair"},{"green","chair"}
	},
	theft = {
		-- 8 cartas
		-- 1 cópia de theft de cada cor
		{"red","theft"},{"blue","theft"},{"yellow","theft"},{"green","theft"},
		{"red","theft"},{"blue","theft"},{"yellow","theft"},{"green","theft"}
	},
	imitate = {
		-- 4 cartas
		-- 1 cópia de imitate de cada cor
		{"red","imitate"},{"blue","imitate"},{"yellow","imitate"},{"green","imitate"}
	},
	equality = {
		-- 4 cartas
		-- 1 cópia de equality de cada cor
		{"red","equality"},{"blue","equality"},{"yellow","equality"},{"green","equality"}
	},
	web = {
		-- 4 cartas
		-- 1 cópia de web de cada cor
		{"red","web"},{"blue","web"},{"yellow","web"},{"green","web"}
	},
	rule = {
		-- 4 cartas
		-- 1 cópia de rule de cada cor
		{"red","rule"},{"blue","rule"},{"yellow","rule"},{"green","rule"}
	},
	steal = {
		-- 4 cartas
		-- 1 cópia de steal de cada cor
		{"red","steal"},{"blue","steal"},{"yellow","steal"},{"green","steal"}
	},
	thunder = {
		-- 2 cartas
		{"yellow","thunder"},{"green","thunder"}
	},
	rain = {
		-- 2 cartas
		{"red","rain"},{"blue","rain"}
	},
	box = {
		-- 2 cartas
		{"red","box"},{"blue","box"}
	},
	wish = {
		-- 4 cartas
		{"red","wish"},{"blue","wish"},{"yellow","wish"},{"green","wish"}
	},
	ink = {
		-- 4 cartas
		{"red","ink"},{"blue","ink"},{"yellow","ink"},{"green","ink"}
	},
	curse = {
		-- 4 cartas
		{"red","curse"},{"blue","curse"},{"yellow","curse"},{"green","curse"}
	},
	dice = {
		-- 4 cartas
		{"red","dice"},{"blue","dice"},{"yellow","dice"},{"green","dice"}
	},
	paradox = {
		-- 4 cartas
		{"red","paradox"},{"blue","paradox"},{"yellow","paradox"},{"green","paradox"}
	},
	mimic = {
		-- 4 cartas
		{"red","mimic"},{"blue","mimic"},{"yellow","mimic"},{"green","mimic"}
	},
	justice = {
		-- 4 cartas
		{"red","justice"},{"blue","justice"},{"yellow","justice"},{"green","justice"}
	},
	oddeven = {
		-- 8 cartas
		{"red","oddeven"},{"blue","oddeven"},{"yellow","oddeven"},{"green","oddeven"},
		{"red","oddeven"},{"blue","oddeven"},{"yellow","oddeven"},{"green","oddeven"}
	},
	bomb = {
		-- 1 carta
		{"black","bomb"}
	},
	batata = {
		-- 1 carta
		{"red","batata"}
	},
	draw99 = {
		-- 1 carta
		{"black","draw99"}
	},
	half = {
		-- 1 carta
		{"black","half"}
	},
	simon = {
		-- 8 cartas
		{"black","simon"},{"black","simon"},{"black","simon"},{"black","simon"},{"black","simon"},{"black","simon"},{"black","simon"},{"black","simon"}
	},
	meep = {
		-- 8 cartas
		-- 2 cópias de meep de cada cor
		{"red","meep"},{"blue","meep"},{"yellow","meep"},{"green","meep"},
		{"red","meep"},{"blue","meep"},{"yellow","meep"},{"green","meep"}
	},
	luck = {
		-- 8 cartas
		-- 2 cópias de luck de cada cor
		{"red","luck"},{"blue","luck"},{"yellow","luck"},{"green","luck"},
		{"red","luck"},{"blue","luck"},{"yellow","luck"},{"green","luck"}
	},
	portal = {
		-- 8 cartas
		-- 2 cópias de portal de cada cor
		{"red","portal"},{"blue","portal"},{"yellow","portal"},{"green","portal"},
		{"red","portal"},{"blue","portal"},{"yellow","portal"},{"green","portal"},
	},
	key = {
		-- 4 cartas
		-- 1 cópias de key de cada cor
		{"red","key"},{"blue","key"},{"yellow","key"},{"green","key"},
	},
	share = {
		-- 8 cartas
		-- 2 cópias de share de cada cor
		{"green","share"},{"yellow","share"},
	},
	mix = {
		-- 12 cartas
		-- 1 cópia de reverse skip de cada cor
		-- 1 cópia de reverse +2 de cada cor
		-- 1 cópia de skip +2 de cada cor
		{"red","mix1"},{"blue","mix1"},{"yellow","mix1"},{"green","mix1"},
		{"red","mix2"},{"blue","mix2"},{"yellow","mix2"},{"green","mix2"},
		{"red","mix3"},{"blue","mix3"},{"yellow","mix3"},{"green","mix3"},
	},
	chess = {
		-- 22 cartas
		-- 1 rei preto
		-- 1 rainha preto
		-- 1 cópia de bispo de cada cor
		-- 1 cópia de cavalo de cada cor
		-- 1 cópia de torre de cada cor
		-- 2 cópias de peões de cada cor
		{"black","king"},{"black","queen"},
		{"red","bishop"},{"blue","bishop"},{"yellow","bishop"},{"green","bishop"},
		{"red","knight"},{"blue","knight"},{"yellow","knight"},{"green","knight"},
		{"red","rook"},{"blue","rook"},{"yellow","rook"},{"green","rook"},
		{"red","pawn"},{"blue","pawn"},{"yellow","pawn"},{"green","pawn"},
		{"red","pawn"},{"blue","pawn"},{"yellow","pawn"},{"green","pawn"},
	}
}