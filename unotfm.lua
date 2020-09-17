--[[ src/init.lua ]]--

MAP = {"@7094274", "@7108608", "@6149054", "@7131131", "@7131143", "@7146157", "@5494959", "@7000495", "@7157619", "@7157805", "@7158484", "@7147082", "@7158627", "@7146872", "@7176840", "@7225526", "@7312590", "@7491588", "@7516436", {"@7283094", "@7283521"}}
MUSIC = {"@7295158"}
COMMAND = {"chair", "np", "random", "rule", "settings", "ban", "kick", "unban", "adm", "new", "map", "reset", "start", "pw", "p", "profile", "stats", "ranking", "boss", "power", "history", "fake", "color", "bell", "nolag", "shadow", "test", "custom", "givechair", "givebadge", "givescore", "giverule", "isranked", "rulenow", "limit", "spectator", "flag", "faustao", "rules"}

VERSION = "v1.0.11 [30/05/20]"

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
	tribeHouse = tfm.get.room.name:sub(2,2) == "",
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
	qtdRule = 71,
}

ROUND = {}

PLAYER = {}

PARADOX = {}


--[[ src/images.lua ]]--

IMG = {
	skin = {
		orange = {
			misc = {
				shadow = "15ae79a2aae.png",
				back = "15c33b7a4a1.png",
				nocard = "15d10b6eb2d.png",
				cardLayer = "15b4aad0f7b.png",
				backIce = "1625a89e88b.png",
				backThorn = "1625a95cde0.png",
				backAnvil = "1625aadaca8.png",
				death = "15c27a454b7.png",
				discover = "15c33b7d798.png",
				discoverWild = "16066820aee.png",
				discoverRule = "1606686351d.png",
			},
			color = {
				red = {mini="15b4a93e9fc.png", big="15b4a9a1d71.png"},
				blue = {mini="15b4a93fcfc.png", big="15b4a99f8b1.png"},
				yellow = {mini="15f126966fd.png", big="15f126948a2.png"},
				green = {mini="15b4a942583.png", big="15b4a9a0de9.png"},
				black = {mini="15b4a9436c7.png", big="15bff03e5dd.png"},
			},
			colorBlind = {
				red = {mini="15f27448b95.png", big="15f274469c6.png"},
				blue = {mini="15f2744ca72.png", big="15f2744aab0.png"},
				yellow = {mini="15f27450ec2.png", big="15f2744ef6a.png"},
				green = {mini="15f27455303.png", big="15f27453026.png"},
			},
			symbol = {
				n0 = {mini="15b4a91f2f3.png", big="15bfefecf96.png"},
				n1 = {mini="15b4a925b73.png", big="15bfefef0fa.png"},
				n2 = {mini="15b4a926cff.png", big="15bfeff0775.png"},
				n3 = {mini="15b4a928046.png", big="15bfeff1a0a.png"},
				n4 = {mini="15b4a929c3c.png", big="15bfeff2dfe.png"},
				n5 = {mini="15b4a92b167.png", big="15bfeff3d41.png"},
				n6 = {mini="15b4a92c0a5.png", big="15bfeff4f05.png"},
				n7 = {mini="15b4a92d0d4.png", big="15bfeff688e.png"},
				n8 = {mini="15b4a92eeaf.png", big="15bfeff8570.png"},
				n9 = {mini="15b4a930032.png", big="15bfeff993c.png"},
				skip = {mini="15b4a9351d8.png", big="15bfeffe96a.png"},
				reverse = {mini="15b4a933ff7.png", big="15bfeffc3cb.png"},
				draw2 = {mini="15b4a931641.png", big="15bfeffb188.png"},
				wild = {mini="15b4a937707.png", big="15b4a99c0c8.png"},
				draw4 = {mini="15b4f792cbf.png", big="15b4f7917e7.png"},
				chair = {mini="15c286cbc02.png", big="15c28747aa0.png"},
				carousel = {mini="15c286d58e3.png", big="15c28750003.png"},
				spy = {mini="15c286def3c.png", big="15c2875987a.png"},
				shield = {mini="15c297e90ba.png", big="15c297eb19b.png"},
				rain = {mini="15c286d7919.png", big="15c28753de0.png"},
				gift = {mini="15c286c43c3.png", big="15c287456eb.png"},
				imitate = {mini="15c286cfb44.png", big="15c28749da3.png"},
				death = {mini="15c286d1b8d.png", big="15c2874bd44.png"},
				peace = {mini="15c286c033b.png", big="15c28740759.png"},
				random = {mini="15c286c23f2.png", big="15c28743560.png"},
				trade = {mini="15c286dacf4.png", big="15c287559bf.png"},
				equality = {mini="15c286be2dc.png", big="15c28712bdf.png"},
				bomb = {mini="15c286dd152.png", big="15c2875798a.png"},
				meep = {mini="15c287e09c7.png", big="15c287e2a12.png"},
				rule = {mini="15c8f99eb44.png", big="15c8f999c9b.png"},
				ruleBoss = {mini="15c8f99eb44.png", big="15c8f999c9b.png"},
				pawn = {mini="15c381d8cfc.png", big="15c381f8f3b.png"},
				rook = {mini="15c381e0bba.png", big="15c38201e23.png"},
				knight = {mini="15c381daf72.png", big="15c381fadb1.png"},
				bishop = {mini="15c381dd012.png", big="15c381fc923.png"},
				queen = {mini="15c381deca0.png", big="15c38200418.png"},
				king = {mini="15c381d6c68.png", big="15c381f6e9f.png"},
				steal = {mini="15e54b0cf90.png", big="15e54b0afc9.png"},
				thunder = {mini="15ebbcc19c3.png", big="15ebbcbf816.png"},
				clone = {mini="15ec03f3ded.png", big="15ec03f14a8.png"},
				luck = {mini="15ec0b2592a.png", big="15ec0b239f0.png"},
				web = {mini="15ec6046e8a.png", big="15ec6042371.png"},
				box = {mini="15f0d927294.png", big="15f0d924a59.png"},
				wish = {mini="15f1158233a.png", big="15f1157fcb5.png"},
				portal = {mini="15f82c9f113.png", big="15f82c9d035.png"},
				custom = {mini="15f8ccf2c13.png", big="15f8c85c5e3.png"},
				ink = {mini="16065906f9d.png", big="16065905381.png"},
				confuse = {mini="1606c28b12b.png", big="1606c2872c0.png"},
				compass = {mini="16106416e62.png", big="16106418c8b.png"},
				chest = {mini="16106412756.png", big="161064146bc.png"},
				batata = {mini="16168d82ac0.png", big="16168d80c6d.png"},
				draw99 = {mini="1618fe23269.png", big="1618fe25ef4.png"},
				curse = {mini="1625983f1c1.png", big="1625984174b.png"},
				magnet = {mini="1637fb72c9a.png", big="1637fb75134.png"},
				tornado = {mini="165c696b073.png", big="165c696cdad.png"},
				theft = {mini="165ce50d72d.png", big="165ce50b7ca.png"},
				simon = {mini="16622ad97d0.png", big="16622abe97e.png"},
				ban = {mini="166657d8063.png", big="166657da628.png"},
				dice = {mini="1678b464c48.png", big="1678b474f8a.png"},
				half = {mini="1678b4668b1.png", big="1678b4769e8.png"},
				paradox = {mini="1678b4689bc.png", big="1678b4785cd.png"},
				mimic = {mini="1678b46a7ea.png", big="1678b47a2be.png"},
				oddeven = {mini="1678b46c247.png", big="1678b47beed.png"},
				justice = {mini="16793a19028.png", big="16793a1b1b7.png"},
				mix1 = {mini="1678b46e52e.png", big="1678b47e3ef.png"},
				mix2 = {mini="1678b4706f4.png", big="1678b4804ad.png"},
				mix3 = {mini="1678b47224c.png", big="1678b48215d.png"},
				key = {mini="171653173d2.png", big="1716530f46e.png"},
				share = {mini="171653130eb.png", big="1716530ae8e.png"},
			}
		},
		blue = {
			misc = {
				shadow = "171484f6b09.png",
				back = "1713e1e860f.png",
				nocard = "1716c91b159.png",
				cardLayer = "15b4aad0f7b.png",
				backIce = "1716c9137e0.png",
				backThorn = "1716c9161b8.png",
				backAnvil = "1716c90d032.png",
				death = "1716c918c7d.png",
				discover = "1716c96953a.png",
				discoverWild = "1716c96de06.png",
				discoverRule = "1716c96be7e.png",
			},
			color = {
				red = {mini="171668c8f03.png", big="171668adc64.png"},
				blue = {mini="1713e04dc61.png", big="1713e097cfe.png"},
				yellow = {mini="171668c67ab.png", big="171668ab012.png"},
				green = {mini="1713e05a179.png", big="1713e09b1e5.png"},
				black = {mini="1713e070b62.png", big="1713e099c73.png"},
			},
			colorBlind = {
				red = {mini="171668f06d1.png", big="171668f239a.png"},
				blue = {mini="171668e73da.png", big="171668e9231.png"},
				yellow = {mini="171668f4400.png", big="171668f6451.png"},
				green = {mini="171668ec2e2.png", big="171668ee1ea.png"},
			},
			symbol = {
				n0 = {mini="1713e03c95c.png", big="1713e085663.png"},
				n1 = {mini="1713e03e42e.png", big="1713e088b40.png"},
				n2 = {mini="1713e03fdd8.png", big="1713e08a1f0.png"},
				n3 = {mini="1713e0413b7.png", big="1713e08b79a.png"},
				n4 = {mini="1713e0428ee.png", big="1713e08cdd0.png"},
				n5 = {mini="1713e043fe6.png", big="1713e08e392.png"},
				n6 = {mini="1713e0456c6.png", big="1713e08f9c9.png"},
				n7 = {mini="1713e046d95.png", big="1713e0911ae.png"},
				n8 = {mini="1713e048596.png", big="1713e0928b8.png"},
				n9 = {mini="1713e049d96.png", big="1713e093f20.png"},
				skip = {mini="1713e054dd8.png", big="1713e0aa3d3.png"},
				reverse = {mini="1713e05376b.png", big="1713e0a28eb.png"},
				draw2 = {mini="1713e05e008.png", big="1713e09fa7a.png"},
				wild = {mini="1713e056f62.png", big="1713e0abb26.png"},
				draw4 = {mini="1713e0586fa.png", big="1713e0acfb6.png"},
				chair = {mini="171481b4e1d.png", big="171480f11c4.png"},
				carousel = {mini="171481aa49e.png", big="171480d36d6.png"},
				spy = {mini="171481ae274.png", big="171480d9847.png"},
				shield = {mini="171481bf16f.png", big="171480fa044.png"},
				rain = {mini="171481abe8e.png", big="171480d5cd0.png"},
				gift = {mini="171481b9d0f.png", big="171480f76cb.png"},
				imitate = {mini="171481c4ffe.png", big="17148100415.png"},
				death = {mini="171481d9ae9.png", big="1714811164d.png"},
				peace = {mini="171481e0691.png", big="17148117edc.png"},
				random = {mini="171481e8878.png", big="1714811fc86.png"},
				trade = {mini="171481fddbe.png", big="1714813188e.png"},
				equality = {mini="171481c23e6.png", big="171480fd051.png"},
				bomb = {mini="171481a7986.png", big="171480cbc91.png"},
				meep = {mini="171481d171d.png", big="17148108e65.png"},
				rule = {mini="171525ef296.png", big="1714812310d.png"},
				ruleBoss = {mini="171525ef296.png", big="1714812310d.png"},
				pawn = {mini="171481defd7.png", big="1714811677e.png"},
				rook = {mini="171481e9e69.png", big="171481219a6.png"},
				knight = {mini="171481c9a76.png", big="17148201e72.png"},
				bishop = {mini="171481a62dd.png", big="171480c87d7.png"},
				queen = {mini="171481e6d49.png", big="1714811e10b.png"},
				king = {mini="171481c7f83.png", big="171481033aa.png"},
				steal = {mini="171481ce1ed.png", big="17148104cf7.png"},
				thunder = {mini="171481f7a37.png", big="1714812e48b.png"},
				clone = {mini="171481afecd.png", big="171480dc382.png"},
				luck = {mini="171481f1a58.png", big="171481267ed.png"},
				web = {mini="171481f31ef.png", big="1714812901e.png"},
				box = {mini="171481e54b7.png", big="1714811c7ad.png"},
				wish = {mini="171481b640e.png", big="171480f33ed.png"},
				portal = {mini="171481e3851.png", big="1714811afd0.png"},
				custom = {mini="171481b36cc.png", big="171480ef6aa.png"},
				ink = {mini="171481f9ae7.png", big="1714812ff0d.png"},
				confuse = {mini="171481b1ead.png", big="171480de741.png"},
				compass = {mini="171481a8f86.png", big="171480cd762.png"},
				chest = {mini="171481f4a10.png", big="1714812b067.png"},
				batata = {mini="171481a4d95.png", big="171480c7210.png"},
				draw99 = {mini="171481cfa1f.png", big="17148106741.png"},
				curse = {mini="171481e1fa9.png", big="1714811968b.png"},
				magnet = {mini="171481c3a75.png", big="171480fe8e6.png"},
				tornado = {mini="171481fb2c1.png", big="171481ff912.png"},
				theft = {mini="171481f6652.png", big="1714812cca4.png"},
				simon = {mini="171481efbb7.png", big="17148124988.png"},
				ban = {mini="171481a3456.png", big="171480c5a59.png"},
				dice = {mini="171481b80be.png", big="171480f5592.png"},
				half = {mini="171481c0a71.png", big="171480fb668.png"},
				paradox = {mini="171481dd650.png", big="17148114baf.png"},
				mimic = {mini="171481d2f95.png", big="1714810ab97.png"},
				oddeven = {mini="171481db8b7.png", big="17148112e25.png"},
				justice = {mini="171481c6557.png", big="17148101be6.png"},
				mix1 = {mini="171481d49ed.png", big="1714810c278.png"},
				mix2 = {mini="171481d65c5.png", big="1714810e136.png"},
				mix3 = {mini="171481d81d5.png", big="1714810fdc0.png"},
				key = {mini="1716531925b.png", big="1716531125c.png"},
				share = {mini="17165315696.png", big="1716530d12f.png"},
			}
		},
	},
	misc = {
		target = "15c26b225c5.png",
		emptyChair = "15b90ff3a79.png",
		skipped = "15b14ff686d.png",
		challenge = "15b2b8ebc59.png",
		cloud = "15ae8515f11.png",
		arrow = "15afd80f0d5.png",
		winning = "163140d5a81.png",
		genericLayer = "15b26bef526.png",
		handLayer = "15b29c7a3ab.png",
		sucess = "15b2b8f36b6.png",
		fail = "15b2b8f543c.png",
		light = "15b2bb46d9c.png",
		hourglass = "15b7bebaea1.png",
		illuminatiEye = "15b9263c5a3.png",
		psychoBlink = "165c68bc2aa.png",
		glowCard = "15bd0ba0089.png",
		jumpIn = "15c0f06183e.png",
		discover = "15c33b7d798.png",
		discoverWild = "16066820aee.png",
		discoverRule = "1606686351d.png",
		locked = "15c75888414.png",
		lockedPanel = "161df0a4f48.png",
		lockedCard = "165e9976dc9.png",
		right = "15c99240e69.png",
		left = "15c99243213.png",
		tip = "15e82cd7bcd.png",
		thunder = "15ebbcbb3ac.png",
		web = "15ec624d33a.png",
		ribbon = "15f0d921edd.png",
		wish = "15f115840a2.png",
		shoe = {orange="1625b6181d9.png", blue="171655f0730.png"},
		lock = {orange="171655f7437.png", blue="171655f9f70.png"},
		blue = "17165aab862.png",
		--orange = "15f83690b8b.png",
		orange = "171668b2978.png",
		burn = "16065673a46.png",
		errou = "166329fbdfd.png",
		portal = "1678e290176.png",
		odd = "1678fbde7de.png",
		even = "1678fbdb9af.png",
		linked = "1678ffe71f6.png",
		robot = "1729b704b01.png",
		pow = "167d3a2e0fb.png",
	},
	emote = {
		[0] = "15c4710d437.png", -- dance
		[1] = "15c4711220a.png", -- laugh
		[2] = "15c4710b6d9.png", -- cry
		[3] = "15c4711082f.png", -- kiss
		[4] = "15c471181bc.png", -- tilt
		[5] = "15c4710990d.png", -- clap
		[6] = "15c47116630.png", -- sleep
		[7] = "15c4710eeb3.png", -- facepalm
	},
	flag = {
		ar = "15cb218003e.png",
		bg = "15cb21817ca.png",
		br = "15cb2182bbb.png",
		cn = "15cb21842c7.png",
		cz = "15cb2185aaf.png",
		de = "15cb2187905.png",
		e2 = "15cb21893d2.png",
		ee = "15cb218ac86.png",
		en = "15cb218c5ea.png",
		es = "15cb218de01.png",
		fi = "15cb218f55f.png",
		fr = "15cb2190f1e.png",
		he = "15cb21925c7.png",
		hr = "15cb2193ff8.png",
		hu = "15cb21959ad.png",
		id = "15cb2196eae.png",
		it = "15cb2198b3e.png",
		jp = "15cb219add7.png",
		lt = "15cb219cc71.png",
		lv = "15cb219e4b1.png",
		nl = "15cb219fda6.png",
		ph = "15cb21a1d58.png",
		pl = "15cb21a34ea.png",
		pt = "15cb21a4ca8.png",
		ro = "15cb21a6631.png",
		ru = "15cb21a7d86.png",
		tr = "15cb21a9422.png",
		vk = "15cb21aadc0.png",
	},
	team = {
		{"15f510ad1a9.png", "16101286c7a.png"}, -- vermelho
		{"15f510a6c6a.png", "1610127db31.png"}, -- azul
		{"15f510a8f28.png", "1610128087c.png"}, -- verde
		{"15f600958bf.png", "16101285142.png"}, -- rosa
		{"15f6009339f.png", "16101288b36.png"}, -- amarelo
	},
	neighbor = {
	 n0 = {orange="16149a69c53.png", blue="171dc1d738d.png"},
	 n1 = {orange="16149a681d2.png", blue="171dc1d8fd5.png"},
	 n2 = {orange="16149a66878.png", blue="171dc1dab25.png"},
	 n3 = {orange="16149a64f94.png", blue="171dc1dc76d.png"},
	 n4 = {orange="16149a634a1.png", blue="171dc1de255.png"},
	 n5 = {orange="16149a6156b.png", blue="171dc1dfec5.png"},
	 n6 = {orange="16149a5fb60.png", blue="171dc1e1b7d.png"},
	 n7 = {orange="16149a5dc62.png", blue="171dc1e357d.png"},
	 n8 = {orange="16149a5c160.png", blue="171dc1e5074.png"},
	 n9 = {orange="16149a5a599.png", blue="171dc1e6c5d.png"},
	},
	batata = {
		"1616d6f1e8b.png",
		"1616d6f3e9b.png",
		"1616d6f5b87.png",
		"1616d6f79d8.png",
		"1616d6f9ab2.png",
	},
	simon = {
		red = {orange="16627af4d7f.png", blue="171485729e6.png"},
		blue = {orange="16627af0da0.png", blue="1714856e8d3.png"},
		yellow = {orange="16627adfa78.png", blue="1714856bfc4.png"},
		green = {orange="16627af304c.png", blue="171485708e1.png"},
	},
	simonMini = {
		red = {orange="1662b7548ae.png", blue="1714857abed.png"},
		blue = {orange="1662b7508e3.png", blue="17148576dfe.png"},
		yellow = {orange="1662b74e95b.png", blue="17148574dc7.png"},
		green = {orange="1662b7527ca.png", blue="17148578be0.png"},
	},
}


--[[ src/deck.lua ]]--

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


--[[ src/chairs.lua ]]--

SKIN = {
	empty = {
		img = "15b90ff3a79.png",
	},
	default = {
		img = "15b90ff1d49.png",
		imgMini = "15bb5cd1561.png",
		name = "SKIN_DEFAULT",
		mission = "SKIN_DEFAULT_MISSION",
		author = "Melibellule#0001"
	},
	random = {
		img = "1660e8ad817.png",
		imgMini = "1660e8aa110.png",
		name = "SKIN_RANDOM",
		desc = "SKIN_RANDOM_DESC",
		mission = "SKIN_DEFAULT_MISSION",
		author = "???"
	},
	wood = {
		img = "15b0ce80d49.png",
		imgMini = "15bb5ce58c1.png",
		name = "SKIN_WOOD",
		mission = "SKIN_ROUND_MISSION",
		progress = 100,
		author = "Kurt#0010",
	},
	stone = {
		img = "15b0cf64856.png",
		imgMini = "15bb5ce28d2.png",
		name = "SKIN_STONE",
		mission = "SKIN_ROUND_MISSION",
		progress = 1000,
		author = "Kurt#0010"
	},
	gold = {
		img = "15b5319cc9b.png",
		imgMini = "15bb5cd6f3d.png",
		name = "SKIN_GOLD",
		mission = "SKIN_WIN_MISSION",
		progress = 100,
		author = "Ninguem#0095"
	},
	diamond = {
		img = "15d47af57e9.png",
		imgMini = "15d47b2a452.png",
		name = "SKIN_DIAMOND",
		mission = "SKIN_WIN_MISSION",
		progress = 1000,
		author = "Miau#0010"
	},
	red = {
		img = "15b0ce34fb4.png",
		imgMini = "15bb5ce0731.png",
		name = "SKIN_RED",
		mission = "SKIN_RED_MISSION",
		author = "Fofinhoppp#0000"
	},
	blue = {
		img = "15b0ce4499b.png",
		imgMini = "15bb5cca762.png",
		name = "SKIN_BLUE",
		mission = "SKIN_BLUE_MISSION",
		author = "Fofinhoppp#0000"
	},
	yellow = {
		img = "15b0ce53ea6.png",
		imgMini = "15bb5ce679a.png",
		name = "SKIN_YELLOW",
		mission = "SKIN_YELLOW_MISSION",
		author = "Fofinhoppp#0000"
	},
	green = {
		img = "15b0ce63018.png",
		imgMini = "15bb5cd8f9b.png",
		name = "SKIN_GREEN",
		mission = "SKIN_GREEN_MISSION",
		author = "Fofinhoppp#0000"
	},
	white = {
		img = "15b0ce70858.png",
		imgMini = "15bb5ce4967.png",
		name = "SKIN_WHITE",
		mission = "SKIN_WHITE_MISSION",
		author = "Fofinhoppp#0000"
	},
	fire = {
		img = "15b5319f7d3.png",
		imgMini = "15bb5cd50c7.png",
		name = "SKIN_FIRE",
		mission = "RED_MISSION",
		progress = 100,
		author = "Ninguem#0095"
	},
	water = {
		img = "15b69d3246f.png",
		imgMini = "15bb5ce3843.png",
		name = "SKIN_WATER",
		mission = "BLUE_MISSION",
		progress = 100,
		author = "Ninguem#0095"
	},
	earth = {
		img = "15b69d3389b.png",
		imgMini = "15bb5cd3e0a.png",
		name = "SKIN_EARTH",
		mission = "YELLOW_MISSION",
		progress = 100,
		author = "Ninguem#0095"
	},
	air = {
		img = "15b69d350ba.png",
		imgMini = "15bb5cc6d88.png",
		name = "SKIN_AIR",
		mission = "GREEN_MISSION",
		progress = 100,
		author = "Ninguem#0095"
	},
	rainbow = {
		img = "15d47af344d.png",
		imgMini = "15d47b27567.png",
		name = "SKIN_RAINBOW",
		mission = "WILD_MISSION",
		progress = 100,
		author = "Miau#0015"
	},
	king = {
		img = "15b0db0691b.png",
		imgMini = "15bb5cdd3f7.png",
		name = "SKIN_KING",
		mission = "SKIN_KING_MISSION",
		author = "Flindix#0095"
	},
	luck = {
		img = "15b6d44e9a2.png",
		imgMini = "15bb5cde53b.png",
		name = "SKIN_LUCK",
		mission = "SKIN_LUCK_MISSION",
		author = "Ninguem#0095"
	},
	angel = {
		img = "171b4145362.png",
		imgMini = "171b429cd14.png",
		name = "SKIN_ANGEL",
		mission = "SKIN_ANGEL_MISSION",
		author = "Sulyvahn#1958"
	},
	junky = {
		img = "171b414bfbe.png",
		imgMini = "171b429ee8c.png",
		name = "SKIN_JUNKY",
		mission = "SKIN_JUNKY_MISSION",
		author = "Sulyvahn#1958"
	},
	shaman = {
		img = "15b8ea909bf.png",
		imgMini = "15bb5ce1a48.png",
		name = "SKIN_SHAMAN",
		mission = "SKIN_SHAMAN_MISSION",
		progress = 3000,
		author = "Ninguem#0095"
	},
	beach = {
		img = "15b8ea92b37.png",
		imgMini = "15bb5cc8da3.png",
		name = "SKIN_BEACH",
		mission = "SKIN_WATCH_MISSION",
		progress = 100,
		author = "Ninguem#0095"
	},
	cine = {
		img = "15b8ea93f1b.png",
		imgMini = "15bb5cd060e.png",
		name = "SKIN_CINE",
		mission = "SKIN_WATCH_MISSION",
		progress = 1000,
		author = "Ninguem#0095"
	},
	hell = {
		img = "15b9169df9f.png",
		imgMini = "15bb5cda164.png",
		name = "SKIN_HELL",
		mission = "SKIN_HELL_MISSION",
		author = "Ninguem#0095"
	},
	cards = {
		img = "15b9169c24c.png",
		imgMini = "15bb5ccd46c.png",
		name = "SKIN_CARDS",
		mission = "SKIN_CARDS_MISSION",
		author = "Ninguem#0095"
	},
	candy = {
		img = "15b91c9c22d.png",
		imgMini = "15bb5ccc28f.png",
		name = "SKIN_CANDY",
		mission = "SKIN_CANDY_MISSION",
		progress = CONFIG.qtdRule,
		author = "Ninguem#0095"
	},
	fraise = {
		img = "15b91eb78f3.png",
		imgMini = "15bb5cd6047.png",
		name = "SKIN_FRAISE",
		mission = "SKIN_FRAISE_MISSION",
		author = "Ninguem#0095"
	},
	illuminati = {
		img = "15b91f65488.png",
		imgMini = "15bb5cdb5d3.png",
		name = "SKIN_ILLUMINATI",
		mission = "SKIN_ILLUMINATI_MISSION",
		author = "Ninguem#0095"
	},
	gift = {
		img = "15cb6abde73.png",
		imgMini = "15cb6ac456c.png",
		name = "SKIN_GIFT",
		mission = "SKIN_GIFT_MISSION",
		author = "Water_puddle#8159"
	},
	bog = {
		img = "15d47af972a.png",
		imgMini = "15d47b28d2d.png",
		name = "SKIN_BOG",
		mission = "SKIN_BOG_MISSION",
		author = "Miau#0015"
	},
	got = {
		img = "1600efed30e.png",
		imgMini = "1600f1f62fe.png",
		name = "SKIN_IRON_THRONE",
		mission = "SKIN_IRON_THRONE_MISSION",
		progress = 3,
		author = "Konamice23#2842"
	},
	hamburguer = {
		img = "160f659a4ed.png",
		imgMini = "160f661db7a.png",
		name = "SKIN_HAMBURGUER",
		mission = "SKIN_TEAM_MISSION",
		progress = 250,
		author = "Konamice23#2842"
	},
	test = {
		img = "15b90ff1d49.png",
		imgMini = "15bb5cd1561.png",
		name = "SKIN_TEST",
		mission = "SKIN_BOG_MISSION",
		author = "None"
	},
	school = {
		img = "1613775d7d9.png",
		imgMini = "161376b87e8.png",
		name = "SKIN_SCHOOL",
		mission = "SKIN_SCHOOL_MISSION",
		author = "Ninguem#0095"
	},
	skull = {
		img = "16137764898.png",
		imgMini = "161376bd233.png",
		name = "SKIN_SKULL",
		mission = "SKIN_SKULL_MISSION",
		author = "Qadori#0000"
	},
	time = {
		img = "1613774c39c.png",
		imgMini = "1613774ea42.png",
		name = "SKIN_TIME_MACHINE",
		mission = "SKIN_TIME_MACHINE_MISSION",
		author = "Ninguem#0095"
	},
	chess = {
		img = "16137761f21.png",
		imgMini = "161376b3e37.png",
		name = "SKIN_CHESS",
		mission = "SKIN_CHESS_MISSION",
		progress = 25,
		author = "Ninguem#0095"
	},
	pencil = {
		img = "1613775f863.png",
		imgMini = "161376b6a40.png",
		name = "SKIN_PENCIL",
		mission = "SKIN_PENCIL_MISSION",
		progress = 100,
		author = "Ninguem#0095"
	},
	show = {
		img = "1613775b679.png",
		imgMini = "161376bb842.png",
		name = "SKIN_SHOW",
		mission = "SKIN_SHOW_MISSION",
		author = "Ninguem#0095"
	},
	cheese = {
		img = "15d47af7681.png",
		imgMini = "15d47b2c21f.png",
		name = "SKIN_CHEESE",
		mission = "SKIN_WIN_MISSION",
		progress = 3000,
		author = "Miau#0015"
	},
	anvil = {
		img = "16559aadbb9.png",
		imgMini = "16559beceb2.png",
		name = "SKIN_ANVIL",
		mission = "SKIN_ROUND_MISSION",
		progress = 10000,
		author = "Ninguem#0095"
	},
	garden = {
		img = "16559bc8113.png",
		imgMini = "16559beed93.png",
		name = "SKIN_GARDEN",
		mission = "SKIN_ROUND_MISSION",
		progress = 5000,
		author = "Qadori#0000"
	},
	falls = {
		img = "16559bbec5b.png",
		imgMini = "16559be4307.png",
		name = "SKIN_FALLS",
		mission = "SKIN_FALLS_MISSION",
		author = "unknown player"
	},
	unicorn = {
		img = "16559bc0bad.png",
		imgMini = "16559be5f2d.png",
		name = "SKIN_UNICORN",
		mission = "SKIN_WIN_MISSION",
		progress = 2000,
		author = "unknown player"
	},
	psycho = {
		img = "16593b7b830.png",
		imgMini = "16559be9587.png",
		name = "SKIN_PSYCHO",
		mission = "SKIN_PSYCHO_MISSION",
		author = "Catoff#0000"
	},
	television = {
		img = "16559bc65b0.png",
		imgMini = "16559beb228.png",
		name = "SKIN_TV",
		mission = "SKIN_WATCH_MISSION",
		progress = 7500,
		author = "Chuckfodex#0000"
	},
	radio = {
		img = "16559bc2730.png",
		imgMini = "16559be78a2.png",
		name = "SKIN_RADIO",
		mission = "SKIN_WATCH_MISSION",
		progress = 5000,
		author = "Chuckfodex#0000"
	},
	newspaper = {
		img = "16559bcbbd2.png",
		imgMini = "16559bf299d.png",
		name = "SKIN_NEWSPAPER",
		mission = "SKIN_WATCH_MISSION",
		progress = 2500,
		author = "Ninguem#0095"
	},
	cat = {
		img = "16559bc9d62.png",
		imgMini = "16559bf0cc1.png",
		name = "SKIN_CAT",
		mission = "SKIN_ROUND_MISSION",
		progress = 2500,
		author = "Qadori#0000"
	},
	potato = {
		img = "165dab6aeb6.png",
		imgMini = "165dab8f834.png",
		name = "SKIN_POTATO",
		mission = "SKIN_POTATO_MISSION",
		author = "Himnafor#0000"
	},
	rip = {
		img = "165dab74ae4.png",
		imgMini = "165dab9649a.png",
		name = "SKIN_RIP",
		mission = "SKIN_RIP_MISSION",
		author = "White_pudim#0000"
	},
	apple = {
		img = "165dab63f6e.png",
		imgMini = "165dab864d6.png",
		name = "SKIN_APPLE",
		mission = "SKIN_APPLE_MISSION",
		author = "Chuckfodex#0000"
	},
	heart = {
		img = "165dab6cbb0.png",
		imgMini = "165dab9139b.png",
		name = "SKIN_HEART",
		mission = "SKIN_HEART_MISSION",
		author = "Chuckfodex#0000"
	},
	breakfast = {
		img = "165dab6782c.png",
		imgMini = "165dab8bddf.png",
		name = "SKIN_BREAKFAST",
		mission = "SKIN_TEAM_MISSION",
		progress = 100,
		author = "Himnafor#0000"
	},
	bones = {
		img = "165dab65c71.png",
		imgMini = "165dab88203.png",
		name = "SKIN_BONES",
		mission = "SKIN_BONES_MISSION",
		author = "Konamice23#2842"
	},
	chocolate = {
		img = "165dab72d14.png",
		imgMini = "165dab94b15.png",
		name = "SKIN_CHOCOLATE",
		mission = "SKIN_CHOCOLATE_MISSION",
		author = "Qadori#0000"
	},
	marine = {
		img = "165dab6920a.png",
		imgMini = "165dab8daeb.png",
		name = "SKIN_MARINE",
		mission = "SKIN_MARINE_MISSION",
		author = "Qadori#0000"
	},
	loot = {
		img = "165dab6eb25.png",
		imgMini = "165dab930ef.png",
		name = "SKIN_LOOT",
		mission = "SKIN_LOOT_MISSION",
		author = "Himnafor#0000"
	},
	
	astral = {
		img = "1662cad59f7.png",
		imgMini = "1662ca1e19d.png",
		name = "SKIN_ASTRAL",
		mission = "SKIN_ASTRAL_MISSION",
		author = "Ninguem#0095"
	},
	computer = {
		img = "1662cad79fa.png",
		imgMini = "1662ca1ff79.png",
		name = "SKIN_COMPUTER",
		mission = "SKIN_WATCH_MISSION",
		progress = 10000,
		author = "White_pudim#0000"
	},
	elemental = {
		img = "1662cad9b71.png",
		imgMini = "1662ca21fe8.png",
		name = "SKIN_ELEMENTAL",
		mission = "SKIN_ELEMENTAL_DESC_MISSION",
		author = "Konamice23#2842"
	},
	guitar = {
		img = "1662cadb916.png",
		imgMini = "1662ca24393.png",
		name = "SKIN_GUITAR",
		mission = "SKIN_GUITAR_MISSION",
		author = "Awesync#8255"
	},
	popcorn = {
		img = "1662caddae8.png",
		imgMini = "1662ca26578.png",
		name = "SKIN_POPCORN",
		mission = "SKIN_POPCORN_MISSION",
		author = "Chuckfodex#0000"
	},
	trash = {
		img = "1662cadf8b8.png",
		imgMini = "1662ca283ce.png",
		name = "SKIN_TRASH",
		mission = "SKIN_TRASH_MISSION",
		author = "Chuckfodex#0000"
	},
	wonderland = {
		img = "1662cae1e69.png",
		imgMini = "1662ca2a814.png",
		name = "SKIN_WONDERLAND",
		mission = "SKIN_WONDERLAND_MISSION",
		progress = 2,
		author = "White_pudim#0000"
	},
	
	
	friend = {
		img = "166d0316342.png",
		imgMini = "166d02f5b54.png",
		name = "SKIN_FRIEND",
		mission = "SKIN_ROUND_MISSION",
		progress = 7500,
		author = "Arki#0113"
	},
	pumpkin = {
		img = "166d031dfbe.png",
		imgMini = "166d02fc533.png",
		name = "SKIN_PUMPKIN",
		mission = "SKIN_PUMPKIN_MISSION",
		author = "Chuckfodex#0000"
	},
	gothic = {
		img = "166d031a4d6.png",
		imgMini = "166d02f901d.png",
		name = "SKIN_GOTHIC",
		mission = "SKIN_GOTHIC_MISSION",
		author = "Qadori#0000"
	},
	gaga = {
		img = "166d0318349.png",
		imgMini = "166d03b6e19.png",
		name = "SKIN_GAGA",
		mission = "SKIN_GAGA_MISSION",
		author = "Catoff#0000"
	},
	cuphead = {
		img = "166d0312f9e.png",
		imgMini = "166d02f22c0.png",
		name = "SKIN_CUPHEAD",
		mission = "SKIN_CUPHEAD_MISSION",
		author = "Himnafor#0000"
	},
	mecatopus = {
		img = "166d031c2fc.png",
		imgMini = "166d02fa99c.png",
		name = "SKIN_MECATOPUS",
		mission = "SKIN_MECATOPUS_MISSION",
		author = "White_pudim#0000"
	},
	bootcamp = {
		img = "166d031155a.png",
		imgMini = "166d02f05bb.png",
		name = "SKIN_BOOTCAMP",
		mission = "SKIN_BOOTCAMP_MISSION",
		author = "Dududuzaooo#0000"
	},
	football = {
		img = "166d0314a46.png",
		imgMini = "166d02f3f70.png",
		name = "SKIN_FOOTBALL",
		mission = "SKIN_FOOTBALL_MISSION",
		progress = 100,
		author = "Awesync#8255"
	},
	ufo = {
		img = "16793c48ff9.png",
		imgMini = "16793c2aa1f.png",
		name = "SKIN_UFO",
		mission = "SKIN_UFO_MISSION",
		author = "unknown player"
	},
	aquarium = {
		img = "16793c4aad4.png",
		imgMini = "16793c2c820.png",
		name = "SKIN_AQUARIUM",
		mission = "SKIN_AQUARIUM_MISSION",
		author = "Subzeraah#0000"
	},
	help = {
		img = "16793c4c647.png",
		imgMini = "16793c2e2ee.png",
		name = "SKIN_HELP",
		mission = "SKIN_HELP_MISSION",
		author = "Subzeraah#0000"
	},
	font = {
		img = "16793c4e08e.png",
		imgMini = "16793c2ffb5.png",
		name = "SKIN_FONT",
		mission = "SKIN_FONT_MISSION",
		author = "Subzeraah#0000"
	},
	chimney = {
		img = "16793c4fca3.png",
		imgMini = "16793c31a52.png",
		name = "SKIN_CHIMNEY",
		mission = "SKIN_CHIMNEY_MISSION",
		author = "Arki#0113"
	},
	circus = {
		img = "16793c5188a.png",
		imgMini = "16793c335de.png",
		name = "SKIN_CIRCUS",
		mission = "SKIN_CIRCUS_MISSION",
		author = "Chuckfodex#0000"
	},
	cisne = {
		img = "16793c5358e.png",
		imgMini = "16793c35189.png",
		name = "SKIN_CISNE",
		mission = "SKIN_CISNE_MISSION",
		author = "Subzeraah#0000"
	},
	coffee = {
		img = "16793c5543e.png",
		imgMini = "16793c373b7.png",
		name = "SKIN_COFFEE",
		mission = "SKIN_COFFEE_MISSION",
		progress = 4,
		author = "Morningstar#0010"
	},
	croissant = {
		img = "16793c56f2e.png",
		imgMini = "16793c39095.png",
		name = "SKIN_CROISSANT",
		mission = "SKIN_TEAM_MISSION",
		progress = 487.5,
		author = "Subzeraah#0000"
	},
	space = {
		img = "16793c59521.png",
		imgMini = "16793c3abe5.png",
		name = "SKIN_SPACE",
		mission = "SKIN_SPACE_MISSION",
		author = "Chuckfodex#0000"
	},
	mermaid = {
		img = "16793c5b215.png",
		imgMini = "16793c3c94e.png",
		name = "SKIN_MERMAID",
		mission = "SKIN_MERMAID_MISSION",
		author = "Konamice23#2842"
	},
	phone = {
		img = "16793c5cdf9.png",
		imgMini = "16793c3e806.png",
		name = "SKIN_PHONE",
		mission = "SKIN_PHONE_MISSION",
		author = "Arki#0113"
	},
	quartz = {
		img = "16793c5e9fc.png",
		imgMini = "16793e20995.png",
		name = "SKIN_QUARTZ",
		mission = "SKIN_QUARTZ_MISSION",
		progress = 5000,
		author = "White_pudim#0000"
	},
	snowman = {
		img = "16793c60744.png",
		imgMini = "16793e24087.png",
		name = "SKIN_SNOWMAN",
		mission = "SKIN_SNOWMAN_MISSION",
		author = "Tupac_shakur#4173"
	},
	totoro = {
		img = "16793c6236b.png",
		imgMini = "16793e227c3.png",
		name = "SKIN_TOTORO",
		mission = "SKIN_TOTORO_MISSION",
		author = "White_pudim#0000"
	},
	vangogh = {
		img = "16793c64043.png",
		imgMini = "16793c45a19.png",
		name = "SKIN_VANGOGH",
		mission = "SKIN_VANGOGH_MISSION",
		author = "White_pudim#0000"
	},
	
	cheeseclassic = {
		img = "167aaa81b1e.png",
		imgMini = " 167d768bcfc.png",
		name = "SKIN_CHEESE_CLASSIC",
		mission = "SKIN_CHEESE_CLASSIC_MISSION",
		author = "Ninguem#0095"
	},
	
	chest = {
		img = "16887dc0e17.png",
		imgMini = "16887ddc9bd.png",
		name = "SKIN_CHEST",
		mission = "SKIN_CHEST_MISSION",
		author = "White_pudim#0000"
	},
	coca = {
		img = "16887dc2d1c.png",
		imgMini = "16887e5d6ef.png",
		name = "SKIN_COCA",
		mission = "SKIN_COCA_MISSION",
		author = "Arki#0113"
	},
	flamingo = {
		img = "16887dc483a.png",
		imgMini = "16887de0634.png",
		name = "SKIN_FLAMINGO",
		mission = "SKIN_FLAMINGO_MISSION",
		author = "White_pudim#0000"
	},
	honey = {
		img = "16887dc63c4.png",
		imgMini = "16887de20ba.png",
		name = "SKIN_HONEY",
		mission = "SKIN_HONEY_MISSION",
		author = "Chuckfodex#0000"
	},
	old = {
		img = "16887dc7fd6.png",
		imgMini = "16887de3af2.png",
		name = "SKIN_OLD",
		mission = "SKIN_OLD_MISSION",
		author = "Arki#0113"
	},
	pineapple = {
		img = "16887dc9bc6.png",
		imgMini = "16887e5f59c.png",
		name = "SKIN_PINEAPPLE",
		mission = "SKIN_PINEAPPLE_MISSION",
		author = "Chuckfodex#0000"
	},
	sack = {
		img = "16887dcbad3.png",
		imgMini = "16887de7059.png",
		name = "SKIN_SACK",
		mission = "SKIN_SACK_MISSION",
		author = "Iho#5679"
	},
	smartphone = {
		img = "16887dcd915.png",
		imgMini = "16887de90b3.png",
		name = "SKIN_SMARTPHONE",
		mission = "SKIN_SMARTPHONE_MISSION",
		author = "Tempo#5571"
	},

	vampire = {
		img = "17105474015.png",
		imgMini = "1710559ff17.png",
		name = "SKIN_VAMPIRE",
		mission = "SKIN_VAMPIRE_MISSION",
		author = "Ninguem#0095"
	},
	
	moon = {
		img = "171237eedfc.png",
		imgMini = "171237f0ac3.png",
		name = "SKIN_MOON",
		mission = "SKIN_MOON_MISSION",
		author = "Albinoska#0000"
	},
	max = {
		img = "171237f3015.png",
		imgMini = "171237f5ade.png",
		name = "SKIN_MAX",
		mission = "SKIN_MAX_MISSION",
		author = "White_pudim#0000"
	},
	bill = {
		img = "1713896e30e.png",
		imgMini = "171389b38ce.png",
		name = "SKIN_BILL",
		mission = "SKIN_BILL_MISSION",
		author = "White_pudim#0000"
	},
	horn = {
		img = "17138971cb9.png",
		imgMini = "171389baf1f.png",
		name = "SKIN_HORN",
		mission = "SKIN_HORN_MISSION",
		author = "White_pudim#0000"
	},
	
	samson = {
		img = "1716a7e5a2a.png",
		imgMini = "1716a7e7f17.png",
		name = "SKIN_SAMSON",
		mission = "SKIN_SAMSON_MISSION",
		author = "Iho#5679"
	},
	toast = {
		img = "1716a7ea0b1.png",
		imgMini = "1716a7ec4f1.png",
		name = "SKIN_TOAST",
		mission = "SKIN_TIME_MISSION",
		progress = 600,
		author = "Arki#0113"
	},
	pizza = {
		img = "1716a7e19b0.png",
		imgMini = "1716a7e3b37.png",
		name = "SKIN_PIZZA",
		mission = "SKIN_PIZZA_MISSION",
		progress = 10000,
		author = "Arki#0113"
	},
	
	fashion = {
		img = "171b41481f1.png",
		imgMini = "171b4170d35.png",
		name = "SKIN_FASHION",
		mission = "SKIN_DAY_MISSION",
		progress = 7,
		author = "Arki#0113"
	},
	undertale = {
		img = "171b4157a7f.png",
		imgMini = "171b417f5ea.png",
		name = "SKIN_UNDERTALE",
		mission = "SKIN_DAY_MISSION",
		progress = 15,
		author = "White_pudim#0000"
	},
	forest = {
		img = "171b4149fcc.png",
		imgMini = "171b4172992.png",
		name = "SKIN_FOREST",
		mission = "SKIN_FOREST_MISSION",
		author = "White_pudim#0000"
	},
	kiss = {
		img = "171b414e053.png",
		imgMini = "171b42a0d57.png",
		name = "SKIN_KISS",
		mission = "SKIN_KISS_MISSION",
		author = "Matheus#5306"
	},
	mountain = {
		img = "171b414fc99.png",
		imgMini = "171b4177dee.png",
		name = "SKIN_MONTAIN",
		mission = "SKIN_MONTAIN_MISSION",
		author = "Chanyeol#8543"
	},
	pikachu = {
		img = "171b41518be.png",
		imgMini = "171b42a2c6c.png",
		name = "SKIN_PIKACHU",
		mission = "SKIN_PIKACHU_MISSION",
		author = "Sulyvahn#1958"
	},
	simpsons = {
		img = "171b4153989.png",
		imgMini = "171b417b486.png",
		name = "SKIN_SIMPSONS",
		mission = "SKIN_SIMPSONS_MISSION",
		author = "Arki#0113"
	},
	truelove = {
		img = "171b415559b.png",
		imgMini = "171b42a4a0c.png",
		name = "SKIN_TRUE_LOVE",
		mission = "SKIN_TRUE_LOVE_MISSION",
		author = "Artgir#0000"
	},
	
	cyan = {
		img = "171d7fe12e9.png",
		imgMini = "171d7fe3888.png",
		name = "SKIN_CIAN",
		mission = "SKIN_CIAN_MISSION",
		author = "Fofinhoppp#0000"
	},
	orange = {
		img = "171d7fed8b9.png",
		imgMini = "171d7fefb11.png",
		name = "SKIN_ORANGE",
		mission = "SKIN_ORANGE_MISSION",
		author = "Fofinhoppp#0000"
	},
	pink = {
		img = "171d7ff9af8.png",
		imgMini = "171d7ffc588.png",
		name = "SKIN_PINK",
		mission = "SKIN_PINK_MISSION",
		author = "Fofinhoppp#0000"
	},
	purple = {
		img = "171d8002d82.png",
		imgMini = "171d8005641.png",
		name = "SKIN_PURPLE",
		mission = "SKIN_PURPLE_MISSION",
		author = "Fofinhoppp#0000"
	},
	black = {
		img = "171d800c4a9.png",
		imgMini = "171d800e3a9.png",
		name = "SKIN_BLACK",
		mission = "SKIN_BLACK_MISSION",
		author = "Fofinhoppp#0000"
	},
	toxic = {
		img = "171d8015cf0.png",
		imgMini = "171d8017ddc.png",
		name = "SKIN_TOXIC",
		mission = "CYAN_MISSION",
		progress = 15,
		author = "Chuckfodex#0000"
	},
	thunder = {
		img = "171d801fb61.png",
		imgMini = "171d83e2373.png",
		name = "SKIN_THUNDER",
		mission = "ORANGE_MISSION",
		progress = 15,
		author = "Qadori#0000"
	},
	crystal = {
		img = "171d802bbc3.png",
		imgMini = "171d83db645.png",
		name = "SKIN_CRYSTAL",
		mission = "PINK_MISSION",
		progress = 15,
		author = "Sulyvahn#1958"
	},
	dark = {
		img = "171d8034ba5.png",
		imgMini = "171d8036ccc.png",
		name = "SKIN_DARK",
		mission = "PURPLE_MISSION",
		progress = 15,
		author = "Arki#0113"
	},
	light = {
		img = "171d803e7d5.png",
		imgMini = "171d8041299.png",
		name = "SKIN_LIGHT",
		mission = "WHITE_MISSION",
		progress = 15,
		author = "White_pudim#0000"
	},
	eclipse = {
		img = "171d8048cb6.png",
		imgMini = "171d804b0e9.png",
		name = "SKIN_ECLIPSE",
		mission = "SKIN_ECLIPSE_MISSION",
		author = "Aykv#0000"
	},
	toothless = {
		img = "171d8056b39.png",
		imgMini = "171d8058f0e.png",
		name = "SKIN_TOOTHLESS",
		mission = "SKIN_TOOTHLESS_MISSION",
		progress = 10,
		author = "Sulyvahn#1958"
	},
	lightfury = {
		img = "171d8065424.png",
		imgMini = "171d806753e.png",
		name = "SKIN_LIGHTFURY",
		mission = "SKIN_LIGHTFURY_MISSION",
		progress = 10,
		author = "Sulyvahn#1958"
	},
	kratos = {
		img = "171d806edce.png",
		imgMini = "171d83d3615.png",
		name = "SKIN_KRATOS",
		mission = "SKIN_KRATOS_MISSION",
		author = "Sulyvahn#1958"
	},
	shenlong = {
		img = "171d8077235.png",
		imgMini = "171d80794bc.png",
		name = "SKIN_SHENLONG",
		mission = "SKIN_SHENLONG_MISSION",
		author = "Sulyvahn#1958"
	},
	spider = {
		img = "171d807f79a.png",
		imgMini = "171d80819e0.png",
		name = "SKIN_SPIDER",
		mission = "SKIN_SPIDER_MISSION",
		author = "Sulyvahn#1958"
	},
	
	soon = {
		img = "15b90ff3a79.png",
		imgMini = "1603de0c1a2.png",
		name = "SKIN_SOON",
		mission = "SKIN_SOON_MISSION",
		author = "???"
	},
}



--[[ src/rules.lua ]]--

RULE = {
	mini = {
		name = "HOUSE_MINI",
		desc = "HOUSE_MINI_DESC",
		mission = "UNLOCK_RULE",
		img = "161aba690c6.png",
		imgDesc = "15c4c117200.png",
		conflict = {"maxi"},
		public = true,
		type = "PASSIVE",
	},
	maxi = {
		name = "HOUSE_MAXI",
		desc = "HOUSE_MAXI_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c5ab66.png",
		imgDesc = "15c4c1147fa.png",
		conflict = {"mini", "noaction"},
		public = true,
		type = "PASSIVE",
	},
	flash = {
		name = "HOUSE_FLASH",
		desc = "HOUSE_FLASH_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c4ee17.png",
		imgDesc = "15c4c10b14a.png",
		conflict = {},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	revelation = {
		name = "HOUSE_REVELATION",
		desc = "HOUSE_REVELATION_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c67cd7.png",
		imgDesc = "15c4c122df3.png",
		conflict = {"tracking","luck"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	clean = {
		name = "HOUSE_CLEAN_FINISH",
		desc = "HOUSE_CLEAN_FINISH_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c4bee3.png",
		imgDesc = "15c4c106f11.png",
		conflict = {"mess"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	insatisfaction = {
		name = "HOUSE_INSATISFACTION",
		desc = "HOUSE_INSATISFACTION_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c54da8.png",
		imgDesc = "15c4c11067f.png",
		conflict = {"satisfaction","fastdraw"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	perfection = {
		name = "HOUSE_PERFECTION",
		desc = "HOUSE_PERFECTION_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5d807dc.png",
		imgDesc = "15c4c11e306.png",
		conflict = {"sequence","stack","mess"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	black = {
		name = "HOUSE_BLACK",
		desc = "HOUSE_BLACK_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c46d70.png",
		imgDesc = "15c4c100109.png",
		conflict = {},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	stack = {
		name = "HOUSE_STACK",
		desc = "HOUSE_STACK_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c6d857.png",
		imgDesc = "15c4c125f22.png",
		conflict = {"perfection","sequence","mess","neighbor"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	tracking = {
		name = "HOUSE_TRACKING",
		desc = "HOUSE_TRACKING_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c72d66.png",
		imgDesc = "15c4c128bdc.png",
		conflict = {"revelation","luck"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	overload = {
		name = "HOUSE_OVERLOAD",
		desc = "HOUSE_OVERLOAD_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c6501f.png",
		imgDesc = "15c4c11b32b.png",
		conflict = {"limbo"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	jumpin = {
		name = "HOUSE_JUMP_IN",
		desc = "HOUSE_JUMP_IN_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c5649d.png",
		imgDesc = "15c4c111e36.png",
		conflict = {},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	satisfaction = {
		name = "HOUSE_SATISFACTION",
		desc = "HOUSE_SATISFACTION_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c69300.png",
		imgDesc = "15c4c12471e.png",
		conflict = {"insatisfaction","fastdraw"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	nocombo = {
		name = "HOUSE_NO_COMBO",
		desc = "HOUSE_NO_COMBO_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c637ab.png",
		imgDesc = "15c4c119de5.png",
		conflict = {"supercombo","hell","noaction"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	supercombo = {
		name = "HOUSE_SUPER_COMBO",
		desc = "HOUSE_SUPER_COMBO_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c6f2c2.png",
		imgDesc = "15c4c1274b9.png",
		conflict = {"nocombo","hell","noaction"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	hell = {
		name = "HOUSE_HELL",
		desc = "HOUSE_HELL_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c536f3.png",
		imgDesc = "15c4c10da85.png",
		conflict = {"nocombo","supercombo","noaction","mess"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	mulligan = {
		name = "HOUSE_MULLIGAN",
		desc = "HOUSE_MULLIGAN_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c5da7b.png",
		imgDesc = "15c4c11871d.png",
		conflict = {},
		public = true,
		type = "PASSIVE",
	},
	death = {
		name = "HOUSE_DEATH",
		desc = "HOUSE_DEATH_DESC",
		mission = "UNLOCK_RULE",
		img = "15c326229de.png",
		imgDesc = "15c4c1085a8.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	carousel = {
		name = "HOUSE_CAROUSEL",
		desc = "HOUSE_CAROUSEL_DESC",
		mission = "UNLOCK_RULE",
		img = "15c3261f5eb.png",
		imgDesc = "15c4c102dad.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	trade = {
		name = "HOUSE_TRADE",
		desc = "HOUSE_TRADE_DESC",
		mission = "UNLOCK_RULE",
		img = "15c3260caa5.png",
		imgDesc = "15c4c12a68e.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	gift = {
		name = "HOUSE_GIFT",
		desc = "HOUSE_GIFT_DESC",
		mission = "UNLOCK_RULE",
		img = "15c32617c3c.png",
		imgDesc = "15c4c10c563.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	spy = {
		name = "HOUSE_VIEW",
		desc = "HOUSE_VIEW_DESC",
		mission = "UNLOCK_RULE",
		img = "15c3261b803.png",
		imgDesc = "15c4c12bd97.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	rain = {
		name = "HOUSE_RAIN",
		desc = "HOUSE_RAIN_DESC",
		mission = "UNLOCK_RULE",
		img = "15c326277fd.png",
		imgDesc = "15c4c11fc59.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	equality = {
		name = "HOUSE_EQUALITY",
		desc = "HOUSE_EQUALITY_DESC",
		mission = "UNLOCK_RULE",
		img = "15c326118f3.png",
		imgDesc = "15c4c109ba8.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	chair = {
		name = "HOUSE_CHAIRS",
		desc = "HOUSE_CHAIRS_DESC",
		mission = "UNLOCK_RULE",
		img = "15c32619855.png",
		imgDesc = "15c4c1042aa.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	meep = {
		name = "HOUSE_MEEP",
		desc = "HOUSE_MEEP_DESC",
		mission = "UNLOCK_RULE",
		img = "15c3261d7ec.png",
		imgDesc = "15c4c115cdc.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	bomb = {
		name = "HOUSE_BOMB",
		desc = "HOUSE_BOMB_DESC",
		mission = "UNLOCK_RULE",
		img = "15c3260e9cd.png",
		imgDesc = "15c4c101787.png",
		conflict = {"noaction","mess"},
		card = {color={"black"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	random = {
		name = "HOUSE_RANDOM",
		desc = "HOUSE_RANDOM_DESC",
		mission = "UNLOCK_RULE",
		img = "15c3261560c.png",
		imgDesc = "15c4c121517.png",
		conflict = {"noaction","mess"},
		card = {color={"black"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	peace = {
		name = "HOUSE_PEACE",
		desc = "HOUSE_PEACE_DESC",
		mission = "UNLOCK_RULE",
		img = "15c3261341c.png",
		imgDesc = "15c4c11cd14.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		notMess = true,
		rulecard = true,
		type = "CARD",
	},
	chess = {
		name = "HOUSE_CHESS",
		desc = "HOUSE_CHESS_DESC",
		mission = "UNLOCK_RULE",
		img = "15c50042c2f.png",
		imgDesc = "15c4c10580a.png",
		conflict = {"noaction","mess"},
		card = {color={"black"},name="king"},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	imitate = {
		name = "HOUSE_IMITATE",
		desc = "HOUSE_IMITATE_DESC",
		mission = "UNLOCK_RULE",
		img = "15c32624cf7.png",
		imgDesc = "15c4c10ef60.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	limit = {
		name = "HOUSE_TIME",
		desc = "HOUSE_TIME_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c5947a.png",
		imgDesc = "1610b6b50ae.png",
		conflict = {"limbo"},
		public = true,
		type = "PASSIVE",
	},
	nochallenge = {
		name = "HOUSE_CHALLENGE",
		desc = "HOUSE_CHALLENGE_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c61fce.png",
		imgDesc = "15c6eb2b741.png",
		conflict = {"noaction"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	noaction = {
		name = "HOUSE_NO_ACTION",
		desc = "HOUSE_NO_ACTION_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c60865.png",
		imgDesc = "15c904433ae.png",
		conflict = {"maxi","mess","peace","death","gift","trade","carousel","chair","spy","rain","equality","imitate","meeep","random","bomb","chess","rule","steal","web","thunder","clone","nochallenge","hell","nocombo","supercombo","luck","box","wish","ink","confuse","portal","batata","compass","draw99","curse","magnet","tornado","theft","simon","ban","dice","paradox","half","oddeven","mimic","mix","justice","share","key"},
		public = true,
		type = "PASSIVE",
	},
	camouflage = {
		name = "HOUSE_CAMOUFLAGE",
		desc = "HOUSE_CAMOUFLAGE_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c4a7a5.png",
		imgDesc = "15c9043ecd9.png",
		conflict = {"dos"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	rule = {
		name = "HOUSE_ADD_RULE",
		desc = "HOUSE_ADD_RULE_DESC",
		mission = "UNLOCK_RULE",
		img = "15c8fc525b7.png",
		imgDesc = "15c9044135a.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		type = "CARD",
	},
	hard = {
		name = "HOUSE_HARD",
		desc = "HOUSE_HARD_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c51f3b.png",
		imgDesc = "15e67ba2aed.png",
		conflict = {},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	fastdraw = {
		name = "HOUSE_FAST_DRAW",
		desc = "HOUSE_FAST_DRAW_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c4d794.png",
		imgDesc = "15e67b9f422.png",
		conflict = {"satisfaction","insatisfaction"},
		public = true,
		rulecard = true,
		
		type = "PASSIVE",
	},
	steal = {
		name = "HOUSE_STEAL",
		desc = "HOUSE_STEAL_DESC",
		mission = "UNLOCK_RULE",
		img = "15e54b0f5b4.png",
		imgDesc = "15e67b9b97b.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		notMess = true,
		rulecard = true,
		type = "CARD",
	},
	thunder = {
		name = "HOUSE_THUNDER",
		desc = "HOUSE_THUNDER_DESC",
		mission = "UNLOCK_RULE",
		img = "15ebbcc57b0.png",
		imgDesc = "15ed536ed22.png",
		conflict = {"noaction","mess"},
		card = {color={"yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	clone = {
		name = "HOUSE_CLONE",
		desc = "HOUSE_CLONE_DESC",
		mission = "UNLOCK_RULE",
		img = "15ec03fec02.png",
		imgDesc = "15ed5373b93.png",
		conflict = {"noaction","mess"},
		card = {color={"black"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	luck = {
		name = "HOUSE_LUCK",
		desc = "HOUSE_LUCK_DESC",
		mission = "UNLOCK_RULE",
		img = "15ec0b282ef.png",
		imgDesc = "15fb322b1d6.png",
		conflict = {"noaction","mess","tracking"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	web = {
		name = "HOUSE_WEB",
		desc = "HOUSE_WEB_DESC",
		mission = "UNLOCK_RULE",
		img = "15ec6049e05.png",
		imgDesc = "15ed5371210.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	shiny = {
		name = "HOUSE_SHINY",
		desc = "HOUSE_SHINY_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c6c079.png",
		imgDesc = "1610b737bb0.png",
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	drekkemaus = {
		name = "HOUSE_DREKKEMAUS",
		desc = "HOUSE_DREKKEMAUS_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c48dcf.png",
		imgDesc = "15ed52b7848.png",
		notCount = true,
		type = "BOSS",
	},
	jingle = {
		name = "HOUSE_JINGLE",
		desc = "HOUSE_JINGLE_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c48dcf.png",
		imgDesc = "16007c17c97.png",
		notCount = true,
		type = "BOSS",
	},
	papaille = {
		name = "HOUSE_PAPAILLE",
		desc = "HOUSE_PAPAILLE_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c48dcf.png",
		imgDesc = "16007c19ab5.png",
		notCount = true,
		type = "BOSS",
	},
	icemice = {
		name = "HOUSE_ICEMICE",
		desc = "HOUSE_ICEMICE_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c48dcf.png",
		imgDesc = "167d646330d.png",
		notCount = true,
		type = "BOSS",
	},
	snowy = {
		name = "HOUSE_SNOWY",
		desc = "HOUSE_SNOWY_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c48dcf.png",
		imgDesc = "167d646118f.png",
		notCount = true,
		type = "BOSS",
	},
	ninguem_v2 = {
		name = "HOUSE_NINGUEM",
		desc = "HOUSE_NINGUEM_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c48dcf.png",
		imgDesc = "1712da6f330.png",
		notCount = true,
		lock = "LOCKED",
		type = "BOSS",
	},
	box = {
		name = "HOUSE_BOX",
		desc = "HOUSE_BOX_DESC",
		mission = "UNLOCK_RULE",
		img = " 15f1674f2cb.png",
		imgDesc = "1610b6b1641.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	wish = {
		name = "HOUSE_WISH",
		desc = "HOUSE_WISH_DESC",
		mission = "UNLOCK_RULE",
		img = "15f16742984.png",
		imgDesc = "16007c1b88e.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	portal = {
		name = "HOUSE_PORTAL",
		desc = "HOUSE_PORTAL_DESC",
		mission = "UNLOCK_RULE",
		img = "15f82ca13ff.png",
		imgDesc = "1610b6af6b1.png",
		conflict = {"noaction","mess","bluegreen"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	sequence = {
		name = "HOUSE_SEQUENCE",
		desc = "HOUSE_SEQUENCE_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c6a8bd.png",
		imgDesc = "15fb32291a9.png",
		conflict = {"mess","stack","perfection"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	team = {
		name = "HOUSE_TEAM",
		desc = "HOUSE_TEAM_DESC",
		mission = "TEAM_RULE",
		img = "161a5d35a72.png",
		imgDesc = "160f639df86.png",
		lock = "TEAM",
		type = "PASSIVE",
	},
	custom = {
		name = "HOUSE_CUSTOM",
		desc = "HOUSE_CUSTOM_DESC",
		mission = "BUY_RULE",
		img = "15f8cc7e48c.png",
		imgDesc = "1610b6ab2b5.png",
		conflict = {"noaction"},
		lock = "ALL",
		notMess = true,
		notCount = true,
		type = "CARD",
	},
	ink = {
		name = "HOUSE_INK",
		desc = "HOUSE_INK_DESC",
		mission = "UNLOCK_RULE",
		img = "1606599bbf3.png",
		imgDesc = "1610b6b6f11.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	confuse = {
		name = "HOUSE_CONFUSE",
		desc = "HOUSE_CONFUSE_DESC",
		mission = "UNLOCK_RULE",
		img = "1606c2a1c33.png",
		imgDesc = "1610b6a8995.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	compass = {
		name = "HOUSE_TREASURE",
		desc = "HOUSE_TREASURE_DESC",
		mission = "UNLOCK_RULE",
		img = "1610641ad80.png",
		imgDesc = "1610b6a33a1.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		public = true,
		rulecard = true,
		type = "CARD",
	},
	red = {
		name = "HOUSE_RED",
		desc = "HOUSE_RED_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c66678.png",
		imgDesc = "1610b6b323e.png",
		lock = "LOCKED",
		type = "EXTRA",
	},
	blue = {
		name = "HOUSE_BLUE",
		desc = "HOUSE_BLUE_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c75edc.png",
		imgDesc = "1610b695776.png",
		lock = "LOCKED",
		type = "EXTRA",
	},
	yellow = {
		name = "HOUSE_YELLOW",
		desc = "HOUSE_YELLOW_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c7471b.png",
		imgDesc = "1610b6b9278.png",
		lock = "LOCKED",
		type = "EXTRA",
	},
	green = {
		name = "HOUSE_GREEN",
		desc = "HOUSE_GREEN_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c50321.png",
		imgDesc = "1610b6ad562.png",
		lock = "LOCKED",
		type = "EXTRA",
	},
	charlotte = {
		name = "HOUSE_CHARLOTTE",
		desc = "HOUSE_CHARLOTTE_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c48dcf.png",
		imgDesc = "1611561f846.png",
		notCount = true,
		type = "BOSS",
	},
	buffy = {
		name = "HOUSE_BUFFY",
		desc = "HOUSE_BUFFY_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c48dcf.png",
		imgDesc = "165e99472af.png",
		notCount = true,
		type = "BOSS",
	},
	elise = {
		name = "HOUSE_ELISE",
		desc = "HOUSE_ELISE_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c48dcf.png",
		imgDesc = "167d75ae1f6.png",
		notCount = true,
		type = "BOSS",
	},
	neighbor = {
		name = "HOUSE_NEIGHBOR",
		desc = "HOUSE_NEIGHBOR_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c5f1e4.png",
		imgDesc = "161a5f624a7.png",
		conflict = {"mess","stack"},
		public = true,
		rulecard = true,
		type = "PASSIVE",
	},
	mess = {
		name = "HOUSE_MESS",
		desc = "HOUSE_MESS_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5d1b7fa.png",
		imgDesc = "1627e2bbbf0.png",
		-- tracking
		conflict = {"noaction","stack","sequence","perfection","neighbor","clean","peace","death","gift","trade","carousel","chair","spy","rain","equality","imitate","meep","random","bomb","chess","rule","steal","web","thunder","clone","luck","box","wish","ink","confuse","portal","compass","batata","draw99","curse","magnet","tornado","theft","simon","ban","dice","paradox","half","oddeven","mimic","mix","justice","share","key","hell","bluegreen"},
		type = "PASSIVE",
	},
	limbo = {
		name = "HOUSE_LIMBO",
		desc = "HOUSE_LIMBO_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c57cab.png",
		imgDesc = "1627e2b98f1.png",
		conflict = {"overload"},
		rulecard = true,
		public = true,
		type = "PASSIVE",
	},
	batata = {
		name = "HOUSE_BATATA",
		desc = "HOUSE_BATATA_DESC",
		mission = "UNLOCK_RULE",
		img = "16168f66e7b.png",
		imgDesc = " 161ed70240c.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		rulecard = true,
		public = true,
		type = "CARD",
	},
	draw99 = {
		name = "HOUSE_PLUS99",
		desc = "HOUSE_PLUS99_DESC",
		mission = "BUY_RULE",
		img = "1627e34cb06.png",
		imgDesc = "1627e2b24a9.png",
		conflict = {"noaction","mess"},
		card = {color={"black"}},
		lock = "SHOP",
		notMess = true,
		type = "CARD",
	},
	curse = {
		name = "HOUSE_CURSE",
		desc = "HOUSE_CURSE_DESC",
		mission = "UNLOCK_RULE",
		img = " 16259816bc3.png",
		imgDesc = "1627e2b7736.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		rulecard = true,
		public = true,
		type = "CARD",
	},
	elisah = {
		name = "HOUSE_ELISAH",
		desc = "HOUSE_ELISAH_DESC",
		mission = "UNLOCK_RULE",
		img = "161a5c48dcf.png",
		imgDesc = "16313dbd30d.png",
		notCount = true,
		type = "BOSS",
	},
	magnet = {
		name = "HOUSE_MAGNET",
		desc = "HOUSE_MAGNET_DESC",
		mission = "UNLOCK_RULE",
		img = "1637fb76f93.png",
		imgDesc = "1637fc1e79e.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		rulecard = true,
		public = true,
		type = "CARD",
	},
	tornado = {
		name = "HOUSE_TORNADO",
		desc = "HOUSE_TORNADO_DESC",
		mission = "UNLOCK_RULE",
		img = "165c6a5676b.png",
		imgDesc = "165e994a99f.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		rulecard = true,
		public = true,
		type = "CARD",
	},
	theft = {
		name = "HOUSE_THEFT",
		desc = "HOUSE_THEFT_DESC",
		mission = "UNLOCK_RULE",
		img = "165ce55301e.png",
		imgDesc = "165e9948cc0.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		rulecard = true,
		public = true,
		type = "CARD",
	},
	simon = {
		name = "HOUSE_SIMON",
		desc = "HOUSE_SIMON_DESC",
		mission = "UNLOCK_RULE",
		img = "16627b2d4cf.png",
		imgDesc = "1662b8e5605.png",
		conflict = {"noaction","mess"},
		card = {color={"black"}},
		rulecard = true,
		public = true,
		type = "CARD",
	},
	ban = {
		name = "HOUSE_BAN",
		desc = "HOUSE_BAN_DESC",
		mission = "UNLOCK_RULE",
		img = "166657eae03.png",
		imgDesc = "166d0212faa.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		rulecard = true,
		public = true,
		type = "CARD",
	},
	
	dice = {
		name = "HOUSE_DICE",
		desc = "HOUSE_DICE_DESC",
		mission = "UNLOCK_RULE",
		img = "1678b6894e3.png",
		imgDesc = "1678b78e8cd.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		--rulecard = true,
		--public = true,
		lock = true,
		notMess = true,
		type = "CARD",
	},
	paradox = {
		name = "HOUSE_PARADOX",
		desc = "HOUSE_PARADOX_DESC",
		mission = "UNLOCK_RULE",
		img = "1678b683a06.png",
		imgDesc = "1678b790783.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		rulecard = true,
		public = true,
		type = "CARD",
	},
	half = {
		name = "HOUSE_HALF",
		desc = "HOUSE_HALF_DESC",
		mission = "UNLOCK_RULE",
		img = "1678b685756.png",
		imgDesc = "1678b7925a3.png",
		conflict = {"noaction","mess"},
		card = {color={"black"}},
		rulecard = true,
		public = true,
		type = "CARD",
	},
	oddeven = {
		name = "HOUSE_ODD_EVEN",
		desc = "HOUSE_ODD_EVEN_DESC",
		mission = "UNLOCK_RULE",
		img = "1678b68cd54.png",
		imgDesc = "1678b79416e.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		rulecard = true,
		public = true,
		notMess = true,
		type = "CARD",
	},
	mimic = {
		name = "HOUSE_MIMIC",
		desc = "HOUSE_MIMIC_DESC",
		mission = "UNLOCK_RULE",
		img = "1678b690414.png",
		imgDesc = "1678b795c3a.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		rulecard = true,
		public = true,
		type = "CARD",
	},
	justice = {
		name = "HOUSE_JUSTICE",
		desc = "HOUSE_JUSTICE_DESC",
		mission = "UNLOCK_RULE",
		img = "16793a1d160.png",
		imgDesc = "16793a1f409.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		rulecard = true,
		public = true,
		type = "CARD",
	},
	mix = {
		name = "HOUSE_MIX",
		desc = "HOUSE_MIX_DESC",
		mission = "UNLOCK_RULE",
		img = "1678b68e953.png",
		imgDesc = "1678b797f89.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"},name="mix1"},
		rulecard = true,
		public = true,
		type = "CARD",
	},
	bluegreen = {
		name = "HOUSE_BG",
		desc = "HOUSE_BG_DESC",
		mission = "UNLOCK_RULE",
		img = "1678b68b115.png",
		imgDesc = "1678b7df6d3.png",
		conflict = {"portal","mess"},
		rulecard = true,
		public = true,
		type = "PASSIVE",
	},
	dos = {
		name = "HOUSE_DOS",
		desc = "HOUSE_DOS_DESC",
		mission = "UNLOCK_RULE",
		img = "1678b6872bd.png",
		imgDesc = "1678b7e15be.png",
		conflict = {"camouflage"},
		--rulecard = true,
		--public = true,
		lock = true,
		type = "PASSIVE",
	},
	
	share = {
		name = "HOUSE_SHARE",
		desc = "HOUSE_SHARE_DESC",
		mission = "UNLOCK_RULE",
		img = "171653c5945.png",
		imgDesc = "171653cb1cc.png",
		conflict = {"noaction","mess"},
		card = {color={"yellow","green"}},
		rulecard = true,
		public = true,
		type = "CARD",
	},
	key = {
		name = "HOUSE_LOCK",
		desc = "HOUSE_LOCK_DESC",
		mission = "UNLOCK_RULE",
		img = "171653c35c5.png",
		imgDesc = "171653c7e04.png",
		conflict = {"noaction","mess"},
		card = {color={"red","blue","yellow","green"}},
		rulecard = true,
		public = true,
		type = "CARD",
	},
}


--[[ src/lights.lua ]]--

LIGHT = {
	yellow = {
		name = "",
		desc = "",
		author = "",
		img = "15b2bb46d9c.png",
	},
	green = {
		name = "",
		desc = "",
		author = "",
		img = "1729b79f378.png",
	},
	blue = {
		name = "",
		desc = "",
		author = "",
		img = "1729b789f27.png",
	},
	red = {
		name = "",
		desc = "",
		author = "",
		img = "1729b7acf10.png",
	},
	white = {
		name = "",
		desc = "",
		author = "",
		img = "1729b787cc8.png",
	},
}


--[[ src/card_tips.lua ]]--

-- tips for cards that don't have a rule that explain them
CARD = {
	skip = "CARD_SKIP",
	reverse = "CARD_REVERSE",
	draw2 = "CARD_DRAW_TWO",
	wild = "CARD_WILD",
	draw4 = "CARD_WILD_DRAW_FOUR",
	pawn = "CARD_PAWN",
	bishop = "CARD_BISHOP",
	knight = "CARD_KNIGHT",
	rook = "CARD_ROOK",
	queen = "CARD_QUEEN",
	king = "CARD_KING",
	chest = "CARD_TREASURE",
	down = "CARD_DOWN",
	left = "CARD_LEFT",
	right = "CARD_RIGHT",
	up = "CARD_UP",
	shield = "CARD_SHIELD",
	mix1 = "CARD_MIX1",
	mix2 = "CARD_MIX2",
	mix3 = "CARD_MIX3",
}


--[[ src/curses.lua ]]--

CURSE = {
	anvil = {
		img = "162598dff2b.png",
		desc = "CURSE_ANVIL",
		turns = 4,
	},
	ice = {
		img = "162598de0d7.png",
		desc = "CURSE_ICE",
		turns = 3,
	},
	shoe = {
		img = "162598dc59c.png",
		desc = "CURSE_SHOE",
		turns = 3,
	},
	thorn = {
		img = "162598d992f.png",
		desc = "CURSE_THORN",
		turns = 1,
	},
	time = {
		img = "162598d7b11.png",
		desc = "CURSE_TIME",
		turns = 4,
	},
	poison = {
		img = "162598d5ad2.png",
		desc = "CURSE_POISON",
		turns = 2,
	},
}


--[[ src/medals.lua ]]--

TROPHY = {
	none = {
		img = "15c74d9731d.png",
	},
	test = {
		img = "15c8a6d3d6a.png",
		lock = true,
	},
	beta = {
		img = "15ca1a94a30.png",
		lock = true,
	},
	drekkemaus = {
		img = "15ed4c7b562.png",
		lock = true,
	},
	noel = {
		img = "1600ef5f36a.png",
		lock = true,
	},
	charlotte = {
		img = "1614e61ad6e.png",
		lock = true,
	},
	elisah = {
		img = "1631789b13c.png",
		--lock = true,
	},
	buffy = {
		img = "1662c864cd1.png",
		lock = true,
	},
	snowy = {
		img = "167d3a64c76.png",
		lock = true,
	},
}


--[[ src/consumables.lua ]]--

POWERUP = {
	shiny = {
		name = "ITEM_SHINY",
		desc = "ITEM_SHINY_DESC",
		img = "161850c3256.png",
	},
	bot = {
		name = "ITEM_BOT",
		desc = "ITEM_BOT_DESC",
		img = "161850c4ec7.png",
	},
	uno = {
		name = "ITEM_AUTO_UNO",
		desc = "ITEM_AUTO_UNO_DESC",
		img = "161850c6cf0.png",
	},
	mallet = {
		name = "ITEM_MALLET",
		desc = "ITEM_MALLET_DESC",
		img = "161850c8be6.png",
	},
	lamp = {
		name = "ITEM_MAGIC_LAMP",
		desc = "ITEM_MAGIC_LAMP_DESC",
		img = "161850caaf4.png",
	},
	rematch = {
		name = "ITEM_REPLAY",
		desc = "ITEM_REPLAY_DESC",
		img = "161850cc9e0.png",
	},
}


--[[ src/panels.lua ]]--

FLAG = {
	default = {
		name = "FLAG_DEFAULT",
		mission = "SKIN_DEFAULT_MISSION",
		author = "???",
		img = {},
		imgDesc = "161d9c5e781.png",
	},
	picnic = {
		name = "FLAG_PICNIC",
		desc = "FLAG_PICNIC_DESC",
		mission = "RED_MISSION",
		progress = 300,
		author = "Ninguem#0095",
		img = {big="161b057e770.png", mini="161b07c87e4.png"},
		imgDesc = "161d9c5541e.png",
		func = "picnicFlag",
		color = "red",
		card = {"red","n0"},
		fontColor = "1DCED1",
	},
	metal = {
		name = "FLAG_CLOUD",
		desc = "FLAG_CLOUD_DESC",
		mission = "BLUE_MISSION",
		progress = 300,
		author = "Ninguem#0095",
		img = {big="161c91f06eb.png", mini="161c9228cd6.png"},
		imgDesc = "161d9c5aded.png",
		func = "cloudFlag",
		color = "blue",
		card = {"blue","n0"},
		fontColor = "9EBED3",
	},
	paper = {
		name = "FLAG_STAR",
		desc = "FLAG_STAR_DESC",
		mission = "YELLOW_MISSION",
		progress = 300,
		author = "Ninguem#0095",
		img = {big="161bb1cf66a.png", mini="161bb1d2c46.png"},
		imgDesc = "161d9c521ec.png",
		func = "starFlag",
		color = "yellow",
		card = {"yellow","n0"},
		fontColor = "FFE09E",
	},
	carpet  = {
		name = "FLAG_LEAF",
		desc = "FLAG_LEAF_DESC",
		mission = "GREEN_MISSION",
		progress = 300,
		author = "Ninguem#0095",
		img = {big="161b58d725e.png", mini="161b59530fb.png"},
		imgDesc = "161d9c57d62.png",
		func = "leafFlag",
		color = "green",
		card = {"green","n0"},
		fontColor = "BAFFBF",
	},
	disco  = {
		name = "FLAG_DISCO",
		desc = "FLAG_DISCO_DESC",
		mission = "WILD_MISSION",
		progress = 300,
		author = "Ninguem#0095",
		img = {big="1712d58e0d5.png", mini="1712d59031d.png"},
		imgDesc = "1712d59225f.png",
		func = "emptyFunc",
		fontColor = "BAFFBF",
	},
	cloud  = {
		name = "FLAG_CLOUD2",
		desc = "FLAG_CLOUD2_DESC",
		mission = "FLAG_CLOUD2_MISSION",
		progress = 50,
		author = "Ninguem#0095",
		img = {big="171233cfa11.png", mini="171246fb324.png"},
		imgDesc = "171233d5ff4.png",
		func = "emptyFunc",
		fontColor = "BAFFBF",
	},
	circuit  = {
		name = "FLAG_CIRCUIT",
		desc = "FLAG_CIRCUIT_DESC",
		mission = "FLAG_CIRCUIT_MISSION",
		author = "Ninguem#0095",
		img = {big="171233d82f2.png", mini="171246fdbff.png"},
		imgDesc = "171233dd4d1.png",
		func = "emptyFunc",
		fontColor = "BAFFBF",
	},
	circuitused  = {
		name = "FLAG_CIRCUIT",
		desc = "FLAG_CIRCUIT_DESC",
		mission = "FLAG_CIRCUIT_MISSION",
		author = "Ninguem#0095",
		img = {big="1729b690e01.png", mini="1729b68f009.png"},
		imgDesc = "171233dd4d1.png",
		func = "emptyFunc",
		fontColor = "BAFFBF",
	},
}


--[[ src/translate.lua ]]--

LANG = { --ENBRFRRUESCNPLHUTR
MENU ={"Menu","","","Меню","Menú","菜單","","Menü","Menü"},
INVENTORY ={"Inventory","Inventário","Inventaire","Инвентарь","Inventario","物品庫","Inwentarz","Leltár","Envanter"},
NEWS ={"News","Novidades","Nouveautés","Новости","Novedades","更新快報","Wiadomości","Hírek","Haberler"},
RULES ={"Main Rules","Regras Principais","Règles principales","Основные правила","Reglas","主要規則","Główne zasady","Alapszabályok","Kurallar"},
HOUSE_RULES ={"House Rules","Regras da Casa","Règles de la maison","Домашние правила","Reglas de la Casa","自訂規矩","Domowe zasady","Házszabályok","Oda Kuralları"},
CHAIRS ={"Chairs","Cadeiras","Chaises","Кресла","Sillas","椅子","Krzesła","Székek","Koltuklar"},
POWERUPS ={"Powerups","Poderes","Bonus","Улучшения","Poderes","額外功能","Dopalacze ","Felerősítések","Güçlendirici"},
PANELS ={"Panels","Painéis","Panneaux","Панели","Paneles","名稱版面","Panele","Panelek","Paneller"},
LEADERBOARD ={"Leaderboard","Ranking","Classement","Лидеры","Ranking","排行榜","Ranking","Ranglista","Skor Tablosu"},
SPOTLIGHTS ={"Spotlights","Holofotes","","","","","Reflektorfény","Sahne ışıkları"},
MAPS ={"Maps","Mapas","","","","","","Pályák","Haritalar"},
SETTINGS ={"Settings","Opções","Paramètres","Настройки","Ajustes","設定","Ustawienia","Beállítások","Ayarlar"},
ITEMS ={"Items","Itens","Objets","Предметы","Artículos","物品","Przedmioty","Tárgyak","Eşyalar"},
PROFILE ={"Profile","Perfil","Profil","Профиль","Perfil","個人資料","Profil","Profil","Profil"},
CLOSE ={"Close","Fechar","Fermer","Закрыть","Cerrar","關閉","Zamknij","Bezárás","Kapat"},
NEXT ={"Next","Próximo","Suivant","Следующий","Siguiente","下一個","Dalej","Következő","İleri"},
BACK ={"Back","Voltar","Retour","Назад","Volver","返回","Z powrotem","Vissza","Geri"},
PREVIOUS ={"Previous","Anterior","Précédent","Предыдущий","Anterior","上一個","Wstecz","Előző","Önceki"},
FAVORITES ={"Favorites","Favoritos","","","","","","Kedvencek","Favoriler"},
FAVORITES_ADD ={"Add to favorites","Adicionar aos favoritos","","","","","","Hozzáadás a kedvencekhez","Favorilere ekle"},
VICTORY ={"Victories","Vitórias","Victoires","Победы","Victorias","勝利次數","Zwycięstwa","Győzelmek","Galibiyetler"},
TEAM_VICTORY ={"Team victories","Vitórias em dupla","Victoires de l'équipe","Командные победы","Victorias en Equipo","團隊勝利次數","Zwycięstwa drużynowe","Csapat győzelmek","Takım Galibiyetleri"},
ROUND_PLAYED ={"Rounds played","Partidas jogadas","Tours joués","Раундов сыграно","Rondas jugadas","玩過的回合數","Zagrane rundy","Játszott körök","Oynanılan Oyun"},
ROUND_WATCHED ={"Rounds watched","Partidas assistidas","Tours regardés","Раундов просмотрено","Rondas espectadas","旁觀場數","Obejrzane rundy","Megfigyelt körök","İzlenilen oyun"},
CHAIRS_UNLOCKED ={"Chairs unlocked","Cadeiras desbloqueadas","Chaises débloquées","Разблокированные кресла","Sillas desbloqueadas","解鎖了的椅子數量","Odblokowane krzesła","Feloldott székek","Açılan Koltuklar"},
FAVORITE ={"Current chair","Cadeira atual","Chaise actuelle","Текущее кресло","Silla actual","使用中的椅子","Obecne krzesło","Aktuális szék","Kullanılan Koltuk"},
CHANGE ={"Change","Trocar","Changer","Сменить","Cambio","更換","Zmień","Változtat","Değiştir"},
SET_COLORBLIND ={"Colorblind Mode (may cause lag)","Modo daltônico (pode causar lag)","Mode daltonien (peut causer des lags)","Режим дальтоника (может вызвать задержку)","Modo Daltónico (Puede causar lag)","色弱協助模式 (有機會導致延遲)","Tryb Kolorystyczny (może powodować lagi)","Színvak Mód (laggot okozhat)","Renk Körü Modu (Lag yapabilir)"},
SET_BELL ={"Ring the bell when it's your turn (active Transformice sounds)","Tocar sino na sua vez (ative os sons do Transformice)","Sonnez la cloche quand c'est votre tour (active les sons de Transformice)","Звенит звонок когда твоя очередь (звуки Transformice)","Sonar la campana en turno (activar sonidos en Transformice)","啟用回合提醒聲音 (啟用 Transformice 音效)","Dźwięk dzwonka w twojej turze (aktywuje dźwięki Transformice)","Szóljon harang, amikor te következel (aktiváld a Transformice hangjait)","Sıra sana geldiğinde çanı etkinleştir (Transformice seslerini aktif et)"},
SET_SHADOW ={"Card shadows (may cause lag)","Escurecimento das cartas (pode causar lag)","Ombres de cartes (peut causer des lags)","Карта с тенями (может вызвать задержку)","Sombras de Carta (Pueden causar lag)","卡牌陰影效果 (有機會導致延遲)","Cienie kart (może powodować lagi)","Kártya árnyékok (laggot okozhat)","Kart Gölgesi (Lag yapabilir)"},
SET_CHALLENGE ={"Ask for confirmation before challenging a +4 card","Confirmar ao desafiar +4","Demandez confirmation avant de défier une carte +4","Спросите подтверждения, прежде чем бросите карту +4","Confirmar antes de cambiar +4","在質疑 +4 卡牌的時候彈出確認視窗","Potwierdź przed Wyzwaniem +4","Kérjen megerősítést, mielőtt a +4 kártyát kihívja"," +4'e itiraz etmeden önce onay isteyin"},
SET_COMMUNITY ={"Community","Comunidade","Communauté","Сообщество","Comunidad","社區","Społeczność","Közösség","Topluluk"},
CREDITS ={"Credits","Créditos","Crédits","Благодарность","Créditos","鳴謝","Zasługi","Köszönetnyilvánítás","Bilgilendirme"},
CREDIT_TXT ={"This minigame was developed by Ninguem#0095. Suggestions, bugs, praise or a +4 can be sent via private message on Atelier 801's forum.","Este minigame foi desenvolvido pelo Ninguem#0095. Sugestões, bugs, elogios ou um +4 podem ser enviados por mensagem privada através do fórum da Atelier 801.","Ce mini-jeu a été développé par Ninguem#0095. Suggestions, bugs, éloges ou une carte +4 peuvent être envoyés par message privé sur le forum de l'Atelier 801.","Эта мини-игра была разработана Ninguem#0095. Предложения, ошибки, благодарность или +4 можно отправить личным сообщением на форуме Atelier 801.","Este minijuego fue desarrollado por Ninguem#0095. Sugerencias, errores, felicitaciones o un +4 pueden ser enviados por mensaje privado a través del foro.","這個小遊戲是由 Ninguem#0095 創作。 如果有任何建議, 發現漏洞, 想稱讚或是有做不好的地方, 可以透過 Atelier 801 的論壇發信息聯絡。","Minigra została zaprogramowana przez Ninguem#0095. Sugestie, błędy, pochwały lub +4 można wysłać przez prywatną wiadomość na forum Atelier801.","Ezt a minijátékot Ninguem#0095 fejlesztette. Javaslatokat, hibákat, dicséretet küldhetsz privát üzenetben az Atelier801 fórum oldalán.","Bu mini oyun Ninguem#0095 tarafından geliştirilmiştir. Öneriler, hatalar, övgü veya +4, Atelier 801'in forumundaki özel mesajla gönderilebilir."},
CREDIT_TXT2 ={"You can also support #unotfm by sending donations via PayPal (<a href='event:support'>click here</a>). Unfortunately I cannot offer rewards, but you will have my sincere thanks! Don't forget to write your nickname and tag so I know who you are.","Você também pode apoiar o #unotfm enviando doações via PayPal (<a href='event:support'>clique aqui</a>). Infelizmente não posso oferecer recompensas, mas você terá meus sinceros agradecimentos! Não esqueça de colocar seu nick com tag para eu saber quem você é.","","","","你也可以透過 PayPal 來支持 #unotfm (<a href='event:support'>點這裡</a>). 可惜是我不能用東西回報, 但我會給你最真誠的謝意! 別忘記寫下你的玩家名稱及編號以讓我知道你大方慷慨。","","Támogathatod a #unotfm-et PayPal adományozáson keresztül (<a href='event:support'>kattints ide</a>). Sajnos nem tudok érte jutalmat nyújtani, de őszintén hálás leszek! Ne felejtsd el megírni a játékosneved (az azonosítóval együtt), hogy tudjam ki vagy.","PayPal aracılığıyla bağış göndererek #unotfm'i de destekleyebilirsiniz (<a href='event:support'> burayı tıklayın </a>). Maalesef ödüller sunamıyorum, ama içten teşekkürlerimi sunacaksın! Takma adınızı ve etiketinizi yazmayı unutmayın, böylece kim olduğunuzu biliyorum."},
THANKS ={"Thanks","Agradecimentos","Remerciements","Спасибо","Agradecimientos","感謝","Podziękowania","Köszönet","Teşekkürler"},
THANKS_TRANSLATE ={"translate to %s","tradução para %s","traduction en %s","перевёл на %s","traducido por %s","%s 翻譯","przetłumaczenie na %s","fordítás %s régióra","çeviri yapanlara"},
THANKS_CARDS ={"cards design","design das cartas","apparence des cartes","дизайн карт","diseño de cartas","卡牌設計","projektowanie kart","kártyák tervezése","kartların tasarımı"},
THANKS_POPUPS ={"pop-up design","design das pop-ups","apparence des fenêtes","дизайн","diseño de pop-ups","彈出動畫設計","zaprojektowanie okien","felugró üzenetek tervezése","pop-up tasarımı"},
THANKS_MAPS ={"creating maps","criação de mapas","création de cartes","создание карт","creación de mapas","地圖製作","tworzenie map","pályák készítése","haritayı tasarlayanlara"},
THANKS_CHAIRS ={"chair design","design de cadeiras","apparence des chaises","дизайн кресел","diseño de sillas","椅子設計","zaprojektowanie krzeseł","székek tervezése","koltukları tasarlayanlara"},
WARN_AUTOSTART ={"Type !start to start the game manually.","Digite !start para iniciar o jogo manualmente.","Tapez !start pour démarrer manuellement le jeu.","Напишите !start, чтобы запустить игру вручную.","Escribe !start para iniciar el juego manualmente.","輸入 !start 開始遊戲","Typ !start do rozpoczęcia gry manualnie.","Írd be a !start parancsot a játék manuális indításához.","Oyunu manuel olarak başlatmak için !start yazın."},
START_TIP ={"Press space or duck to have a seat.","Pressione espaço ou abaixe-se para pegar uma cadeira.","Appuyez sur espace ou baissez-vous pour vous asseoir.","Нажмите пробел или стрелку вниз, чтобы сесть.","Presiona espacio o bájate para tener una silla.","蹲下或按空格鍵來加入遊戲位置","Kliknij spację lub kucnij aby zająć fotel.","Nyomd meg a szóközt vagy a lefele gombot, hogy leülj.","Oturmak için boşluk veya eğilme tuşuna basın."},
SPACE ={"space","espaço","espace","пробел","Espacio","空格鍵","spacja","szóköz","space"},
PASS ={"Pass turn","Passar a vez","Passer le tour","Пропустить","Pasar turno","結束回合","Przeczekaj rundę.","Kör Átadása","Sıranı atla"},
CHALLENGE ={"Challenge","Desafiar","Défi","Вызов","Desafiar","質疑","Wyzwij","Kihívás","İtiraz"},
DRAW ={"Draw","Comprar","Tirer","Взять","Tomar","抽取卡牌","Wyciągnij","Húzás","Kart çek"},
CHANGE_HAND ={"Change cards","Trocar cartas","Changer les cartes","Сменить карты","Cambiar Cartas","更換卡牌","Zmiana kart","Kártyák kicserélése","Değiştir"},
CHAIR_ALLERT ={"Back to your chair!","Volte para sua cadeira!","Retournez a votre chaise!","Вернитесь к своему креслу!","¡Vuelve a tu silla!","返回你的座位!","Wróć na swój fotel!","Menj vissza a székedhez!","Sandalyenize geri dönün!"},
PROCESSING ={"Processing...","Processando...","","","","","","Processing...","İşleniyor..."},
PLAYER_WON ={"%s won the game!","%s venceu o jogo!","%s a gagné la partie!","%s выиграл игру!","¡%s gana el juego!","%s 勝出了遊戲!","%s wygrał grę!","%s megnyerte a játékot!","%s oyunu kazandı!"},
PLAYER_LOST ={"Everyone lost!","Todos perderam!","Tout le monde a perdu!","Все проиграли!","¡Todos han perdido!","所有人都輸了!","Wszyscy zgubieni!","Mindenki veszített!","Herkes kaybetti!"},
TEAM_WON ={"%s and %s won!","%s e %s venceram!","%s et %s ont gagné!","%s и %s выиграли!","¡%s y %s han ganado!","%s 和 %s 勝出了!","%s i %s wygrali!","%s és %s nyert!","%s ve %s kazandı!"},
PLAYER_TIED ={"Tie!","Empate!","Égalité!","Привязан!","¡Córbata!","和局!","Remis!","Döntetlen!","Kravat!"},
TEAM_SHOW_CARD ={"Click on a card to show it to your partner.","Clique em uma carta para mostrá-la ao seu parceiro!","Cliquez sur une carte pour la montrer à votre coéquipier.","Нажмите на карту, чтобы показать её своему партнеру.","Clic en una carta para mostrársela a tu compañero.","點擊卡牌來向隊友展示它。","Kliknij na kartę, aby pokazać ją swojemu partnerowi.","Kattints egy kártyára, hogy megmutasd a partnerednek.","Partnerinize göstermek için bir karta tıklayın."},
TEAM_DESCRIPTION ={"This is your partner. Work as a team to win this match.","Este é o seu parceiro. Trabalhe em equipe para vencer esta partida.","C'est votre coéquipier. Jouez ensemble pour gagner cette partie.","Это твой партнёр. Работайте в команде, чтобы выиграть.","Éste es tu compañero. Trabajen en equipo para ganar esta partida.","他是你的隊友。以團隊形式贏得這回合吧!","To jest twój partner. Pracujcie jako drużyna, aby wygrać rundę.","Ez a partnered. Dolgozzatok csapatban, hogy megnyerjétek a mérkőzést.","Bu partneriniz. Bu maçı kazanmak için takım olarak çalışın."},
CHALENGE_COLOR ={"Do you think %s has a card with this color?","Você acha que %s tem uma carta dessa cor?","","","","","","","Sizce %s bu renkte bir karta sahip mi?"},
KILL_PAWN ={"Killed the Pawn!","Matou o Peão!","Pion tué!","Пешка убита!","¡Mató al Peón!","士兵被殺掉了!","Zabito Pionka!","A Gyalog elesett!","Piyonu öldürdü!"},
KILL_BISHOP ={"Killed the Bishop!","Matou o Bispo!","Fou tué!","Офицер убит!","¡Mató al Obispo!","主教被殺掉了!","Zabito Gońca!","A Futó elesett!","Piskopos öldürdü!"},
KILL_KNIGHT ={"Killed the Knight!","Matou o Cavalo!","Chevalier tué!","Конь убит!","¡Mató al Caballero!","騎士被殺掉了!","Zabito Skoczka!","A Lovag elesett!","Şövalyeyi Öldürdü!"},
KILL_ROOK ={"Killed the Rook!","Matou a Torre!","Tour tuée!","Ладья убита!","¡Mató a la Torre!","城堡被殺掉了!","Zabito Wieżę!","A Bástya elesett!","Kaleyi Öldürdü!"},
KILL_QUEEN ={"Killed the Queen!","Matou a Rainha!","Reine tuée!","Королева убита!","¡Mató a la Reina!","王后被殺掉了!","Zabito Królową!","A Királynő elesett!","Kraliçeyi öldürdü!"},
KILL_KING ={"Killed the King!","Matou o Rei!","Roi tué!","Король убит!","¡Mató al Rey!","國王被殺掉了!","Zabito Króla!","A Király elesett!","Kralı öldürdü!"},
MISSION_DESC ={"You receive a new quest every day. You can accumulate up to 3 quests.","Você recebe uma nova missão por dia. É possível acumular até 3 missões.","","","","","","","Her gün yeni bir görev alırsınız. En fazla 3 görev toplayabilirsiniz."},
MISSION_CHANGE ={"Change","Trocar","","","","","","","Değişiklik"},
MISSION_NEW ={"New quest in %s.","Nova missão em %s.","","","","","","","%s içinde yeni görev."},
MISSION ={"Quests","Missões","","","","","","","Görevler"},
COMPLETED_RED ={"You have completed the quest '%s' and got %s red tickets!","Você completou a missão '%s' e recebeu %s tickets vermelhos!","","","","","","","%s' görevini tamamladınız ve %s kırmızı bilet aldınız!"},
COMPLETED_BLUE ={"You have completed the quest '%s' and got %s blue tickets!","Você completou a missão '%s' e recebeu %s tickets azuis!","","","","","","","%s' görevini tamamladınız ve %s mavi bilet aldınız!"},
COMPLETED_YELLOW ={"You have completed the quest '%s' and got %s yellow tickets!","Você completou a missão '%s' e recebeu %s tickets amarelos!","","","","","","","%s' görevini tamamladınız ve %s sarı bilet aldınız!"},
COMPLETED_GREEN ={"You have completed the quest '%s' and got %s green tickets!","Você completou a missão '%s' e recebeu %s tickets verdes!","","","","","","","%s' görevini tamamladınız ve %s yeşil bilet aldınız!"},
MISSION1 ={"All Reds","Tudo Vermelho","","","","","","","Tüm Kırmızılar"},
MISSION1_DESC ={"Play %s red cards.","Jogue %s cartas vermelhas.","","","","","","","%s  kırmızı kartı oynayın."},
MISSION2 ={"All Blues","Tudo Azul","","","","","","","Tüm Maviler"},
MISSION2_DESC ={"Play %s blue cards.","Jogue %s cartas azuis.","","","","","","","%s mavi kartları oynayın."},
MISSION3 ={"All Yellows","Tudo Amarelo","","","","","","","Tüm Sarılar"},
MISSION3_DESC ={"Play %s yellow cards.","Jogue %s cartas amarelas.","","","","","","","%s sarı kart oynayın."},
MISSION4 ={"All Greens","Tudo Verde","","","","","","","Tüm Yeşiller"},
MISSION4_DESC ={"Play %s green cards.","Jogue %s cartas verdes.","","","","","","","%s yeşil kart oynayın."},
MISSION5 ={"Draw, friend, draw!","Compre, amigo. Compre!","","","","","","","Çek, arkadaş, çek!"},
MISSION5_DESC ={"Play %s +2 cards.","Jogue %s cartas +2.","","","","","","","%s +2 kart oynayın."},
MISSION6 ={"Turning the Game","Vai e Vem.","","","","","","","Oyun dönüyor"},
MISSION6_DESC ={"Play %s Reverse cards.","Jogue %s cartas Reverter.","","","","","","","%s Ters kartları oynat."},
MISSION7 ={"Blocker","Bloqueador","","","","","","","Engelleyici"},
MISSION7_DESC ={"Play %s Skip cards.","Jogue %s cartas Pular.","","","","","","","%s Kartları atla."},
MISSION8 ={"In Search of Zeros","Em Busca dos Zeros","","","","","","","Sıfırlar Arayışı"},
MISSION8_DESC ={"Play %s zero cards.","Jogue %s cartas 0.","","","","","","","%s sıfır kart oynayın."},
MISSION9 ={"Persistence","Persistência","","","","","","","Süreklilik"},
MISSION9_DESC ={"Play %s rounds.","Jogue %s partidas.","","","","","","","%s tur oynayın."},
MISSION10 ={"Victorious","Vitorioso","","","","","","","Başarılı"},
MISSION10_DESC ={"Win %s rounds.","Vença %s partidas.","","","","","","","%s tur kazanın."},
MISSION11 ={"UNO!","","","","","","","",""},
MISSION11_DESC ={"Say UNO %s times.","Diga UNO %s vezes.","","","","","","","%s kere UNO de."},
MISSION12 ={"Supply","Abastecimento","","","","","","","Tedarik"},
MISSION12_DESC ={"Draw %s cards (without intentional drawing).","Compre %s cartas (sem compras propositais).","","","","","","","%s kartları çiz (kasıtlı çizim olmadan)."},
MISSION13 ={"Passing","Passando","","","","","","","Geçen"},
MISSION13_DESC ={"Block +2 or +4 %s times.","Bloqueie +2 ou +4 %s vezes.","","","","","","","%s kez +2 veya +4 ile engelle."},
MISSION14 ={"Team Win","Vitória em Dupla","","","","","","","Takım Galibiyeti"},
MISSION14_DESC ={"Win a Team Match round.","Vença uma Partida em Duplas.","","","","","","","Bir Takım Maçı turu kazanın."},
MISSION15 ={"Red Win","Vitória Vermelha","","","","","","","Kırmızı Zafer"},
MISSION15_DESC ={"Win a round using a red card.","Vença uma partida usando uma carta vermelha.","","","","","","","Kırmızı kart kullanarak bir tur kazanın."},
MISSION16 ={"Blue Win","Vitória Azul","","","","","","","Mavi Zafer"},
MISSION16_DESC ={"Win a round using a blue card.","Vença uma partida usando uma carta azul.","","","","","","","Mavi kart kullanarak bir tur kazanın."},
MISSION17 ={"Yellow Win","Vitória Amarela","","","","","","","Sarı Zafer"},
MISSION17_DESC ={"Win a round using a yellow card.","Vença uma partida usando uma carta amarela.","","","","","","","Sarı kart kullanarak bir tur kazanın."},
MISSION18 ={"Green Win","Vitória Verde","","","","","","","Yeşil Zafer"},
MISSION18_DESC ={"Win a round using a green card.","Vença uma partida usando uma carta verde.","","","","","","","Sarı kart kullanarak bir tur kazanın."},
MISSION19 ={"Attentive Player","Jogador Atento","","","","","","","Özenli Oyuncu"},
MISSION19_DESC ={"Win a round without the timer appearing during your turn.","Vença uma partida sem deixar o cronômetro aparecer na sua vez.","","","","","","","Sıranız sırasında zamanlayıcı görünmeden bir tur kazanın."},
MISSION20 ={"Chaotic Win","Vitória Caótica","","","","","","","Kaotik Zafer"},
MISSION20_DESC ={"Win a round with the Mess rule.","Vença uma partida com a regra Bagunça.","","","","","","","Karmakarışık kuralı ile bir tur kazanın."},
MISSION21 ={"Double Trouble!","Encrenca em Dobro!","","","","","","","Çifte Bela!"},
MISSION21_DESC ={"Play %s Team Match rounds.","Jogue %s Partidas em Duplas.","","","","","","","%s kez Takım maçı turu oynayın."},
MISSION22 ={"Chaos is Fun!","Caos é Divertido!","","","","","","","Kaos Eğlencelidir!"},
MISSION22_DESC ={"Play %s rounds with the Mess rule.","Jogue %s partidas com a regra Bagunça.","","","","","","","Karmakarışık kuralıyla %s tur oynayın."},
MISSION23 ={"Action Win","Vitória com Ação","","","","","","","Aksyon Zafer"},
MISSION23_DESC ={"Win a round using action card.","Vença com uma carta de ação.","","","","","","","Aksiyon kartını kullanarak bir tur kazanın."},
MISSION24 ={"Together is More Fun","Juntos é Mais Divertido","","","","","","","Birlikte Daha Eğlenceli"},
MISSION24_DESC ={"Play a round with your soulmate.","Jogue uma partida com sua alma-gêmea.","","","","","","","Ruh eşinizle bir tur oynayın."},
MISSION25 ={"Ace in the Hole","Carta na Manga","","","","","","","Son Koz"},
MISSION25_DESC ={"Win a round using a Wild card.","Vença uma partida usando uma carta curinga.","","","","","","","Renk kartı kullanarak bir tur kazanın."},
CONSUMABLES ={"Consumables","Consumíveis","","","","","","","Tüketim maddeleri"},
USE ={"Use","Usar","","","","","","","Kullan"},
ACTIVATE ={"Enable","Ativar","","","","","","","Etkinleştirme"},
DEACTIVATE ={"Disable","Desativar","","","","","","","Devre Dışı"},
PUT_RULE ={"Put this rule in the next round","Colocar regra na próxima partida","","","","","","","Bu kuralı bir sonraki tura koy"},
CANCEL ={"Cancel","Cancelar","","","","","","","İptal etmek"},
ITEM_BOT ={"Auto Play","Jogada Automática","","","","","","","Otomatik oynatma"},
ITEM_BOT_DESC ={"Play for you when your time is up. Spend 1 unit per use.","Joga por você quando seu tempo acabar. Gasta 1 unidade por uso.","","","","","","","Zamanın dolduğunda senin için oyna. Her kullanım için 1 birim harcayın."},
ITEM_UNO ={"Auto UNO","UNO Automático","","","","","","","Otomatik UNO"},
ITEM_UNO_DESC ={"Say UNO for you in case you forget. Spend 1 unit per use.","Fala UNO por você caso você esqueça. Gasta 1 unidade por uso.","","","","","","","Unutmanız durumunda Kullanım başına 1 birim harcayarak sizin için UNO der."},
ITEM_LIGHT ={"Highlight Cards","Destacar Cartas","","","","","","","Vurgu Kartları"},
ITEM_LIGHT_DESC ={"Highlights your playable cards. Spend 1 unit per match.","Destaca as suas cartas jogáveis. Gasta 1 unidade por partida.","","","","","",""," Maç başına 1 birim harcayarak oynanabilir kartlarınızı vurgular."},
ITEM_RULE ={"Magic Lamp","Lâmpada Mágica","","","","","","","Sihirli Lamba"},
ITEM_RULE_DESC ={"Choose a rule to appear in your next match.","Escolha uma regra para aparecer na sua próxima partida.","","","","","","","Bir sonraki maçınızda görünecek bir kural seçin."},
ITEM_RESERVE ={"Reserve Seat","Reservar Lugar","","","","","","","Yedek Koltuk"},
ITEM_RESERVE_DESC ={"Reserve your seat for the next match.","Reserve seu lugar para a próxima partida.","","","","","","","Bir sonraki maç için yerinizi ayırtın."},
ITEM_TIME ={"Time Hammer","Marreta do Tempo","","","","","","","Zaman Çekiç"},
ITEM_TIME_DESC ={"Stay immune to the hourglass for 1 hour.","Fique livre da ampulheta durante 1 hora.","","","","","","","Kum saatine karşı 1 saat boyunca bağışık kalın."},
FLAG_DEFAULT ={"None","Nenhum","Aucun","Никто","Ninguna","什麼都沒有~","Nic","Nincs","Yok"},
FLAG_PICNIC ={"Pic-nic","Piquenique","Pique-nique","Пикник","","野-餐","Piknik","Piknik","Piknik"},
FLAG_PICNIC_DESC ={"When playing a red 0, donate a duplicate card to a player.","Ao jogar um 0 vermelho, doe uma carta repetida para um jogador.","En jouant un 0 rouge, vous donnez une carte en double à un joueur.","Играя красной 0, подарите игроку дубликат карты.","Cuando juegues una roja 0, dónale una carta duplicada a algún jugador.","當你發出紅色 0 號牌, 可以把一張複製卡給予一個玩家。","Kiedy zagrasz czerwonym 0, podaruj graczowi duplikat karty.","Amikor piros 0-t játszol, egy másolat kártyát adományoz egy játékosnak.","Kırmızı renk bir 0 yazan kart oynarken, bir oyuncuya çift kart bağışlanır."},
FLAG_CLOUD ={"Metal","","Métal","Метал","","重金屬","","Fém",""},
FLAG_CLOUD_DESC ={"When playing a blue 0, a random player draws 1 to 2 cards.","Ao jogar um 0 azul, um jogador aleatório compra de 1 a 2 cartas.","En jouant un 0 bleu, un joueur aléatoire tire de 1 à 2 cartes.","Играя синей 0, случайный игрок берёт 1-2 карты.","Cuando juegues una azul 0, un jugador aleatorio sorteará de 1 a 2 cartas.","當你發出藍色 0 號牌, 隨機一個玩家罰抽 1 到 2 張卡牌。","Kiedy zagrasz niebieskim 0, losowy gracz dobierze od 1 do 2 kart.","Amikor kék 0-t játszol, egy véletlenszerű játékos 1-2 kártyát húz.","Mavi renk bir 0 yazan kart oynarken, rastgele bir oyuncu 1 ila 2 kart çeker."},
FLAG_STAR ={"Paper","Papel","Papier","Бумага","Cuando juegues una amarilla 0, usa una carta comodín.","宣紙","Papier","Papír","Kağıt"},
FLAG_STAR_DESC ={"When playing a yellow 0, add a Wild card to your hand.","Ao jogar um 0 amarelo, adicione uma carta curinga à sua mão.","En jouant un 0 bleu, une carte noire s'ajoute à votre jeu.","Играя жёлтой 0, добавьте в свою руку чёрную карту.","Tapiz","當你發出黃色 0 號牌,  將會增加一張 換色卡牌 到你持有的卡牌中。","Kiedy zagrasz żółtym 0, otrzymasz kartę Wild do twojej ręki.","Amikor sárga 0-t játszol, egy Színválasztó kártyát ad hozzá a kezedhez.","Sarı renk bir 0 yazan kart oynarken, elinize bir Renk kartı eklenir."},
FLAG_LEAF ={"Carpet","Tapete","Tapis","Ковер","Cuando juegues una verde 0, descarta una carta numérica y sortea una carta para reiniciar.","草地毯","Dywan","Szőnyeg","Halı"},
FLAG_LEAF_DESC ={"When playing a green 0, discard a numerical card and draw 1 card to reset.","Ao jogar um 0 verde, descarte um número e compre 1 carta para repor.","Lorsque vous jouez un 0 vert, vous défaussez une carte numérique et tirez une carte pour la réinitialiser.","Играя зелёной 0, выбросьте цифровую карту и возьмите 1 карту для сброса.","Disco","當你發出綠色 0 號牌, 可以丟棄一張數字卡並抽取另一張卡代替。","Kiedy zagrasz zielonym 0, odrzuć kartę z numerem  i dobierz jedną kartę by zresetować.","Amikor zöld 0-t játszol, dobj el egy számkártyát, majd húzz 1 újat.","Yeşil renk bir 0 yazan kart oynarken, sayısal bir kartı atın ve sıfırlamak için 1 kart çekin."},
FLAG_DISCO ={"Disco","Discoteca","","Диско","","迪斯可","Dyskoteka","Diszkó","Disko"},
FLAG_DISCO_DESC ={"When an opponent plays a Wild card, your zeros have a 25% chance of becoming the color chosen by them.","Quando um adversário jogar um curinga, seus zeros tem 25% de chance de ficarem da cor escolhida por ele.","","","","當對手發出換色卡牌, 你手中的0號卡牌有25%機會變成對手選擇的顏色。","","Amikor egy ellenfeled Színválasztó kártyát játszik, a nulláidnak 25% esélye van arra, hogy az általuk választott színre változzanak.","Bir rakip Renk kartı oynadığında, sıfırlarınızın %25'i tarafından seçilen renk olma şansı vardır."},
FLAG_CLOUD2 ={"Cloud","Nuvem","","","","白雲","","Felhő","Bulut"},
FLAG_CLOUD2_DESC ={"Begin the game with an extra action card.","Comece a partida com uma carta de ação extra.","","","","遊戲開局會得到多一張行動卡牌。","","Kezdd a játékot egy extra akciókártyával!","Oyuna ekstra bir aksiyon kartı ile başlayın."},
FLAG_CLOUD2_MISSION ={"Unlocked by winning %s times with the Mess rule.","Desbloqueado ao vencer %s partidas com a regra Bagunça.","","","","在大混亂模式中勝出50次。","","A feloldáshoz nyerj 50 alkalommal a Zűrzavar szabállyal.","Karmakarışık kuralı ile 50 kez kazanarak kilidi açıldı."},
FLAG_CIRCUIT ={"Circuit","Circuito","","","","電路板","","Áramkör","Devre"},
FLAG_CIRCUIT_DESC ={"If you forgot to play a card, we'll play one for you (once per match).","Se você esquecer de jogar carta, jogaremos por você (1 vez por partida)","","","","如果你忘了發出卡, 我們會幫你 (一局遊戲只限一次)。","","Ha elfelejtesz kártyákkal játszani, akkor mi játszunk neked egyet. (játékonként egyszer)","Bir kart oynamayı unuttuysanız, sizin için bir tane oynayacağız (maç başına bir kez)."},
FLAG_CIRCUIT_MISSION ={"Unlocked by defeating 9 bots in the same match (without rules).","Desbloqueado ao derrotar 9 bots na mesma partida (sem regras).","","","","在同一局裡打敗9個機械人鼠解鎖 (不能使用規矩)。","","A feloldáshoz győzz le 9 robotot ugyanabban a játékban (szabályok nélkül).","Aynı maçta 9 botu yenerek kilidi açıldı (kurallar olmadan)."},
FLAG_NO_NAME ={"????","","","","","","","",""},
FLAG_NO_NAME_DESC ={"When you play a 0 over another 0, your next draw will use the Tracking rule.","Ao jogar um 0 sobre outro 0, sua próxima compra usa a regra Rastrear.","","","","","","","Başka bir 0 üzerinden 0 oynadığınızda, bir sonraki çekilişiniz İzleme kuralını kullanır."},
FLAG_CHAMPION ={"Champion","Campeão","","","","","","","Şampiyon"},
FLAG_CHAMPION_DESC ={"Your first drawing uses the Fast Drawing rule. You lose your first turn.","Sua primeira compra usa a regra Compra Rápida. Você perde o primeiro turno.","","","","","","","İlk çiziminiz Hızlı Çizim kuralını kullanır. İlk sıranızı kaybedersiniz."},
LIGHT_YELLOW ={"Yellow Light","Luz Amarela","","","","","","","Sarı ışık"},
LIGHT_BLUE ={"Blue Light","Luz Azul","","","","","","","Mavi ışık"},
LIGHT_GREEN ={"Green Light","Luz Verde","","","","","","","Yeşil ışık"},
LIGHT_RED ={"Red Light","Luz Vermelha","","","","","","","Kırmızı ışık"},
LIGHT_WHITE ={"White Light","Luz Branca","","","","","","","Beyaz ışık"},
LIGHT_PINK ={"Pink Light","Luz Rosa","","","","","","","Pembe Işık"},
LIGHT_ORANGE ={"Orange Light","Luz Laranja","","","","","","","Turuncu Işık"},
LIGHT_BLUE_SHAMAN ={"Blue Shaman","Shaman Azul","","","","","","","Mavi Şaman"},
LIGHT_GOLD_SHAMAN ={"Golden Shaman","Shaman Dourado","","","","","","","Altın Şaman"},
LIGHT_DIVINE_SHAMAN ={"Divine Shaman","Shaman Divino","","","","","","","İlahi Şaman"},
MAP_CLASSIC ={"Classic Maps","Pacote Clássico","","","","","","","Klasik Haritalar"},
MAP_CLASSIC_DESC ={"A random classic map.","Um mapa clássico aleatório.","","","","","","","Rastgele klasik bir harita."},
MAP_FAVORITE ={"Favorite Maps","Pacote Favoritos","","","","","","","Favori Haritalar"},
MAP_FAVORITE_DESC ={"A random favorite map.","Um mapa favorito aleatório.","","","","","","","Rasgele bir favori harita."},
MAP1 ={"Classic","Clássico","","","","","","","Klasik "},
MAP2 ={"Grass","Gramas","","","","","","","Çimen"},
MAP3 ={"Castle","Castelo","","","","","","","Kale"},
MAP4 ={"Ninja","","","","","","","",""},
MAP5 ={"Gears","Engrenagens","","","","","","","Donanımlar"},
MAP6 ={"Cafe","Café","","","","","","","Kafe"},
MAP7 ={"Gourmet","","","","","","","","Gurme"},
MAP8 ={"Night Fishing","Pesca Noturna","","","","","","","Gece Balıkçılık"},
MAP9 ={"Boat","Barco","","","","","","","Tekne"},
MAP10 ={"Archeology","Arqueologia","","","","","","","Arkeoloji"},
MAP11 ={"Waterfall","Cachoeira","","","","","","","Şelale"},
MAP12 ={"Anniversary","Aniversário","","","","","","","Yıldönümü"},
MAP13 ={"Love","Amor","","","","","","","Aşk"},
MAP14 ={"Jurassic","Jurássico","","","","","","","Tarih öncesi"},
MAP15 ={"Spooky","Assustador","","","","","","","Ürpertici"},
MAP16 ={"Forest","Floresta","","","","","","","Orman"},
MAP17 ={"Moon","Lua","","","","","","","Ay"},
MAP18 ={"Mansion","Mansão","","","","","","","Konak"},
MAP19 ={"Garden","Jardim","","","","","","","Bahçe"},
MAP20 ={"Party","Festa","","","","","","","Parti"},
MAP21 ={"Stripes","Listras","","","","","","","Çizgili"},
MAP22 ={"Forest 2","Floresa 2","","","","","","","Orman 2"},
MAP23 ={"Christmas","Natal","","","","","","","Noel"},
MAP24 ={"Ice","Gelo","","","","","","","Buz"},
MAP25 ={"Mythology","Mitologia","","","","","","","Mitoloji"},
MAP26 ={"Temple","Templo","","","","","","","Tapınak"},
MAP27 ={"Spooky 2","Assustador 2","","","","","","","Ürkütücü 2"},
MAP28 ={"Bells","Sinos","","","","","","","Çanlar"},
MAP29 ={"Blueprint","Rascunho","","","","","","","Taslak"},
MAP30 ={"Futuristic City","Cidade Futurista","","","","","","","Fütüristik şehir"},
MAP31 ={"Rocket","Foguete","","","","","","","Roket"},
MAP32 ={"MyCity","","","","","","","","Benim şehrim"},
SKIN_DEFAULT ={"Gray Armchair","Poltrona Cinza","Fauteuil gris","Серое Кресло","Sillón Gris","灰色扶手椅子","Szary Fotel","Szürke Fotel","Gri Koltuk"},
SKIN_DEFAULT_MISSION ={"Unlocked by default.","Desbloqueado por padrão","Débloqué par défaut","Разблокирован по умолчанию.","Desbloquueado por defecto","自動解鎖。","Odblokowany domyślnie. ","Alapértelmezés szerint feloldva.","Varsayılan olarak kilidi açıktır."},
SKIN_WOOD ={"Wooden Chair","Banco de Madeira","Chaise en bois","Деревянное Кресло","Silla de madera","木製椅子","Drewniane krzesło","Fa szék","Tahta sandalye"},
SKIN_ROUND_MISSION ={"Unlocked after playing %s games.","Desbloqueado ao jogar %s partidas","Débloqué en jouant %s parties.","Разблокируется после %s сыгранных игр.","Desbloqueado después de jugar %s partidas","玩過 %s 場遊戲後解鎖。","Odblokuje się po zagraniu %s gier","A feloldáshoz játssz %s alkalommal.","%s oyun oynadıktan sonra kilidi açılır."},
SKIN_STONE ={"Stone Bench","Banco de Pedra","Banc en pierre","Каменное Кресло","Banco de piedra","石頭長椅","Kamienna ława","Kőpad","Taş Bank"},
SKIN_GOLD ={"Golden Throne","Trono de Ouro","Trône en or","Золотое Кресло","Trono Dorado","黃金寶座","Złoty Tron","Arany Trón","Altın Taht"},
SKIN_WIN_MISSION ={"Unlocked by winning %s times.","Desbloqueado ao vencer %s vezes","Débloqué en gagnant %s fois.","Разблокируется, выиграв %s раз.","Desbloqueado después de ganar %s veces","勝出 %s 場遊戲後解鎖。","Odblokuj go wygrywając %s razy","A feloldáshoz nyerj %s alkalommal.","%s kez kazanarak kilidi açıldı."},
SKIN_DIAMOND ={"Diamond Throne","Trono de Diamante","Trône en diamant","Алмазный Трон","Trono de Diamante","鑽石寶座","Diamentowy Tron","Gyémánt Trón","Elmas Tahtı"},
SKIN_RED ={"Red Armchair","Poltrona Vermelha","Fauteuil rouge","Красное Кресло","Sillón Rojo","紅色扶手椅子","Czerwony Fotel","Piros Fotel","Kırmızı Koltuk"},
SKIN_RED_MISSION ={"Unlocked by winning with a red card.","Desbloqueado ao vencer com uma carta vermelha","Débloqué en gagnant avec une carte rouge.","Разблокируется, выиграв с красной картой.","Desbloqueado por ganar con una carta roja","最後發出紅色卡牌而勝出後解鎖。","Odblokuj go wygrywając czerwoną kartą.","A feloldáshoz nyerj piros kártyával.","Kırmızı kart ile kazanarak kilidi açılır."},
SKIN_BLUE ={"Blue Armchair","Poltrona Azul","Fauteuil bleu","Синее Кресло","Sillón Azul","藍色扶手椅子","Niebieski Fotel","Kék Fotel","Mavi Koltuk"},
SKIN_BLUE_MISSION ={"Unlocked by winning with a blue card.","Desbloqueado ao vencer com uma carta azul","Débloqué en gagnant avec une carte bleue.","Разблокируется, выиграв с синей картой.","Desbloqueado por ganar con una carta azul","最後發出藍色卡牌而勝出後解鎖。","Odblokuj wygrywając niebieską kartą.","A feloldáshoz nyerj kék kártyával.","Mavi kart ile kazanarak kilidi açıldı."},
SKIN_YELLOW ={"Yellow Armchair","Poltrona Amarela","Fauteuil jaune","Жёлтое Кресло","Sillón Amarillo","黃色扶手椅子","Żółty Fotel","Sárga Fotel","Sarı Koltuk"},
SKIN_YELLOW_MISSION ={"Unlocked by winning with a yellow card.","Desbloqueado ao vencer com uma carta amarela","Débloqué en gagnant avec une carte jaune.","Разблокируется, выиграв с жёлтой картой.","Desbloqueado por ganar con una carta amarilla","最後發出黃色卡牌而勝出後解鎖。","Odblokuj go wygrywając żółtą kartą.","A feloldáshoz nyerj sárga kártyával.","Sarı kart ile kazanarak kilidi açılır."},
SKIN_GREEN ={"Green Armchair","Poltrona Verde","Fauteuil vert","Зелёное Кресло","Sillón Verde","綠色扶手椅子","Zielony Fotel","Zöld Fotel","Yeşil Koltuk"},
SKIN_GREEN_MISSION ={"Unlocked by winning with a green card.","Desbloqueado ao vencer com uma carta verde","Débloqué en gagnant avec une carte verte.","Разблокируется, выиграв с зелёной картой.","Desbloqueado por ganar con una carta verde","最後發出綠色卡牌而勝出後解鎖。","Odblokuj go wygrywając zieloną kartą.","A feloldáshoz nyerj zöld kártyával.","Yeşil kartla kazanarak kilidi açılır."},
SKIN_WHITE ={"White Armchair","Poltrona Branca","Fauteuil blanc","Белое Кресло","Sillón Blanco","白色扶手椅子","Biały Fotel","Fehér Fotel","Beyaz Koltuk"},
SKIN_WHITE_MISSION ={"Unlocked by winning with a wild card.","Desbloqueado ao vencer com um curinga","Débloqué en gagnant avec une carte noire.","Разблокируется, выиграв с чёрной картой.","Desbloqueado por ganar con una carta comodín","最後發出換色卡牌而勝出後解鎖。","Odblokuj go wygrywając kartą wild.","A feloldáshoz nyerj Színválasztó kártyával.","Renk kartı ile kazanarak kilidi açılır."},
SKIN_FIRE ={"Fire Throne","Trono do Fogo","Trône de feu","Огненный Трон","Trono de Fuego","烈焰寶座","Ognisty Tron","Tűz Trón","Yangın Tahtı"},
RED_MISSION ={"Unlocked by winning %s times with a red card.","Desbloqueado ao vencer %s vezes com uma carta vermelha","Débloqué en gagnant %s fois avec une carte rouge.","Разблокируется, выиграв %s раз с красной картой.","Desbloqueado por ganar %s veces con una carta roja","最後發出紅色卡牌而勝出 %s 次後解鎖。","Odblokuj go wygrywając %s razy czerwoną kartą","A feloldáshoz nyerj %s alkalommal piros kártyával.","Kırmızı kart ile %s kez kazanarak kilidi açılır."},
SKIN_WATER ={"Water Throne","Trono da Água","Trône d'eau","Водный Трон","Trono de Agua","水流寶座","Wodny Tron","Víz Trón","Su Tahtı"},
BLUE_MISSION ={"Unlocked by winning %s times with a blue card.","Desbloqueado ao vencer %s vezes com uma carta azul","Débloqué en gagnant %s fois avec une carte bleue.","Разблокируется, выиграв %s раз с синей картой.","Desbloqueado por ganar %s veces con una carta azul","最後發出藍色卡牌而勝出 %s 次後解鎖。","Odblokuj go wygrywając %s razy niebieską kartą","A feloldáshoz nyerj %s alkalommal kék kártyával.","Mavi kart ile %s kez kazanarak kilidi açıldı."},
SKIN_EARTH ={"Earth Throne","Trono da Terra","Trône de terre","Земной Трон","Trono de Tierra","土壤寶座","Ziemny Tron","Föld Trón","Dünya Tahtı"},
YELLOW_MISSION ={"Unlocked by winning %s times with a yellow card.","Desbloqueado ao vencer %s vezes com uma carta amarela","Débloqué en gagnant %s fois avec une carte jaune.","Разблокируется, выиграв %s раз с жёлтой картой.","Desbloqueado por ganar %s veces con una carta amarilla","最後發出黃色卡牌而勝出 %s 次後解鎖。","Odblokuj go wygrywając %s razy żółtą kartą","A feloldáshoz nyerj %s alkalommal sárga kártyával.","%s kez sarı kart ile kazanılır."},
SKIN_AIR ={"Air Throne","Trono do Ar","Trône d'air","Воздушный Трон","Trono de Aire","氣團寶座","Powietrzny Tron","Levegő Trón","Hava Tahtı"},
GREEN_MISSION ={"Unlocked by winning %s times with a green card.","Desbloqueado ao vencer %s vezes com uma carta verde","Débloqué en gagnant %s fois avec une carte verte.","Разблокируется, выиграв %s раз с зелёной картой.","Desbloqueado por ganar %s veces con una carta verde","最後發出綠色卡牌而勝出 %s 次後解鎖。","Odblokuj go wygrywając %s razy zieloną kartą","A feloldáshoz nyerj %s alkalommal zöld kártyával.","Yeşil kart ile %s kez kazanarak kilidi açılır."},
SKIN_RAINBOW ={"Rainbow Throne","Trono Arco-Íris","Trône arc-en-ciel","Радужный Трон","Trono Arcoiris","彩虹寶座","Tęczowy Tron","Szivárvány Trón","Gökkuşağı tahtı"},
WILD_MISSION ={"Unlocked by winning %s times with a wild card.","Desbloqueado ao vencer %s vezes com um curinga","Débloqué en gagnant %s fois avec une carte noire.","Разблокируется, выиграв %s раз с чёрной картой.","Desbloqueado por ganar %s veces con un comodín","最後發出換色卡牌而勝出 %s 次後解鎖。","Odblokuj go wygrywając %s razy kartą wild.","A feloldáshoz nyerj %s alkalommal színválasztó kártyával.","Bir Renk kartıyla %s kez kazanarak kilidi açılır."},
SKIN_KING ={"King Throne","Trono do Rei","Trône du roi","Королевский Трон","Trono Real","國王寶座","Królewski Tron","Király Trón","Kral Tahtı"},
SKIN_KING_MISSION ={"Unlocked by winning blocking a +2 or +4.","Desbloqueado ao vencer bloqueando um +2 ou +4","Débloqué en gagnant en bloquant un +2 ou un +4.","Разблокируется победой, блокируя +2 или +4.","Desbloqueado por ganar bloqueando una carta +2 o una +4","在上一個玩家發出 +2 或 +4 卡牌之後繼續發出 +2 或 +4 卡牌而獲勝後解鎖。","Odblokuj go wygrywając blokowanie +2 lub +4","A feloldáshoz nyerj azzal, hogy kivédesz egy +2-es vagy +4-es kártyát.","Kazanmaya yakın oyuncuyu +2 veya +4 ile engelleyerek açılır."},
SKIN_LUCK ={"Lucky Throne","Trono da Sorte","Trône de la chance","Удачливый Трон","Trono de la Suerte","幸運寶座","Szczęśliwy Tron","Szerencsés Trón","Şanslı taht"},
SKIN_LUCK_MISSION ={"Unlocked by winning without drawing any cards.","Desbloqueado ao vencer sem comprar cartas","Débloqué en gagnant sans tirer aucune carte.","Разблокируется победой без вытягивания карт.","Desbloqueado ganando sin sortear cartas.","不被罰抽任何卡牌而勝出後解鎖。","Odblokuj go wygrywając bez dobierania kart.","A feloldáshoz nyerj kártyahúzás nélkül.","Herhangi bir kart çekmeden kazanarak kilidi açılır."},
SKIN_ANGEL ={"Angelic Throne","Trono Angelical","Trône angélique","Ангельский Трон","Trono Angelical","天使寶座","Anielski Tron","Angyali Trón","Melek Taht"},
SKIN_ANGEL_MISSION ={"Unlocked by winning without the timer appearing during your turn.","Desbloqueado ao vencer sem deixar o cronômetro aparecer na sua vez","Débloqué en gagnant sans que le minuteur apparaisse pendant votre tour.","Разблокируется победой без таймера, появляющегося во время вашего хода.","Desbloqueado por ganar sin que el temporizador aparezca en tu turno","在你所有的發卡回合中, 別讓限時器彈出而得到勝利。","Odblokuj go wygrywając rundę bez pokazywania stopera wyznaczającego kolejkę.","A feloldáshoz nyerj anélkül, hogy az időmérő megjelenne.","Sıranız sırasında zamanlayıcı görünmeden kazanarak kilidi açılır."},
SKIN_JUNKY ={"Junk Throne","Trono de Sucata","Trône d'ordures","Хламный Трон","Trono de Basura","廢棄物寶座","Tron Rupieć","Kacat Trón","Önemsiz Taht"},
SKIN_JUNKY_MISSION ={"Unlocked by winning after accumulating 15+ cards in your hand.","Desbloqueado ao vencer depois de acumular 15 ou mais cartas na mão","Débloqué en gagnant après avoir accumulé plus de 15 cartes dans votre jeu.","Разблокируется победой после накопления 15+ карт в вашей руке.","Desbloqueado ganando después de haber acumulado +15 cartas en tu baraja.","手中的卡牌曾經在遊戲中多於 15 張而最後得到勝利後解鎖。","Odblokuj go kumulując 15 kart w twoich rękach.","A feloldáshoz nyerj úgy, hogy előtte 15 vagy több kártyát felhalmoztál a kezedben.","Elinizde 15+ kart biriktirdikten sonra kazanarak kilidi açılır."},
SKIN_SHAMAN ={"Shaman Throne","Trono do Shaman","Trône du chamane","Шаманский Трон","Trono del Chamán","薩滿寶座","Szamański Tron","Sámán Trón","Şaman Tahtı"},
SKIN_SHAMAN_MISSION ={"Unlocked by accumulating %s points in a room.","Desbloqueado ao acumular mais de %s pontos em uma sala","Débloqué en accumulant %s points dans un salon.","Разблокируется, накапливая %s очков в комнате.","Desbloqueado por acumular %s puntos en una sala","在房間累積達到 %s 分數後解鎖。","Odblokuj kumulując %s punktów w pokoju","A feloldáshoz gyűjts össze %s pontot egy szobában.","Bir odada %s puan toplayarak kilidi açılır."},
SKIN_BEACH ={"Beach Chair","Cadeira de Praia","Chaise de plage","Пляжное Кресло","Silla de Playa","沙灘椅子","Leżak","Strand Szék","Plaj sandalyesi"},
SKIN_WATCH_MISSION ={"Unlocked by watching %s games.","Desbloqueado ao assistir %s partidas","Débloqué en regardant %s parties.","Разблокируется после %s просмотренных игр.","Desbloqueado después de espectar %s partidas.","旁觀 %s 場遊戲後解鎖。","Odblokuj go obserwując %s gier","A feloldáshoz figyelj meg egy játékot %s alkalommal.","%s oyun izleyerek kilidi açılır."},
SKIN_CINE ={"Cinema Chair","Cadeira de Cinema","Cinema Chair","Кресло-Кино","Silla de Cine","影院椅子","Kinowy Fotel","Mozi Szék","Sinema Koltuğu"},
SKIN_HELL ={"Hell Throne","Trono Infernal","Trône de l'enfer","Адский Трон","Trono Infernal","地獄椅子","Piekielny Tron","Pokol Trón","Cehennem Tahtı"},
SKIN_HELL_MISSION ={"Unlocked by making someone draw 16 cards at once.","Desbloqueado ao fazer alguém comprar 16 cartas de uma vez","Débloqué en faisant tirer une personne 16 cartes d'un coup.","Разблокируется, заставляя кого-то взять 16 карт одновременно.","Desbloqueado por hacer sortear a algún jugador 16 cartas a la vez ","在一次發卡中令別人罰抽 16 張卡牌。","Aby go odblokować spraw by ktoś dobrał 16 kart za jednym razem","A feloldáshoz húzass valakivel 16 kártyát egyszerre.","Birine aynı anda 16 kart çekerek kilidi açılır."},
SKIN_CARDS ={"Cards Throne","Trono de Cartas","Trône de cartes","Карточный Трон","Trono de Cartas","卡牌寶座","Karciany Tron","Kártya Trón","Taht Oyunları"},
SKIN_CARDS_MISSION ={"Unlocked after drawing 16 cards at once.","Desbloqueado ao comprar 16 cartas de uma vez","Débloqué en tirant 16 cartes d'un coup.","Разблокируется после взятия 16 карт одновременно.","Desbloqueado sorteando 16 cartas a la vez","在一次罰抽中抽取 16 張卡牌。","Odblokuj go dobierając 16 kart za jednym razem","A feloldáshoz húzz fel egyszerre 16 kártyát.","Bir kerede 16 kart çekildikten sonra kilidi açılır."},
SKIN_CANDY ={"Candy Throne","Trono de Doces","Trône bonbon","Конфетный Трон","Trono Acaramelado","糖果寶座","Cukierkowy Tron","Cukorka Trón","Şeker Tahtı"},
SKIN_CANDY_MISSION ={"Unlocked by unlocking all house rules.","Desbloqueado ao liberar todas as regras da casa","Débloqué en débloquant toutes les règles de la maison.","Разблокируется разблокировкой всех домашних правил.","Desbloqueado por conseguir todas las reglas de la casa","解鎖所有自訂規矩後解鎖。","Aby go odblokować odblokuj wszystkie domowe zasady","A feloldáshoz oldd fel az összes házszabályt.","Tüm ev kurallarının kilidini açarak kilidi açılır."},
SKIN_FRAISE ={"Fraise Throne","Trono de Morango","Trône fraise","Клубничный Трон","Trono de Fresas","草莓寶座","Truskawkowy Tron","Eper Trón","Çilek Taht"},
SKIN_FRAISE_MISSION ={"Unlocked by winning with a fraise.","Desbloqueado ao vencer com um morango","Débloqué en jouant avec une fraise.","Разблокируется, выиграв с клубникой.","Desbloqueado por ganar con una fresa","和商店裡的草莓一起勝利後解鎖。","Odblokuj go wygrywając truskawką","A feloldáshoz nyerj eperrel.","Bir fraise kazanarak kilidi açıldı."},
SKIN_ILLUMINATI ={"Illuminati Throne","Trono Illuminati","Trône Illuminati","Трон-Иллюминати","Trono Illuminati","光照派寶座","Tron Illuminati","Illuminati Trón","İllumanati Tahtı"},
SKIN_ILLUMINATI_MISSION ={"Have all four +4 cards in your hand to unlock it.","Tenha os quatro +4 na mão para liberar","Débloqué en ayant toutes les cartes +4 de la partie dans votre jeu.","Держите в руке все четыре карты +4, чтобы разблокировать его.","Tener todas las cartas +4 en la baraja para desbloquearlo","手中集齊 4 張 +4 卡牌後解鎖。","Odblokuj go posiadając wyszstkie +4 w twojej ręce.","A feloldáshoz mind a négy +4-es kártya legyen a kezedben.","Kilidini açmak için dört +4 kartın hepsini elinizde bulundurun."},
SKIN_GIFT ={"Gift Throne","Trono de Presentes","Trône cadeau","Подарочный Трон","Trono de Regalos","禮物寶座","Prezentowy Tron","Ajándék Trón","Hediye Tahtı"},
SKIN_GIFT_MISSION ={"Unlocked by winning donating a card from your hand.","Desbloqueado ao vencer doando uma carta sua para alguém.","Débloqué en gagnant en donnant une carte de votre jeu.","Разблокируется, выиграв пожертвованием карты из вашей руки.","Desbloqueado por ganar donando una carta de la baraja.","把你的一張卡牌捐出而獲勝後解鎖。","Odblokuj go wygrywając darowaną kartą z twojej ręki.","A feloldáshoz nyerj azzal, hogy eladományozol egy kártyát a kezedből.","Elinden bir kart bağışlayarak kilidi açıldı."},
SKIN_BOG ={"Bog","Privada","","Сортир","Ciénaga","坐廁","Klozet","Mocsár","Bataklık"},
SKIN_BOG_MISSION ={"Unlocked by finishing a match without having the opportunity to play.","Desbloqueado ao terminar uma partida sem ter a oportunidade de jogar.","Débloqué en finissant un jeu sans avoir joué.","Разблокируется по окончании матча без возможности играть.","Unlocked by finishing a match without having the opportunity to play.","你沒有得到任何發卡牌的機會而完成一局遊戲後解鎖。","Odblokuj go kończąc rundę bez możliwości gry.","A feloldáshoz úgy kell egy játéknak befejeződnie, hogy nem volt lehetőséged játszani.","Oynama şansına sahip olmadan bir maçı bitirerek kilidi açılır."},
SKIN_IRON_THRONE ={"Iron Throne","Trono de Ferro","Trône de fer","Железный Трон","Trono de Hierro","鋼鐵寶座","Żelazny Tron","Vas Trón","Demir Taht"},
SKIN_IRON_THRONE_MISSION ={"Unlocked by successfuly challenging three +4 cards in a row.","Desbloqueado ao vencer 3 desafios de +4 consecutivos sem perder.","Débloqué en défiant avec succès trois cartes +4 d'afillée.","Разблокируется, успешно бросая вызов три +4 карты подряд.","Desbloqueado por ganar tres retos de +4 en una ronda, sin perder","成功連續質疑 +4 卡牌 3 次後解鎖。","Odblokuj wygrywając 3 razy wyzwanie +4 nie ponosząc przy tym straty.","A feloldáshoz hívj ki egymás után három +4-es kártyát sikeresen.","Arka arkaya üç +4 karta başarıyla itiraz ederek kilidi açılır."},
SKIN_HAMBURGUER ={"Throne of Gluttony","Trono da Gula","Trône de la gourmandise","Трон Обжорства","Trono de Glotón","貪吃者寶座","Tron Obżarstwa ","A Falánkság Trónja","Oburluk Tahtı"},
SKIN_TEAM_MISSION ={"Unlocked by winning %s Team Matches.","Desbloqueado ao vencer %s Jogos em Duplas.","Débloqué en gagnant %s Parties en Équipe.","Разблокируется после победы в %s командных матчах.","Desbloqueado por ganar %s rondas en equipo","在團隊模式獲得 %s 場勝利。","Odblokuj wygrywajac %s Rund Drużynowych.","A feloldáshoz nyerj %s Csapatmérkőzést.","%s Takım Maçı kazanarak kilidi açıldı."},
SKIN_SKULL ={"Skull Throne","Trono de Caveira","Trône crâne","Черепной Трон","Trono de Cráneos","骷髏寶座","Tron Czaszka","Koponya Trón","Kafatası Taht"},
SKIN_SKULL_MISSION ={"Unlocked by winning by elimination.","Desbloqueado ao vencer por eliminação.","Débloqué en jouant par elimination.","Разблокируется победой путём исключения.","Desbloqueado ganando por eliminación","在淘汰模式中得到勝利後解鎖。","Odblokuj wygrywajac przez eliminację.","A feloldáshoz nyerj azzal, hogy kiejtesz egy játékost a játékból.","Eleme ile kazanarak açılır."},
SKIN_SHOW ={"Party Throne","Trono Baladeiro","Trône de fête","Трон-Вечеринка","Trono de Fiesta","派對寶座","Imprezowy Tron","Parti Trón","Parti Tahtı"},
SKIN_SHOW_MISSION ={"Unlocked randomly by playing on private rooms.","Desbloqueado aleatoriamente ao jogar em salas privadas.","Débloqué aléatoirement en jouant dans des salons privés.","Разблокируется случайным образом, играя в частных комнатах.","Desbloqueado aleatoriamente jugando en salas privadas.","在私人房間進行遊戲後隨機解鎖。","Odblokowane losowo przez grę w pokojach prywatnych.","Véletlenszerűen feloldható privát szobákban játszva.","Özel odalarda oynayarak rastgele açılır."},
SKIN_TIME_MACHINE ={"Time Throne","Trono do Tempo","Trône du temps","Часовой Трон","Trono del Tiempo","時間寶座","Tron Czasu","Idő Trónja","Zaman Tahtı"},
SKIN_TIME_MACHINE_MISSION ={"Unlocked by winning by time expiration.","Desbloqueado ao vencer por tempo esgotado.","Déverrouillé en gagnant à l'expiration du temps.","Разблокируется победой, когда осталось 60 секунд до окончания матча.","Desbloqueado al ganar por tiempo acabado.","當一局的時限到了然後得到勝利後解鎖。","Odblokuj przez wygraną po upływie czasu.","A feloldáshoz nyerj az idő lejáratával.","Zaman aşımı ile kazanarak kilidi açılır."},
SKIN_CHESS ={"Ivory Throne","Trono de Marfim","Trône d'ivoire","Шахматный Трон","Trono de Marfil","象牙寶座","Tron z Kości Słoniowej","Elefántcsont Trón","Fildişi Taht"},
SKIN_CHESS_MISSION ={"Unlocked by killing %s pieces on Mad Chess rule.","Desbloqueado ao matar %s peças na regra Xadrez Maluco.","Débloqué en tuant %s pièces avec la règle Chequiers Fous.","Разблокируется убийством %s фигур по правилу «Безумные шахматы».","Desbloqueado por matar %s piezas en reglas de Queso Loco.","在瘋狂象棋規矩中殺死 %s 個棋子後解鎖。","Odblokuj zbijając %s figur szachowych w zasadzie Szalone Szachy.","A feloldáshoz üss le %s darabot az Őrült Sakk szabály alatt.","Çılgın Satranç kuralında %s taş öldürerek kilidi açıldı."},
SKIN_PENCIL ={"Pencil Throne","Trono de Lápis","Trône crayon","Карандашный Трон","Trono de Lápizes","鉛筆寶座","Kredkowy Tron","Ceruza Trón","Kalem Tahtı"},
SKIN_PENCIL_MISSION ={"Unlocked by playing a wild card over another %s times.","Desbloqueado ao jogar um curinga sobre outro %s vezes.","Débloqué en jouant une carte noire plus d'une %s fois.","Разблокируется, выиграв с чёрной картой +4 %s раз.","Desbloqueado al jugar una Carta Comodín otras %s veces más.","在換色卡牌上再發出換色卡牌 %s 次後解鎖。","Odblokuj grając Kartą Wild ponad %s razy.","A feloldáshoz játssz egy Színválasztó kártyát egy másikra %s alkalommal.","%s kez daha çılgın bir kart oynayarak kilidi açıldı."},
SKIN_SCHOOL ={"School Chair","Cadeira Escolar","Chaise d'école","Школьное Кресло","Silla de Colegio","學校的椅子","Szkolne Krzesło","Iskolai Szék","Okul Sandalyesi"},
SKIN_SCHOOL_MISSION ={"Unlocked by sitting on the same chair 3 times in a row.","Desbloqueado ao sentar 3 vezes consecutivas na mesma cadeira.","Débloqué en s'asseyant sur la même chaise 3 fois de suite.","Разблокируется, сидя на одном кресле 3 раза подряд.","Desbloqueada sentándose en la misma silla tres veces seguidas.","連續在 3 局遊戲中坐同一個位子後解鎖。","Odblokuj siedząc 3 razy z rzędu na tym samym miejscu.","A feloldáshoz ülj ugyanabban a székben egymás után 3 alkalommal.","Aynı sandalyede üst üste 3 kez oturarak kilidi açılır."},
SKIN_ANVIL ={"Anvil Throne","Trono de Bigornas","Trône enclume","Трон-Наковальня","Trono de Yunques","鐵鉆寶座","Tron Kowadło","Üllő Trón","Örs Tahtı"},
SKIN_GARDEN ={"Garden","Jardim","Jardin","Сад","Jardín","庭院","Ogród","Kert","Bahçe"},
SKIN_CAT ={"Cat's Pouf","Puff de Gato","Panier de chat","Кошачий Пуф","Puff del Gato","貓咪坐墊","Pufa-Kot","Cica Pofi","Kedi Pufu"},
SKIN_FALLS ={"Stream Throne","Trono da Correnteza","","Трон-Ручей","Trono de Corriente","溪流寶座","Tron-Strumień","Vízesés Trón","Akış Tahtı"},
SKIN_FALLS_MISSION ={"Unlocked by winning using the Treasure Card.","Desbloqueado ao vencer com a Carta do Tesouro.","Débloqué en gagnant en utilisant la Carte au Trésor.","Открывается победой с помощью Карты Сокровищ.","Desbloqueado al ganar usando la Carta del Tesoro","最後發出寶箱卡牌而獲得勝利後解鎖。","Odblokuj wygrywając przy użyciu Karty Skarbu.","A feloldáshoz nyerj a Kincskártya használatával.","Hazine Kartı ile kazanarak kilidi açıldı."},
SKIN_CHEESE ={"Cheese Throne","Trono de Queijo","Trône fromage","Сырный Трон","Trono de Queso","奶酪寶座","Serowy Tron","Sajt Trón","Peynir Tahtı"},
SKIN_UNICORN ={"Unicorn Pillow","Almofada de Unicórnio","Coussin licorne","Единорог-Подушка","Almohada de Unicornio","獨角獸枕頭","Poduszka Jednorożca ","Egyszarvú Párna","Unicorn Yastık"},
SKIN_PSYCHO ={"Psychedelic Armchair","Poltrona Psicodélica","Fauteuil psychédélique","Психоделическое Кресло","Sillón Psicodélico","迷幻扶手椅子","Fotel Psychodeliczny","Pszichedelikus Fotels","Sayko Deli Koltuk"},
SKIN_PSYCHO_MISSION ={"Unlocked by winning with the Mess rule.","Desbloqueado ao vencer com a regra Bagunça.","Débloqué en jouant avec la règle Bazar.","Разблокируется победой с правилом Беспорядка.","Desbloqueado por ganar con la regla de Desorden","在大混亂規矩中勝出後解鎖。","Odblokuj wygrywając z zasadą Bałaganu.","A feloldáshoz nyerj egy játékot a Zűrzavar szabállyal.","Karmakarışık kuralı ile kazanarak kilidi açıldı."},
SKIN_TV ={"Television","Televisão","Télévision","Телевизор","Televisión","電視","Telewizja","Televízió","Televizyon"},
SKIN_RADIO ={"Radio","Rádio","","Радио","Radiofonía","收音機","","Rádió","Radyo"},
SKIN_NEWSPAPER ={"Newspaper Armchair","Poltrona de Jornal","Fauteuil en journaux","Газетное Кресло","Sillón de Periódicos","報章扶手椅子","Fotel-Gazeta","Újságpapír Fotel","Gazete Koltuğu"},
SKIN_CHAMPION ={"Champion's Throne","Trono do Campeão","Trône du champion","Чемпионский Трон","Trono de Campeón","冠軍寶座","Tron Czempiona","A Bajnok Trónja","Şampiyon Tahtı"},
SKIN_CHAMPION_MISSION ={"Unlocked when placing high in authorized tournaments.","Desbloqueado ao alcançar posições altas em torneios autorizados.","","Разблокируется при высоких местах в авторизованных турнирах.","Se desbloquea al quedar en algún puesto alto dentro de torneos autorizados.","在授權的聯賽中得到較前的排名後解鎖。","Odblokuj przez wysokie umieszczenie w autoryzowanych turniejach. ","A feloldáshoz érj el magas helyezést a rendszeresen megszervezett versenyeken.","Yetkili turnuvalara yüksek yerleştirilirken kilidi açılır."},
SKIN_POTATO ={"Potato Throne","Trono de Batatas","Trône patate","Картофельный Трон","Trono de Papas","土豆寶座","Tron Ziemniak","Burgonya Trón","Patates Tahtı"},
SKIN_POTATO_MISSION ={"Unlocked by winning with the Potato Card.","Desbloqueado ao vencer usando a Carta da Batata.","Débloqué en gagnant avec la carte Patate.","Открывается победой с Картофельной Картой.","Desbloqueado al ganar con la Carta de Papa","最後發出土豆卡牌而勝利後解鎖。","Odblokuj wygrywając Kartą Ziemniaka.","A feloldáshoz nyerj a Burgonya Kártyával.","Patates Kartı ile kazanarak kilidi açıldı."},
SKIN_WONDERLAND ={"Throne of Wonders","Trono das Maravilhas","Trône des merveilles","Трон Чудес","Trono Maravilla","異想天開寶座","Tron Cudów","Csodák Trónja","Taht Harikası"},
SKIN_WONDERLAND_MISSION ={"Unlocked by winning once on each side of the Portal.","Desbloqueado ao vencer dos dois lados do Portal.","Débloqué en gagnant au moins une fois de chaque côté du Portail.","Разблокируется, выиграв один раз на каждой стороне Портала.","Desbloqueado ganando en ambos lados del Portal.","在傳送門的兩組卡牌中各勝一次。.","Odblokuj wygrywając po dwóch stronach Portalu.","A feloldáshoz nyerj a Portál mindegyik oldalán.","Portalın her iki tarafında bir kez kazanarak kilidi açılır."},
SKIN_UNDERTALE ={"Asgore's Throne","Trono de Asgore","Trone d'Asgore","Трон Асгора","Trono de Asgore","Asgore 的寶座","Tron Asgora","Asgore Trónja","Asgore'un Tahtı"},
SKIN_DAY_MISSION ={"Unlocked by playing daily for %s days.","Desbloqueado ao jogar diariamente por %s dias.","Débloqué en jouant quotidiennement pendant %s jours.","Разблокируется, играя ежедневно в течение %s дней.","Desbloqueado por jugar diariamente durante %s días.","連續 %s 天每天玩 UNO 後解鎖。","Odblokuj, grając codziennie przez %s dni.","A feloldáshoz játssz %s napig minden nap.","%s gün boyunca günlük olarak oynayarak kilidi açılır."},
SKIN_RIP ={"Tombstone","Lápide","Pierre tombale","Могила","Lápida","墓碑","Nagrobek","Sírkő","Mezar taşı"},
SKIN_RIP_MISSION ={"Unlocked by challenging a player who did not say UNO.","Desbloqueado ao desafiar um jogador que não disse UNO.","Débloqué en défiant un joueur qui n'a pas dit UNO.","Разблокируется, бросив вызов игроку, который не сказал УНО.","Desbloqueada al retar a un jugador que no dijo UNO.","成功質疑一個沒說 Uno! 的玩家後解鎖。","Odblokuj wyzywając gracza, który nie powiedział UNO.","A feloldáshoz hívj ki egy olyan játékost, aki nem mondott UNO-t.","UNO demeyen bir oyuncuya itiraz ederek kilidi açılır."},
SKIN_APPLE ={"Apple Throne","Trono de Maçã","Trône pomme","Яблочный Трон","Trono de Manzanas","蘋果寶座","Jabłkowy Tron","Alma Trón","Elma Tahtı"},
SKIN_APPLE_MISSION ={"Unlocked when you get eliminated by your own Thunder Card.","Desbloqueado ao ser eliminado atingido pelo próprio raio.","Débloqué lorsque éliminé par votre propre Carte Tonnerre.","Разблокируется, когда вы уничтожены своей собственной Картой Грома.","Desbloqueado cuando eres eliminado por tu propia Carta Relámpago.","當你使用了雷電暴擊卡牌而你被淘汰出局後解鎖。","Odblokuj, kiedy zostaniesz wyeliminowany przez własną Kartę Grzmotu.","A feloldáshoz ejtsd ki magad a játékból a saját Mennydörgés Kártyáddal.","Kendi Yıldırım Kartınız tarafından elendiğinizde kilidi açılır."},
SKIN_HEART ={"Throne of Love","Trono do Amor","Trône d'amour","Трон Любви","Trono del Amor","愛心寶座","Tron Miłości","A Szerelem Trónja","Taht-ı Aşk"},
SKIN_HEART_MISSION ={"Unlocked by donating 5 or more cards at once.","Desbloqueado ao doar 5 ou mais cartas de uma só vez.","Débloqué en donnant 5 ou plus, de cartes d'un coup.","Разблокируется, пожертвовав 5 или более карт одновременно.","Desbloqueado por donar cinco o más cartas seguidas.","在一個回合裡捐出 5 張卡牌或以上後解鎖。","Odblokuj przekazując 5 lub więcej kart naraz.","A feloldáshoz adományozz egyszerre 5 vagy több kártyát.","Aynı anda 5 veya daha fazla kart bağışlayarak açılır."},
SKIN_ELEMENTAL ={"Elemental Throne","Trono dos Elementos","Trone élémentaire","Стихийный Трон","Trono Elemental","元素寶座","Tron Żywiołowy ","Elemi Trón","Elemental Taht"},
SKIN_ELEMENTAL_DESC_MISSION ={"Unlocked by playing all four zeros (one of each color) in the same game.","Desbloqueado ao jogar os quatro zeros (um de cada cor) na mesma partida.","Débloqué en jouant tous les zeros (de chaque couleur) dans la même partie.","Разблокируется, играя со всеми 0 (по одному каждого цвета) в одной игре.","Desbloqueado jugando todas las cuatro cartas 0 de cada color en la misma partida.","在同一局遊戲中發出 4 張 0 號卡牌(每顏色各一張)後解鎖。","Odblokuj, grając wszystkimi czterema zerami (jednym z każdego koloru) w tej samej grze.","A feloldáshoz játsszd ki mind a négy nullás kártyát (mindegyik színből egy) ugyanabban a játékban.","Aynı oyunda dört sıfırın (her renkten biri) tamamı oynanarak açılır."},
SKIN_TRASH ={"Trash Throne","Trono de Lixeira","Trone en détritus","Мусорный Трон","Trono de Desechos","垃圾桶寶座","Tron Śmieci","Kuka Trón","Çöp Kutusu Tahtı"},
SKIN_TRASH_MISSION ={"Unlocked by having more than 25 cards in your hand, without intentional draws.","Desbloqueado ao ter mais de 25 cartas na mão, sem compras intencionais.","Débloqué en ayant plus de 25 cartes dans votre jeu, sans tirages intentionnels.","Разблокируется, имея в руке более 25 карт, без преднамеренных розыгрышей.","Desbloqueado al tener más de 25 cartas en baraja, sin sortearlas intencionalmente.","在沒有自願罰抽的卡牌前提下, 手中持有多於 25 張卡牌後解鎖。","Odblokuj mając więcej niż 25 kart, bez celowych losowań.","A feloldáshoz tarts több mint 25 kártyát a kezedben, szándékos felhúzás nélkül.","Kasıtlı kart çekmeden elinizde 25'ten fazla kart olmasıyla açılır."},
SKIN_BREAKFAST ={"Breakfast","Café da Manhã","Petit-déjeuner","Завтрак","Desayuno","早餐","Śniadanie","Reggeli","Kahvaltı"},
SKIN_COMPUTER ={"Computer","Computador","Ordinateur","Компьютер","Computadora","電腦","Komputer","Számítógép","Bilgisayar"},
SKIN_BONES ={"Bone Throne","Trono de Ossos","Trône d'os","Костяной Трон","Trono de Huesos","骨頭寶座","Tron z Kości","Csont Trón","Kemik Taht"},
SKIN_BONES_MISSION ={"Unlocked by surviving Limbo rule until the limit is 4 cards.","Desbloqueado ao sobreviver ao Limbo até que o limite seja 4 cartas.","Débloqué en survivant à la règle Limbo jusqu'à ce que la limite soit de 4 cartes.","Разблокируется выживающим правилом Limbo до тех пор, пока лимит не составит 4 карты.","Desbloqueado al sobrevivir la regla del Limbo hasta que el límite sea de 4 cartas.","在林波舞規矩中生存直到持有的卡牌上限是 4 張。","Odblokuj przez przetrwanie z zasadą Otchłań dopóki limit nie wyniesie 4 kart. ","A feloldáshoz éld túl a Limbo szabályt addig, amíg 4 kártya lesz a határ.","Limit 4 kart olana kadar Limbo kuralından sağ çıkılarak açılır."},
SKIN_CHOCOLATE ={"Chocolate Throne","Trono de Chocolate","Trône chocolat","Шоколадный Трон","Trono de Chocolate","巧克力寶座","Czekoladowy Tron","Csokoládé Trón","Çikolata Taht"},
SKIN_CHOCOLATE_MISSION ={"Unlocked by winning in less than 1 minute.","Desbloqueado ao vencer em menos de 1 minuto.","Débloqué en gagnant en moins d'une minute.","Разблокируется, выиграв менее чем за 1 минуту.","Desbloqueado al ganar en menos de un minuto.","在 1 分鐘內勝出遊戲後解鎖。","Odblokuj wygrywając w mniej niż minutę.","A feloldáshoz nyerj kevesebb, mint 1 perc alatt.","1 dakikadan kısa sürede kazanarak açılır."},
SKIN_MARINE ={"Sea Armchair","Poltrona Marinha","Fauteuil des mers","Морское кресло","Sillón de Mar","海洋扶手椅子","Morski Fotel","Tengeri Fotel","Denizden Koltuk"},
SKIN_MARINE_MISSION ={"Unlocked when Elise wins as your teammate.","Desbloqueado quando Elise vence como sua dupla.","Débloqué lorsque Elise gagne en tant que coéquipière.","Разблокируется, когда Elise выигрывает как твой партнёр в команде.","Desbloqueado cuando Elise gana como tu compañera.","當 Elise是你的搭檔時勝出遊戲後解鎖。","Odblokuj gdy Elise wygra w twojej drużynie.","A feloldáshoz Elise kell hogy nyerjen csapattársadként.","Elise takım arkadaşınken kazandığında açılır."},
SKIN_ROCKET ={"Rocket Throne","Trono de Foguete","Trône fusée","Ракетный Трон","Trono Cohete","火箭寶座","Tron Rakieta","Rakéta Trón","Roket Tahtı"},
SKIN_BOOTCAMP ={"Camouflage Armchair","Poltrona Camuflada","Trône camouflage","Камуфляжное Кресло","Sillón de Camuflage","迷彩偽裝扶手椅","Tron Kamuflażu","Álca Fotel","Kamuflaj Koltuk"},
SKIN_BOOTCAMP_MISSION ={"Unlocked by winning a game without saying UNO.","Desbloqueado ao vencer uma partida sem dizer UNO.","Débloqué en gagnant un jeu sans dire UNO.","Разблокируется, выиграв игру, не сказав УНО.","Desbloqueado al ganar una partida sin decir UNO.","不喊 UNO 而勝出一場遊戲。","Odblokuj wygrywając bez wypowiedzenia UNO.","A feloldáshoz nyerj anélkül, hogy kimondod az UNO-t.","UNO demeden bir oyun kazanarak açılır."},
SKIN_FOOTBALL ={"Football Throne","Trono do Futebol","Trône Football","Футбольный Трон","Trono de Fútbol","足球寶座","Tron Piłkarski","Foci Trón","Futbol Tahtı"},
SKIN_FOOTBALL_MISSION ={"Unlocked by blocking +2 or +4 %s times.","Desbloqueado ao bloquear +2 ou +4 %s vezes.","Débloqué en bloquant un +2 ou un +4 %s fois.","Разблокируется блокировкой +2 или +4 %s раз.","Desbloqueado por bloquear cartas de +2 o +4 %s veces.","在上一個玩家發出 +2 或 +4 卡牌之後繼續發出 +2 或 +4 卡牌, 達成 %s 次後解鎖。","Odblokuj blokując +2 lub +4 %s razy.","A feloldáshoz védd ki a +2-t vagy a +4-et %s alkalommal.","%s kez +2 veya +4 ile engellenerek kilidi açıldı."},
SKIN_LOOT ={"Pot of Gold","Pote de Ouro","Chaudron d'or","Горшочек с золотом","Tarro de Oro","一壺金","Garniec Złota","Fazék Arany","Altın Pot"},
SKIN_LOOT_MISSION ={"Unlocked when every card in your starting hand has the same color.","Desbloqueado ao iniciar uma partida com todas as cartas da mesma cor.","Débloqué lorsque toutes les cartes de votre jeu sont de la même couleur.","Разблокируется, когда каждая карта в вашей стартовой руке имеет одинаковый цвет.","Desbloqueado cuando cada carta en tu baraja inicial tenga el mismo color.","你起初手中的卡牌都是同一個顏色的時候解鎖。","Odblokuj kiedy każda karta na początku gry ma taki sam kolor.","A feloldáshoz legyen a kezdéskor az összes kártya a kezedben azonos színű.","Başlangıçda ​​elinizdeki her kart aynı renge sahip olduğunda açılır."},
SKIN_ASTRAL ={"Astral Throne","Trono Astral","Trône astral","Астральный Трон","Trono Astral","星體寶座","Tron Astralny","Csillagászati Trón","Astral Taht"},
SKIN_ASTRAL_MISSION ={"Unlocked when you and every other player have 1 card in hand (minimum 6 players).","Desbloqueado quando você e os outros jogadores têm 1 carta (mínimo 6 jogadores).","Débloqué lorsque vous et tous les autres jours ont une seule carte en main (6 joueurs minimum).","Разблокируется, когда у вас и у каждого другого игрока есть 1 карта в руке (минимум 6 игроков).","Desbloqueado cuando tú y todos los demás jugadores tienen una carta (mínimo 6 jugadores).","當你和其他玩家手中都只剩一張卡牌的時候解鎖 (最少需要 6 個玩家)。","Odblokuj kiedy ty i wszyscy pozostali gracze mają 1 kartę w ręce (minimum 6 graczy).","A feloldáshoz neked és minden más játékosnak 1 kártya kell hogy legyen a kezetekben. (minimum 6 játékos)","Siz ve diğer her oyuncunun elinde 1 kart olduğunda açılır (en az 6 oyuncu)."},
SKIN_RANDOM ={"Mysterious Throne","Trono Misterioso","Trône mystérieux","Таинственный Трон","Trono Aleatorio","神秘寶座","Tajemniczy Tron","Titokzatos Trón","Gizemli Taht"},
SKIN_RANDOM_DESC ={"This turns into a random chair (that you already own).","Isto se transforma em uma cadeira aleatória (das que você tiver).","Il se transforme en une chaise aléatoire (que vous possédez déjà).","Это превращается в случайное кресло (которое у вас уже есть).","Selecciona una silla aleatoria de las que estén disponibles.","這會隨機變成任何一張椅子 (只限你擁有的)。","To zmienia w dowolne krzesło (które już posiadasz).","Ez egy véletlenszerű székké válik. (amit már birtokolsz)","Bu, rastgele bir sandalyeye dönüşür (zaten sahip olduğunuz)."},
SKIN_FASHION ={"Chic Armchair","Poltrona Chique","Fauteuil chic","Шикарное кресло","Sillón Elegante","時尚扶手椅","Szykowny Tron","Elegáns Fotel","Şık Koltuk"},
SKIN_FRIEND ={"Friend Armchair","Poltrona Amiga","Fauteuil ami","Дружеское кресло","Sillón Amigo","朋友扶手椅","Przyjacielski Fotel","Barátságos Fotel","Arkadaş Koltuk"},
SKIN_CHEST ={"Treasure Chest","Baú do Tesouro","Coffre au Trésor","Сундук с сокровищами","Cofre del Tesoro","藏寶箱","Skrzynia Skarbów","Kincsesláda","Hazine Sandığı"},
SKIN_CHEST_MISSION ={"Unlocked by stealing the Treasure Card.","Desbloqueado ao roubar a Carta do Tesouro.","Débloqué en volant la Carte au Trésor.","Открывается при краже Карты Сокровищ.","Desbloqueado al robar la Carta del Tesoro.","偷取寶物卡牌後解鎖。","Odblokuj kradnąc Karte Skarów.","A feloldáshoz lopd el a Kincskártyát.","Hazine Kartını çalarak açılır."},
SKIN_TOTORO ={"Totoro","","","Тоторо","","龍貓","","",""},
SKIN_TOTORO_MISSION ={"Unlocked by wearing an outfit similar to it (there are 2 items).","Desbloqueado ao vestir um visual parecido com ele (são 2 itens).","Débloqué en portant une tenue lui étant similaire (il y a 2 objets).","Разблокируется ношением одежды, похожей на него (есть 2 предмета).","Desbloqueado al poseer una vestimenta similar a el (son 2 objetos).","穿著跟它一樣的 (兩個) 裝扮就會解鎖。","Odblokuj zakładając podobne ubranie do tego (są 2 przedmioty).","A feloldáshoz viselj ehhez hasonló ruhát. (2 elem van)","Buna benzer bir kıyafet giyilerek açılır (2 öğe vardır)."},
SKIN_COFFEE ={"Cup of Coffee","Xícara de Café","Tasse de Café","Чашка кофе","Copa de café","咖啡一杯","Kubek Kawy","Egy Csésze Kávé","Bir fincan kahve"},
SKIN_COFFEE_MISSION ={"Unlocked by staying in a room for more than 4 hours.","Desbloqueado ao ficar em uma sala por mais de 4 horas.","Débloqué en restant dans un salon pendant plus de 4 heures.","Разблокируется пребыванием в комнате более 4 часов.","Desbloqueada por estar más de cuatro horas en una sala.","在同一個房間待上 4 個小時或以上之後解鎖。","Odblokuj pozostając w pokoju przez więcej niż 4 godziny.","A feloldáshoz tartózkodj több mint 4 órán keresztül egy szobában.","Bir odada 4 saatten fazla kalınarak açılır."},
SKIN_PUMPKIN ={"Pumpkin Throne","Trono de Abóbora","Trône citrouille","Тыквенный Трон","Trono de Calabaza","南瓜寶座","Dyniowy Tron","Sütőtök Trón","Balkabağı Tahtı"},
SKIN_PUMPKIN_MISSION ={"Unlocked by playing a +4 on a player stuck by a Web Card.","Desbloqueado ao jogar um +4 em um jogador preso pela Carta da Teia.","Débloqué en jouant un +4 sur un joueur coincé par une Carte Toile d'Araignée.","Разблокируется, кинув +4 игроку, застрявшем на Паучьей Карте.","Desbloqueado por jugar una carta +4 sobre un jugador afectado por una Carta Telaraña.","向一個被蜘蛛網卡牌限制了的玩家發出 +4 卡牌。","Odblokuj grając karte +4 na gracza zablokowanego Kartą Sieciową.","A feloldáshoz játssz egy +4-es kártyát egy olyan játékos előtt, aki a Háló Kártya hatása alatt van","Web Kartı takılı bir oyuncuya +4 oynayarak açılır."},
SKIN_CIRCUS ={"Circus Throne","Trono do Circo","Trône de cirque","Цирковой Трон","Trono de Circo","馬戲團寶座","Cyrkowy Tron","Cirkusz Trón","Sirk Tahtı"},
SKIN_CIRCUS_MISSION ={"Unlocked by playing a +2 or +4 and ending up drawing the cards yourself.","Desbloqueado ao jogar +2 ou +4 e você mesmo acabar comprando cartas.","Débloqué en jouant un +2 ou un +4 et en finissant par tirer les cartes vous-même.","Разблокируется, играя +2 или +4 и заканчивая розыгрышем карт самостоятельно.","Desbloqueado al jugar una carta +2 o +4 pero que terminen sortéandose a si mismo.","發出 +2 或 +4 卡牌可是最終自己被罰抽後解鎖。","Odblokuj grając +2 lub +4 i kończąc na dobraniu własnych kart.","A feloldáshoz játssz egy +2-es vagy +4-es kártyát, és végül húzd utána te a kártyákat."," kartları kendiniz çekerken +2 veya +4 oynayarak açılır."},
SKIN_POPCORN ={"Popcorn Throne","Trono de Pipoca","Trône popcorn","Трон-Попкорн","Trono de Popcorn","爆米花寶座","Popcornowy Tron","Kávészünet?","Patlamış Mısır Tahtı"},
SKIN_POPCORN_MISSION ={"Unlocked by winning by using the Jump-in rule.","Desbloqueado ao vencer cortando.","Débloqué en gagnant en utilisant la règle Jump-in.","Разблокируется победой с помощью правила Jump-in.","Desbloqueado al ganar usando la regla de Saltar-en.","在跳入模式中最後插隊發牌而勝利後解鎖。","Odblokuj wgrywając przy użyciu zasady Wskocz.","A feloldáshoz nyerj a Beugrás szabály felhasználásával.","Atlama kuralını kullanarak kazanarak açılır."},
SKIN_GOTHIC ={"Gothic Throne","Trono Gótico","Trône gothique","Готический Трон","Trono Gótico","歌德風格寶座","Gotycki Tron","Gótikus Trón","Gotik Taht"},
SKIN_GOTHIC_MISSION ={"Unlocked when someone colors your cards black by using the Ink Card.","Desbloqueado quando alguém pinta suas cartas de preto usando a Carta da Tinta.","Débloqué lorsque qu'un joueur colore vos cartes en noir en utilisant une Carte Encre.","Разблокируется, когда кто-то окрашивает ваши карты в чёрный цвет с помощью Чернильной Карты.","Desbloqueado cuando alguien colorea de negro tus cartas usando la Carta de Tinta.","其他玩家用墨汁卡牌把你的卡牌染成黑色後解鎖。","Odblokuj, kiedy ktoś pomaluje twoje karty na czarno używając Karty Atramentu.","A feloldáshoz színezze valaki a Tinta Kártyával feketére a kártyáid.","Birisi Mürekkep Kartını kullanarak kartlarınızı siyaha boyadığında kilidi açılır."},
SKIN_UFO ={"UFO","OVNI","OVNI","НЛО","OVNI","","","","Bir Cİsim Yaklaşıyor Efendim"},
SKIN_UFO_MISSION ={"Unlocked by winning due to a card being banished.","Desbloqueado ao vencer devido a uma carta ter sido banida.","Déverrouillé en gagnant grâce au bannissement d'une carte.","Разблокируется победой благодаря изгнанию карты.","Desbloqueado al ganar debido a que una carta fuese sancionada.","在卡牌被撤走然後勝出的情況下解鎖。","Odblokuj poprzez wygraną, niszcząc swoją ostatnią kartę.","A feloldáshoz nyerj úgy, hogy száműzöl egy kártyát.","Bir kartın yasaklanması nedeniyle kazanarak açılır."},
SKIN_PINEAPPLE ={"Pineapple Throne","Trono de Abacaxi","Trône ananas","Ананасный Трон","Trono de Piña","鳳梨寶座","Ananasowy Tron","Ananász Trón","Ananas Tahtı"},
SKIN_PINEAPPLE_MISSION ={"Unlocked by winning while your mouse is confused.","Desbloqueado ao vencer enquanto seu rato está confuso.","Débloqué en gagnant alors que votre souris est confuse.","Разблокируется победой, пока ваша мышь в замешательстве.","Desbloqueado al ganar mientras tu ratón está confundido.","當你的老鼠被迷惑然後勝出後解鎖。","Odblokuj wygrywając, kiedy twoja myszka jest zdezorientowana.","A feloldáshoz nyerj úgy, hogy zavarodott az egered.","Farenizin kafası karıştığında kazanarak açılır."},
SKIN_GUITAR ={"Music Throne","Trono da Sonzeira","Trône musical","Музыкальный Трон","Trono de Música","音樂寶座","Tron Muzyczny","Zene Trón","Müzik Tahtı"},
SKIN_GUITAR_MISSION ={"Unlocked when someone uses the Dancing Chairs Card and you remain in the same seat.","Desbloqueado quando alguém usa a Carta da Dança e você se mantém no mesmo lugar.","Débloqué lorsque quelqu'un utilise la Carte Chaises Musicales et vous restez tout le temps assis à la même place.","Разблокируется, когда кто-то использует карту «Танцующие стулья», и вы остаетесь на том же месте.","Desbloqueado cuando alguien usa la Carta de Sillas Danzantes y te quedas en el mismo lugar.","有人使用舞動椅子卡牌可是你最後繼續坐在同一個位置後解鎖。","Odblokuj kiedy ktoś użyje Karty Tańczące Fotele, a ty pozostaniesz w tym samym miejscu.","A feloldáshoz maradjon a széked ugyanazon a helyen miután valaki a Táncoló Székek Kártyát használja.","Birisi Dans Sandalyeleri Kartını kullandığında ve aynı koltukta kaldığınızda açılır."},
SKIN_MERMAID ={"Mermaid's Throne","Trono da Sereia","Trône sirène","Трон Русалки","Trono de Sirena","人魚寶座","Tron Syreny","Sellő Trónja","Deniz Kızı Tahtı"},
SKIN_MERMAID_MISSION ={"Unlocked by winning with your name colored green.","Desbloqueado ao vencer com seu nome pintado de verde.","Débloqué en gagnant avec votre nom coloré en vert.","Разблокируется, выиграв с зелёным цветом вашего имени.","Desbloqueado a la victoria con el nombre coloreado en verde.","在你名字是綠色的時候勝出後解鎖。","Odblokuj wygrywając z twoją nazwą w kolorze zielonym.","A feloldáshoz nyerj úgy, hogy zöld a neved.","Yeşil renkli isminizle kazanarak açılır."},
SKIN_GAGA ={"Lady's Throne","Trono da Lady","Trône de la dame","Трон Леди","Trono de Dama","手指寶座","Tron Damy","Hölgy Trónja","Diva Tahtı"},
SKIN_GAGA_MISSION ={"Unlocked by stealing two +4 in the same game using the Robbery Card.","Desbloqueado ao roubar dois +4 na mesma partida usando a Carta do Roubo.","Débloqué en volant deux +4 dans la même partie en utilisant la Carte Vol.","Разблокируется путём кражи двух +4 в одной игре с использованием Карты Ограбления.","Desbloqueado robando dos cartas +4 en la misma partida usando la Carta de Robo","在同一場遊戲裡使用怪盜卡牌偷取兩張 +4 卡牌後解鎖。","Odblokuj kradnąc 2 karty +4 w tej samej grze, używając Karty Rabunku.","A feloldáshoz lopj el a Rablás Kártya segítségével egy játék alatt kétszer +4-es kártyát.","Soygun Kartı ile aynı oyunda iki +4 çalarak açılır."},
SKIN_CUPHEAD ={"Cuphead","","","Чашкоголовый","Diván","茶杯頭","Fotel Kubek","",""},
SKIN_CUPHEAD_MISSION ={"Unlocked by having 1 card left on both sides of the Portal.","Desbloqueado ao ficar com 1 carta dos dois lados do Portal.","Débloqué en ayant 1 carte restante, des deux côtés du Portail.","Разблокируется, если по обе стороны Портала оставить одну карту.","Desbloqueado al tener una carta restante en ambos lados del Portal.","在傳送門兩組卡牌中都各剩下一張卡牌後解鎖。","Odblokuj przez pozostawienie jednej karty po dwóch stronach Portalu.","A feloldáshoz maradjon a Portál mindkét oldalán egy-egy kártya a kezedben.","Portalın her iki tarafında 1 kart bırakılarak açılır."},
SKIN_MECATOPUS ={"Mecatopus","","","","Meccatopus","金屬八爪魚","","",""},
SKIN_MECATOPUS_MISSION ={"Unlocked by discarding 5 or more cards using the Magnet Card.","Desbloqueado ao descartar 5 ou mais cartas usando a Carta do Imã.","Débloqué en défaussant 5 cartes ou plus à l'aide de la Carte Magnétique.","Разблокируется сбросом 5 или более карт с помощью Магнитной Карты.","Desbloqueado al descartar cinco o más cartas usando la Carta Magnética.","使用磁力卡牌丟棄 5 張或以上的卡牌後解鎖。","Odblokuj przez odrzucenie 5 lub więcej kart przy użyciu Karty Magnetycznej.","A feloldáshoz dobj el a Mágnes Kártyával 5 vagy több kártyát.","Mıknatıs Kartı kullanılarak 5 veya daha fazla kart atılarak kilidi açıldı."},
SKIN_VANGOGH ={"Van Gogh","","","Ван Гог","","梵高","","",""},
SKIN_VANGOGH_MISSION ={"Unlocked when all players are using the same throne (minimun 8 players).","Desbloqueado quando todos os jogadores estão usando o mesmo trono (mínimo 8 jogadores).","Débloqué lorsque tous les joueurs utilisent le même trône.","Разблокируется, когда все игроки используют один и тот же трон (минимум 8 игроков).","Desbloqueado cuando todos los jugadores usan el mismo trono (mínimo 8 jugadores).","當所有玩家都在用同一張椅子的時候解鎖。 (需要最少8人)","Odblokuj, gdy wszyscy gracze używają tego samego tronu (minimun 8 graczy).","A feloldáshoz használja minden játékos ugyanazt a trónt (legalább 8 játékos).","Tüm oyuncular aynı tahtı kullandığında açılır (minimum 8 oyuncu)."},
SKIN_SPACE ={"Space Throne","Trono Espacial","Trône spatial","Космический Трон","Trono Espacial","太空寶座","Kosmiczny Tron","Űr Trón","Uzay Tahtı"},
SKIN_SPACE_MISSION ={"Unlocked by playing 4 or more cards in the same turn.","Desbloqueado ao jogar 4 cartas ou mais no mesmo turno.","Débloqué en jouant 4 cartes ou plus en un tour.","Разблокируется, выбросив 4 или более карт в одном ходу.","Desbloqueado al jugar cuatro o más cartas en el mismo turno.","在同一個回合裡發出 4 張或以上的卡牌後解鎖。","Odblokuj grając 4 lub większą ilością kart w tej samej turze.","A feloldáshoz játssz 4 vagy több kártyát egy kör alatt.","Aynı sırayla 4 veya daha fazla kart oynayarak açılır."},
SKIN_QUARTZ ={"Rose Quartz","","Quartz rose","Розовый Кварц","Rose Cuarzo","玫瑰石英","Różowy Kwarc","Rózsakvarc","Gül kuvartzı"},
SKIN_QUARTZ_MISSION ={"Unlocked by playing %s action cards.","Desbloqueado ao jogar %s cartas de ação.","Débloqué en jouant %s cartes action.","Разблокируется, играя %s раз с картами действий.","Desbloqueado por jugar %s cartas de acción.","發出 %s 張行動卡牌後解鎖。","Odblokuj grając %s kart akcji.","A feloldáshoz játssz %s akciókártyát.","%s kez aksiyon kartı oynanarak kilidi açılır."},
SKIN_TRUE_LOVE ={"True Love","Amor verdadeiro","","","","真愛","","Igaz Szerelem","Gerçek Aşk"},
SKIN_TRUE_LOVE_MISSION ={"Unlocked when you and another player reverse the game 4 times in a row.","Desbloqueado quando você e outro jogador revertem o jogo 4 vezes seguidas.","Débloqué lorsque vous et un autre joueur inversez le jeu 4 fois de suite.","Разблокируется, когда вы и другой игрок переворачиваете игру 4 раза подряд.","Se desbloquea cuando tú y otro jugador usan la carta de reverso cuatro veces seguidas.","當你和另一個玩家連續順逆遊戲方向 4 次之後解鎖。","Odblokuj kiedy ty i inny gracz odwrócicie grę 4 razy z rzędu.","A feloldáshoz fordítsd meg a kör irányát egy másik játékossal egymás után négyszer.","Siz ve başka bir oyuncu oyunu arka arkaya 4 kez tersine çevirdiğinde kilidi açılır."},
SKIN_CROISSANT ={"Hot Chocolate","Chocolate Quente","Chocolat chaud","Горячий Шоколад","Chocolate Caliente","熱可可","Gorąca Czekolada","Forró Csokoládé","Sıcak Çikolata"},
SKIN_AQUARIUM ={"Aquarium","Aquário","","Аквариум","Acuario","水族箱","Akwarium","Akvárium","Akvaryum"},
SKIN_AQUARIUM_MISSION ={"Unlocked by winning while having a fish whispering advice in your ear.","Desbloqueado ao vencer enquanto tem um peixe te dando dicas na orelha.","Débloqué en gagnant en ayant un poisson vous donnant des indices en vous chuchotant à l'oreille.","Разблокируется победой с рыбой-советчиком на ушке.","Desbloqueado al ganar mientras se tiene a un pescado dando consejos al oído.","當有魚在耳邊提示你而勝出後解鎖。","Odblokuj wygrywając podczas gdy masz rybę szepczącą ci radę do ucha.","A feloldáshoz hagyd, hogy egy hal tanácsot súgjon a füledbe.","Kulağınıza tavsiye fısıldayan bir balık varken kazanarak açılır."},
SKIN_HELP ={"Lifeboat","Trono Salva-Vidas","Bateau de sauvetage","Спасательная лодка","Salvavidas","救生艇","Łódź Ratunkowa","Mentőcsónak","Cankurtaran Sandalı"},
SKIN_HELP_MISSION ={"Unlocked by winning normally while Sudden Death is activated.","Desbloqueado ao vencer normalmente enquanto a Morte Súbita está ativada.","Débloqué en jouant normalement lorsque la Mort Subite est activée.","Разблокируется победой в обычном режиме, когда активна Внезапная Смерть.","Desboqueado por ganar de forma normal mientras la Muerte Súbita está activada.","在突然死亡模式中以正常方式勝出遊戲後解鎖。","Odblokuj wygrywając normalnie podczas gdy Karta Nagłej Śmierci została aktywowana.","A feloldáshoz nyerj normális módon nyersz miközben a Hirtelen Halál érvényben van.","Ani Ölüm etkinleştirildiğinde normal olarak kazanarak açılır."},
SKIN_FONT ={"Fountain","Chafariz","Fontaine","Фонтан","Fuente de Agua","噴泉","Fontanna","Kút","Çeşme"},
SKIN_FONT_MISSION ={"Unlocked by sacrificing a wild card to the Wish Card.","Desbloqueando ao entregar uma carta curinga para a Carta do Desejo.","Débloqué en sacrifiant une carte noire à la Carte Vœux.","Разблокируется, пожертвовав чёрной картой +4 на Карте Желаний","Desbloqueado al sacrificar una carta comodín a una Carta del Deseo.","在願望卡牌規矩中犧牲一張轉顏色卡牌後解鎖。","Odblokuj poświęcając kartę wild na Kartę Życzeń.","A feloldáshoz áldozz fel egy Színválasztó kártyát a Kívánság Kártyának.","Dilek Kartına bir renk kartı feda edilerek açılır."},
SKIN_CISNE ={"Swans","Cisnes","Cygne","Лебеди","Cisnes","天鵝","Łabędzie","Hattyúk","Kuğu"},
SKIN_CISNE_MISSION ={"Unlocked by winning a Team Match with your soul mate.","Desbloqueado ao vencer uma partida em dupla com sua alma-gêmea.","Débloqué en gagnant une Partie en Équipe avec votre âme sœur.","Разблокируется, выиграв командный матч со своей второй половинкой.","Desbleado al ganar una partida en equipo con tu alma gemela.","在團隊模式中與你的伴侶一起勝出後解鎖。","Odblokuj wygrywając Rundę Drużynową ze swoją drugą połówką.","A feloldáshoz nyerj egy Csapatmérkőzést a lélektársaddal.","Ruh eşinizle bir Takım Maçı kazanarak açılır."},
SKIN_SNOWMAN ={"Snowman","Boneco de Neve","Bonhomme de neige","Снеговик","Hombre de Nieve","雪人","Bałwan","Hóember","Kardan adam"},
SKIN_SNOWMAN_MISSION ={"Unlocked by having someone eliminated by donating a card to them.","Desbloqueado ao fazer alguém ser eliminado doando uma carta para ele.","Débloqué lorsque quelqu'un est éliminé en leur donnant une carte.","Разблокируется тем, что кого-то исключают, жертвуя им карточку.","Desbloqueado al eliminar a alguien por haberle donado una carta.","向別人捐卡而令他被淘汰後解鎖。","Odblokuj eliminując kogoś przez podarowanie mu karty.","A feloldáshoz távolíts el valakit a játékból azzal, hogy kártyát adományozol neki.","Birine bir kart bağışlayarak ortadan kaldırılmasıyla açılır."},
SKIN_COCA ={"Refreshing Throne","Trono Refrescante","Trône rafraichissant","Освежающий Трон","Trono Refrescante","清爽寶座","Tron Orzeźwienia","Felfrissítő Trón","Ferahlatıcı Taht"},
SKIN_COCA_MISSION ={"Unlocked by donating a +4 to someone.","Desbloqueado ao doar um +4 para alguém.","Débloqué en donnant un +4 a quelqu'un.","Разблокируется, пожертвовав +4 кому-то.","Se desbloquea al donar una carta +4 a otro jugador.","捐出一張 +4 卡牌給別人後解鎖。","Odblokuj podarowywując komuś +4.","A feloldáshoz adományozz egy +4-es kártyát valakinek.","Birine +4 bağışlayarak kilidi açıldı."},
SKIN_PHONE ={"Phone Booth","Cabine Telefônica","Cabine téléphonique","Телефонная будка","Cabina Telefónica","電話亭","Budka Telefoniczna","Telefonfülke","Telefon kulübesi"},
SKIN_PHONE_MISSION ={"Unlocked by setting a 6-color sequence in Simon's Card.","Desbloqueado ao acertar uma sequência de 6 cores na Carta da Memorização.","","Разблокируется установкой 6-цветовой последовательности Карты Симона.","Desbloqueado por poner una secuencia de seis colores en la Carta de Simón.","在西蒙卡組中成功設置6個顏色的排列後解鎖。","Odblokuj ustawiając 6 kolor sekwencji w Karcie Simona.","A feloldáshoz állíts fel egy hat színből álló sorozatot Simon Kártyájával.","Simon's kartda 6 renkli bir sekans ayarlanarak açılır."},
SKIN_MOON ={"Shadow Armchair","Poltrona Sombria","Fauteuil des ombres","Теневое Кресло","Banco de las Sombras","影子扶手椅","Krzesło Cieni","Árnyék Fotel","Gölge Koltuk"},
SKIN_MOON_MISSION ={"Unlocked by winning a match during a full moon.","Desbloqueado ao vencer uma partida em temporada de lua cheia.","Débloqué en gagnant une partie durant la pleine lune.","Разблокируется победой в полнолуние.","Se desbloquea por ganar un encuentro durante luna llena.","在滿月的時候勝出一場遊戲後解鎖。","Odblokuj wygrywając rundę podczas pełni księżyca.","A feloldáshoz nyerj egy játékot telihold idején.","Dolunay sırasında bir maç kazanarak açılır."},
SKIN_HONEY ={"Honey Throne","Trono do Mel","Trône miel","Медовый Трон","Trono de Miel","蜜糖寶座","Tron Miodu","Mézes Trón","Bal Tahtı"},
SKIN_HONEY_MISSION ={"Unlocked by playing side by side with your teammate in a Team Match.","Desbloqueado quando você jogar lado a lado com a sua dupla.","Débloqué en jouant côte à côte avec votre coéquipier dans une Partie en Équipe.","Разблокируется, играя бок о бок с товарищем по команде в командном матче.","Se desbloquea al jugar lado a lado con tu compañero en una ronda en equipo.","在團隊模式中, 你的搭檔坐在你旁邊後解鎖。","Odblokuj grając u boku ze swoim członkiem drużyny w Rundzie Drużynowej.","A feloldáshoz kerülj a csapattársad mellé egy Csapatmérkőzésben.","Bir Takım Maçında takım arkadaşınızla yan yana oynayarak açılır."},
SKIN_OLD ={"Old Armchair","Poltrona Antiga","Vieux fauteuil","Старое Кресло","Viejo Sillón","老舊扶手椅","Stary Fotel","Régi Fotel","Eski Koltuk"},
SKIN_OLD_MISSION ={"Unlocked by winning a game without house rules.","Desbloqueado ao vencer uma partida sem regras.","Débloqué en gagnant une partie sans règles de la maison.","Разблокируется, выиграв игру без домашних правил.","Se consigue al ganar un juego sin reglas de la casa.","在沒有自訂規矩中勝出一場遊戲後解鎖。","Odblokuj wygrywając grę bez domowych zasad.","A feloldáshoz nyerj meg egy játékot házszabályok nélkül.","Ev kuralları olmayan bir oyun kazanarak açılır."},
SKIN_CHIMNEY ={"Chimney","Chaminé","Cheminée","Дымоход","Chimenea","煙囪","Komin","Kémény","Baca"},
SKIN_CHIMNEY_MISSION ={"Unlocked by winning dressed as a pine tree.","Desbloqueado ao vencer uma partida fantasiado de pinheiro.","Débloqué en gagnant en étant habillé en sapin.","Разблокируется победой, одетым, как сосна.","Desbloqueado ganando vestido como un árbol.","穿著聖誕杉樹的裝扮勝出遊戲後解鎖。","Odblokuj wygrywając ubranym jako choinkę.","A feloldáshoz nyerj meg egy játékot fenyőfának öltözve.","Çam ağacı gibi giyerken kazanırsan açılır."},
SKIN_CHEESE_CLASSIC ={"Classic Cheese Throne","Trono de Queijo Clássico","Trône de fromage classique","Классический Сырный Трон","Trono Clásico de Queso","古典奶酪寶座","Klasyczny Serowy Tron","Klasszikus Sajt Trón","Klasik Peynir Tahtı"},
SKIN_SACK ={"Sack of Potatoes","Saco de Batatas","Sac de pommes de terre","Мешок с картошкой","Saco de Papas","一大包土豆","Worek Ziemniaków","Egy Zsák Burgonya","Patates Çuvalı"},
SKIN_SACK_MISSION ={"Unlocked by playing the Potato Card twice in the same game.","Desbloqueado ao jogar a Carta da Batata 2 vezes na mesma partida.","Débloqué en jouant la Carte Patate deux fois dans la même partie.","Разблокируется, если дважды сыграть с Картофельной Картой в одной и той же игре.","Se desbloquea por jugar la Carta de Papa dos veces en la misma partida.","在同一場遊戲裡發出兩次土豆卡牌後解鎖。","Odblokuj grając dwukrotnie Kartą Ziemniaka w tej samej grze.","A feloldáshoz játszd ki a Burgona Kártyát egy játék alatt kétszer.","Aynı oyunda Patates Kartını iki kez oynayarak açılır."},
SKIN_SMARTPHONE ={"Smartphone","","","Смартфон","Tecnológico","智能電話","Smartfon","Okostelefon","Akıllı telefon"},
SKIN_SMARTPHONE_MISSION ={"Unlocked randomly by watching matches in a private room.","Desbloqueado aleatoriamente ao assistir partidas em sala privada.","Débloqué aléatoirement en regardant des parties dans un salon privé.","Разблокируется случайным образом путём просмотра матчей в отдельной комнате.","Se desbloquea aleatoriamente al mirar partidas en salas privadas.","在私人房間旁觀後隨機解鎖。","Odblokuj losowo, oglądając rundy w prywatnym pokoju.","Véletlenszerűen feloldható privát játékok megfigyelése közben.","Özel bir odada maçları izleyerek rastgele açılır."},
SKIN_HORN ={"Unicorn","Unicórnio","Licorne","Единорог","Unicornio","獨角獸","Jednorożec","Egyszarvú","Tek boynuzlu at"},
SKIN_HORN_MISSION ={"Unlocked by tying.","Desbloqueado ao empatar.","Débloqué en finissant par une égalité.","Разблокировано связыванием.","Se desbloquea por atadura.","和局之後解鎖。","Odblokuj przez wiązanie.","A feloldáshoz érj el egy döntetlen eredményt.","Bağlanarak açılır."},
SKIN_FLAMINGO ={"Flamingo","","Flamand rose","Фламинго","Flamenco","火烈鳥","Flaming","Flamingó",""},
SKIN_FLAMINGO_MISSION ={"Unlocked by winning a game with 5 or more rules.","Desbloqueado ao vencer uma partida com 5 ou mais regras.","Débloqué en gagnant une partie avec 5 règles ou plus.","Разблокируется, выиграв игру с 5 или более правилами.","Se desbloquea ganando un juego con cinco o más reglas.","在一場自訂規矩有 5 個或以上的遊戲勝出後解鎖。","Odblokuj wygrywając grę z 5 lub więcej zasadami.","A feloldáshoz nyerj meg egy játékot, amelyben legalább 5 házszabály van.","5 veya daha fazla kuralı olan bir oyun kazanarak açılır."},
SKIN_BILL ={"Bill's Statue","Estátua do Bill","Statue de Bill","Статуя Билла","Estatua de Bill","比爾的雕像","Statua Billa","Bill Szobra","Bill'in Heykeli"},
SKIN_BILL_MISSION ={"Unlocked by winning due to the Imitation Card effect.","Desbloqueado ao vencer devido ao efeito da Carta da Imitação.","Débloqué en gagnant grâce à l'effet de la Carte Imitation.","Разблокируется победой благодаря эффекту Имитационной Карты.","Se desbloquea ganando debido al efecto de la Carta de Imitación.","透過仿製卡效果而勝出遊戲後解鎖。","Odblokuj wygrywając dzięki efektowi Karty Imitacji.","A feloldáshoz nyerj az Utánzó Kártya képességével.","Taklit Kart etkisi nedeniyle kazanarak açılır."},
SKIN_MAX ={"Throne Max 3000","Trono Max 3000","Trône Max 3000","Трон Макс 3000","Trono Futuritástico","天皇寶座 3000","Tron Max 3000","","Taht Max 3000"},
SKIN_MAX_MISSION ={"Unlocked by defeating 9 bots at once in a private room.","Desbloqueado ao derrotar 9 bots de uma só vez em sala privada.","Débloqué en battant 9 robots à la fois dans un salon privé.","Разблокируется, победив 9 ботов одновременно в отдельной комнате.","Se desbloquea al vencer a nueve bots en una sala privada.","在私人房間一次打敗 9 個機器人後解鎖。","Odblokuj przez pokonanie 9 botów naraz w prywatnym pokoju.","A feloldáshoz győzz le 9 robotot egy privát szobában.","Özel bir odada aynı anda 9 bot yenilerek açılır."},
SKIN_VAMPIRE ={"Throne of the Plague","Trono da Peste","","","","瘟疫寶座","","A Pestis Trónja","Corona Tahtı"},
SKIN_VAMPIRE_MISSION ={"Unlocked by playing a match next to a player who is using this throne.","Desbloqueado ao jogar uma partida ao lado de alguém que estiver usando este trono.","","","","在使用這個座椅的玩家旁邊玩一局遊戲來解鎖。","","A feloldáshoz játssz egy játékot olyasvalaki mellett, aki ezt a trónt használja.","Bu tahtı kullanan oyuncunun yanında bir maç oynayarak kilidi açılır."},
SKIN_PIKACHU ={"Pikachu's Armchair","Poltrona do Pikachu","","","","皮卡丘扶手椅","","Pikachu Fotele","Pikachu'nun Koltuğu"},
SKIN_PIKACHU_MISSION ={"Unlocked by winning with a Thunder Card.","Desbloqueado ao vencer com a Carta do Trovão.","","","","迅雷。使用雷電卡牌獲勝後解鎖。","","A feloldáshoz nyerj a Mennydörgés Kártyával.","Yıldırım Kartı ile kazanarak açılır."},
SKIN_TOAST ={"Eggs and Toast","Torrada e Ovos","","","","雞蛋吐司","","Tojás és Pirítós","Yumurtalar ve tost"},
SKIN_PIZZA ={"Pizza Box","Caixa de Pizza","","","","披薩盒子","","Pizzásdoboz","Pizza Kutusu"},
SKIN_SIMPSONS ={"Simpsons' Sofa","Sofá dos Simpsons","","","","Simpsons 的沙發","","A Simpson Kanapé","Simpsons 'Kanepe"},
SKIN_SIMPSONS_MISSION ={"Unlocked by winning with your mouse naked.","Desbloqueado ao vencer uma partida com o rato nu.","","","","裸鼠裝扮勝出後解鎖。","","A feloldáshoz nyerj úgy, hogy az egered meztelen.","Çıplak farenizle kazanarak açılır."},
SKIN_KISS ={"Kiss Armchair","Poltrona do Beijo","","","","親親扶手椅","","Csók Fotel","Öpücük Koltuk"},
SKIN_KISS_MISSION ={"Unlocked by donating to a player that donated to you.","Desbloqueado ao retribuir uma Doação que um jogador fez a você.","","","","把另一個玩家捐贈給你的卡牌給回他後解鎖。","","A feloldáshoz adj vissza egy adományt, amit más játékos adományozott neked.","Size bağış yapan bir oyuncuya bağış yaparak açılır."},
SKIN_FOREST ={"Enchanted Forest","Bosque Encantado","","","","迷人之森","","Elvarázsolt Erdő","Büyülü Orman"},
SKIN_FOREST_MISSION ={"Unlocked by winning with a pink Portal Card.","Desbloqueado ao vencer com um Carta do Portal rosa.","","","","使用粉紅色傳送門卡牌獲勝後解鎖。","","A feloldáshoz nyerj egy rózsaszín Portál Kártyával.","Pembe bir Portal Kartı ile kazanarak açılır."},
SKIN_MONTAIN ={"Mountain","Montanha","","","","群山","","Hegy","Dağ"},
SKIN_MONTAIN_MISSION ={"Unlocked by winning using the Tornado Card during Sudden Death.","Desbloqueado ao vencer usando a Carta do Tornado durante a Morte Súbita.","","","","在暴斃模式中使用龍捲風卡牌獲勝後解鎖。","","A feloldáshoz nyerj egy Forgószél Kártyával miközben a Hirtelen Halál aktív.","Ani Ölüm sırasında Kasırga Kartını kullanarak kazanarak açılır."},
SKIN_SAMSON ={"Samson","Sansão","","","","","","Sámson",""},
SKIN_SAMSON_MISSION ={"Unlocked by locking every card of every opponent.","Desbloqueado ao trancar todas as cartas de todos os adversários.","","","","把所有對手的所有卡都鎖起來後解鎖。","","A feloldáshoz zárd el minden ellenfeled minden kártyáját.","Her rakibin her kartını kilitleyerek açılır."},
SKIN_CIAN ={"Cyan Armchair","Poltrona Verde-água","","","","碧綠扶手椅","","Cián Fotel","Camgöbeği Koltuk"},
SKIN_CIAN_MISSION ={"Unlocked by winning with a cyan card.","Desbloqueado ao vencer com uma carta verde-água.","","","","使用墨綠色卡牌獲勝後解鎖。","","A feloldáshoz nyerj cián kártyával.","Camgöbeği kartla kazanarak açılır."},
SKIN_ORANGE ={"Orange Armchair","Poltrona Laranja","","","","橘色扶手椅","","Narancsságra Fotel","Turuncu Koltuk"},
SKIN_ORANGE_MISSION ={"Unlocked by winning with an orange card.","Desbloqueado ao vencer com uma carta laranja.","","","","使用橘色卡牌獲勝後解鎖。","","A feloldáshoz nyerj narancssárga kártyával.","Turuncu kartla kazanarak açılır."},
SKIN_PINK ={"Pink Armchair","Poltrona Rosa","","","","粉紅扶手椅","","Rózsaszín Fotel","Pembe Koltuk"},
SKIN_PINK_MISSION ={"Unlocked by winning with a pink card.","Desbloqueado ao vencer com uma carta rosa.","","","","使用粉紅色卡牌獲勝後解鎖。","","A feloldáshoz nyerj rózsaszín kártyával.","Pembe kartla kazanarak açılır."},
SKIN_PURPLE ={"Purple Armchair","Poltrona Roxa","","","","紫色扶手椅","","Lila Fotel","Mor Koltuk"},
SKIN_PURPLE_MISSION ={"Unlocked by winning with a purple card.","Desbloqueado ao vencer com uma carta roxa.","","","","使用紫色卡牌獲勝後解鎖。","","A feloldáshoz nyerj lila kártyával.","Mor kartla kazanarak açılır."},
SKIN_BLACK ={"Black Armchair","Poltrona Preta","","","","黑色扶手椅","","Fekete Fotel","Siyah Koltuk"},
SKIN_BLACK_MISSION ={"Unlocked by winning with a white card.","Desbloqueado ao vencer com uma carta branca.","","","","使用白色卡牌獲勝後解鎖。","","A feloldáshoz nyerj fehér kártyával.","Beyaz kartla kazanarak açılır."},
SKIN_TOXIC ={"Toxicity Throne","Trono da Toxicidade","","","","毒性寶座","","Mérgező Trón","Zehirlilik Taht"},
CYAN_MISSION ={"Unlocked by winning %s times with a cyan card.","Desbloqueado ao vencer %s vezes com uma carta verde-água.","","","","使用墨綠色卡牌獲勝 %s 次後解鎖。","","A feloldáshoz nyerj cián kártyával %s alkalommal.","Mavi kartla %s kez kazanarak kilidi açılır."},
SKIN_THUNDER ={"Thunder Throne","Trono do Trovão","","","","雷電寶座","","Mennydörgés Trón","Yıldırım Tahtı"},
ORANGE_MISSION ={"Unlocked by winning %s times with an orange card.","Desbloqueado ao vencer %s vezes com uma carta laranja.","","","","使用橘色卡牌獲勝 %s 次後解鎖。","","A feloldáshoz nyerj narancssárga kártyával %s alkalommal.","Turuncu kartla %s kez kazanarak kilidi açılır.."},
SKIN_CRYSTAL ={"Crystal Throne","Trono do Cristal","","","","晶石寶座","","Kristrály Trón","Kristal Taht"},
PINK_MISSION ={"Unlocked by winning %s times with a pink card.","Desbloqueado ao vencer %s vezes com uma carta rosa.","","","","使用粉紅色卡牌獲勝 %s 次後解鎖。","","A feloldáshoz nyerj rózsaszín kártyával %s alkalommal.","Pembe kartla %s kez kazanarak kilidi açılır.."},
SKIN_DARK ={"Darkness Throne","Trono da Escuridão","","","","暗黑寶座","","Sötétség Trónja","Karanlık Taht"},
PURPLE_MISSION ={"Unlocked by winning %s times with a purple card.","Desbloqueado ao vencer %s vezes com uma carta roxa.","","","","使用紫色卡牌獲勝 %s 次後解鎖。","","A feloldáshoz nyerj lila kártyával %s alkalommal.","Mor kartla %s kez kazanarak kilidi açıldı."},
SKIN_LIGHT ={"Light Throne","Trono da Luz","","","","光明寶座","","Fényesség Trónja","Hafif Taht"},
WHITE_MISSION ={"Unlocked by winning %s times with a white card.","Desbloqueado ao vencer %s vezes com uma carta branca.","","","","使用白色卡牌獲勝 %s 次後解鎖。","","A feloldáshoz nyerj fehér kártyával %s alkalommal.","Beyaz kartla %s kez kazanarak kilidi açıldı."},
SKIN_ECLIPSE ={"Eclipse Throne","Trono do Eclipse","","","","日蝕寶座","","Napfogyatkozás Trón","Tutulma Tahtı"},
SKIN_ECLIPSE_MISSION ={"Unlocked by winning a Team Match using a card identical to one of your partner's.","Desbloqueado ao vencer uma partida em duplas usando uma carta idêntica a uma da sua dupla.","","","","在團隊模式中使用跟你同伴同一張的卡牌獲勝後解鎖。","","A feloldáshoz nyerj egy Csapatjátékot ugyanazzal a kártyával ami a partnerednek is van.","Partnerinizden birinin kartıyla aynı olan bir Takım Maçı kazanarak açılır."},
SKIN_TOOTHLESS ={"Toothless","Banguela","","","","無牙","","Fogatlan","Dişsiz"},
SKIN_TOOTHLESS_MISSION ={"Unlocked by winning %s games on the dark side of the Portal.","Desbloqueado ao vencer %s partidas do lado escuro do Portal.","","","","在傳送門黑暗那邊勝出 %s 次後解鎖。","","A feloldáshoz nyerj %s alkalommal a Portál sötét oldalán.","Portalın karanlık tarafında %s oyunları kazanarak kilidi açıldı."},
SKIN_LIGHTFURY ={"Lightfury","Fúria da Luz","","","","毛茸茸","","Fényfúria","Hafif öfke"},
SKIN_LIGHTFURY_MISSION ={"Unlocked by winning %s games on the light side of the Portal.","Desbloqueado ao vencer %s partidas do lado claro do Portal.","","","","在傳送門光明那邊勝出 %s 次後解鎖。","","A feloldáshoz nyerj %s alkalommal a Portál világos oldalán.","Portalın aydınlık tarafında %s oyun kazanarak kilidi açıldı."},
SKIN_KRATOS ={"Kratos","","","","","克雷多斯 戰神","","Kratos",""},
SKIN_KRATOS_MISSION ={"Unlocked by playing an action card using the Hell rule.","Desbloqueado ao descartar uma carta fazendo uso da regra Inferno.","","","","在地獄模式中使用行動卡牌後解鎖。","","A feloldáshoz játssz egy akciókártyát a Pokol szabály felhasználásával.","Cehennem kuralını kullanarak bir aksiyon kartı oynayarak açılır."},
SKIN_SHENLONG ={"Shenlong","","","","","神龍","","Shenlong",""},
SKIN_SHENLONG_MISSION ={"Unlocked when the Wish Card offers you 3 equal options.","Desbloqueado quando a Carta do Desejo te oferecer 3 opções iguais.","","","","當許願卡牌給了你 3 個一樣的選擇時解鎖。","","A feloldáshoz három ugyanolyan opciót kell a Kívánság Kártyától kapnod.","Dilek Kartı size 3 eşit seçenek sunduğunda açılır."},
SKIN_SPIDER ={"Spider-Man","Miranha","","","","蜘蛛俠","","Pókember","Örümcek Adam"},
SKIN_SPIDER_MISSION ={"Unlocked by using the Web Card on the same player twice in a match.","Desbloqueado ao usar a Carta da Teia duas vezes no mesmo jogador em uma partida.","","","","在同一個玩家身上連續使用 2 次蜘蛛網卡牌後解鎖。","","A feloldáshoz használd a Háló Kártyát ugyanazon a játékoson egy játék alatt kétszer.","Bir maçta aynı oyuncu üzerinde Web Kartı kullanılarak iki kez açılarak açılır."},
SKIN_LICH ={"Lich King's Throne","Trono do Lich Rei","","","","巫妖王的寶座","","A Lidérc Király Trónja","Lich Kralı'nın Tahtı"},
SKIN_LICH_MISSION ={"Unlocked by winning a match due to the ice curse.","Desbloqueado ao vencer uma partida devido à maldição de gelo.","","","","在冰凍抽卡的詛咒下勝出後解鎖。","","A feloldáshoz nyerj meg egy játékot a fagyos átoknak köszönhetően,","Buz laneti nedeniyle bir maç kazanarak açılır."},
SKIN_BLACKHOLE ={"Black Hole","Buraco Negro","","","","","","","Kara delik"},
SKIN_BLACKHOLE_MISSION ={"Unlocked by winning with a card not of this round.","Desbloqueado ao vencer uma partida com uma carta que veio de fora.","","","","","","","Bu turdan olmayan bir kartla kazanarak açılır."},
SKIN_EVILJEWEL ={"Evil Jewel","Joia Maligna","","","","","","","Kötü Mücevher"},
SKIN_CACTUS ={"Cactus","Cacto","","","","","","","Kaktüs"},
SKIN_SQUID_HOUSE ={"Squidward House","Casa do Lula Molusco","","","","","","","Squidward Evi"},
SKIN_VOLCANO ={"Volcano","Vulcão","","","","","","","Volkan"},
SKIN_NYAN ={"Nyancat Armchair","Poltrona de Nyancat","","","","","","","Nyancat Koltuk"},
SKIN_TOY_CASTLE ={"Toy Castle","Castelo de Brinquedo","","","","","","","Oyuncak Kale"},
SKIN_BOMBERMAN ={"Bomberman","","","","","","","","Bombacı"},
SKIN_PHOENIX ={"Phoenix","Fênix","","","","","","","Anka kuşu"},
SKIN_FIRE_TEMPLE ={"Temple of Fire","Templo de Fogo","","","","","","","Ateş Tapınağı"},
SKIN_GHOSTFACE ={"Ghostface","","","","","","","","Hayalet Maske"},
SKIN_IRONMAN ={"Ironman","Homem de Ferro","","","","","","","Demir Adam"},
SKIN_NINETALES ={"Ninetales","","","","","","","",""},
SKIN_PARABOLIC ={"Satellite Dishes","Antenas Parabólicas","","","","","","","Uydu antenleri"},
SKIN_TERMINATOR ={"Terminator T-800","Exterminador T-800","","","","","","","Terminatör T-800"},
SKIN_TITANIC ={"Titanic","","","","","","","",""},
SKIN_SQUID_HOUSE ={"Wakanda","","","","","","","",""},
SKIN_ICHIGO ={"Mew Ichigo","","","","","","","",""},
SKIN_MINT ={"Mew Mint","","","","","","","",""},
SKIN_LETTUCE ={"Mew Lettuce","","","","","","","",""},
SKIN_PUDDING ={"Mew Pudding","","","","","","","",""},
SKIN_ZAKURO ={"Mew Zakuro","","","","","","","",""},
SKIN_ANGEL_CLASSIC ={"Angelic Throne Classic","Trono Angelical Clássico","","","","","","","Melek Taht Klasik"},
SKIN_DIAMOND_CLASSIC ={"Diamond Throne Classic","Trono de Diamante Clássico","","","","","","","Elmas Taht Klasik"},
SKIN_JUNKY_CLASSIC ={"Junky Throne Classic","Trono de Sucata Clássico","","","","","","","Hurda Taht Klasik"},
SKIN_RAINBOW_CLASSIC ={"Rainbow Throne Classic","Trono Arco-Íris Clássico","","","","","","","Gökkuşağı Tahtı Klasik"},
SKIN_JOKER ={"Joker","Coringa","","","","小丑","","",""},
SKIN_BATMAN ={"Batman","","","","","蝙蝠俠","","",""},
SKIN_BUBBLES ={"Bubbles","Bolhas","","","","","","","Kabarcıklar"},
SKIN_FAVORITES ={"Not So Mysterious Throne","Trono Não Tão Misterioso","","","","","","","O Kadar da Gizemli Olmayan Taht"},
SKIN_FAVORITES_DESC ={"This becomes one of your favorite thrones.","Isto se transforma num dos seus tronos favoritos.","","","","","","","Bu, en sevdiğiniz tahtlardan biri olabilir."},
SKIN_TEST ={"Test Throne","Trono de Teste","Trône de test","Тестовый Трон","Trono de Prueba","測試寶座","Test Tron","Teszt Trón","Test Tahtı"},
SKIN_BUY_MISSION ={"Unlocked by buying it at the shop.","Desbloqueado ao comprar isto na loja.","","","","","","","Mağazadan satın alarak kilidi açılır."},
EQUIP ={"Equip","Equipar","Equiper","Оборудовать","Equipar","裝備","Załóż","Visel","Donan"},
EQUIPPED ={"Equipped","Equipado","Equipé","Оборудованный","Equipada","已裝備","Założony","Viselve","Donatılmış"},
LOCKED ={"Locked","Bloqueado","Bloqué","Заблокированный","Cerrada","被鎖定","Zablokowane","Zárva","Kilitli"},
CREATED_BY ={"created by","criado por","crée(e) par","создано","creado por","創作人","zrobione przez","készítette:","Tarafından yaratıldı"},
BUY ={"Buy","Comprar","","","","","","","Satın Al"},
NO_ENOUGH_BLUE ={"You don't have enough blue tickets.","Você não tem tickets azuis suficientes.","","","","","","","Yeterli mavi biletiniz yok."},
NO_ENOUGH_RED ={"You don't have enough red tickets.","Você não tem tickets vermelhos suficientes.","","","","","","","Yeterli kırmızı biletiniz yok."},
NO_ENOUGH_YELLOW ={"You don't have enough yellow tickets.","Você não tem tickets verdes suficientes.","","","","","","","Yeterli sarı biletiniz yok."},
NO_ENOUGH_GREEN ={"You don't have enough green tickets.","Você não tem tickets amarelos suficientes.","","","","","","","Yeterli yeşil biletiniz yok."},
SHOP_INFO ={"The shop offers 10 random items daily. The catalogue will be updated in %s.","Esta loja oferece 10 itens aleatórios para comprar todos dias. O catálogo será atualizado em %s.","","","","","","","Dükkan günde 10 rastgele ürün sunuyor. Katalog saat %s civarı güncellenecek."},
SHOP_CHAIRS ={"Chair","Cadeira","","","","","","","Sandalye"},
SHOP_PANEL ={"Panel","Painel","","","","","","",""},
SHOP_LIGHT ={"Spotlight","Holofote","","","","","","","Spot"},
SHOP_MAP ={"Map","Mapa","","","","","","","Harita"},
SHOP_RULE ={"Rule","Regra","","","","","","","Kural"},
SHOP_CONSUMABLE ={"Consumable","Consumível","","","","","","","Tüketim maddesi"},
RULES_1 ={"When a new game begins, you may sit on an empty chair (by pressing space). The game begins after 15 seconds.\n\nGet rid of all the cards on your hand to win the game. Each player can discard one card per round. The discarded card must have a number, color or symbol equal to the one that's shown on the table.\n\nIf you don't have a suitable card to discard, you must draw one from the deck by clicking on it. If this card is adequate, you can play it or pass your turn.","Quando um novo jogo se iniciar, corra e sente-se em uma cadeira vazia (apertando espaço). O jogo se inicia em 15 segundos.\n\nLivre-se de todas as cartas da sua mão para vencer o jogo. Para isto, cada jogador descarta uma carta nos seus respectivos turnos. A carta descartada deve ter número, símbolo ou cor da carta que estiver na mesa.\n\nCaso você não tenha uma carta para jogar, você deve comprar 1 carta (clicando no baralho). Caso esta carta sirva para jogar, você pode jogá-la ou passar a vez.","Lorsqu'une partie commence, vous devez vous asseoir sur une chaise vide (en appuyant sur espace). La partie commence dans 15 secondes. \n\nDébarassez-vous des cartes de votre main pour gagner le jeu. Chaque joueur peut se défausser d'une carte par tour. La carte défaussée doit avoir un numéro, une couleur ou un symbole égal à celui qui est indiqué sur le tableau. \n\nSi vous n'avez pas de carte à défausser, vous devez en tirer une de la pioche en cliquant dessus. Si cette carte est adéquate, vous pouvez la jouer ou passer votre tour.","Когда начинается новая игра, вы можете сесть на пустой кресло (нажав пробел). Игра начинается через 15 секунд.\n\nУбери все карты, которые у тебя есть, чтобы выиграть игру. Каждый игрок может сбросить одну карту за раунд. У сброшенной карты должен быть номер, цвет или символ, совпадающий с тем, который указан на столе.\n\nЕсли у вас нет подходящей карты для сброса, вы должны взять её из колоды, нажав на неё. Если этой карты достаточно, вы можете положить её или пропустить свой ход.","Cuando un nuevo juego comienza, debes correr y tomar una silla vacía(presionando espacio o agachandote en ella). El juego comenzará en 15 segundos.\n\n Descarta todas tus cartas para ganar el juego. Cada jugador puede descartar una carta por turno. La carta descartada debe tener el número, color o símbolo igual a la que se muestra en la parte alta de la mesa. \n\n Si no tienes cartas para descartar, deberás tomar una carta del mazo presionando en él, si la carta encaja puedes descartarla o pasar turno.","當新一輪遊戲開始的時候, 你可以到空置的座位 (按空格鍵) 坐下。 遊戲將在 15 秒後開始。\n\n只要把手上的牌都出完就勝出遊戲。 每個玩家在每一個回合只可以出一張卡牌。 發出的卡牌都必須跟在桌子上已翻開的卡牌有著相同的數字, 顏色 或符號。\n\n如果你沒有一張符合出牌要求的卡牌, 你需要點擊牌庫來抽取一張卡。 如果抽出的卡剛好符合出牌要求, 你可以選擇馬上出牌或是留待下一回合。","Gdy rozpocznie się nowa gra, możesz zacząć biec aby zająć puste krzesło (wciskając spację). Gra rozpocznie się za 15 sekund.\n\nPozbądź się wszystkich kart z twojej puli aby wygrać grę. Każdy gracz w trakcie jednej kolejki może wyrzucić jedna kartę na stół. Wyrzucona karta musi mieć numer, kolor lub symbol taki sam, jak karta pokazana na stole.\n\nJeśli nie masz odpowiedniej karty do wyrzucenia, musisz wyciągnąć jedną kartę z talii kart klikając na nią. Jeśli karta ta pasuje, możesz wyrzucić ja na stół lub przeczekać kolejkę.","Amikor elkezdődik egy új játék, le tudsz ülni egy üres székre (a szóköz megnyomásával). A játék 15 másodperc múlva kezdődik.\n\nSzabadulj meg az összes kezedben lévő kártyától hogy megnyerd a játékot. Minden játékos ki tud játszani egy kártyát minden körben. A kijátszott kártyán olyan színnek, számnak vagy szimbólumnak kell szerepelnie, mint ami az asztalon lévő kártyán van rajta.\n\nHa nincs olyan kártyád amit kijátszhatnál, húznod kell egyet a pakliból úgy, hogy rákattintasz. Ha olyan kártyát húztál, amit ki tudnál játszani, kijátszhatod vagy átadhatod a kört.","Yeni bir oyun başladığında boş bir sandalyeye oturabilirsiniz (boşluk tuşuna basarak). Oyun 15 saniye sonra başlar. \n\nOyunu kazanmak için elinizdeki tüm kartlardan kurtulun. Her oyuncu tur başına bir kart çıkarabilir. Atılan kartın, masada gösterilene eşit bir numarası, rengi veya sembolü olmalıdır. \n\nAtmak için uygun bir kartınız yoksa, üzerine tıklayarak desteden bir kart çekmelisiniz. Bu kart yeterliyse oynayabilir veya sıranızı geçebilirsiniz."},
RULES_2 ={"Some special cards can change the game course:\n\n<b>Skip:</b> The next player misses their turn.\n\n<b>Reverse:</b> This card changes the game direction. If there are only two players in the game, it'll have the same effect as the Skip card.\n\n<b>+2:</b> It makes the next player draw two cards and miss their turn. If that player also has a +2 card, they can discard it and pass the accumulated penalty to the next player.\n\n<b>Wild:</b> You can discard it over any card and it gives the power to change the color to any of the four colors.","Algumas cartas especiais mudam o rumo do jogo:\n\n<b>Pular:</b> Faz o próximo jogador perder a vez\n\n<b>Reverter:</b> Inverte o fluxo do jogo. Se for apenas 2 pessoas jogando, essa carta tem o efeito da carta Pular.\n\n<b>+2:</b> Faz o próximo comprar duas cartas e perder a vez, caso ele também tenha um +2, ele pode descartar e passar a penalidade para o próximo, que será acumulada.\n\n<b>Curinga:</b> Pode jogar em cima de qualquer carta, depois escolha uma cor para prosseguir o jogo.","Certaines cartes spéciales peuvent changer le cours du jeu: \n\n<b>Passe:</b> Le prochain joueur passe son tour. \n\n<b>Changement de sens:</b> Cette carte change la direction du jeu. Si il n'y a que deux joueurs dans la partie, cette carte aura le même effet que la carte Passe.\n\n<b>+2:</b> Cette carte fait prendre, au prochain joueur, 2 cartes et lui passer son tour. Si ce joueur a déjà un +2, alors il peut la défausser et passer la pénalité accumulée au prochain joueur.\n\n<b>Carte noire:</b> Vous pouvez défaussez une carte noire sur n'importe quelle autre carte, vous donnant alors le pouvoir de changer la couleur de la carte en l'une des quatre couleurs du jeu.","Некоторые специальные карты могут изменить ход игры:\n\n<b>Пропустить:</b> Следующий игрок пропускает свой ход.\n\n<b>Обратная:</b>  Эта карта меняет направление игры. Если в игре только два игрока, это будет иметь тот же эффект, что и карта пропуска..\n\n<b>+2:</b> Она заставляет следующего игрока взять две карты и пропустить свой ход. Если у этого игрока также есть карта +2, он может сбросить её и передать накопленные карты следующему игроку..\n\n<b>Чёрная:</b> Вы можете поставить её на любую карту, и сможете сменить на один цвет из четырёх.","Algunas cartas especiales pueden cambiar la dirección del juego:\n\n<b>Saltar:</b> El siguiente jugador pierde su turno.\n\n<b>Reversa:</b> Esta carta cambia la dirección. Si es que sólo hay 2 jugadores en la partida, la carta toma el efecto de la carta ''Saltar''.\n\n<b>+2:</b>Esta carta hace que el siguiente jugador tome 2 cartas y perder su turno. Si el jugador tiene un +2, él puede descartarla y saltarse la penalidad.\n\n<b>Wild:</b> Puedes descartarla encima de cualquier carta y le da el poder de cambiar el color al que la descartó.","有一些特別卡牌會改變遊戲進程:\n\n<b>跳過牌:</b> 使用後會跳過下一位玩家的回合。\n\n<b>反轉牌:</b> 改變遊戲進行的方向。 如果只有兩個玩家, 它會變成跟跳過牌一樣的作用。\n\n<b>+2 卡牌:</b> 它會使下一個玩家罰抽 2 張卡牌然後跳過他的回合。 如果那個玩家也有 +2 卡牌, 他可以發出那卡牌然後把罰抽次數累積給再下一個玩家。\n\n<b>換色卡牌:</b> 你可以在你的回合隨時使用它來換掉出牌的顏色, 在四個顏色中選擇你想換成的顏色就行了。","Niektóre specjalne karty mogą zmienić przebieg gry:\n\n<b>Pominięcie:</b> Następny gracz traci swoją kolejkę.\n\n<b>Odwrócenie:</b> Ta karta zmienia kierunek gry. Jeśli tylko dwie osoby biorą udział w rozgrywce będzie ona dawać taki sam efekt jak karta pominięcie.\n\n<b>+2:</b> Sprawia, ze następny gracz dostaje 2 dodatkowe karty i traci kolejkę. Jeśli gracz posiada w swojej puli kartę +2, może wyrzucić ją na stół i przekazać swoją karę następnemu graczowi.\n\n<b>Wild:</b> Możesz położyć ją na każdą inną kartę, daje ona możliwość wyboru koloru dla tego, kto ja wyrzucił.","Néhány különleges kártya megváltoztathatja a játék menetét:\n\n<b>Kimaradsz:</b> A következő játékos kimarad a körből.\n\n<b>Visszafordító:</b> Ez a kártya megfordítja a kör irányát. Ha csak két játékos van, ugyanaz a képessége mint a Kimaradsz kártyának.\n\n<b>+2:</b> A következő játékosnak kettőt kell húznia, majd kimarad a körből. Ha neki is van +2-es kártyája, kijátszhatja és a felhalmozott +2-es kártyák összesített értékével továbbíthatja a következő játékosnak.\n\n<b>Színválasztó:</b> Kijátszhatod bármely kártyára, és utána kiválaszthatod a színét a négy szín bármelyikéből.","Bazı özel kartlar oyunun gidişatını değiştirebilir:\n\n<b>Atla:</b> Bir sonraki oyuncu sırasını kaçırır.\n\n<b>Tersine çevirmek:</b> Bu kart oyunun yönünü değiştirir. Oyunda yalnızca iki oyuncu varsa, Atlama kartıyla aynı etkiye sahip olacaktır.\n\n<b>+2:</b> Bir sonraki oyuncunun iki kart çekmesine ve sırasını kaçırmasına neden olur. Bu oyuncunun da +2 kartı varsa, onu atabilir ve birikmiş cezayı bir sonraki oyuncuya geçirebilir.\n\n<b>Renk kartı:</b> Herhangi bir kartın üzerine atabilirsiniz ve rengi dört renkten herhangi birine değiştirme gücü verir."},
RULES_3 ={"<b>Wild +4:</b> It works just like the Wild, but this one also makes the next player draw 4 cards. If the next player has a Wild +4 card, they can discard the card and pass the accumulated penalty to the next player.\n\nYou can only play a Wild +4 card when you have no card matching the color of the top card on the table. The next player can challenge an invalid Wild +4 card. If the challenger is right, the one that will draw four cards will be the one who played it and the challenger won't miss their turn. But if the challenger is wrong, they will draw 6 cards, the initial 4 plus an extra 2 as a penalty.","<b>Curinga +4:</b> Igual ao Curinga comum, mas faz o próximo comprar 4 cartas e perder a vez, se o próximo também tiver um +4, ele pode descartar e passar a penalidade para o próximo, que será acumulada.\n\nÉ permitido jogar um +4 apenas quando você não tiver cartas da cor da mesa.\n\nO próximo jogador pode desafiar um +4 injusto. Se o desafiante estiver certo, quem compra as 4 cartas será quem jogou o +4 e a vez não será perdida. Caso o desafiante perca, ele compra 2 cartas a mais como punição.","","<b>Чёрная +4:</b> Она работает так же, как и обычная Чёрная, но эта также заставляет следующего игрока взять 4 карты. Если следующий игрок имеет Чёрную +4, он может сбросить её и передать накопленные карты следующему игроку.\n\nВы можете играть картой Чёрной +4, только если у вас нет карты, соответствующей цвету карты, которая на столе. Следующий игрок может бросить вызов недействительной карте Чёрной +4. Если человек прав, то тот, кто возьмет четыре карты, будет тем, кто их разыграл, и претендент не пропустит свой ход. Но если человек ошибается, он вытянет 6 карт, начальные 4 и 2 дополнительные.","<b>Wild +4:</b> Funciona como un joker común, pero este hace al próximo jugador tomar 4 cartas. Si el próximo jugador tiene un joker +4, el jugador puede descartar la carta y pasar la penitencia al próximo jugador.\n\nSólo puedes jugar el joker +4 cuando no tienes cartas del color jugable. El siguiente jugador puede desafiar el joker +4 injusto. Si el jugador está en la razón, el jugador que descartó el joker +4 será quien reciba las 4 cartas y el que lo iba a recibir no pierde su turno. En caso de que el desafiador esté equivocado tendrá que tomar 2 cartas más aparte de las que iba a recibir como penalización.","<b>+4 換色卡牌:</b> 它跟換色卡牌一樣, 但是這張卡牌會讓下一個玩家罰抽 4 張卡。 如果下一個玩家也有 +4 換色卡牌, 他可以發出那卡牌然後把罰抽次數累積給再下一個玩家。\n\n你只可以在沒有跟桌面上出牌的顏色一樣的卡牌這個情況下才可以發出 +4 換色卡牌。 下一個玩家有權力質疑你的 +4 換色卡牌有沒有違反這規則。 如果成功質疑, 發出這 +4 換色卡牌的人需要罰抽 4 張卡牌而提出質疑的玩家不會失去自己的回合。 可是如果質疑失敗, 提出質疑的玩家會被罰抽 6 張卡牌, 那是本來的 4 張加上額外 2 張卡牌作為懲罰。","<b>Wild +4:</b> Działa trochę jak znany joker, ale sprawia, że następny gracz musi wyciągnąć 4 karty z talii. Jeśli ma on w swojej puli kartę Wild +4. może położyć ją na stół i przekazać karę następnemu graczowi.\n\nMożesz użyć karty Wild +4 jeśli nie masz żadnej karty w kolorze tej, która znajduje się na stole. Następny gracz może rzucić wyzwanie, jeśli stwierdzi, ze karta +4 została wyrzucona niesprawiedliwie, Jeżeli wyzywający ma racje, osobą która dostanie 4 dodatkowe karty, będzie ten, kto położył kartę Wild +4, a wyzywający nie straci kolejki.\nW przypadku, gdy wyzywający nie ma racji, otrzyma dwie karty więcej jako karę.","<b>Színválasztó +4:</b> Úgy működik mint egy Színválasztó, viszont a következő játékosnak húznia kell négy kártyát. Ha neki is van Színválasztó +4-s kártyája, kijátszhatja és a felhalmozott Színválasztó +4-es kártyák összesített értékével továbbíthatja a következő játékosnak.\n\nCsak akkor játszhatsz egy Színválasztó +4-es kártyát, ha nincs más kártyád, amely megegyezik színben az asztalon lévővel. A következő játékos kihívhat egy érvénytelen Színválasztó +4-es kártyát. Ha a kihívónak van igaza, a kijátszó húz négy kártyát és a kihívó köre nem marad ki. Ha a kihívó tévedett, ő húz 6 kártyát, a kezdeti négyet és még kettőt büntetésből.","<b>+4:</b> Tıpkı Renk kartı gibi çalışır, ancak bu aynı zamanda bir sonraki oyuncunun 4 kart çekmesini sağlar. Bir sonraki oyuncunun bir +4 kartı varsa, kartı atabilir ve birikmiş cezayı bir sonraki oyuncuya geçirebilir. \n\ nBir +4 kartını yalnızca masanın üstündeki kartın rengiyle eşleşen kartınız olmadığında oynayabilirsiniz. Sıradaki oyuncu geçersiz bir +4 kartına itiraz edebilir. Eğer rakip haklıysa, dört kart çekecek olan, onu oynayan kişi olur ve itiraz sırasını kaçırmaz. Ancak rakip hatalıysa, ceza olarak ilk 4 artı ekstra 2 olmak üzere 6 kart çeker."},
RULES_4 ={"Before you discard your penultimate card, you should click the UNO button. If you don't click it in time, the other players can then click the challenge button and you'll automatically draw 2 cards.\n\nThere are additional rules that can appear in some matches. Pay attention to the list of house rules because a new rule can appear! You can click on each rule for further details. Some rules add new cards, while others alter the gameplay in other ways. Have fun!","Antes de você jogar sua penúltima carta, você deve declarar UNO (apertando no botão UNO), caso não faça isso, você deverá comprar duas cartas caso alguém desafie você.\n\nExistem várias outras regras especiais que podem aparecer em algumas partidas. Fique atento no quadro de regras caso apareça uma regra nova.\n\nVocê pode clicar no nome da regra para ver mais detalhes sobre ela. Algumas regras adicionam cartas novas, enquanto outras alteram a forma de jogar. Divirta-se!","","Прежде чем выбросить свою предпоследнюю карту, вам нужно нажать кнопку УНО. Если вы не нажмёте его вовремя, другие игроки могут нажать кнопку за вас, и вы автоматически получите 2 карты..\n\nВ некоторых матчах могут появиться дополнительные правила. Обратите внимание на список домашних правил, потому что может появиться новое правило! Вы можете нажать на каждое правило для получения дополнительной информации. Некоторые правила добавляют новые карты, в то время как другие изменяют игровой процесс другими способами. Веселитесь!","Antes de descartar tu penúltima carta, debes decir UNO (presionando el botón UNO), si no lo presionas deberás tomar 2 cartas en caso de que alguien te de desafio.\n\nExisten reglas especiales que aparecerán en algunas rondas. Puedes informarte sobre las reglas en el muro de reglas (presiona U). Puedes presionar el nombre de una regla para aprender que hace. Algunas reglas añaden nuevas cartas, mientras que otras cambian el modo de juego. ¡Diviértete!","在剩下最後二張卡牌的時候, 你在發牌之前應該先按 UNO 鍵。 如果你在發牌之前沒有按它, 其他的玩家就可以按質疑鍵然後你就會自動被罰兩張卡牌。\n\n在一些遊戲局中也可能會出現額外的規矩。 多點留意左邊的列表因為有機會出現新的自訂規矩哦! 你可以按下每道規矩來查看詳情。 有一些規矩會在牌庫中加入新卡牌, 也有一些會改變遊戲的進程。 總而言之請玩的高興!","Zanim wyrzucisz swoją ostatnią kartę, musisz nacisnąć przycisk UNO, w przypadku kiedy tego nie zrobisz, dostaniesz dwie dodatkowe karty jeśli któryś z graczy cię wyzwie. \n\nSą też specjalne zasady, które mogą pojawić się w niektórych meczach. Bądź czujny i obserwuj tablicę z zasadami. Możesz kliknąć na nazwę zasady żeby zobaczyć więcej szczegółów. Niektóre zasady dodają nowe karty , a inne zmieniają rozgrywkę. Miłej zabawy!","Mielőtt kijátszanád az utolsó előtti kártyád, kattints rá az UNO gombra. Ha nem kattintasz rá időben, a többi játékos rákattinthat a kihívás gombra, és azonnal húzol 2 kártyát.\n\nVannak egyéb szabályok, amelyek megjelenhetnek játékokban. Figyelj oda a házszabályok listájára mert egy új szabály bármikor megjelenhet! Rá tudsz kattintani a szabályokra részletes leírásokért. Néhány szabály új kártyákat ad a játékba, mások különböző módokon változtatják meg a játékot. Jó szórakozást!","Sondan bir önceki kartınızı atmadan önce, UNO düğmesine tıklamalısınız. Zamanında tıklamazsanız, diğer oyuncular itiraz düğmesine tıklayabilir ve otomatik olarak 2 kart çekersiniz. \n\nBazı maçlarda görünebilecek ek kurallar vardır. Ev kuralları listesine dikkat edin çünkü yeni bir kural görünebilir! Daha fazla ayrıntı için her kurala tıklayabilirsiniz. Bazı kurallar yeni kartlar ekler, bazıları ise oyunu başka şekillerde değiştirir. İyi eğlenceler!"},
HOUSE_CHALLENGE ={"No Challenge","Sem Desafiar","Pas de Défi","Нет Вызова","Sin desafiar","不准質疑","Bez wyzwań","Nincs Kihívás","İtiraz Yok"},
HOUSE_CHALLENGE_DESC ={"The wild +4 card can't be challenged anymore.","Os +4 não podem mais ser desafiados.","La carte +4 ne peut plus être défiée.","Чёрная +4 берётся без вызова.","La carta comodín +4 no podrá ser retada."," +4 換色卡牌不能夠再被質疑了。","Wild +4 nie może być więcej Challenge.","A Színválasztó +4-es kártyát nem lehet többé kihívni."," +4 kartına artık itiraz edilemez."},
HOUSE_NO_COMBO ={"No Combo","Sem Combo","Pas de Combo","Нет Комбо","Sin combo","不可累積","Bez Combo","Nincs Kivédés","Kombo Yok"},
HOUSE_NO_COMBO_DESC ={"You can't block drawing cards anymore.","Não é mais possível se defender de cartas de compra.","You can't block drawing cards anymore.","Вы не можете больше блокировать карты +2.","Ya no podrás bloquear cartas sorteadas.","你不能夠再累積罰抽卡牌了。","Nie możesz więcej blokować dobierania kart. ","Nem lehet többé kártyahúzást kivédeni.","Kart çektirme kartlarını engelleyemezsiniz."},
HOUSE_SUPER_COMBO ={"Super Combo","","","Супер Комбо","Supercombo","超級累積","","Szuper Kivédés","Süper Kombo"},
HOUSE_SUPER_COMBO_DESC ={"You can block drawing cards with any card that has a + on it.","É possível se defender de compras de carta com qualquer carta com um +.","You can block drawing cards with any card that has a + on it.","Вы можете блокировать карты картами, у которых есть +.","Podrás bloquear cartas sorteadas con cualquier carta que tenga un + en ella.","你可以用任何有 + 號的卡牌累積罰抽次數。","Możesz blokować karty wyciągając dowolną kartę z +.","Bármilyen + szimbólumot tartalmazó kártyával kivédheted a kártyahúzást.","Üzerinde + olan herhangi bir kartla kart çektirme kartlarını engelleyebilirsiniz."},
HOUSE_HELL ={"Hell","Inferno","Enfer","Ад","Infierno","地獄","Piekło","Pokol","Cehennem"},
HOUSE_HELL_DESC ={"Action cards can be played over any other action card, of any color.","Cartas de ação podem ser jogadas em cima de outras cartas de ação de qualquer cor.","Les cartes action peuvent être jouées au-dessus de n'importe quelle autre carte action, de n'importe quelle couleur.","Карты действий можно положить поверх любой другой карты действий любого цвета.","Cartas de acción podrán ser jugadas sobre cualquier otra carta de acción, de cualquier color.","所有的行動卡牌都可以在上一張行動卡牌發出之後接著發出, 不管是任何顏色。","Kartę akcji można położyć na inną taką kartę, niezależnie od jej koloru.","Az akciókártyák bármely másik akciókártyára lejátszhatók, bármely más színből is.","Aksiyon kartları, herhangi bir renkteki diğer herhangi bir aksiyon kartı üzerinde oynanabilir."},
HOUSE_JUMP_IN ={"Jump-In","Corte","","Прыжок","En-Salto","跳-入","Wskocz","Beugrás","Atlama"},
HOUSE_JUMP_IN_DESC ={"If you have the exact same card that's on the table, you can play it even if it's not your turn.","Se você tiver uma carta idêntica à da mesa, você pode jogá-la mesmo que não seja sua vez!","Si vous avez exactement la même carte que celle sur la table, vous pouvez la jouer même si ce n'est pas votre tour.","Если у вас есть карта, которая на столе, вы можете нажать на свою и заберёте ход на себя","Si tienes exactamente la misma carta que está en la tabla, podrás jugarla aunque no sea tu turno.","如果你有跟在桌面上一模一樣的卡牌, 就算還沒有到你的回合你也可以馬上發出那卡牌。","Jeśli masz dokładnie taką samą kartę, jaka widnieje na stole, możesz położyć ją nawet jeśli nie jest to twoja kolej.","Ha olyan kártyával rendelkezel, amely az asztalon van, akkor kijátszhatod akkor is, ha nem a te köröd van.","Masadaki kartın aynısına sahipseniz, sıranız olmasa bile oynayabilirsiniz."},
HOUSE_CLEAN_FINISH ={"Clean Finish","Final Limpo","Finition Propre","Чистый Финиш","Final Limpio","乾淨俐落","Czysty Koniec","Tiszta Győzelem","Temiz Bitir"},
HOUSE_CLEAN_FINISH_DESC ={"You can only win the game if your last card is a numerical card.","Você só pode vencer o jogo se sua última carta for numérica.","Vous pouvez gagner cette partie uniquement si votre dernière carte est une carte numérique.","Вы можете выиграть игру, только если ваша последняя карта - цифровая.","Sólo podrás ganar el juego si tu última carta es un número.","你最後發出的一張卡牌必須要是數字卡牌才可以勝出遊戲。","Możesz wygrać jeżeli twoja ostatnia karta jest numerem.","Csak akkor nyerhetsz, ha az utolsó kártyád számkártya.","Oyunu yalnızca son kartınız sayısal bir kartsa kazanabilirsiniz."},
HOUSE_MINI ={"Mini","","","Мини","Mínimo","迷你","","",""},
HOUSE_MINI_DESC ={"Everyone starts with 4 cards.","Todos iniciam com 4 cartas.","Tout le monde démarre avec 4 cartes.","Игра начинается с 4 карт.","Todos empiezan con cuatro cartas.","所有人起初的卡牌數量變成 4","Wszyscy startują z 4 kartami","Mindenki 4 kártyával kezd.","Herkes 4 kartla başlar."},
HOUSE_MAXI ={"Maxi","","","Макси","Máximo","最大","","","Maksi"},
HOUSE_MAXI_DESC ={"Everyone starts with 9 cards.","Todos iniciam com 9 cartas.","Tout le monde démarre avec 9 cartes.","Игра начинается с 9 карт.","Todos empiezan con nueve cartas.","所有人起初的卡牌數量變成 9","Wszyscy startują z 9 kartami","Mindenki 9 kártyával kezd.","Herkes 9 kartla başlar."},
HOUSE_SATISFACTION ={"Satisfaction","Satisfação","","Удовлетворение","Satisfacción","心滿意足","Zadowolenie","Elégedettség","Memnuniyet"},
HOUSE_SATISFACTION_DESC ={"You must keep drawing cards until you find a playable card.","Compre cartas até poder jogar uma.","Vous devez continuer à tirer des cartes jusqu'à ce que vous trouviez une carte jouable.","Вы должны продолжать брать карты, пока не найдете нормальную.","Tendrás que estar sorteando cartas hasta que encuentres una carta jugable.","你需要一直抽取卡牌直到抽出一張可以馬上發出的卡牌。","Wyciągaj karty dopóki nie znajdziesz opłacalnej karty.","Addig kell húznod kártyát, amíg kijátszhatót nem találsz.","Oynanabilir bir kart bulana kadar kart çekmeye devam etmelisiniz."},
HOUSE_INSATISFACTION ={"Unsatisfied","Insatisfação","Insatisfaction","Неудовлетворенный","Insatisfecho","不滿意","Niezadowolenie","Kielégítetlen","Tatminsiz"},
HOUSE_INSATISFACTION_DESC ={"When you draw a card, you pass your turn automatically.","Comprar carta fará você passar a vez automaticamente.","Lorsque vous tirez une carte, vous passez votre tour automatiquement.","Когда вы берете карту, вы автоматически пропускаете свой ход.","Cuando sortees una carta pasarás automáticamente de turno.","當你抽取卡牌, 將會自動結束自己的回合。","Kiedy dobierasz kartę twój ruch zostaje przerwany automatycznie.","Ha húzol egy kártyát, azonnal kimaradsz a körből.","Bir kart çektiğinizde, sıranızı otomatik olarak geçersiniz."},
HOUSE_FLASH ={"Flash","Rápido","","Флэш","","閃現","Błysk","Villanás","Flaş"},
HOUSE_FLASH_DESC ={"You only have 5 seconds to play!","São apenas 5 segundos para jogar!","Vous avez uniquement 5 secondes pour jouer!","У вас есть только 5 секунд, чтобы играть!","¡Sólo tienes cinco segundos para escoger!","你只有 5 秒來決定出牌!","To tylko 5 sekund na gre!","Csak 5 másodperced van játszani!","Oynamak için sadece 5 saniyeniz var!"},
HOUSE_REVELATION ={"Revelation","Revelação","Révélation","Откровение","Revelación","泄密","Rewelacja","Jelenés","Vahiy"},
HOUSE_REVELATION_DESC ={"The top card of the deck is visible to everyone.","A carta no topo do baralho é visível para todos.","La carte supérieure de la pioche est visible par tout le monde.","Верхняя карта колоды видна всем.","La carta más alta de la baraja estará visible a todos.","所有人都看的見牌庫中第一張卡牌。","Górna karta z talli jest widoczna dla wszystkich.","A pakli felső kártyája mindenki számára látható.","Destenin en üst kartı herkes tarafından görülebilir."},
HOUSE_PERFECTION ={"Perfection","Perfeccionista","","Совершенство","Perfección","完美主義","Doskonałość","Tökéletesség","Mükemmellik"},
HOUSE_PERFECTION_DESC ={"If you play a number card that is equal to the number of cards in your hand, you can play again.","Se jogar um número igual ao número de cartas na mão, jogue novamente.","Si vous jouez une carte numérique égale au nombre de cartes de votre jeu, vous pouvez rejouer.","Если вы играете цифровой картой, которая равна количеству карт в вашей руке, вы можете играть снова.","Si juegas una carta cuyo número es equivalente al número de cartas que tienes a la mano, tendrás otro turno.","如果你發出的卡牌上的數字跟你持有的卡牌數目一樣, 你可以再發出一張牌。","Jeśli grasz kartą z takim samym numerem jaką trzymasz w ręku zagraj ponownie.","Ha olyan számkártyát játszol amely értéke egyenlő a kezedben lévő kártyák számával, újra játszhatsz.","Elinizdeki kart sayısına eşit numarada kartı oynarsanız, tekrar oynayabilirsiniz."},
HOUSE_TRACKING ={"Tracking","Rastrear","Traçage","Отслеживание","Rastreo","追蹤","Śledzenie","Nyomkövetés","Takip"},
HOUSE_TRACKING_DESC ={"When you draw a card, you get the option to choose one of three cards.","Ao comprar carta, você escolhe uma entre três cartas para comprar.","Lorsque vous piochez une carte, vous avez l'option de choisir une sur trois cartes.","Когда вы берёте карту, вы получаете возможность выбрать одну из трёх карт.","Cuando sortees una carta, tendrás la opción de escoger una de tres cartas.","當你抽取卡牌的時候, 你可以在 3 個選擇中選一個。","Kiedy dobierasz kartę możesz wybrać jedną z pośród trzech podanych. ","Ha egy kártyát húznál, választhatsz három kártya közül.","Bir kart çektiğinizde, üç karttan birini seçme seçeneğine sahip olursunuz."},
HOUSE_MULLIGAN ={"Mulligan","Segunda Chance","","Пересдача","","穆里根","","",""},
HOUSE_MULLIGAN_DESC ={"When the game starts, you can change your hand with a new one.","No início do jogo, você pode trocar sua mão por uma nova.","Lorsque le jeu commence, vous pouvez changer votre jeu avec un autre.","Когда игра начнётся, вы можете сменить свои карты на новые.","Cuando el juego comienze, podrás cambiar tu baraja con una nueva.","在遊戲開始的時候, 你可以選擇把卡組換掉。","Kiedy gra się rozpoczyna, możesz wymienić swoją pulę kart na nową.","Amikor a játék elkezdődik, kicserélheted a kezedben lévő kártyáid újakra.","Oyun başladığında elinizi yenisiyle değiştirebilirsiniz."},
HOUSE_OVERLOAD ={"Overload","Sobrecarga","Surcharge","Перегрузка","Sobrecarga","負荷過多","Przeciążenie","Túltöltődés","Aşırı yükleme"},
HOUSE_OVERLOAD_DESC ={"Players with more than 10 cards get eliminated.","Quem ficar com mais de 10 cartas na mão será eliminado.","Les joueurs avec plus de 10 cartes sont éliminés.","Игроки с более чем 10 картами исключаются.","Jugadores que posean más de diez cartas serán eliminados.","玩家手中卡牌多於 10 就會被淘汰掉。","Gracz mający więcej niż 10 kart, będzie wyeliminowany. ","A több mint 10 kártyával rendelkező játékosok kiesnek a játékból.","10'dan fazla karta sahip oyuncular elenir."},
HOUSE_BLACK ={"Black Cards","Cartas Pretas","Cartes Noires","Чёрные Карты","Cartas Negras","黑色恐怖","Czarne Karty","Fekete Kártyák","Siyah Kartlar"},
HOUSE_BLACK_DESC ={"If you play the exact same card as the top card, it turns into a black one. Only a card with the same number or symbol can be played on it.","Se jogar uma carta idêntica à da mesa, a carta fica com cor preta.","Si vous jouez exactement la même carte que celle du haut, elle devient noire. Seule une carte avec le même numéro ou symbole peut être jouée dessus.","Если вы кладёте ту же карту, какая сверху, она превращается в чёрную. Положить можно только ту, которая имеет такой же символ и номер.","Si juegas exactamente la mimsa carta que está en el tope, se tornará a una negra. Únicamente una carta que contenga el mismo número o símbolo podrá ser jugada sobre ésta.","如果你發出的卡跟桌面上的卡牌一模一樣, 它會變成黑色。之後只可以發出跟黑卡有著一樣的數字或符號的卡牌。","Jeśli zagrasz taką samą kartą jak karta z góry, stanie się czarna.","Ha az asztalon lévő kártyával azonos kártyát játszol ki, feketévé változik. Csak olyan kártya játszható rá, amelyen ugyanaz a szám vagy szimbólum szerepel.","Üstteki kartla aynı kartı oynarsanız, siyah bir karta dönüşür. Üzerinde sadece aynı sayı veya sembole sahip bir kart oynanabilir."},
HOUSE_STACK ={"Stacking","Empilhar","Empilage","Множество","Apilando","堆疊","Układanie","Halmozás","İstifleme"},
HOUSE_STACK_DESC ={"You can play several cards with the same numerical value in one turn.","Você pode jogar várias cartas do mesmo número de uma só vez.","Vous pouvez jouer plusieurs cartes avec la même valeur numérique en un tour.","Вы можете положить несколько карт с одинаковым числами за один ход.","Podrás jugar varias cartas que tengan el mismo valor número en un turno.","你可以在同一個回合裡發出多張同一個數字的卡牌。","Możesz wyłożyć kilka kart z tym samym numerem podczas jednej kolejki.","Egy kör alatt több, ugyanolyan számértékkel rendelkező kártyát játszhatsz.","Tek bir turda aynı sayısal değere sahip birkaç kart oynayabilirsiniz."},
HOUSE_PEACE ={"Peace Card","Carta da Paz","Carte Paix","Мирная Карта","Carta de Paz","和平之卡","Karta Pokoju","Béke Kártya","Barış Kartı"},
HOUSE_PEACE_DESC ={"When you play this card, action cards will have no effect on the next two turns.","Ao jogar esta carta, cartas de ação não terão efeito nos próximos dois turnos.","Lorsque vous jouez cette carte, les cartes action n'auront pas d'effet aux 2 prochains tours.","Когда вы положили эту карту, карты действий не будут работать следующие два хода.","Cuando juegues esta carta, las cartas de acción no tendrán efecto en los siguientes dos turnos.","當你發出這張卡牌之後, 行動卡都會在接下來的兩個回合中失效。","Kiedy zagrasz tą kartą, karty akcji nie będą miały żadnego działania przez kolejne dwie kolejki.","Ha kijátszod ezt a kártyát, az akciókártyák elvesztik a hatásukat két körig.","Bu kartı oynadığınızda, aksiyon kartlarının sonraki iki turda hiçbir etkisi olmayacaktır."},
HOUSE_DEATH ={"Sudden Death Card","Carta da Morte Súbita","Carte Mort Subite","Карта Внезапной Смерти","Carta de Muerte Súbita","暴斃卡牌","Karta Nagłej Śmierci","Hirtelen Halál Kártya","Ani Ölüm Kartı"},
HOUSE_DEATH_DESC ={"After playing this card, anyone who can't play a card or make a mistake will be eliminated.","Após jogar esta carta, quem não puder jogar cartas ou cometer um erro será eliminado.","","","","","","",""},
HOUSE_CAROUSEL ={"Treadmill Card","Carta da Esteira","Carte Tapis roulant","Беговая Дорожка","Carta Cinta","跑步機卡牌","Biegająca Karta","Futópad Kártya","Koşu Bandı Kartı"},
HOUSE_CAROUSEL_DESC ={"When you play this card, everyone passes their cards to the next player.","Ao jogar esta carta, todos passam suas cartas para o próximo jogador.","Lorsque vous jouez cette carte, tout le monde passe ses cartes au joueur suivant.","Когда вы положили эту карту, каждый передает свои карты следующему игроку.","Cuando juegues esta carta, todos pasarán sus cartas al siguiente jugador.","當你發出這卡牌, 所有人會把自己的卡組讓給下一個玩家。","Kiedy zagrasz tą kartą, każdy przekaże swoje karty następnej osobie. ","Ha kijátszod ezt a kártyát, mindenki átadja a kártyáit a következő játékosnak.","Bu kartı oynadığınızda, herkes kartlarını bir sonraki oyuncuya geçirir."},
HOUSE_TRADE ={"Trade Card","Carta da Troca","Carte Échange","Торговая Карта","Carta de Intercambio","交換卡","Wymiana Kart","Csere Kártya","Takas Kartı"},
HOUSE_TRADE_DESC ={"When you play this card, you exchange cards with a player of your choice.","Ao jogar esta carta, escolha um adversário para trocar de cartas com ele.","Lorsque vous jouez cette carte, vous échangez vos cartes avec un joueur de votre choix.","Когда вы положили эту карту, вы обмениваетесь картами с игроком по вашему выбору.","Cuando juegues esta carta, intercambiarás cartas con un jugador a tu elección.","當你發出這卡牌之後, 你可以選擇跟一位玩家來交換卡組。","Używając tej karty możesz dokonać wymiany kartą z innym graczem.","Ha kijátszod ezt a kártyát, kicseréled a kártyáidat egy általad választott játékossal.","Bu kartı oynadığınızda, seçtiğiniz bir oyuncuyla kartlarınızı değiştirirsiniz."},
HOUSE_GIFT ={"Donate Card","Carta da Doação","Carte Don","Пожертвовать Карту","Carta de Donación","捐獻卡","Darowana Karta","Adományozó Kártya","Bağış Kartı"},
HOUSE_GIFT_DESC ={"When you play this card, give a random card from your hand to a player of your choice.","Ao jogar esta carta, escolha um adversário para doar uma carta aleatória para ele.","Lorsque vous jouez cette carte, donnez une carte au hasard de votre jeu à un joueur de votre choix.","Когда вы положили эту карту, отдайте случайную карту из вашей руки игроку по вашему выбору.","Cuando juegues esta carta, de tu baraja le darás una carta a un jugador de tu elección.","當你發出這卡牌之後, 隨機在你卡組中抽一張卡送給一位你選擇的玩家。","Kiedy zagrasz tą kartą, wybierz gracza, któremu dasz jedną losową kartę z twojej puli.","Ha kijátszod ezt a kártyát, egy általad választott játékosnak adsz egy véletlenszerű kártyát a kezedből.","Bu kartı oynadığınızda, seçtiğiniz bir oyuncuya elinizden rastgele bir kart verir."},
HOUSE_BOMB ={"Bomb Card","Carta Bomba","Carte Bombe","Карта-Бомба","Carta Bomba","炸彈卡","Bombowa Karta","Bomba Kártya","Bomba Kartı"},
HOUSE_BOMB_DESC ={"If you draw this card, you get eliminated.","Se comprar esta carta, você perde.","Si vous tirez cette carte, vous êtes éliminé.","Если вы возьмёте эту карту, вы будете устранены.","Si juegas esta carta serás eliminado.","如果你抽到這卡牌, 你就會被淘汰出局。","Jeśli weźmiesz tę kartę, przegrywasz.","Ha kihúzod ezt a kártyát, kiesel a játékból.","Bu kartı çekerseniz, elenirsiniz."},
HOUSE_RANDOM ={"Mysterious Card","Carta Misteriosa","Carte Mystérieuse","Таинственная Карта","Carta Misteriosa","神秘卡牌","Losowa Karta","Titokzatos Kártya","Gizemli Kart"},
HOUSE_RANDOM_DESC ={"This card activates a random effect when played.","Esta carta ativa um efeito aleatório quando jogada.","Cette carte active un effet aléatoire lorsqu'elle est jouée.","Эта карта активирует случайный эффект при игре.","Esta carta activa un efecto aleatorio cuando es jugada.","這張卡牌在發出之後會有隨機的效果。","Ta karta aktywuje losowy efekt kiedy nią zagrasz.","Ha kijátszod ezt a kártyát, egy véletlenszerű hatást aktivál.","Bu kart, oynandığında rastgele bir etkiyi etkinleştirir."},
HOUSE_VIEW ={"Clairvoyance Card","Carta da Clarividência","Carte Clairvoyance","Карта Ясновидения","Carta de Clarividencia","洞察卡牌","Karta Jasnowidza","Tisztánlátó Kártya","Durugörü Kartı"},
HOUSE_VIEW_DESC ={"When you play this card, every other player will reveal a random card of their hand.","Ao jogar esta carta, todos mostram uma de suas cartas.","Lorsque vous jouez cette carte, tous les autres joueurs révèlent une carte aléatoire de leur jeu.","Когда вы положили эту карту, каждый игрок показывает случайную карту своей руки.","Cuando juegues esta carta, cada jugador revelará una carta aleatoria de su baraja.","當你發出這卡牌, 所有其他玩家都會展示出他們卡組中的一張牌。","Kiedy zagrasz tą kartą, inni gracze pokażą jedną kartę ze swojej puli","Ha kijátszod ezt a kártyát, minden más játékos megmutat egy véletlenszerű kártyát a kezében.","Bu kartı oynadığınızda, diğer tüm oyuncular ellerinden rastgele bir kartını gösterir."},
HOUSE_RAIN ={"Rain Card","Carta da Chuva","Carte Pluie","Дождевая Карта","Carta de Lluvia","雨神卡牌","Deszcz Kart","Eső Kártya","Yağmur Kartı"},
HOUSE_RAIN_DESC ={"When you play this card, every other player draws 1 card.","Ao jogar esta carta, seus adversários compram 1 carta.","Lorsque vous jouez cette carte, tous les autres joueurs tirent 1 carte.","Когда вы положили эту карту, каждый игрок берёт одну карту.","Cuando juegues esta carta, cada jugador sorteará una carta.","當你發出這卡牌, 所有其他玩家罰抽一張卡。","Kiedy użyjesz tej karty gracze dobierają po 1 karcie.","Ha kijátszod ezt a kártyát, minden más játékos húz egy kártyát.","Bu kartı oynadığınızda, diğer her oyuncu 1 kart çeker."},
HOUSE_EQUALITY ={"Equality Card","Carta da Igualdade","Carte Égalité","Карта Равенства","Carta de Igualdad","公平卡牌","Karta Równości","Egyenlőség Kártya","Eşitlik Kartı"},
HOUSE_EQUALITY_DESC ={"When you play this card, every player either draws or discards cards until everyone has 3 cards.","Ao jogar esta carta, todos compram ou descartam até terem 3 cartas.","Lorsque vous jouez cette carte, tous les joueurs chaque joueur tire ou défausse des cartes jusqu'à ce que tout le monde ait 3 cartes.","Когда вы положили эту карту, каждый игрок либо тянет, либо сбрасывает карты, пока у всех не будет 3 карты.","Cuando juegues esta carta, cada jugador sorteará o descartará hasta que todos tengan tres cartas.","當你發出這卡牌, 所有人會抽取或棄置卡牌直到卡組只剩下 3 張卡牌。","Jeśli zagrasz tą kartą każdy gracz dobiera lub schodzi do 3 kart.","Ha kijátszod ezt a kártyát, minden játékos addig húz vagy dob el kártyákat, míg 3 kártyája nem lesz.","Bu kartı oynadığınızda, artarak veya azalarak herkes anında 3 kart olur."},
HOUSE_CHAIRS ={"Dancing Chairs Card","Carta da Dança","Cartes Chaises Musicales","Карта 'Танцующие стулья'","Carta de Sillas Danzantes","舞動椅子卡牌","Karta Tańczące Fotele","Táncoló Székek Kártya","Dans Eden Sandalyeler Kartı"},
HOUSE_CHAIRS_DESC ={"When you play this card, all the other players' chairs randomly change positions.","Ao jogar esta carta, seus adversário trocam de posições aleatoriamente.","Lorsque vous jouez cette carte, les chaises des autres joueurs changent de position.","Когда вы положили эту карту, все стулья других игроков случайным образом меняют позиции.","Cuando juegues esta carta, todas las sillas de los jugadores cambiarán de lugares aleatoriamente.","當你發出這卡牌, 所有其他玩家的位置都會隨機改變。","Kiedy zagrasz tą kartą, inni gracze zmienią swoje krzesła.","Ha kijátszod ezt a kártyát, minden más játékos széke véletlenszerűen helyet cserél.","Bu kartı oynadığınızda, diğer tüm oyuncuların sandalyeleri rastgele yer değiştirir."},
HOUSE_IMITATE ={"Emote Card","Carta da Emoção","Carte Émote","Карта Эмоций","Carta de Emote","表情卡","Karta Emotka","Érzelem Kártya","İfade Kartı"},
HOUSE_IMITATE_DESC ={"When you play this card, everyone must perform the emote being shown. The last player to do so, draws 2 cards.","Ao jogar esta carta, todos devem imitar uma emoção mostrada. Quem imitar por último compra 2 cartas.","Lorsque vous jouez cette carte, tout le monde doit jouer l'émote montré. Le dernier joueur à le faire, tire 2 cartes.","Когда вы положили эту карту, каждый должен выполнить показанную эмоцию. Последний игрок, который сделает это, берёт 2 карты.","Cuando juegues esta carta, todos deberán realizar el emote que se mostrará. El último jugador en hacerlo recibirá dos cartas.","當你發出這卡牌之後, 所有人必須跟著做出顯示著的表情。 最後兩個做出正確表情的玩家會被罰抽 2 張卡牌。","Kiedy zagrasz tą kartą, inni każdy musi zachowywać się tak, jak emotka pokazała. Kto zrobi to ostatni, dostaje dwie dodatkowe karty.","Ha kijátszod ezt a kártyát, mindenkinek ki kell fejeznie a megjelenített érzelmet. Az utolsó játékos húz 2 kártyát.","Bu kartı oynadığınızda, herkesin gösterilen ifadeyi gerçekleştirmesi gerekir. Bunu yapan son oyuncu 2 kart çeker."},
HOUSE_MEEP ={"Meep! Card","Carta do Meep!","Carte Meep!","Карта 'Meep!'","Carta de ¡Meep!","Meep! 卡牌","Karta Meep","Meep! Kártya","Meep! Kart"},
HOUSE_MEEP_DESC ={"When you play this card, you gain the Meep power!","Ao jogar esta carta, você ganha o poder do Meep!","Lorsque vous jouez cette carte, vous gagnez le pouvoir de Meep!","Когда вы разыгрываете эту карту, вы получаете силу Meep!","¡Cuando juegues esta carta, obtendrás el poder del Meep!","當你發出這卡牌之後, 你會得到 Meep 的能力!","Kiedy użyjesz tej karty możesz władać meepem!","Ha kijátszod ezt a kártyát, megkapod a Meep erőt.","Bu kartı oynadığınızda, Meep gücünü kazanırsınız!"},
HOUSE_NO_ACTION ={"No Action","Sem Ação","Pas d'Action","Бездействие","No Acción","沒有動力","Bez Akcji","Nincs Akció","Aksyon Yok"},
HOUSE_NO_ACTION_DESC ={"The deck consists only of numerical and wild cards.","O baralho é formado apenas por números e curingas.","La pioche consiste uniquement en cartes numériques et noires.","Колода состоит только из цифровых и чёрных карт.","El mazo consistirá solamente de cartas númericas y cartas comodín.","整個卡庫只有數字跟換顏色卡牌。","W tej rozgrywce udział biorą tylko karty z numerami i karty wild.","A pakli csak szám- és Színválasztó kártyákat tartalmaz.","Deste yalnızca sayısal ve renk değiştirme kartlarından oluşur"},
HOUSE_CAMOUFLAGE ={"Camouflage","Camuflagem","","Маскировка","Camuflage","偽裝","Kamuflaż","Álca","Kamuflaj"},
HOUSE_CAMOUFLAGE_DESC ={"You can't see anyone's number of cards until they have only 1 card left.","Você não enxerga quantas cartas seus adversários tem até que fiquem com 1 carta.","Vous ne pouvez pas voir le nombre de cartes des autres joueurs jusqu'à ce qu'ils en aient qu'une.","Вы не можете видеть чьё-либо количество карт, пока у них не останется только 1 карта.","No podrás ver el número de cartas de nadie hasta que solamente tenga una carta.","你不會看到其他人卡組裡有多少卡牌直到他們剩下最後 1 張卡。","Nie możesz zobaczyć ile kart ma twój przeciwnik dopóki nie zostanie z jedną kartą.","Nem látod mások kártyáinak számát, amíg csak egy kártyájuk nem lesz.","Sadece 1 kartı kalana kadar kimsenin kart sayısını göremezsiniz."},
HOUSE_ADD_RULE ={"Rule Card","Carta da Regra","Carte Règle","Карта Правил","Carta de Regla","規矩卡牌","Karta Zasad","Házszabály Kártya","Kural Kartı"},
HOUSE_ADD_RULE_DESC ={"When you play this card, add a new rule to the current round.","Ao jogar esta carta, adicione uma nova regra à partida atual.","Lorsque vous jouez cette carte, une nouvelle règle est rajoutée au tour actuel.","Когда вы положили эту карту, добавьте новое правило в текущий раунд.","Cuando juegues esta carta, añadirá una nueva regla a la ronda actual.","當你發出這卡牌之後, 將會馬上新增一道自訂規矩。","Kiedy zagrasz tą kartą wprowadzasz nową zasadę do aktualnej rundy.","Ha kijátszod ezt a kártyát, válassz egy új szabályt ehhez a játékhoz.","Bu kartı oynadığınızda, mevcut tura yeni bir kural eklenir."},
HOUSE_TIME ={"Reduced Time","Tempo Reduzido","Temps Réduit","Сокращенное Время","Tiempo Reducido","時間緊湊","Redukcja Czasu","Csökkentett Idő","Azaltılmış Süre"},
HOUSE_TIME_DESC ={"After 6 minutes, the player whose hand is worth the least points wins.","Após 6 minutos, vence quem tiver menos pontos na mão.","Après 6 minutes, le joueur dont le jeu vaut le moins de points gagne.","Через 6 минут выигрывает игрок, в чьей руке меньше всего карт.","Después de seis minutos, el jugador cuya baraja valga menos puntos gana.","6 分鐘過後, 手中卡組分數總和最少的玩家會勝出遊戲。","Po upływie 6 minut zwycięzca otrzyma mniej punktów.","6 perc után az a játékos nyer, akinek a kezében lévő kártyák értéke a legkevesebb.","6 dakikanın sanonunda puanı en düşük olan oyuncu oyunu kazanır."},
HOUSE_CHESS ={"Mad Chess","Xadrez Maluco","Chéquiers fous","Безумные Шахматы","Tablero Loco","瘋狂象棋","Szalone Szachy","Őrült Sakk","Deli Satranç"},
HOUSE_CHESS_DESC ={"If you play a chess piece over another piece, activate the previous piece's effect. <b><a href='event:chess'>Click here</a></b> to see the various effects.","Se você jogar uma peça de xadrez em cima de outra peça, ative o efeito da peça anterior. <b><a href='event:chess'>Clique aqui</a></b> para ver os efeitos.","Si vous jouez une pièce d'échecs sur une autre pièce, ça active l'effet de la pièce précédente. <b><a href='event:chess'>Cliquez ici</a></b> pour voir les différents effets.","Если вы играете шахматными фигурами, активируйте эффект предыдущей. <b><a href='event:chess'>Нажмите здесь</a></b> чтобы увидеть различные эффекты.","Si juegas una pieza sobre otra pieza, activará el efecto anterior de la pieza. <b><a href='event:chess'>Cliquea aquí</a></b> para ver los diferentes efectos.","如果你在有象棋圖案的卡牌上再發一張, 就會激活前一張卡牌象棋上的效果。 <b><a href='event:chess'>點這裡</a></b> 查看不同的象棋效果。","Jesli zagrasz fragmentem szach nad innym takim fragmentem, aktywujesz efekt poprzedniego fragmentu. <b><a href='event:chess'>Kliknij tutaj</a></b> by zobaczyć różne efekty.","Ha egy sakkbábút játszol egy másik sakkbábúra, aktiváld az előző képességét. <b><a href='event:chess'>Kattints ide</a></b> hogy lásd a különböző hatásokat.","Satranç taşını başka bir taş üzerinde oynarsanız, önceki taşın etkisini etkinleştirir Çeşitli efektleri görmek için <b><a href='event:chess'>buraya tıklayın.</a></b>"},
HOUSE_STEAL ={"Recycling Card","Carta da Reciclagem","Carte Recyclage","Карта Переработки","Carta de Reciclaje","回收卡牌","Karta Recyklingu","Újrahasznosító Kártya","Geri Dönüşüm Kartı"},
HOUSE_STEAL_DESC ={"When you play this card, every other player discards 1 action card, provided they own one, then draws 1 card.","Ao jogar esta carta, todos os outros descartam uma carta de ação aleatória e compram 1 carta para repor.","Lorsque vous jouez cette carte, tous les autres joueurs se défaussent d'une carte action, à condition qu'ils en possèdent une, puis tirent une carte.","Когда вы положили эту карту, каждый игрок сбрасывает 1 карту действия, если у него она есть, а затем берет 1 карту.","Cuando jugues esta carta, cada jugador descartará una carta de acción y sorteara una carta provicionada de las que tenían.","當你發出這卡牌, 所有其他的玩家如果手上擁有功能卡牌都會被逼丟棄 1 張, 然後再抽回 1 張卡。","Kiedy zagrasz tą kartą, każdy inny gracz odrzuca 1 kartę akcji i dobiera kartę pod warunkiem, że są własne.","Ha kijátszod ezt a kártyát, minden játékos eldob 1 akciókártyát, ha van neki, majd húz 1 kártyát.","Bu kartı oynadığınızda, diğer oyuncular eğer sahiplerse 1 aksyon kartı atarlar ve ardından 1 kart çekerler."},
HOUSE_HARD ={"Hard Mode","Modo Rigoroso","Mode Difficile","Сложный Режим","Modo Difícil","困難模式","Tryb Trudny","Nehéz Mód","Zor Mod"},
HOUSE_HARD_DESC ={"If you click on an invalid card, you draw 1 card and lose your turn. You draw 4 cards when challenged for not saying UNO.","Clicar em carta errada faz passar a vez. Não falar UNO faz comprar 4 cartas.","Si vous cliquez sur une carte invalide, vous tirez une carte et passez votre tour. Vous tirez 4 cartes si vous avez été défié pour ne pas avoir dit UNO.","Если вы нажмете на недействительную карту, вы берёте 1 карту и теряете свой ход. Вы берете 4 карты, когда за вас нажимают УНО.","Si das clic en una carta inválidad perderás tu turno. Si eres desafiado por no haber dicho UNO, recibirás cuatro cartas.","如果你點錯了一張不適合發出的卡牌, 你會被罰抽 1 張卡然後失去你的回合。而當你忘記了說 UNO 的時候又剛好被別人質疑, 你會被罰抽 4 張卡。","Jeśli klikniesz niewłaściwą kartę przeczekaj swoją kolejkę. Jeśli zostałeś wyzwany bo nie powiedziałeś UNO dobierasz 4 karty.","Ha a kezedben nem megfelelő kártyára kattintasz, húznod kell 1 kártyát és kimaradsz a körből. 4 kártyát húzol ha kihívnak, mert nem mondtál UNO-t.","Geçersiz bir karta tıklarsanız, 1 kart çekersiniz ve sıranızı kaybedersiniz. UNO demediğin için itiraz edildiğinde 4 kart çekersiniz."},
HOUSE_FAST_DRAW ={"Fast Drawing","Compra Rápida","Tirage Rapide","Быстрая Взятка","Sorteo Rápido","快速抽取","Szybkie Dobieranie","Gyors Húzás","Hızlı Kart Çekme"},
HOUSE_FAST_DRAW_DESC ={"Drawn cards are played immediately (unless they are drawn due to a penalty).","Cartas compradas são jogadas imediatamente (exceto por penalidades).","Les cartes tirées sont jouées automatiquement (à moins qu'elles ne soient tirés en raison d'une pénalité).","Вытащенные карты ставятся сразу (если они не вытянуты из-за штрафа).","Las cartas sorteadas son jugadas inmediatamente (a menos de que sean sorteadas por penalización).","你抽出的卡牌會馬上被發出 (除非那是罰抽的卡牌) 。","Dobrane karty są grane natychmniast (chyba, że są pobrane z powodu kary).","A felhúzott kártyák azonnal kijátszásra kerülnek (kivéve ha más kártya által, vagy büntetésből lettek húzva).","Çekilmiş kartlar hemen oynanır (ceza nedeniyle çekilmedikçe)."},
HOUSE_THUNDER ={"Thunder Card","Carta do Trovão","Carte Tonnerre","Громовая Карта","Carta Relámpago","雷電暴擊卡牌","Karta Grzmotu","Mennydörgés Kártya","Yıldırım Kartı"},
HOUSE_THUNDER_DESC ={"When you play this card, two random players draw 1-5 cards.","Ao jogar esta carta, dois jogadores aleatórios compram de 1 a 5 cartas.","Lorsque vous jouez cette carte, 2 joueurs aléatoires tirent de 1 à 5 cartes.","Когда вы положили эту карту, два случайных игрока берут 1-5 карт.","Cuando juegues esta carta, dos jugadores aleatorios sortearán de una a cinco cartas.","當你發出這卡, 隨機兩個玩家會被罰抽 1-5 張卡牌。","Kiedy zagrasz tą kartą, dwoje losowych graczy dobierze 1-5 kart.","Ha kijátszod ezt a kártyát, két véletlenszerű játékos felhúz 1-5 kártyát.","Bu kartı oynadığınızda, rastgele iki oyuncu 1-5 kart çeker."},
HOUSE_CLONE ={"Cloning Card","Carta da Clonagem","Carte Clone","Карта-Клон","Carta de Clonación","複製卡牌","Karta Klonowania","Másoló Kártya","Klonlama Kartı"},
HOUSE_CLONE_DESC ={"This card activates the same effect as the previous card.","Esta carta ativa o mesmo efeito da carta anterior.","Cette carte active les mêmes effets que la carte précédente.","Эта карта активирует тот же эффект, что и предыдущая карта.","Esta carta activa el mismo efecto de la carta anteriormente usada.","這張卡發出了之後會跟上一張卡有著一樣的效果。","Ta karta uaktywnia ten sam efekt co poprzednio zagrana karta.","Ha kijátszod ezt a kártyát, az előző kártya hatásait aktiválja.","Bu kart, önceki kartla aynı etkiyi etkinleştirir."},
HOUSE_WEB ={"Web Card","Carta da Teia","Carte Toile d'Araignée","Паучья Карта","Carta Telaraña","蜘蛛網卡牌","Karta Sieci","Háló Kártya","Web Kartı"},
HOUSE_WEB_DESC ={"When you play this card, chose a player who will miss their next turn.","Ao jogar esta carta, escolha um jogador para ficar 1 turno sem jogar.","Lorsque vous jouez cette carte, choisissez un joueur qui loupera son tour.","Когда вы положили эту карту, выбирайте игрока, который пропустит свой следующий ход.","Cuando juegues esta carta, podrás elegir un jugador para que pierda su siguiente turno.","當你發出這卡牌, 選擇一個玩家使他失去下一回合。","Jeśli zagrasz tą kartą, wybierz gracza, który straci następną kolejkę.","Ha kijátszod ezt a kártyát, válassz egy játékost, aki kimarad a körből.","Bu kartı oynadığınızda, bir sonraki sırasını kaçıracak bir oyuncu seçin."},
HOUSE_SHINY ={"Shiny Hand","Mão Brilhante","Main Brillante","Блестящая Рука","Baraja Reluciente","閃爍小手","Błyszcząca Dłoń","Fényes Kártyák","Parlak El"},
HOUSE_SHINY_DESC ={"Players holding a wild card or at least one card of each color will have their hand highlighted.","Quem tiver um curinga ou as 4 cores na mão ficará com o número de cartas com cor branca.","Les joueurs ayant une carte noire ou au moins une carte de chaque couleur auront leur jeu en surbrillance.","Игроки, имеющие чёрные карты или хотя бы одну карту каждого цвета, будут подсвечены.","Jugadores teniendo a la mano una carta comodín o al menos una carta de cada color tendrán su baraja brillando.","手上持有換色卡牌或每個顏色的卡牌都有至少一張的時候, 手中的卡牌會發白光標示。","Gracze posiadający Kartę Wild lub przynajmniej jedną kartę z każdego koloru, będą mieli podświetloną rękę.","Azok kártyái, akik vagy Színváltó kártyát, vagy a négy színből legalább egy-egy kártyát tartanak a kezükben, kiemelődnek fehérrel.","Bir renk kartına veya her renkten en az bir karta sahip olan oyuncuların elleri vurgulanacaktır."},
HOUSE_SEQUENCE ={"Sequence","Sequência","Séquence","Последовательность","Secuencia","排列","Sekwencja","Sorozat","Sekans"},
HOUSE_SEQUENCE_DESC ={"You can play several cards of the same color, as long as they form a numerical sequence.","Você pode jogar várias cartas da mesma cor, desde que formem uma sequência numérica.","Vous pouvez jouer plusieurs cartes de la même couleur, à condition qu'elles forment une séquence numérique.","Вы можете положить несколько карт одного цвета, если они образуют числовую последовательность.","Podrás jugar varias cartas del mismo color, siempre y cuando formen una secuencia numérica.","你可以連續發出幾張一樣顏色的卡牌, 只要它們能夠組成數字順序。","Możesz zagrać kilka kart o tym samym kolorze, pod warunkiem, że tworzą sekwencję liczbową.","Egy körben több azonos színű kártyát játszhatsz, ha számtani sorozatot alkotnak.","Sayısal bir sıra oluşturdukları sürece aynı renkteki birkaç kartı oynayabilirsiniz."},
HOUSE_LUCK ={"Luck Card","Carta da Sorte","Carte Chance","Карта Удачи","Carta de la Suerte","幸運卡牌","Karta Szczęścia","Szerencse Kártya","Şans Kartı"},
HOUSE_LUCK_DESC ={"When you play this card, you can choose the next card that you draw (unless it's due to a penalty).","Ao jogar esta carta, escolha a próxima carta que você comprar (a menos que seja por penalidade).","Lorsque vous jouez cette carte, vous pouvez choisir la prochaine carte que vous tirerez (à moins qu'elles ne soient tirés en raison d'une pénalité).","Когда вы положили эту карту, в следующем ходу можете выбрать карту, которую хотите (если это не из-за штрафа).","Cuando juegues esta carta, podrás elegir la siguiente carta que sortees (a menos de que sea por penalización).","當你發出這卡牌的時候, 你可以選擇下一張你要抽取的卡牌 (除非是被罰抽卡牌)。","Grając tą kartą możesz wybrać następną kartę, którą dobierzesz (chyba, że jest to kara)","Ha kijátszod ezt a kártyát, kiválaszthatod mi legyen a következő húzásod (kivéve ha más kártya által, vagy büntetésből lett húzva).","Bu kartı oynadığınızda, çekeceğiniz bir sonraki kartı seçebilirsiniz (ceza olmadığı sürece)."},
HOUSE_BOX ={"Gift Card","Carta do Presente","Carte Cadeau","Подарочная Карта","Carta de Regalo","禮物卡","Karta Prezent","Ajándék Kártya","Hediye kartı"},
HOUSE_BOX_DESC ={"When you play this card, everyone gains a Mysterious Card, which activates a random effect.","Ao jogar esta carta, todos ganham uma Carta Misteriosa, que ativa um efeito aleatório.","Lorsque vous jouez cette carte, tout le monde gagne une Carte Mystérieuse, qui active un effet aléatoire.","Когда вы положили эту карту, каждый получает Таинственную Карту, которая активирует случайный эффект.","Cuando juegues esta carta, todos obtendrán una Carta Misteriosa.","當你發出這卡, 所有人會得到一張神秘卡牌, 它會有隨機效果。","Kiedy zagrasz tą kartą, każdy otrzymuje Losową Kartę, która aktywuje losowy efekt.","Ha kijátszod ezt a kártyát, minden játékos kap egy Titokzatos Kártyát, amely véletlenszerű hatást aktivál.","Bu kartı oynadığınızda, herkes rastgele bir etkiyi etkinleştiren bir Gizemli Kart kazanır."},
HOUSE_WISH ={"Wish Card","Carta do Desejo","Carte de Vœux","Карта Желаний","Carta de Deseo","許願卡","Karta Życzenie","Kívánság Kártya","Dilek Kartı"},
HOUSE_WISH_DESC ={"When you play this card, you exchange a random card from your hand with one from the discard pile.","Ao jogar esta carta, troque uma carta aleatória da sua mão por uma da pilha de descartes.","Lorsque vous jouez cette carte, vous échangez une carte aléatoire de votre jeu avec une carte de la défausse.","Когда вы положили эту карту, вы меняете случайную карту из вашей руки на одну из колоды сброса.","Cuando juegues esta carta, intercambiarás una carta aleatoria de tu baraja por otra de la pila de descarte.","當你發出這卡牌, 你可以在手中選一張卡跟已出牌的卡交換。","Kiedy zagrasz tą kartą, wymieniasz losową kartę na jedną ze stosu kart odrzuconych.","Ha kijátszod ezt a kártyát, kicserélhetsz egy véletlenszerű kártyát a kezedben egyre a kijátszott kártyák közül","Bu kartı oynadığınızda, elinizdeki rastgele bir kartı atılan destedeki bir kartla değiştirirsiniz."},
HOUSE_TEAM ={"Team Match","Jogo em Duplas","Parties en Équipe","Командный Матч","En Equipos","團隊模式","Runda Drużynowa","Csapatmérkőzés","Takım Maçı"},
HOUSE_TEAM_DESC ={"Each player has a partner. If one of them wins, both players win.","Cada jogador tem uma dupla. Se um vencer, a equipe toda vence.","Chaque joueur a un coéquipier. Si un des deux gagne, les deux remportent la partie.","У каждого игрока есть партнёр. Если один из них выигрывает, выигрывают оба игрока.","Cada jugador tiene un compañero. Si uno de ellos gana, ambos ganan.","每一個玩家都有搭檔。 如果其中一人勝了, 兩人都會獲勝。","Każdy gracz ma partnera. Jeśli jeden z nich wygra, oboje wygrywają.","Minden játékos rendelkezik egy csapattárssal. Ha bármelyikük nyer, mindketten nyernek.","Her oyuncunun bir ortağı vardır. İçlerinden biri kazanırsa, her iki oyuncu da kazanır."},
HOUSE_PORTAL ={"Portal Card","Carta do Portal","Carte Portail","Карта-Портал","Carta Portal","傳送門","Karta Portal","Portál Kártya","Portal Kartı"},
HOUSE_PORTAL_DESC ={"Two matches are taking place at the same time. Play this card to switch between them.","Duas partidas estão acontecendo ao mesmo tempo. Jogue esta carta para alternar entre elas.","","Два матча проходят одновременно. Положите эту карту, чтобы переключаться между ними.","Dos rondas están tomando lugar a la vez. Juega esta carta para cambiar entre ellas.","兩場遊戲同時在進行。發出這卡來進行兩組卡組的替換。","Dwie rozgrywki odbywają się w tym samym czasie. Zagraj tą kartą, aby przełączyć się między nimi.","Két játék vesz részt párhuzamosan. Ha kijátszod ezt a kártyát, válthatsz köztük.","Aynı anda iki maç yapılıyor. Aralarında geçiş yapmak için bu kartı oynayın."},
HOUSE_INK ={"Ink Card","Carta da Tinta","Carte Encre","Чернильная Карта","Carta de Tinta","墨水卡牌","Karta Atrament","Tinta Kártya","Mürekkep Kartı"},
HOUSE_INK_DESC ={"When you play this card, every colored card on the next player's hand turns the color of your ink card.","Ao jogar esta carta, pinte todas as cartas do próximo jogador com a cor desta carta.","Lorsque vous jouez cette carte, chaque carte de couleur dans le jeu du joueur suivant va prendre la couleur de votre Carte Encre.","Когда вы положили эту карту, каждая цветная карта следующего игрока закрашивается в определённый цвет.","Cuando juegues esta carta, usarás su color para colorear la siguiente carta de todos los jugadores.","當你發出這卡, 下一個玩家手上所有有顏色的卡牌都會變成你發出的墨水卡牌的顏色。","Kiedy zagrasz tą kartą, użyjesz jej koloru, aby pokolorować wszystkie karty następnego gracza.","WHa kijátszod ezt a kártyát, a következő játékos minden kártyájának színe a Tinta Kártyád színévé változik.","Bu kartı oynadığınızda, bir sonraki oyuncunun elindeki her renkli kart mürekkep kartınızın rengi ile değiştirir."},
HOUSE_CONFUSE ={"Confusion Card","Carta da Confusão","Carte Confusion","Карта-Путаница","Carta de Confusión","迷惑卡牌","Karta Zguba","Zavarodottság Kártya","Karışıklık Kartı"},
HOUSE_CONFUSE_DESC ={"When you play this card, you will play a random card on your next turn.","Ao jogar esta carta, você jogará de forma aleatória no próximo turno.","Lorsque vous jouez cette carte, vous jouerez une carte aléatoire au tour suivant.","Когда вы положили эту карту, за вас положат случайную карту на следующем ходу.","Cuando juegues esta carta, jugarás una carta aleatoria en tu siguiente turno.","當你發出這卡牌, 你會在下一個回合隨機發出一張卡。","Kiedy zagrasz tą kartą, użyjesz losowej karty w twojej następnej kolejce.","Ha kijátszod ezt a kártyát, a következő körben véletlenszerű kártyát fogsz kijátszani.","Bu kartı oynadığınızda, bir sonraki sıranızda rastgele bir kart oynayacaksınız."},
HOUSE_TREASURE ={"Search Card","Carta da Busca","Carte Recherche","Карта Поиска","Carta de Búsqueda","搜尋卡牌","Karta Wyszukiwania","Kincskereső Kártya","Arama Kartı"},
HOUSE_TREASURE_DESC ={"When you play this card 3 times, you receive the Treasure Card. When you play that one, you automatically win the game.","Ao jogar esta carta 3 vezes, receba a Carta do Tesouro, que faz você vencer o jogo.","Lorsque vous jouez cette carte, vous recevez la Carte au Trésor. Lorsque vous jouez celle-ci, vous gagnez automatiquement la partie.","Когда вы положили эту карту 3 раза, вы получаете карту сокровищ. Когда вы положите её, вы автоматически выигрываете игру.","Cuando juegues tres veces esta carta, recibirás la Carta del Tesoro, y ganarás el juego.","當你發出這卡 3 次, 你會得到寶藏卡牌。 當你發出寶藏卡牌, 你就會自動勝出遊戲。","Kiedy zagrasz tą kartą 3 razy, zyskasz Kartę Skarbu, którą zapewnisz sobie zwycięstwo.","Ha kijátszod ezt a kártyát háromszor, megkapod a Kincskártyát, amelyet kijátszva azonnal megnyered a játékot.","Bu kartı 3 kez oynadığınızda Hazine Kartı alırsınız. Bunu oynadığınızda, oyunu otomatik olarak kazanırsınız."},
HOUSE_NEIGHBOR ={"Neighbor","Vizinho","Voisin","Сосед","Vecino","鄰居","Sąsiad ","Szomszéd","Komşu"},
HOUSE_NEIGHBOR_DESC ={"Cards of equal numerical value no longer match. They only match cards of a value either higher or lower by 1.","Números iguais não combinam mais. Números só combinam com um número acima ou abaixo.","Les cartes de même valeur numérique ne correspondent plus. Elles ne correspondent qu'aux cartes d'une valeur supérieure ou inférieure de 1.","Карты с одинаковым числовым значением больше не совпадают. Они соответствуют только картам, стоимость которых выше или ниже на 1.","Cartas de valor número igual no podrán ser jugadas. Solo podrán ser jugadas cartas con un valor mayor o menor por uno.","卡牌上的數字不再相符合。 它們只對應原本的數字加及減 1 後的數值。","Karty o równej wartości już nie pasują. Pasują tylko karty o wartości większej lub mniejszej o 1.","Az azonos számértékű kártyák nem játszhatóak egymásra. Csak olyan számértéket lehet rájuk játszani, amely kisebb vagy nagyobb 1-el.","Eşit sayısal değerlere sahip kartlar yerine 1 puan yüksek veya düşük sayısal değer kullanılabilir."},
HOUSE_MESS ={"Mess","Bagunça","Bazar","Беспорядок","Tablero","大混亂","Bałagan","Zűrzavar","Karmakarışık"},
HOUSE_MESS_DESC ={"The deck consists only of action cards.","O baralho é formado apenas por cartas de ação.","Le jeu se compose uniquement de cartes action.","Колода состоит только из карт действий.","La baraja consiste solamente de cartas de acción.","整個牌庫只有行動卡牌。","Talia składa się tylko z kart akcji.","A pakli csak akciókártyákat tartalmaz.","Deste yalnızca aksiyon kartlarından oluşur."},
HOUSE_BATATA ={"Potato Card","Carta da Batata","Carte Patate","Картофельная Карта","Carta de Papa","馬鈴薯卡牌","Karta Ziemniak","Burgonya Kártya","Patates Kartı"},
HOUSE_BATATA_DESC ={"When you play this card, put it in a player's hand. Whoever keeps this card in hand for 5 turns will be eliminated.","Ao jogar esta carta, coloque-a na mão de um jogador. Quem ficar com esta carta na mão por 5 turnos perde.","Lorsque vous jouez cette carte, vous échangez une carte aléatoire de votre jeu avec une de la défausse.","Когда вы положили эту карту, кладите её в руку игрока. Тот, кто держит эту карту в руке в течение 5 ходов, будет уничтожен.","Cuando juegues esta carta, le darás a la baraja de un jugador aleatorio una Carta de Papa. Si te quedas con la carta en tu baraja por cinco turnos, serás eliminado.","當你發出這卡, 把它放到一個玩家手中的牌裡。 只要有人把馬鈴薯卡留在手裡超過 5 輪就會被淘汰。","Kiedy zagrasz ta kartą, dajesz Kartę Ziemniaka graczowi. Jeśli będziesz trzymał Kartę Ziemniaka przez 5 rund, zostaniesz wyeliminowany. ","Ha kijátszod ezt a kártyát, válassz egy játékost akinek a kezébe kerül. Akinek ez a kártya 5 körig a kezében marad, az kiesik a játékból.","Bu kartı oynadığınızda, bir oyuncunun eline koyun. Bu kartı elinde 5 tur tutan elenecek."},
HOUSE_CURSE ={"Curse Card","Carta da Maldição","Carte Malédiction","Проклятие Карты","Carta de Maldición","詛咒卡","Karta Przekleństwa","Átok Kártya","Lanetli Kart"},
HOUSE_CURSE_DESC ={"When you play this card, inflict a random curse to everyone for a few turns.","Ao jogar esta carta, aplique uma maldição aleatória que dura alguns turnos.","Lorsque vous jouez cette carte, une malédiction aléatoire est infligée à tout le monde pendant quelques tours.","Когда вы положили эту карту, наложите на всех случайное проклятие на несколько ходов.","Cuando juegues esta carta, aplicará una maldición que afectará unos cuantos turnos.","當你發出這卡, 將會在所有人身上施以隨機一個持續幾個回合的詛咒。","Kiedy zagrasz tą kartą, zastosuj wybraną klątwę, która będzie trwać przez kilka kolejek.","Ha kijátszod ezt a kártyát, néhány körre mindenkit átok sújt.","Bu kartı oynadığınızda, birkaç tur için herkese rastgele bir lanet verin."},
HOUSE_LIMBO ={"Limbo","","Limbes","Лимбо","","林波舞","Otchłań","Limbó",""},
HOUSE_LIMBO_DESC ={"Whoever exceeds the limit of cards in hand will be eliminated. The limit starts at 12 cards and reduces by 1 every minute.","Quem ultrapassar o limite de cartas na mão será eliminado. O limite começa em 12 e reduz em 1 a cada minuto.","Quiconque dépasse la limite des cartes en main sera éliminé. La limite commence à 12 cartes et diminue de 1 toutes les minutes.","Тот, кто превысит лимит карт в руке, будет удалён. Лимит начинается с 12 карт и уменьшается на 1 каждую минуту.","Cualquiera que exceda el límite de cartas en baraja será eliminado. El límite empieza con doce cartas y se le va restando una por cada minuto que pasa.","只要有人手中持有的卡牌數量超過上限就會被淘汰。 上限起初是 12 張卡然後每一分鐘將會減少 1 張。","Ktokowiek przekroczy limit kart w ręce zostanie wyeliminowany.  Limit zaczyna się od 12 kart i zmniejsza się o 1 co minutę.","Aki túllépi a kézben tartható kártyák határát, az kiesik a játékból. A határ 12 kártyával indul, és percenként csökken 1-el.","Eldeki kart limitini aşan elenecektir. Limit 12 karttan başlar ve her dakika 1 azalır."},
HOUSE_MAGNET ={"Magnet Card","Carta do Imã","Carte Magnétique","Карта-Магнит","Carta Magnética","磁力卡牌","Magnetyczna Karta","Mágnes Kártya","Mıknatıs Kartı"},
HOUSE_MAGNET_DESC ={"When you play this card, discard every card that has your magnet card's color.","Ao jogar esta carta, descarte todas as cartas da mesma cor que esta.","Lorsque vous jouez cette carte, vous déffaussez toutes les cartes qui ont la couleur de votre carte magnétique.","Когда вы положили эту карту, она сбросит карты, которые такого же цвета, как и она.","Cuando juegues esta carta, descartará todas las cartas con el mismo color de ésta.","當你發出這卡, 將會丟棄你手中跟磁力卡牌一樣顏色的卡牌。","Kiedy zagrasz tą kartą pozbędziesz się wszystkich kart o tym samym kolorze co ta karta.","Ha kijátszod ezt a kártyát, dobj el minden kártyát a kezedből amely a mágnes színével megegyező színű.","Bu kartı oynadığınızda, mıknatıs kartınızın rengine sahip olan her kartı atın."},
HOUSE_PLUS99 ={"Wild +99","Curinga +99","Carte +99","Чёрная +99","Comodín +99","換色 +99","","Színváltó +99","Joker +99"},
HOUSE_PLUS99_DESC ={"When you play this card, the next player will be eliminated by drawing too many cards. This card can be challenged.","Ao jogar esta carta, o próximo jogador morre de tanto comprar cartas. Esta carta pode ser desafiada.","Lorsque vous jouez cette carte, le prochain joueur sera éliminé pour avoir pioché beaucoup trop de cartes. Cette carte peut être défiée.","Когда вы положили эту карту, следующий игрок будет удалён из-за вытягивания слишком большого количества карт. Эта карта может быть выиграна. ","Cuando juegues esta carta, el siguiente jugador morirá de sortear tantas cartas. Ésta puede ser desafiada.","當你發出這卡, 下一個玩家會因為罰抽太多卡而被淘汰。 這張卡也是可以被質疑的。","Kiedy zagrasz tą kartą, następny gracz zginie przez dobranie ogromniej ilości kart. Ta karta może zostać wyzwana.","Ha kijátszod ezt a kártyát, a következő játékos kiesik a játékból,  mert túl sok kártyát húzott. Ezt a kártyát ki lehet hívni.","Bu kartı oynadığınızda, bir sonraki oyuncu çok fazla kart çekerek elenecektir. Bu karta itiraz edilebilir."},
HOUSE_TORNADO ={"Tornado Card","Carta do Tornado","Carte Tornade","Карта-Торнадо","Carta de Tornado","龍捲風卡牌","Karta Tornado","Forgószél Kártya","Kasırga Kartı"},
HOUSE_TORNADO_DESC ={"When you play this card, you shuffle the other players' cards.","Ao jogar esta carta, embaralhe as cartas dos outros jogadores.","Lorsque vous jouez cette carte, vous échanger vos cartes avec celles des autres joueurs.","Когда вы положили эту карту, вы перетасовываете карты других игроков.","Cuando juegues esta carta, barajeará las cartas de los demás jugadores.","當你發出這卡牌, 你會搗亂別人的卡組。","Kiedy zagrasz tą kartą, tasuje karty innych graczy.","Ha kijátszod ezt a kártyát, a többi játékos kártyái megkeverődnek.","Bu kartı oynadığınızda, diğer oyuncuların kartlarını karıştırırsınız."},
HOUSE_THEFT ={"Robbery Card","Carta do Roubo","Carte Vol","Карта-Ограбление","Carta de Robo","怪盜卡牌","Karta Rabunku","Rablás Kártya","Soygun Kartı"},
HOUSE_THEFT_DESC ={"When you play this card, you force a player to give you a wild card, provided they have one.","Ao jogar esta carta, force um jogador a dar uma carta curinga para você (se ele tiver uma).","Lorsque vous jouez cette carte, vous forcez un joueur à vous donner une carte noire, à condition que ce joueur en ait.","Когда вы положили эту карту, вы заставляете игрока дать вам чёрную карту, если она у него есть.","Cuando juegues esta carta, forzarás a un jugador a darte una carta comodín (si es que tiene una).","當你發出這卡牌, 你強迫一個玩家給你一張換色卡牌, 前提是他要擁有一張。","Kiedy zagrasz tą kartą, zmuś gracza, aby dał ci kartę wild (jeśli ją posiada).","Ha kijátszod ezt a kártyát, egy általad kiválasztott játékosnak oda kell adnia neked egy Színválasztó kártyát, ha van a kezében.","Bu kartı oynadığınızda, eğer elinde varsa bir oyuncuyu size bir renk kartı vermeye zorlarsınız."},
HOUSE_SIMON ={"Simon's Card","Carta da Memorização","","Карта Симона","Carta de Simón","西蒙卡組","Karta Simona","Simon Kártyája","Simon'un Kartı"},
HOUSE_SIMON_DESC ={"When you play this card, repeat, in order, the colors of previous Simon's Cards. Fail & draw 1 card. Succeed & choose the next color.","Ao jogar esta carta, repita as cores escolhidas por outras cartas desta. Se errar, compre 1 carta. Se acertar, escolha a próxima cor.","","Когда вы положили эту карту, повторяйте по порядку цвета предыдущих карт Симона. Сбой - возьмите 1 карту. Преуспейте и выберите следующий цвет.","Cuando juegues estta carta, repetirá todos los colores elegidos antes por otras cartas de Simón. Si pierdes, sorteas una carta, sino, eliges el siguiente color.","當你發出這卡時, 需要重複之前發出的西蒙卡牌的顏色順序。 重複順序錯誤就罰抽 1 張卡。 成功就可以選擇下一個顏色加到順序中。","Kiedy zagrasz tą kartą, powtórz wszystkie inne kolory wybrane wcześniej przez inne Karty Simona. W przypadku pominięcia, dobierz 1 kartę. Jeśli trafisz, wybierz następny kolor.","Ha kijátszod ezt a kártyát, ismételd meg sorban az eddigi Simon Kártyák által válaszott színeket. Ha nem sikerül, húzz egy kártyát. Ha sikerül, válaszd ki a következő színt.","Bu kartı oynadığınızda, sırayla önceki Simon'un Kartı'nın renklerini tekrarlayın. Başarısız olursanız 1 kart çekersiniz. Başarılı olursanız bir sonraki rengi seçersiniz."},
HOUSE_BAN ={"Banishment Card","Carta do Banimento","","Карта Изгнания","Carta de Sanción","驅逐卡牌","Karta Banicji","Száműzetés Kártya","Sürgün Kartı"},
HOUSE_BAN_DESC ={"When you play this card, choose one of three cards from your hand and remove from the game every card matching its symbol.","Ao jogar esta carta, escolha uma entre 3 cartas da sua mão. Tire do jogo TODAS as cartas com o mesmo símbolo da carta escolhida.","","Когда вы положили эту карту, выберите одну из трёх карт из своей руки и удалите из игры каждую карту, соответствующую ее символу.","Cuando juegues esta carta, tendrás que elegir una de tres cartas de tu baraja, y remover del juego cada carta que coincida con su símbolo.","當你發出這卡, 在三張你卡組的卡牌中選取一張, 之後跟那卡牌有著一樣的圖案/數字的卡會從遊戲中刪去。","Kiedy zagrasz tą kartą, wybierz jedną z trzech kart z twojej ręki i usuń z gry każdą kartę pasującą do jej symbolu.","Ha kijátszod ezt a kártyát, válassz egy, a kezedben lévő kártyát három lehetőségből, majd száműzz a játékból minden olyan szimbólummal rendelkező kártyát.","Bu kartı oynadığınızda, elinizdeki üç karttan birini seçin ve sembolüne uyan her kartı oyundan çıkarın."},
HOUSE_MIX ={"Combo Cards","Cartas Combo","","Комбо-Карты","Carta de Combo","累計卡牌","Karty Combo","Keverék Kártyák","Kombo Kartları"},
HOUSE_MIX_DESC ={"These cards activate the two effects corresponding to their symbols.","Estas cartas ativam os dois efeitos correspondentes aos símbolos delas.","","Эти карты активируют два эффекта, соответствующие их символам.","Esas cartas activan los dos efectos correspondientes a sus símbolos.","這些卡牌會激活上面的圖案的兩個效果。","Karty te aktywują dwa efekty odpowiadające ich symbolom.","Ezek a kártyák a rajtuk megjelenő két szimbólumhoz tartozó hatást aktiválják.","Bu kartlar, sembollerine karşılık gelen iki efekti etkinleştirir."},
HOUSE_DICE ={"Dice Card","Carta do Dado","","Игральные Карты","Carta de Dado","骰子卡牌","Karta Kości Do Gry","Dobókocka Kártya","Zar Kartı"},
HOUSE_DICE_DESC ={"When you play this card, force the next player to roll the dice and suffer the effects.","Ao jogar esta carta, force o próximo jogador a rolar o dado e sofrer uma consequência.","","Когда вы положили эту карту, вынуждайте следующего игрока бросать кости и переносить эффекты.","Cuando juegues esta carta, forzarás al siguiente jugador a rodar los dados y sufrir los efectos.","當你發出這卡牌, 會迫使下一個玩家去投骰然後承受相關的效果。","Kiedy zagrasz tą kartą, zmuś następnego gracza, aby rzucił kostką i poniósł skutki.","Ha kijátszod ezt a kártyát, a következő játékosnak dobókockát kell dobnia, majd annak hatásait elviselni.","Bu kartı oynadığınızda, bir sonraki oyuncuyu zar atmaya ve etkilere maruz kalmaya zorlayın."},
HOUSE_HALF ={"Authority Card","Carta da Autoridade","","Авторитетная Карточка","Carta de Autoridad","權力卡牌","Karta Autorytetu","Felhatalmazó Kártya","Yetki Kartı"},
HOUSE_HALF_DESC ={"Draw only half of the cards while holding this card in your hand.","Compre apenas metade das cartas enquanto segurar esta carta na mão.","","Возьмите только половину карт, держа эту карту в руке.","Solo podrás sortear la mitad de las cartas mientras tengas esta carta en tu baraja.","當你手中持有這卡牌被罰抽的時候只需抽取一半的卡。","Dobierz tylko połowę kart, trzymając tę ​​kartę w twojej dłoni.","Amíg ez a kártya a kezedben van, csak feleannyi kártyát kell húznod.","Bu kartı elinizde tutarken kartların sadece yarısını çekin."},
HOUSE_JUSTICE ={"Justice Card","Carta da Justiça","","Карта Правосудия","Carta de Justicia","正義卡牌","Karta Sprawiedliwości","Igazság Kártya","Adalet Kartı"},
HOUSE_JUSTICE_DESC ={"When you play this card, discard 1 card for each player with fewer cards than you.","Ao jogar esta carta, descarte 1 carta por cada jogador com menos cartas que você.","","Когда вы положили эту карту, сбросьте 1 карту для каждого игрока, у которого меньше карт, чем у вас.","Cuando jugues esta carta, descartará una carta por cada jugador con menos cartas que tú.","當你發出這卡牌, 每當有一個玩家持有的卡牌比你少你就會丟棄掉一張卡。","Kiedy zagrasz tą kartą, odrzuć 1 kartę dla każdego gracza z mniejszą ilością kart niż ty.","Ha kijátszod ezt a kártyát, dobj el egy véletlenszerű kártyákat annyiszor, mint ahány játékos van kevesebb kártyával, mint ami neked van.","Bu kartı oynadığınızda, sizden daha az karta sahip her oyuncu için 1 kart atın."},
HOUSE_MIMIC ={"Imitation Card","Carta da Imitação","","Имитационная Карта","Carta de Imitación","模仿卡牌","Karta Imitacji","Utánzó Kártya","İmitasyon Kartı"},
HOUSE_MIMIC_DESC ={"When you play this card, choose a player. You will imitate their actions (play/draw cards) until your next turn.","Ao jogar esta carta, escolha um jogador. Você imitará as ações dele (jogar/comprar cartas) até sua próxima vez.","","Когда вы положили эту карту, выбирайте игрока. Вы будете подражать его действиям (играть / брать карты) до вашего следующего хода.","Cuando juegues esta carta, eligirás una jugador. A este mismo jugador imitarás las acciones (jugar/sortear cartas) hasta tu siguiente turno.","當你發出這卡牌的時候, 選擇一個玩家。 你會仿傚他的行動 (發/抽卡) 直到你下一個回合。","Kiedy zagrasz tą kartą, wybierz gracza. Będziesz imitować ich działania (grać / dobierać karty) aż do następnej tury.","Ha kijátszod ezt a kártyát, válassz egy játékost. A következő körödig utánozni fogod a cselekvéseit (kártya kijátszása/húzása).","Bu kartı oynadığınızda bir oyuncu seçin. Bir sonraki sıranıza kadar hareketlerini taklit edeceksiniz (oyun / kart çekme)."},
HOUSE_BG ={"Blue and Green","Azul e Verde","","Синий и Зелёный","Azul y Verde","藍天綠地","Niebieski i Zielony","Kék és Zöld","Mavi ve Yeşil"},
HOUSE_BG_DESC ={"Blue and green cards will be treated as if they were the same color.","Cartas azuis e verdes serão tratadas como se fossem da mesma cor.","","Синие и зелёные карты будут рассматриваться так, как если бы они были одного цвета.","Las cartas de color azul y verde serán tratadas como si del mismo color fuesen.","藍色跟綠色會被當作成同一個顏色。","Niebieskie i zielone karty będą traktowane tak, jakby były tego samego koloru.","A kék és zöld kártyák azonos színűeknek számítanak.","Mavi ve yeşil kartlar aynı renkmiş gibi değerlendirilecektir."},
HOUSE_DOS ={"DOS!","","","ДОС!","","","","",""},
HOUSE_DOS_DESC ={"Instead of declaring UNO, you need to declare DOS when you have two cards in your hand.","Ao invés de declarar UNO, você precisa declarar DOS quando tiver duas cartas na mão.","","Вместо того, чтобы объявлять УНО, вам нужно объявить ДОС, когда у вас в руке две карты.","En vez de declarar UNO, deberás de declarar DOS cuanto tengas dos cartas en tu baraja.","你需要在你卡組只剩下兩張卡牌的時候喊 DOS, 而不是 UNO。","Zamiast deklarować UNO, musisz zadeklarować DOS, gdy masz dwie karty w ręce.","Ahelyett, hogy UNO-t kellene bemondani, DOS-t kell, ha két kártya van csak a kezedben.","UNO ilan etmek yerine, elinizde iki kart varken DOS bildirmeniz gerekir."},
HOUSE_PARADOX ={"Paradox Card","Carta do Paradoxo","","Карта-Парадокс","Carta Paradoja","悖論卡牌","Karta Paradoksu","Paradox Kártya","Paradoks Kartı"},
HOUSE_PARADOX_DESC ={"When you play this card, send a random card from your hand to your hand in your next match.","Ao jogar esta carta, envie uma carta aleatória da sua mão para a sua mão da sua próxima partida.","","Когда вы положили эту карту, отправьте случайную карту из вашей руки в вашу руку в следующем матче.","Cuando juegues esta carta, enviará una carta aleatoria de tu baraja, a tu baraja pero en tu siguiente turno.","當你發出這卡牌, 你會把手中隨機的一張卡傳送到你下一場遊戲中的卡組。","Kiedy zagrasz tą kartą, wyślij losową kartę z ręki do ręki w następnej rundzie.","Ha kijátszod ezt a kártyát, a kezedből egy véletlenszerű kártya a következő játékban lévő kezdeti kártyáid közé kerül.","Bu kartı oynadığınızda, bir sonraki maçınızda elinizden elinize rastgele bir kart gönderin."},
HOUSE_ODD_EVEN ={"Traffic Light Card","Carta do Semáforo","","Карта Светофора","Carta Semáforo","交通燈卡","Karta Sygnalizacji Świetlnej","Közlekedési Lámpa Kártya","Trafik Işığı Kartı"},
HOUSE_ODD_EVEN_DESC ={"When you play this card, you won't be able to win with either odds or evens (randomly chosen). Playing this card again changes it.","Ao jogar esta carta, será proibido vencer com cartas pares ou ímpares (escolhido aleatoriamente). Ao jogar isso de novo, mude.","","Когда вы положили эту карту, вы не сможете выиграть ни с коэффициентами, ни с чётными (выбранными случайным образом). Повторное использование этой карты меняет её.","When playing this card again, switch to the other option. Cuando juegues esta carta, estará prohibido ganar con cartas pares o impares, dependiendo de cuál sea elegido. Cuando la juegues nuevamente, cambiará a la otra opción.","當你發出這卡牌, 你將不能夠以單數或雙數的卡牌勝出遊戲 (隨機決定)。 再發出這卡會改變效果。","Kiedy zagrasz tą kartą, zabronione będzie wygrywanie kartami nieparzystymi lub parzystymi (wybieranymi losowo). Podczas ponownego zagrania tą kartą, zmień na inną opcję.","Ha kijátszod ezt a kártyát, akkor nem lehet a játékot megnyerni vagy páros vagy páratlan kártyákkal (véletlenszerűen kiválasztva). Ha ismét kijátszod ezt a kártyát, akkor megcserélődik.","Bu kartı oynadığınızda, tek veya çift sayılarla (rastgele seçilir) kazanamazsınız. Bu kartı tekrar oynamak onu değiştirir."},
HOUSE_LOCK ={"Lock Card","Carta da Tranca","","Блокировка Карты","Carta de Bloqueo","鎖卡","Karta Blokady","Zár Kártya","Kilit Kartı"},
HOUSE_LOCK_DESC ={"When you play this card, lock two cards in every other player's hand for 1 turn.","Ao jogar esta carta, bloqueie duas cartas na mão de cada outro jogador por 1 turno.","","","Cuando juegues esta carta, bloqueará dos cartas por cada jugador por un turno.","當你發出這卡, 會在一個回合內鎖著所有人手上的兩張卡。","","Ha kijátszod ezt a kártyát, egy körig minden ellenfeled kezében két kártya lezáródik.","Bu kartı oynadığınızda, her oyuncunun elinde 1 tur için iki kartı kilitleyin."},
HOUSE_SHARE ={"Sharing Card","Carta da Partilha","","","","分享卡","","Osztozkodás Kártya","Paylaşım Kartı"},
HOUSE_SHARE_DESC ={"When you play this card, give copies of your cards randomly to the other players (maximum 10 cards).","Ao jogar esta carta, dê cópias das suas cartas aleatoriamente aos outros jogadores (máximo 10 cartas).","","","","當你發出這卡, 你手上的卡會被隨機複製給其他玩家 (上限 10 張)。","","Ha kijátszod ezt a kártyát, a többi játékos véletlenszerűen kap a kezedben lévő kártyákról másolatokat (maximum 10 kártya).","Bu kartı oynadığınızda, kartlarınızın kopyalarını rastgele diğer oyunculara verin (en fazla 10 kart)."},
HOUSE_TWO_HANDS ={"Two Hands","Duas Mãos","","","","雙手","","Két Kéznyi Lap","İki el"},
HOUSE_TWO_HANDS_DESC ={"You have two hands of cards to play. Finish one first to be able to use the other and win the game!","Você tem duas mãos de cartas para jogar. Termine uma primeiro para poder usar a outra e ganhar o jogo!","","","","你有兩組的卡牌遊玩。首先完成一組卡牌再使用第二組來取得遊戲勝利!","","Két kéznyi kártyával kell játszanod. Ha az elsőt befejezted, akkor használhatod a másodikat, hogy megnyerd a játékot.","Oynamak için iki el kartınız var. Diğerini kullanabilmek ve oyunu kazanabilmek için önce birini bitir!"},
HOUSE_REVERSE ={"Counterattack","Contra-ataque","","","","反擊","","Ellentámadás","Karşı atak"},
HOUSE_REVERSE_DESC ={"Reverse cards now can be used to block a +2 of the same color.","Cartas de reverter agora podem ser usadas para se defender de um +2 da mesma cor.","","","","方向反轉卡牌現在可以用來阻擋相同顏色的 +2 卡牌。","","A Visszafordító kártyákkal ki lehet védeni azonos színű +2-es kártyákat.","Ters kartlar artık aynı renkten + 2'yi engellemek için kullanılabilir."},
HOUSE_POKER ={"Rule Poker","Poker de Regras","","","","規矩扑克","","Szabály Póker","Kural Poker"},
HOUSE_POKER_DESC ={"At the start of the game, each player chooses a rule to add to the match.","No início do jogo, cada jogador escolhe uma regra para colocar na partida.","","","","在遊戲開始之前, 每一個玩家可選擇一個規矩加到遊戲當中。","","A játék kezdetekor minden játékos választhat egy szabályt, amit hozzáadhat a játékhoz.","Oyunun başlangıcında, her oyuncu maça eklemek için bir kural seçer."},
HOUSE_ADD ={"More Rules","Mais Regras","","","","更多規矩","","Több Szabály","Daha Fazla Kural"},
HOUSE_ADD_DESC ={"Enable this rule to allow the game to sometimes add other rules.","Ative esta regra para permitir que o jogo adicione outras regras de vez em quando.","","","","選擇這規矩來讓遊戲隨時增加額外的規矩。","","Ha ez a szabály érvényes, a játékhoz véletlenszerűen egyéb szabályok hozzáadódhatnak.","Oyunun bazen başka kurallar eklemesine izin vermek için bu kuralı etkinleştirin."},
HOUSE_LIMITLESS ={"Limitless","Sem Limite","","","","無限","","Határtalan","Sınırsız"},
HOUSE_LIMITLESS ={"Players can now have more than 30 cards in hand.","Os jogadores agora podem ter mais de 30 cartas na mão.","","","","現在玩家手上可以多於 30 張卡牌。","","A játékosoknak lehet egyszerre több, mint 30 kártya a kezében.","Oyuncuların elinde artık 30'dan fazla kart olabilir."},
HOUSE_TOURNAMENT ={"Tournament","Torneio","","Турнир","Torneo","聯賽","Turniej","Bajnokság","Turnuva"},
HOUSE_TOURNAMENT_DESC ={"Multiple matches will occur. When a player reaches %s points, they will be the winner. Click here and see how scoring works.","Várias partidas ocorrerão. Quando um jogador atingir %s pontos, ele será o vencedor. Clique aqui e veja como funciona a pontuação.","","Происходить будут несколько матчей. Когда игрок наберет %s очков, он станет победителем. Нажмите здесь и посмотрите, как работают оценки.","Múltiples juegos ocurrirán. Cuando un jugador pase los puntos de %s, será el ganador. Da clic aquí para ver como funciona la puntuación.","多場遊戲會同時進行。當一個玩家達到 %s 分數, 他就會成為勝利者。 點這裡查看如何計算分數。","Będą się pojawiać wielokrotne rozgrywki. Kiedy gracz osiągnie %s punktów, zostanie zwycięzcą. Kliknij tutaj i zobacz jak działa punktacja.","Egymás után több játék fog megtörténni. Ha egy játékos elér %s pontot, ő lesz a győztes. Kattints ide, hogy lásd hogy működik a pontozás.","Birden çok eşleşme olacak. Bir oyuncu %s puana ulaştığında kazanan olur. Buraya tıklayın ve puanlamanın nasıl çalıştığını görün."},
HOUSE_SURVIVOR ={"Survival Tournament","Torneio de Sobrevivência","","Турнир На Выживание","Torneo de Supervivencia","生存賽制聯賽","Turniej Przetrwania","Túlélő Bajnokság","Hayatta Kalma Turnuvası"},
HOUSE_SURVIVOR_DESC ={"Multiple matches will occur. When a player reaches %s points, they will be eliminated. Last player standing wins. Click here and see how scoring works.","Várias partidas ocorrerão. Quando um jogador atingir %s pontos, ele será eliminado do torneio. Vence quem sobrar. Clique aqui e veja como funciona a pontuação.","","Происходить будут несколько матчей. Когда игрок наберет %s очков, они будут устранены. Последний стоящий игрок выигрывает. Нажмите здесь и посмотрите, как работают оценки.","Múltiples juegos ocurrirán. Cuando un jugador pase los puntos de %s, el otro será eliminado. El último jugador en prevalecer ganará. Da clic aquí para ver como funciona la puntuación.","多場遊戲會同時進行。 當一個玩家達到 %s 分數, 他就會被淘汰。 剩下的最後一個玩家勝出。 點這裡查看如何計算分數。","Będą pojawiać się wielokrotne rozgrywki. Kiedy gracz osiągnie %s punktów, zostanie wyeliminowany. Ostatni gracz zostanie zwycięzcą. Kliknij tutaj i zobacz jak działa punktacja.","Egymás után több játék fog megtörténni. Ha egy játékos elér %s pontot, kiesik a játékból. A legutolsó játékos, aki játékban marad, nyer. Kattints ide, hogy lásd hogy működik a pontozás.","Birden çok eşleşme olacak. Bir oyuncu %s puana ulaştığında, elenecektir. Ayakta kalan son oyuncu kazanır. Buraya tıklayın ve puanlamanın nasıl çalıştığını görün."},
HOUSE_CUSTOM ={"Custom Card","Carta Customizada","","Таможенная Карта","Carta Personalizada","自定義卡牌","Karta Zwyczaju","Saját Kártya","Özel Kart"},
HOUSE_CUSTOM_DESC ={"The room owner can put the effect they want on this card.","O dono da sala pode colocar o efeito que ele quiser nesta carta.","","Владелец комнаты может поместить желаемый эффект на эту карту.","El dueño de la sala podrá poner los efectos que quiera en esta carta.","房間的創建人可以把想要的效果自行加到這張卡牌中。","Właściciel pokoju może umieścić na niej wybrany przez siebie efekt.","A szoba tulajdonosa bármilyen hatást tud erre a kártyára rakni.","Oda sahibi istediği efekti bu karta koyabilir."},
CARD_SKIP ={"When you play this card, the next player misses their turn.","Ao jogar esta carta, o próximo jogador perde a vez.","","Когда вы положили эту карту, следующий игрок пропускает свой ход.","Cuando juegues esta carta, el siguiente jugador perderá su turno.","當你發出這張卡, 下一個玩家會失去他的回合。","Kiedy zagrasz tą kartą, następny gracz traci swoją kolej.","Ha kijátszod ezt a kártyát, a következő játékos kimarad a körből.","Bu kartı oynadığınızda, bir sonraki oyuncu sırasını kaçırır."},
CARD_REVERSE ={"When you play this card, the order of play is reversed. If there are only two players in the game, you play again.","Ao jogar esta carta, inverta a ordem do jogo. Se for apenas duas pessoas jogando, jogue novamente.","","Когда вы положили эту карту, порядок игры меняется на противоположный. Если в игре только два игрока, вы играете снова.","Cuando juegues esta carta, la dirección de turnos en el juego cambiará. Si sólo hay dos personas jugando, pasará normal.","當你發出這張卡, 遊戲進行的方向會反轉。 如果只有兩個玩家進行遊戲, 你可以馬上再發卡。","Kiedy zagrasz tą kartą, zmień kierunek gry. Jeśli w grze jest tylko dwóch graczy, zagraj ponownie.","Ha kijátszod ezt a kártyát, megfordul a kör iránya. Ha csak két játékos van a játékban, újra te következel.","Bu kartı oynadığınızda, oyun sırası tersine döner. Oyunda sadece iki oyuncu varsa, tekrar oynarsınız."},
CARD_DRAW_TWO ={"When you play this card, the next player draws 2 cards and misses their turn, (unless they have another +2).","Ao jogar esta carta, o próximo jogador deve comprar 2 cartas (a menos que ele jogue outro +2).","","Когда вы полоижили эту карту, следующий игрок берет 2 карты и пропускает свой ход (если у него нет другого +2).","Cuando juegues esta carta, el siguiente jugador necesitará sortear dos cartas (a menos de que tenga otra +2).","當你發出這張卡, 下一個玩家罰抽 2 張卡牌然後失去回合, (除非他有另一張 +2 卡牌)。","Kiedy zagrasz tą kartą, następny gracz musi dobrać 2 karty (chyba że ma inne +2).","Ha kijátszod ezt a kártyát, a következő játékos húz két kártyát, és kimarad a körből, (kivéve ha van nekik egy másik +2).","Bu kartı oynadığınızda, sonraki oyuncu 2 kart çeker ve sırasını kaçırır (başka bir +2'ye sahip olmadığı sürece)."},
CARD_WILD ={"You can play this card over cards of every color, to switch the color to any of the four colors.","Você pode jogar esta carta a qualquer momento. Depois escolha uma cor para prosseguir o jogo.","","Вы можете положить эту карту поверх карт любого цвета, чтобы поменять цвет на любой из четырёх цветов.","Podrás descartarla sobre cualquier carta y darle el poder de cambiar entre cualquier de los cuatro colores.","你可以在任何一個顏色的卡牌上發出這換色卡牌, 用來改變出牌的顏色。","Możesz go wyłożyć na dowolnej karcie i daje on możliwość zmiany koloru na dowolny z czterech kolorów.","Bármely színű kártyára kijátszhatod ezt a kártyát, hogy megváltoztasd a színt a négy szín bármelyikére.","Rengi dört renkten herhangi birine değiştirmek için bu kartı her renkteki kartlar üzerinde oynayabilirsiniz."},
CARD_WILD_DRAW_FOUR ={"You can play this card over cards of every color, to switch the color to any of the four colors. You also force the next player to draw 4 cards and miss their turn (unless they have another +4). You should play this card only when you have no card matching the color of the card on the table. It is possible to challenge this card if you think it was illegally played on you.","Além de poder jogar a qualquer momento e escolher a cor, você força o próximo a comprar 4 cartas (a menos que ele tenha outro +4). Você só deve jogar esta carta caso não possua nenhuma carta da cor da carta da mesa. É possível desafiar esta carta caso você ache que a carta foi jogada injustamente.","","Вы можете положить эту карту поверх карт любого цвета, чтобы поменять цвет на любой из четырёх цветов. Вы также заставляете следующего игрока взять 4 карты и пропустить свой ход (если у него также нет +4). Ложить эту карту следует только в том случае, если на столе нет карты, соответствующей цвету карты. Можно принять вызов, если вы думаете, что она была незаконно разыграна на вас.","Además de poder jugarla en cualquier momento y elegir el color, forzarás al siguiente a recibir cuatro cartas (a menos de que juegue otro +4). Solo deberías de jugar esta carta si no tienes cartas que coincidan con el color de la carta superior en la tabla. Es posible desafiar esta carta si crees que la carta fue jugada suciamante.","你可以在任何一個顏色的卡牌上發出這 +4 卡牌, 改變出牌的顏色。 同時, 你也會令下一個玩家罰抽 4 張卡牌以及跳過他的回合 (除非他也有一張 +4 卡牌)。 你只可以在手中的卡牌沒有跟桌面上的卡一樣顏色的時候才可以發出 +4 卡牌。 如果你覺得別人沒有照規定發出 +4 卡牌, 你可以質疑他。","Oprócz możliwości wyłożenia go w dowolnym momencie i wyboru koloru, wymuszasz graczowi dobranie 4 kart (chyba, że ​​zagra on kolejną kartą +4). Powinieneś zagrać tę kartę tylko, jeśli nie masz karty pasującej do koloru górnej karty na stole. Możesz zakwestionować tę kartę, jeśli uważasz, że karta została niesprawiedliwie zagrana.","Bármely színű kártyára kijátszhatod ezt a kártyát, hogy megváltoztasd a színt a négy szín bármelyikére. Ezen kívül a következő játékosnak négy kártyát kell húznia, majd kimarad a körből (kivéve ha van neki egy másik +4). Csak akkor szabad ezt a kártyát kijátszani, ha nincs olyan színű kártya a kezedben, mint amilyen az asztalon van. Ha szerinted helytelenül játszották ki rád ezt a kártyát, ki lehet hívni. ","Rengi dört renkten herhangi birine değiştirmek için bu kartı her renkteki kartlar üzerinde oynayabilirsiniz. Ayrıca bir sonraki oyuncuyu 4 kart çekmeye ve sırasını kaçırmaya zorlarsınız (başka bir +4 kartına sahip olmadıkça). Bu kartı sadece masadaki kartın rengiyle eşleşen kartınız olmadığında oynamalısınız. Size yasadışı olarak oynandığını düşünüyorsanız bu karta itiraz etmeniz mümkündür."},
CARD_PAWN ={"When someone plays a chess card over this card, the previous player draws 1 card.","Quando alguém jogar uma peça de xadrez em cima desta carta, o jogador anterior compra 1 carta.","","Когда кто-то ложит шахматную карту поверх этой карты, предыдущий игрок берет 1 карту.","Cuando alguien juega una pieza de tablero sobre esta carta, el jugador anterior sortea una carta.","當有玩家在這張卡之後發出另一張棋子卡牌, 上一個玩家罰抽 1 張卡牌。","Gdy ktoś zagra figurą szachową na tej karcie, poprzedni gracz dobiera 1 kartę.","Ha valaki egy sakk kártyát játszik erre a kártyára, az előző játékos húz egy kártyát.","Birisi bu kartın üzerinde satranç kartı oynadığında, önceki oyuncu 1 kart çeker."},
CARD_BISHOP ={"When someone plays a chess card over this card, they donate 1 random card to the previous player.","Quando alguém jogar uma peça de xadrez em cima desta carta, ele doa uma carta aleatória para o jogador anterior.","","Когда кто-то ложит шахматную карту поверх этой карты, он жертвует 1 случайную карту предыдущему игроку.","Cuando alguien juega una pieza de tablero sobre esta carta, le da una carta aleatoria al jugador anterior.","當有玩家在這張卡之後發出另一張棋子卡牌, 他會把隨機一張手中的牌送給上一個玩家。","Gdy ktoś zagra figurą szachową na tej karcie, daje 1 losową kartę dla poprzedniego gracza.","Ha valaki egy sakk kártyát játszik erre a kártyára, egy véletlenszerű kártyát adományoz az előző játékosnak.","Birisi bu kartın üzerinde satranç kartı oynadığında, önceki oyuncuya 1 rastgele kart bağışlar."},
CARD_KNIGHT ={"When someone plays a chess card over this card, the order of play is reversed and the next player draws 1 card and misses their turn.","Quando alguém jogar uma peça de xadrez em cima desta carta, o jogo inverte e o próximo jogador compra 1 carta e perde a vez.","","Когда кто-то ложит шахматную карту поверх этой карты, порядок игры меняется на противоположный, и следующий игрок берёт 1 карту и пропускает свой ход.","Cuando alguien juega una pieza de tablero sobre esta carta, el juego se torna de reverso y el sigueinte jugador sortea una carta y pierde su turno.","當有玩家在這張卡之後發出另一張棋子卡牌, 遊戲方向反轉而且下一個玩家罰抽 1 張卡及失去他的回合。","Gdy ktoś zagra figurą szachową na tej karcie, kierunek gry się odwraca, a następny gracz dobiera 1 kartę i traci swoją kolej.","Ha valaki egy sakk kártyát játszik erre a kártyára, a kör iránya megfordul, a következő játékos húz egy kártyát, és kimarad a körből.","Birisi bu kartın üzerinde bir satranç kartı oynadığında, oyun sırası tersine çevrilir ve bir sonraki oyuncu 1 kart çeker ve sırasını kaçırır."},
CARD_ROOK ={"When someone plays a chess card over this card, the previous player draws 2 cards.","Quando alguém jogar uma peça de xadrez em cima desta carta, o jogador anterior compra 2 cartas.","","Когда кто-то ложит шахматную карту поверх этой карты, предыдущий игрок берёт 2 карты.","Cuando alguien juega una pieza de tablero sobre esta carta, el jugador anterior sortea dos cartas.","當有玩家在這張卡之後發出另一張棋子卡牌, 上一個玩家罰抽 2 張卡牌。","Gdy ktoś zagra figurą szachową na tej karcie, poprzedni gracz dobiera 2 karty.","Ha valaki egy sakk kártyát játszik erre a kártyára, az előző játékos húz két kártyát.","Birisi bu kartın üzerinde satranç kartı oynadığında, önceki oyuncu 2 kart çeker."},
CARD_QUEEN ={"When someone plays a chess card over this card, the previous player will draw cards until they have 10 cards.","Quando alguém jogar uma peça de xadrez em cima desta carta, o jogador anterior compra cartas até ter 10 cartas na mão.","","Когда кто-то ложит шахматную карту поверх этой карты, предыдущий игрок будет брать карты, пока у него не будет 10 карт.","Cuando alguien juega una pieza de tablero sobre esta carta, el jugador anterior tendrá que sortear cartas hasta que tenga diez.","當有玩家在這張卡之後發出另一張棋子卡牌,　上一個玩家需要一直罰抽直到他手中有 10 張卡牌。","Gdy ktoś zagra figurą szachową na tej karcie, poprzedni gracz dobiera karty, dopóki nie będzie miał ich 10.","Ha valaki egy sakk kártyát játszik erre a kártyára, az előző játékos addig húz kártyákat, amíg 10 lesz a kezében.","Birisi bu kartın üzerinde satranç kartı oynadığında, önceki oyuncu 10 kart alana kadar kart çeker."},
CARD_KING ={"When someone plays a chess card over this card, they give all their cards, except one, to the previous player.","Quando alguém jogar uma peça de xadrez em cima desta carta, ele doa todas as cartas, exceto uma, para o jogador anterior.","","Когда кто-то ложит шахматную карту поверх этой карты, он передает все свои карты, кроме одной, предыдущему игроку.","Cuando alguien juega una pieza de tablero sobre esta carta, le da todas sus cartas, excepto una, al jugador anterior.","當有玩家在這張卡之後發出另一張棋子卡牌, 他會把手上的卡牌 (除了一張以外) 全部送給上一個玩家。","Gdy ktoś zagra figurą szachową na tej karcie, oddaje wszystkie swoje karty dla poprzedniego gracza z wyjątkiem jednej.","Ha valaki egy sakk kártyát játszik erre a kártyára, egy kivételével a kezében lévő összes kártyáját az előző játékosnak adja.","Birisi bu kartın üzerinde satranç kartı oynadığında, biri hariç tüm kartlarını bir önceki oyuncuya verir."},
CARD_TREASURE ={"When you play this card, you win the game!","Ao jogar esta carta, você vence o jogo!","","Когда вы ложите эту карту - вы выигрываете игру!","¡Cuando juegues esta carta ganarás el juego!","當你發出這卡牌, 你直接勝出!","Kiedy zagrasz tą kartą, wygrywasz grę!","Ha kijátszod ezt a kártyát, megnyered a játékot!","Bu kartı oynadığınızda oyunu kazanırsınız!"},
CARD_SHIELD ={"This card can protect you against +2 and +4 cards.","Esta carta pode te proteger de +2 e +4.","","Эта карта может защитить вас от +2 и +4","Esta carta te protege contra +2 y +4.","這張卡保護你不受到 +2 及 +4 的罰抽效果。","Ta karta chroni Cię przed kartami +2 i +4.","Ezzel a kártyával kivédheted a +2-es és +4-es kártyákat.","Bu kart sizi +2 ve +4 kartlara karşı koruyabilir."},
CARD_MIX1 ={"When you play this card, you reverse the game and the next player misses their turn.","Ao jogar esta carta, inverta o jogo e então o próximo jogador perde a vez.","","Когда вы ложите эту карту, вы переворачиваете игру, и следующий игрок пропускает свой ход.","Cuando juegas esta carta, el juego se reversa y el siguiente jugador pierde su turno.","當你發出這卡牌, 你改變遊戲方向以及下一個玩家會失去他的回合。","Kiedy zagrasz tą kartą, odwracasz kierunek gry, a następny gracz traci swoją kolej.","Ha kijátszod ezt a kártyát, a kör iránya megfordul, és a következő játékos kimarad a körből.","Bu kartı oynadığınızda, oyunu tersine çevirirsiniz ve bir sonraki oyuncu sıralarını kaçırır."},
CARD_MIX2 ={"When you play this card, you reverse the game and the next player draws 2 cards and misses their turn.","Ao jogar esta carta, inverta o jogo e então o próximo jogador compra 2 cartas e perde a vez.","","Когда вы ложите эту карту, вы переворачиваете игру, а следующий игрок берет 2 карты и пропускает свой ход.","Cuando juegas esta carta, el juego se reversa y el siguiente jugador sortea dos cartas y pierde su turno.","當你發出這卡牌, 你改變遊戲方向以及下一個玩家需要罰抽 2 張卡並且會失去他的回合。","Kiedy zagrasz tą kartą, odwracasz kierunek gry, a następny gracz dobiera 2 karty i traci swoją kolej.","Ha kijátszod ezt a kártyát, a kör iránya megfordul, a következő játékos húz 2 kártyát, és kimarad a körből.","Bu kartı oynadığınızda, oyunu tersine çevirirsiniz ve bir sonraki oyuncu 2 kart çeker ve sıralarını kaçırır."},
CARD_MIX3 ={"When you play this card, the next player misses their turn and the subsequent player draws 2 cards and misses their turn.","Ao jogar esta carta, o próximo jogador perde a vez e então o jogador subsequente compra 2 cartas e perde a vez.","","Когда вы ложите эту карту, следующий игрок пропускает свой ход, а последующий игрок берет 2 карты и пропускает свой ход.","Cuando juegas esta carta, el siguiente jugador pierde su turno y el siguiente a él consecuentemente sortea dos cartas y pierde su turno.","當你發出這卡牌, 下一個玩家會失去他的回合而再下一個玩家會被罰抽 2 張卡並且失去他的回合。","Kiedy zagrasz tą kartą, następny gracz traci swoją kolejkę, a kolejny gracz dobiera 2 karty i traci swoją kolej.","Ha kijátszod ezt a kártyát, a következő játékos kimarad a körből, és az utána következő játékos húz 2 kártyát, majd szintén kimarad a körből.","Bu kartı oynadığınızda, bir sonraki oyuncu sırasını ve sonraki oyuncu 2 kart çeker ve sırasını kaçırır."},
HOUSE_DREKKEMAUS ={"Von Drekkemaus","","","","","","","",""},
HOUSE_DREKKEMAUS_DESC ={"He is immune to Thunder cards and he draws cards using the Tracking rule.","Ele é imune a Trovões e compra cartas usando a regra Rastrear.","","Он невосприимчив к Картам Грома и берёт карты, используя правило Отслеживания.","Él es inmune a las cartas relámpago y el sortea cartas usando la regla de rastreo.","他對雷電暴擊卡牌的效果免疫以及他使用\"追蹤\"規矩來抽取卡牌。 ","Jest odporny na Kartę Grzmotu i dobiera karty zgodnie z zasadą Śledzenie.","Nem hat rá a Mennydörgés Kártya, és a Nyomkövetés szabállyal húz kártyát.","Yıldırım kartlarından muaftır ve İzleme kuralını kullanarak kart çeker."},
HOUSE_JINGLE ={"Jingle","","","","","","","",""},
HOUSE_JINGLE_DESC ={"He donates two cards instead of one and he draws cards using the Tracking rule.","Ele doa 2 cartas ao invés de uma e compra cartas usando a regra Rastrear.","","Он жертвует две карты вместо одной и берёт карты, используя правило Отслеживания.","Él dona dos cartas en vez de una y sortea cartas usando la regla de rastreo.","他會在\"捐獻卡\"規矩下送出兩張卡牌以及使用\"追蹤\"規矩來抽取卡牌。","Przekazuje dwie karty zamiast jednej i dobiera je zgodnie z zasadą Śledzenie. ","Adományozáskor egy kártya helyett kettőt adományoz, és a Nyomkövetés szabállyal húz kártyát.","Bir yerine iki kart bağışlar ve İzleme kuralını kullanarak kart çeker."},
HOUSE_PAPAILLE ={"Papaille","","","","","","","",""},
HOUSE_PAPAILLE_DESC ={"He starts with 9 cards, draws cards using the Fast Drawing rule and cannot receive card donations.","Ele começa com 9 cartas, compra cartas usando Compra Rápida e não pode receber doações.","","Он начинает с 9 карт, берёт карты, используя правило Быстрой Взятки, и не может получать пожертвования карт.","Él empieza con nueve cartas, surtea cartas usando la regla de Sorteo rápdio y no puede recibir donaciones.","他起初手中的卡牌會是 9 張, 使用\"快速抽取\"規矩抽卡牌而且不會接收捐獻的卡牌。","Rozpoczyna z 9 kartami, dobiera karty zgodnie z zasadą Szybkie Dobieranie i nie otrzymuje darowanych kart.","9 kártyával kezdi a játékot, a Gyors Húzás szabállyal húz kártyát, és nem fogad el adományt.","9 kartla başlar, Hızlı Kart Çekme kuralını kullanarak kart çeker ve kart bağışları alamaz."},
HOUSE_CHARLOTTE ={"Charlotte","","","","","","","",""},
HOUSE_CHARLOTTE_DESC ={"She draws cards using the Tracking rule and she cannot be eliminated.","Ela compra cartas usando a regra Rastrear e ela não pode ser eliminada.","","Она берёт карты, используя правило Отслеживания, и её нельзя исключить.","Ella sortea cartas usando la regla de rastreo y no puede ser eliminada.","她使用\"追蹤\"規矩抽取卡牌而且不會被淘汰。","Dobiera karty zgodnie z zasadą Śledzenie i nie może zostać wyeliminowana.","A Nyomkövetés szabállyal húz kártyát, és nem lehet kiejteni a játékból.","Takip kuralını kullanarak kart çeker ve elenemez."},
HOUSE_ELISAH ={"Elisah","","","","","","","",""},
HOUSE_ELISAH_DESC ={"She starts with 3 Curse Cards and she is immune to Curses.","Ela começa com 3 Cartas da Maldição e ela é imune a Maldições.","","Она начинает с 3 Проклятых Карт и неуязвима для Проклятий.","Ella empieza con tres cartas de maldición y es inmune a las maldiciones.","她起初手中會有3張詛咒卡牌而她是對詛咒免疫。","Rozpoczyna z 3 Kartami Przekleństwa i jest na nie odporna.","3 Átok Kártyával kezdi a játékot, és nem hatnak rá az átkok.","3 Lanetli Kart ile başlar ve Lanetlerden etkilenmez."},
HOUSE_BUFFY ={"Buffy","","","","","","","",""},
HOUSE_BUFFY_DESC ={"She's still learning to play, so she starts with 5 cards.","Ela está aprendendo a jogar, por isso começa com 5 cartas.","","Она все ещё учится играть, поэтому начинает с 5 карт.","Ella está aprendiendo a jugar, por lo que empieza con cinco cartas.","她還在學習要怎麼玩, 所以她起初只有 5 張卡牌。","Ona uczy się gry, więc zaczyna z 5 kartami.","Még tanulja a játékot, ezért 5 kártyával kezd.","Hala oynamayı öğreniyor, bu yüzden 5 kartla başlıyor."},
HOUSE_SNOWY ={"Snowy","","","","","","","",""},
HOUSE_SNOWY_DESC ={"If eliminated, he distributes his cards to the other players.","Se ele for eliminado, ele distribuirá as cartas dele para os outros jogadores.","","В случае исключения он раздает свои карты другим игрокам.","Si él es eliminado, distribuirá sus cartas a los demás jugadores.","如果被淘汰了, 他會把他剩下的卡牌分發給所有玩家。","Jeśli zostanie wyeliminowany, rozdaje swoje wszystkie karty innym graczom.","Ha kiesik a játékból, szétosztja a kártyáit a többi játékosnak.","Elendiğinde kartlarını diğer oyunculara dağıtır."},
HOUSE_ICEMICE ={"Icemice","","","","","","","",""},
HOUSE_ICEMICE_DESC ={"Whenever he draws cards, another random player will draw 1 card.","Sempre que ele comprar cartas, outro jogador aleatório compra 1 carta.","","Всякий раз, когда он берёт карты, другой случайный игрок берёт одну карту.","Siempre que sortee cartas, un jugador aleatorio sorteará una carta.","每當他抽卡, 另一個隨機的玩家也會被罰抽 1 張卡。","Za każdym razem, gdy dobierze karty, inny losowy gracz dobierze 1 kartę.","Valahányszor kártyát húz, egy véletlenszerű játékos is húz egy kártyát.","Ne zaman kart çekse, başka bir rastgele oyuncu 1 kart çeker."},
HOUSE_ELISE ={"Elise","","","","","","","",""},
HOUSE_ELISE_DESC ={"She plays fair.","Ela joga de forma justa.","","Она играет честно.","Ella juega limpiamente.","她會公平的玩。","Ona gra fair.","Rendesen játszik.","Adil oynuyor."},
HOUSE_NINGUEM ={"Ninguem_v2","","","","","","","",""},
HOUSE_NINGUEM_DESC ={"I don't know how I got here...","Não sei como isto veio parar aqui...","","","","我不知道它怎麼會在這...","","Nem tudom hogy került ez ide...","Buraya nasıl geldiğimi bilmiyorum ..."},
HOUSE_DERP ={"Derp","","","","","","","",""},
HOUSE_DERP_DESC ={"He won't let you win!","Ele não deixará você vencer!","","","","他不會讓你贏!","","Nem fog nyerni hagyni!","Kazanmana izin vermiyor!"},
HOUSE_RED ={"Love?","Amor?","Amour?","Любовь?","¿Amor?","愛?","Miłość?","Szeretet?","Aşk?"},
HOUSE_RED_DESC ={"When Charlotte plays a red numerical card, she donates a numerical card to a random player.","Quando Charlotte joga um número vermelho, ela doa uma carta numérica para alguém.","Lorsque Charlotte joue une carte numérique rouge, elle donne une carte numérique à un joueur aléatoire.","Когда Charlotte ложит красную цифровую карту, она жертвует цифровую карту случайному игроку.","Cuando Charlotte juega una carta numérica roja, le dona una carta a un jugador aleatorio.","當 Charlotte 發出紅色的數字卡牌, 她會向隨機一個玩家捐獻一張數字卡牌。","Kiedy Charlotte zagra czerwoną kartą z liczbą, przekazuje kartę z liczbą losowemu graczowi.","Ha Charlotte piros számkártyát játszik, eladományoz egy számkártyát egy véletlenszerű játékosnak.","Charlotte kırmızı bir sayısal kart oynadığında, rastgele bir oyuncuya sayısal bir kart bağışlar."},
HOUSE_BLUE ={"Peace?","Paz?","Paix?","Мир?","¿Paz?","和平?","Pokój?","Béke?","Barış?"},
HOUSE_BLUE_DESC ={"When Charlotte plays a blue numerical card, every other player can only play numerical cards during the next turn.","Quando Charlotte joga um número azul, os outros podem jogar apenas cartas numéricas no próximo turno.","Lorsque Charlotte joue une carte numérique bleue, tous les autres joueursWhen Charlotte plays a blue numerical card, tous les autres joueurs ne peuvent jouer que des cartes numériques pendant le tour suivant.","Когда Charlotte ложит синюю цифровую карту, любой другой игрок может играть только числовые карты в течение следующего хода.","Cuando Charlotte juega una carta numérica azul, todos los demás jugadores solo podrán jugar cartas numéricas en su siguiente turno.","當 Charlotte 發出藍色的數字卡牌, 所有玩家下一回合只可以發出數字卡牌。","Kiedy Charlotte zagra niebieską kartą z liczbą, każdy gracz musi zagrać numeryczną kartą podczas następnej tury .","Ha Charlotte kék számkártyát játszik, a többi játékos egy körig csak számkártyát játszhat.","Charlotte mavi bir sayısal kart oynadığında, diğer tüm oyuncular bir sonraki turda yalnızca sayısal kartları oynayabilir."},
HOUSE_YELLOW ={"Rage?","Ira?","","Ярость?","¿Rabia?","狂暴?","Wściekłość?","Harag?",""},
HOUSE_YELLOW_DESC ={"When Charlotte plays a yellow numerical card, another random player draws 1-3 cards.","Quando Charlotte joga um número amarelo, outro jogador aleatório compra de 1 a 3 cartas.","Lorsque Charlotte joue une carte numérique jaune, un joueur au hasard tire 1-3 cartes.","Когда Charlotte ложит жёлтую цифровую карту, другой случайный игрок берёт 1-3 карты.","Cuando Charlotte juega una carta numérica amarilla, un jugador aleatorio recibe de una a tres cartas.","當 Charlotte 發出黃色的數字卡牌, 隨機一個玩家罰抽 1-3 張卡牌。","Kiedy Charlotte zagra żółtą kartą, losowy gracz dobiera 1-3 karty.","Ha Charlotte sárga számkártyát játszik, egy véletlenszerű játékos húz 1-3 kártyát.","Charlotte sarı bir sayısal kart oynadığında, başka bir rastgele oyuncu 1-3 kart çeker."},
HOUSE_GREEN ={"Equality?","Igualdade?","Égalité?","Равенство?","¿Igualdad?","平等?","Równość?","Egyenlőség?","Eşitlik?"},
HOUSE_GREEN_DESC ={"When Charlotte plays a green numerical card, her number of cards will adjust to be equal to the player's with the least cards.","Quando Charlotte joga um número verde, ela fica com o mesmo número de cartas de quem está vencendo.","Lorsque Charlotte joue une carte numérique verte, son nombre de cartes s'ajustera pour être égal à celui du joueur ayant le moins de cartes.","Когда Charlotte ложит зелёную цифровую карту, её количество карт будет скорректировано, чтобы быть равным количеству карт игрока с наименьшим количеством карт.","Cuando Charlotte juega una carta numérica verde, su número de cartas se ajustará para ser igual al del jugador con menos cartas.","當 Charlotte 發出綠色的數字卡牌, 她的卡牌數目會調整到等於玩家中擁有最少卡牌的數目。","Kiedy Charlotte zagra zieloną numeryczną kartą, jej liczba zostanie dostosowana tak by być równa graczowi z najmniejszą ilością kart. ","Ha Charlotte zöld számkártyát játszik, annyi kártyát húz vagy dob el, hogy annyi legyen a kezében, mint amennyi a legkevesebb kártyával rendelkező játékosnak van.","Charlotte yeşil bir sayısal kart oynadığında, kart sayısı oyuncunun en az kartı olan oyuncuya eşit olacak şekilde ayarlanır."},
CURSE_ANVIL ={"When someone draws a card, they draw an additional one.","Quem comprar cartas comprará 1 carta a mais","Lorsque quelqu'un tire une carte, il en tire une autre.","Когда кто-то берёт карту, он берет дополнительную.","Aquel que sortee cartas también sorteará una más","當有人抽卡, 要額外再罰抽一張。","Kto dobiera karty, dobiera o 1 kartę więcej","Ha valaki kártyát húzna, húznia kell mégegyet.","Birisi bir kart çektiğinde, başka bir kart çeker."},
CURSE_ICE ={"No one can draw cards.","Ninguém pode comprar cartas","Personne ne peut tirer de cartes.","Никто не может брать карты.","No podrá sortear cartas","沒有人能抽卡。　","Nikt nie może dobrać kart","Senki sem húzhat kártyákat.","Kimse kart çekemez."},
CURSE_SHOE ={"When someone plays an action card, they draw 1 card.","Quem jogar carta de ação compra 1 carta","Quand quelqu'un joue une carte action, il tire 1 carte.","Когда кто-то кладёт карту действия, он берёт одну карту.","El que juega una acción recibirá una carta","當有人發出行動卡牌, 他們需要罰抽一張卡。","Kto zagra kartą akcji dobiera jedną kartę","Ha valaki akciókártyát játszik, húznia kell 1 kártyát","Birisi bir aksiyon kartı oynadığında 1 kart çeker."},
CURSE_THORN ={"Anyone that draws cards will be eliminated.","Quem comprar cartas será eliminado","Quiconque tire des cartes sera éliminé.","Любой, кто берёт карты, будет удален.","Aquel que sortee cartas será eliminado","任何人要抽卡的話就會被淘汰。","Kto dobierze karty zostanie wyeliminowany","Aki kártyát húz, az kiesik a játékból.","Kart çeken herkes elenecek."},
CURSE_TIME ={"Everyone has only 3 seconds to play.","São apenas 3 segundos para jogar","Tout le monde n'a que 3 secondes pour jouer.","У всех есть только 3 секунды, чтобы играть.","Todos los jugadores solo tienen tres segundos para jugar","所有人只有 3 秒回合時間。","Wszyscy gracze mają tylko 3 sekundy by zagrać","Mindenkinek csak 3 másodperce van játszani.","Herkesin oynaması için sadece 3 saniyesi vardır."},
CURSE_POISON ={"Everyone becomes confused.","Todos ficam confusos","Tout le monde devient confus.","Все смущаются.","Todos se confunden","所有人都被困惑了。","Wszyscy gracze są zdezorientowani","Mindenki zavarodott lesz.","Herkesin kafası karışır."},
DICE_1 ={"Take 1 card from the previous player.","Pegue 1 carta do jogador anterior.","Prenez 1 carte du joueur précédent.","Возьмите 1 карту от предыдущего игрока.","Toma una carta del jugador anterior.","從上一個玩家手中拿一張卡。","Weź 1 kartę od poprzedniego gracza.","Vegyél el 1 kártyát az előző játékostól.","Önceki oyuncudan 1 kart alın."},
DICE_2 ={"Draw 2 cards.","Compre 2 cartas.","Tirez 2 cartes.","Возьмите 2 карты.","Sortea dos cartas.","抽取 2 張卡。","Dobierz 2 karty.","Húzz 2 kártyát.","2 kart çek."},
DICE_3 ={"Discard cards until you have 3 cards in your hand.","Descarte cartas até ficar com 3 cartas na mão.","Jetez des cartes jusqu'à ce que vous en ayez 3 dans votre main.","Сбрасывайте карты, пока в вашей руке не окажется 3 карты.","Descarta cartas hasta que tengas tres cartas en tu baraja.","一直丟棄卡牌直到手中只剩 3 張卡。","Odrzuć karty, dopóki nie masz 3 kart w ręce","Dobj el kártyákat a kezedből, amíg csak 3 kártya marad.","Elinizde 3 kart olana kadar kartları atın."},
DICE_4 ={"Play a 4 or draw 4 cards.","Jogue um 4 ou compre 4 cartas.","Jouez un 4 ou tirez 4 cartes.","Сыграйте 4 или возьмите 4 карты.","Juega un +4 o sortea cuatro cartas.","發出數字 4 的卡牌不然罰抽 4 張卡。","Zagraj kartą o numerze 4 lub dobierz 4 karty.","Játssz ki egy 4-es számkártyát, vagy húzz 4 kártyát.","4 oynayın veya 4 kart çekin."},
DICE_5 ={"Hand out 5 cards to the other players.","Distribua 5 cartas para os outros jogadores.","Distribuez 5 cartes aux autres joueurs.","Раздайте 5 карт другим игрокам.","Barajea cinco cartas a los otros jugadores.","分發 5 張卡牌給其他玩家。","Rozdaj 5 kart innym graczom.","Adj oda 5 kártyát a többi játékosnak.","Diğer oyunculara 5 kart dağıtın."},
DICE_6 ={"Draw cards until you have 6 cards in your hand.","Compre cartas até ficar com 6 cartas na mão.","Tirez des cartes jusqu'à ce que vous en ayez 6 dans votre main.","Берите карты, пока в вашей руке не будет 6 карт.","Sortea cartas hasta que tengas seis cartas en tu baraja.","一直抽牌直到手中有 6 張卡。","Wyciągaj karty, dopóki nie masz 6 kart w ręce.","Húzz kártyákat, amíg 6 kártya lesz a kezedben.","Elinizde 6 kart olana kadar kartları çizin."},
FORBIDEN_ODD ={"Unable to win with odd numerical cards.","Proibido vencer com cartas ÍMPARES","Impossible de gagner avec des cartes impaires.","Невозможно выиграть с нечётными цифровых картами.","Prohibido ganar con cartas IMPARES","不能夠用單數數字卡牌勝出。","Zabronione jest wygrywanie kartami o numerach nieparzystych.","Nem lehet páratlan számmal nyerni.","Tek sayılı kartlarla kazanılamıyor."},
FORBIDEN_EVEN ={"Unable to win with even numerical cards.","Proibido vencer com cartas PARES","Impossible de gagner avec des cartes paires.","Невозможно выиграть даже с помощью цифровых карт.","Prohibido ganar con cartas PARES","不能夠用雙數數字卡牌勝出。","Zabronione jest wygrywanie kartami o numerach parzystych.","Nem lehet páros számmal nyerni.","Sayısal kartlarla kazanılamıyor."},
UNLOCK_RULE ={"Win a match with this rule to unlock it!","Vença uma partida com essa regra para desbloqueá-la!","Gagnez une partie avec cette règle pour déverouiller!","Выиграйте матч с этим правилом, чтобы разблокировать его!","¡Gana una partida con esta regla para desbloquearla!","在用這規矩的一場遊戲裡勝出後解鎖它!","Wygraj rundę z daną zasadą aby ją odblokować!","Nyerj meg egy játékot ezzel a szabállyal, hogy feloldd magadnak!","Kilidini açmak için bu kuralla bir maç kazanın!"},
TEAM_RULE ={"Win 10 matches with this rule to unlock it!","Vença 10 jogos com esta regra pra desbloqueá-la.","Gagnez 10 parties avec cette règle pour déverouiller!","Выиграйте 10 матчей с этим правилом, чтобы разблокировать его!","¡Gana diez partidas con esta regla para desbloquearla!","在 10 場用這規矩的遊戲裡勝出後解鎖它!","Wygraj 10 rund z tą zasadą, aby ją odblokować!","Nyerj meg 10 játékot ezzel a szabállyal, hogy feloldd magadnak!","Kilidini açmak için bu kuralla 10 maç kazanın!"},
ACTION_DRAW ={"Draw cards","Comprar cartas","Tirer des cartes","Брать карты","Sortear cartas","抽卡","Dobierz karty","Kártyahúzás","Kartları çek"},
ACTION_DISCARD ={"Discard cards","Descartar cartas","Défausser des cartes","Сбросить карты","Descartar cartas","棄卡","Odrzuć karty","Kártyaeldobás","Kartları sil"},
ACTION_DONATE ={"Donate cards","Doar cartas","Donner des cartes","Пожертвовать карты","Donar cartas","捐獻卡牌","Podaruj kartę","Kártyaadományozás","Bağış kartları"},
ACTION_SHOW ={"Show card","Mostrar carta","Montrer les cartes","Показать карту","Mostrar carta","顯示卡牌","Pokaż kartę","Kártya megmutatása","Şov Kartı"},
ACTION_SKIP ={"Lose a turn","Perder a vez","Rater un tour","Пропустить поворот","Perder turno","錯過了回合","Strać kolejkę","Körből kimaradás","Bir tur kaybet"},
ACTION_SWAP ={"Exchange places","Trocar de lugar","Échanger les places","Обмен местами","Intercambiar lugares","交換了位子","Wymień miejsca","Helycsere","Değişim yerleri"},
ACTION_TRADE ={"Swap cards","Trocar de cartas","Échanger les cartes","Обменять карты","Cambiar cartas","交換卡牌","Zmień karty","Kártyák cserélése","Kartları takas"},
ACTION_ELIMINATE ={"Eliminate","Eliminar","Éliminer","Устранить","Eliminar","淘汰","Eliminacja","Kiejtés","Eleme"},
WHO_YOURSELF ={"yourself","você mesmo","vous-même","сам","tú mismo","你","siebie","te","kendin"},
WHO_NEXT ={"next player","próximo jogador","joueur suivant","следующий игрок","siguiente jugador","下一個玩家","następny gracz","a következő játékos","sonraki oyuncu"},
WHO_PREVIOUS ={"previous player","jogador anterior","joueur précédent","предыдущий игрок","anterior jugador","上一個玩家","poprzedni gracz","az előző játékos","önceki oyuncu"},
WHO_ALL ={"all players","todos os jogadores","tous les joueurs","все игроки","todos los jugadores","所有玩家","wszyscy gracze","minden játékos","tüm oyuncular"},
WHO_OTHERS ={"other players","os outros jogadores","autres joueurs","другие игроки","otros jugadores","其他玩家","inni gracze","más játékosok","diğer oyuncular"},
WHO_CHOOSE ={"a player of your choice","um jogador a sua escolha","un joueur de votre choix","игрок по вашему выбору","un jugador a tu elección","你選擇的一個玩家","gracz twojego wyboru","egy általad választott játékos","seçtiğiniz bir oyuncu"},
WHO_RANDOM ={"a random player","um jogador aleatório","un joueur au hasard","случайный игрок","un jugador aleatorio","隨機一個玩家","losowy gracz","egy véletlenszerű játékos","rastgele bir oyuncu"},
WHO_RANDOM2 ={"two random players","dois jogadores aleatórios","deux joueurs au hasard","два случайных игрока","dos jugadores aleatorios","隨機兩個玩家","dwóch losowych graczy","két véletlenszerű játékos","iki rastgele oyuncu"},
WHO_RANDOM3 ={"three random players","três jogadores aleatórios","trois joueurs au hasard","три случайных игрока","tres jugadores aleatorios","隨機三個玩家","trzech losowych graczy","három véletlenszerű játékos","üç rastgele oyuncu"},
AMOUNT_X ={"%s card(s)","%s carta(s)","carte(s) de %s","%s карт(ы)","%s cartas","%s 張卡","%s karta(y)","%s kártya","%s kart(lar)"},
AMOUNT_RANGE ={"%s-%s cards","de %s a %s cartas","cartes de %s-%s","%s-%s карты","%s-%s cartas","%s-%s 張卡","%s-%s kart","%s-%s kártya","%s-%s kart"},
AMOUNT_UNTIL ={"until to have %s card(s)","até ter %s carta(s)","","пока не будет %s карт(ы)","hasta tener %s cartas","直到有 %s 張卡","aż do %s kart","amíg %s kártya van","%s karta sahip olana kadar"},
AMOUNT_RETURN ={"return of action %s","saída da ação %s","","возврат действия %s","retorno de acción %s","撤銷行動 %s","wróć do akcji %s","a %s akció visszatérése","eylem dönüşü %s"},
CONDITION_ANY ={"any card","qualquer carta","n'importe quelle carte","любая карта","cualquier carta","任何一張卡牌","dowolna karta","bármely kártya","herhangi bir kart"},
CONDITION_NUMBER ={"numerical cards","cartas numéricas","cartes numériques","цифровые карты","cartas numéricas","數字卡牌","karty ponumerowane","számkártyák","sayısal kartlar"},
CONDITION_ACTION ={"action cards","cartas de ação","cartes action","карты действий","cartas de acción","行動卡牌","karty akcji","akciókártyák","aksiyon kartları"},
CONDITION_RED ={"red cards","cartas vermelhas","cartes rouges","красные карты","cartas rojas","紅色卡牌","czerwone karty","piros kártyák","kırmızı kartlar"},
CONDITION_BLUE ={"blue cards","cartas azuis","cartes bleues","синие карты","cartas azules","藍色卡牌","niebieskie karty","kék kártyák","mavi kartlar"},
CONDITION_YELLOW ={"yellow cards","cartas amarelas","cartes jaunes","жёлтые карты","cartas amarillas","黃色卡牌","żółte karty","sárga kártyák","sarı kartlar"},
CONDITION_GREEN ={"green cards","cartas verdes","cartes vertes","зелёные карты","cartas verdes","綠色卡牌","zielone karty","zöld kártyák","yeşil kartlar"},
CONDITION_WILD ={"wild cards","curingas","cartes noires","чёрные карты","cartas comodín","換色卡牌","karty wild","Színváltó kártyák","renk kartları"},
CONDITION_SAME ={"cards of the same color as this","cartas da mesma cor que esta","cartes de la même couleur que celle-ci","карты того же цвета, что и этот","cartas del mismo color que éste","跟這一樣顏色的卡牌","karty z takim samym kolorem jak to","ugyanolyan színű kártyák, mint ez","bununla aynı renkteki kartlar"},
ADD_ACTION ={"add action","adicionar ação","ajouter une action","добавить действие","añadir acción","增加行動","dodaj akcję","akció hozzáadása","aksyon ekle"},
CUSTOM_DESC ={"Description","Descrição","Description","Описание","Descripción","描述","Opis","Leírás","Açıklama"},
CUSTOM_DESC_INFO ={"Describe what the card does","Descreva o que a carta faz","Décrit ce que la carte fait","Описывает, что делает карта","Describe que hace la carta","描述卡牌會有什麼功能","Opisz co karta robi","Írd le, hogy mit tud a kártya","Kartın ne yaptığını açıklayın"},
CUSTOM_COPIES ={"Copies of each color","Cópias de cada cor","Copies de chaque couleur","Копии каждого цвета","Copia de cada color","每一個顏色的複本","Kopie każdego koloru","Minden színből darab","Her rengin kopyaları"},
CUSTOM_EDIT ={"Edit","Editar","Modifier","Редактировать","Editar","編輯","Edytuj","Szerkesztés","Düzenle"},
CUSTOM_ERROR ={"There was an error in editing","Houve um erro ao editar","Il y a eu une erreur dans les modifications","Произошла ошибка при редактировании","Hubo un error al editar","編輯中有錯誤","Wystąpił błąd w edycji","Hiba történt szerkesztéskor","Düzenleme sırasında bir hata oluştu"},
CUSTOM ={"Customize card","Customizar carta","Personnaliser la carte","Настроить карту","Personalizar carta","自定義卡牌","Dostosuj kartę","Kártya testreszabása","Kartı özelleştirin"},
CUSTOM_LOAD ={"Load card","Carregar carta","Charger une carte","Загрузить карту","Cargar carta","加載卡牌","Załaduj kartę","Kártya betöltése","Kartı yükle"},
CUSTOM_SAVE ={"Copy card","Copiar carta","Copier la carte","Копировать карту","Copiar carta","複製卡牌","Kopiuj kartę","Kártya másolása","Kartı kopyala"},
CUSTOM_CODE ={"Save this code to share your card: <vp>%s","Guarde este código para compartilhar sua carta: <vp>%s","Sauvegardez ce code pour partager votre carte: <vp>%s","Сохраните этот код, чтобы поделиться своей картой: <vp>%s","Guarda este código para compartir tu carta: <vp>%s","把這個代碼儲存下來以分享你的卡牌: <vp>%s","Zapisz ten kod, aby udostępnić swoją kartę: <vp>%s","Mentsd le ezt a kódot, hogy megoszthasd a kártyád: <vp>%s","Kartınızı paylaşmak için bu kodu kaydedin: <vp>%s"},
TOURNAMENT_HELP ={"The winner of a match earns points from the opponents' remaining cards. Whoever reaches %s points wins the tournament!\n\nNumerical cards: Their face value.\nAction cards: 20 points.\nWild cards: 50 points.","O vencedor da partida ganha pontos das cartas que restaram nas mãos dos adversários. Quem atingir %s pontos vence o torneio!\n\nCartas numéricas: seus valores de face\nCartas de ação: 20 pontos\nCartas curinga: 50 pontos","Le vainqueur d'un match gagne des points sur les cartes restantes de l'adversaire. Celui qui atteint %s points gagne la partie! Cartes numériques: leur valeur est sur la carte. Cartes Action: 20 points. Cartes Noires: 50 points.","Победитель матча зарабатывает очки с оставшихся карт противников. Тот, кто наберёт %s очков, выигрывает турнир!\n\nЦифровые карты: Их номинал.\nКарты действий: 20 очков.\nЧёрные карты: 50 очков.","El ganador de una partida gana puntuación por las cartas restantes de los oponentes. ¡Cuando un jugador alcanza %s puntos, se corona ganador!\n\nCartas numéricas: El número que representan\nCartas de acción: 20 puntos\nCarta comodín: 50 puntos.","在每場遊戲中勝出的玩家會從對手剩下的卡牌中贏得分數。 只要有人贏得 %s 分他就會勝出聯賽!\n\n數字卡: 數字面值就是分數。\n行動卡: 20 分。\n換色卡: 50 分。","Zwycięzca meczu zdobywa punkty od przeciwników z pozostałych kart. Kiedy gracz osiągnie %s punktów, zostanie zwycięzcą!\n\nPonumerowane karty: zgodnie z ich numeracją\nKarty Akcji: 20 points\nKarty Wild: 50 points","A játék nyertese összesített pontszámot kap az ellenfelei hátralévő kártyáinak értékéből. Aki eléri a(z) %s pontot megnyeri a bajnokságot!\n\nSzámkártyák: A rajtuk lévő számérték.\nAkciókártyák: 20 pont.\nSzínváltó kártyák: 50 pont. ","Bir maçın galibi, rakiplerin kalan kartlarından puan kazanır. %s puana ulaşan herkes turnuvayı kazanır!\n\nNumerik kartlar: Yüz değeri.\nAksiyon kartları: 20 puan.\nWild kartları: 50 puan."},
TOURNAMENT_HELP2 ={"When a match ends, the players earn points from their own remaining cards. Whoever reaches %s points gets eliminated.\n\nNumerical cards: Their face value.\nAction cards: 20 points.\nWild cards: 50 points.","Quando uma partida terminar, os jogadores recebem pontos das suas próprias cartas. Quem atingir %s pontos será eliminado do torneio.\n\nCartas numéricas: seus valores de face\nCartas de ação: 20 pontos\nCartas curinga: 50 pontos","Quand une partie se termine, les joueurs gagnent des points à partir de leurs propres cartes restantes. Celui qui atteint %s points sera éliminé. Cartes numériques: leur valeur est sur la carte. Cartes Action: 20 points. Cartes Noires: 50 points.","Когда матч заканчивается, игроки зарабатывают очки со своих оставшихся карт. Тот, кто наберёт %s очков, будет удалён.\n\nЦифровые карты: Их номинал.\nКарты действий: 20 очков.\nДикие карты: 50 очков.","El ganador de una partida gana puntuación por las cartas restantes de los oponentes. ¡Cuando un jugador alcanza %s puntos, se corona ganador!\n\nCartas numéricas: El número que representan\nCartas de acción: 20 puntos\nCarta comodín: 50 puntos.","當一場遊戲結束, 玩家會從自己剩下的卡牌中得到分數。 只要有人達到 %s 分就會被淘汰。\n\n數字卡: 數字面值就是分數。\n行動卡: 20 分。\n換色卡: 50 分。","Po zakończeniu rundy gracze otrzymają punkty z pozostałych kart. Kiedy gracz osiągnie %s punktów, zostanie wyeliminowany!\n\nPonumerowane karty: zgodnie z ich numeracją\nKarty Akcji: 20 points\nKarty Wild: 50 points","A játék végén a játékosok pontokat kapnak a hátralévő kártyáik értékéből. Aki eléri a(z) %s pontot kiesik a bajnokságból.\n\nSzámkártyák: A rajtuk lévő számérték.\nAkciókártyák: 20 pont.\nSzínváltó kártyák: 50 pont. ","Bir maç sona erdiğinde, oyuncular kalan kartlarından puan kazanırlar. %s puana ulaşan herkes elenir.\n\ nNumerik kartlar: Yüz değeri.\nAksiyon kartları: 20 puan.\nWild kartları: 50 puan."},
TOURNAMENT_EDIT ={"Edit score","Editar pontuação","Modifier le score","Изменить счёт","Editar puntuación","編輯分數","Edytuj wynik","Pontszám módosítása","Skoru düzenle"},
HOUSE_FIXED ={"Fixed rules","Regras fixas","Règles fixes","Исправить правила","Reglas Fijas","固定規則","Popraw zasady","Megszabott szabályok","Sabit kurallar"},
ROOM_OPTIONS ={"Room options","Opções da Sala","Options de salon","Настройки комнаты","Opciones de la sala","房間選項","Opcje pokoju","Szoba beállítások","Oda seçenekleri"},
CLEAR_HOUSE ={"Reset rules","Limpar regras","Réinitialiser les règles","Сбросить правила","Resetear Reglas","重置規矩","Zrestartuj zasady","Szabályok alapértelmezése","Kuralları sıfırla"},
HOUSE_NEW_PLAYER ={"Allow new players","Permitir novos jogadores","Autoriser les nouveaux joueurs","Разрешить новым игрокам","Permitir nuevos jugadores","准許新玩家加入","Wpuszczać nowych graczy","Új játékosok engedélyezése","Yeni oyunculara izin ver"},
HOUSE_FIXED_CHAIRS ={"Fixed chairs","Cadeiras fixas","Chaises fixes","Исправить кресла","Sillas Fijas","固定座位","Poprawiono fotele","Foglalt ülőhelyek","Sabit sandalyeler"},
HOUSE_AUTOSTART ={"Start automatically","Iniciar automaticamente","Démarrer automatiquement","Начать автоматически","Empezar automáticamente","自動開始遊戲","Automatyczny start","Automatikus indulás","Otomatik başlat"},
SCORE_BY ={"Score","Pontuação","","Счёт","Puntuación","分數","Punkty","Pontszám","Puan"},
SCORE_1 ={"from opponents' cards","das cartas dos adversários","des cartes de l'adversaire","с карт противника","de las cartas de los oponentes","從對手剩下的卡牌中計算","z kart przeciwnika","az ellenfelek kártyáiból","rakiplerin kartlarından"},
SCORE_2 ={"from own cards","das próprias cartas","de ses propres cartes","с собственных карт","de las cartas propias","從自己剩下的卡牌中計算","z własnych kart","a saját kártyáidból","Kendi kartlarından"},
SCORE_3 ={"1 point per victory","1 ponto por vitória","1 point par victoire","1 очко за победу","un punto por victoria","每次勝出就得到 1 分","1 punkt do zwycięstwa","1 pont győzelmenként","Zafer başına 1 puan"},
RESET_SCORE ={"Reset score","Zerar pontuação","Réinitialiser le score","Сбросить счёт","resetear puntuación","重置分數","Restartuj punkty","Pontszám alapértelmezése","Skoru sıfırla"},
YES ={"yes","sim","oui","да","sí","是","tak","igen","Evet"},
NO ={"no","não","non","нет","no","不是","nie","nem","Hayır"},
COMMANDS ={"See commands","Ver comandos","Voir les commandes","Посмотреть команды","Ver comandos","查看指令","Zobacz komendy","Parancsok mutatása","Komutlara bakın"},
PARTY_ROOM ={"Make your room!","Crie sua sala!","Créez votre salon!","Сделай свою комнату!","¡Haz tu sala!","創建自己的房間!","Zrób swój pokój!","Készítsd el a szobád!","Odanı yap!"},
COMMAND_START ={"start the round manually","inicia a partida manualmente","démarrer la partie manuellement","начать раунд вручную","comienza la ronda manualmente","手動開始遊戲","manualny start rundy","játék kézi indítása","raundu elle başlat"},
COMMAND_NEW ={"start a new round","inicia uma nova partida","démarrer une nouvelle partie","начать новый раунд","inicia una nueva ronda","開始新一輪遊戲","start nowej rundy","új kör indítása","yeni bir raunt başla"},
COMMAND_MAP ={"put a specific map","coloca um mapa específico","jouer une carte spécifique","поставить конкретную карту","pone un mapa en específico","用指定的圖","włącza konkretną mapę","megadott pálya berakása","belirli bir harita koy"},
COMMAND_RESET ={"reset the room score","zera a pontuação da sala","réinitialiser le score du salon","сбросить счёт комнаты","resetea la puntuación en la sala","重設房間分數","restartuje punkty w pokoju","a szoba pontszámának lenullázása","oda puanını sıfırla"},
COMMAND_KICK ={"kick a player from the round","tira um jogador da partida","éjecter un joueur de la partie","выгнать игрока из раунда","expulsa a un jugador de la ronda","把玩家從一局遊戲中踢除","wyrzuca gracza z tej rundy","játékos kirúgása a játékból","turdan bir oyuncu vur"},
COMMAND_BAN ={"ban a player from the room","bane um jogador da sala","bannir un joueur de la partie","забанить игрока в комнате","sanciona a un jugador de la sala","把玩家從房間裡 ban 掉","banuje gracza w tym pokoju","játékos kizárása a szobából","oyuncuyu odadan yasakla"},
COMMAND_UNBAN ={"unban a player","desbane um jogador","retirer le ban d'un joueur","разблокировать игрока","remueve la sanción a un jugador","解除被 ban 了的玩家","odbanowywuje gracza","játékos kizárásának feloldása","oyuncunun yasağını kaldır"},
COMMAND_ADM ={"give/revoke admin powers to a player","dá/tira poderes de administrador para um jogador","donner/retirer le pouvoir d'administrateur à un joueur","дать / отменить полномочия администратора для игрока","da/remueve poderes de administrador a un jugador","給予/撤銷 玩家房間管理能力","daje/wycofuje admina graczowi","admin képességek adása/elvétele játékosnak","bir oyuncuya yönetici yetkileri verme/iptal etme"},
COMMAND_CHAIR ={"put a player on a chair manually","coloca um jogador em uma cadeira manualmente","déplacer manuellement un joueur sur une chaise","посадить игрока на кресло вручную","pone a un jugador manualmente en un asiento","手動把玩家安排到座位上","umieszcza gracza w fotelu manualnie","játékos kézi leültetése","oyuncuyu manuel olarak sandalyeye oturtmak"},
COMMAND_PW ={"equal to /pw","igual ao /pw","équivaut à /pw","равно /pw","pone contraseña a la sala","跟 /pw 用途一樣","jak /pw","ugyanaz mint a /pw","odaya şifre koy /pw"},
COMMAND_SPECTATOR ={"allows you to view the cards of every player, but you can't play","permite ver as cartas de todos os jogadores, mas você não pode jogar","vous permet de voir les cartes de chaque joueur, mais vous ne pouvez pas jouer","позволяет просматривать карты каждого игрока, но вы не можете играть","deja mirar las cartas de todos los jugadores, no podrás jugar con el comando activo","准許你可以查看所有玩家手中的卡牌, 但是你不能加入遊戲","pozwala obserwować karty wszystkich graczy, ale nie można grać","láthatod mások kártyáit, de te magad nem játszhatsz","her oyuncunun kartlarını görmenizi sağlar, ancak oynayamazsınız"},
PASSWORD ={"Password","Senha","Mot de passe","Пароль.","Contraseña","密碼","Hasło","Jelszó","Şifre"},
PASSWORD_REMOVED ={"Password disabled.","Senha desativada.","Mot de passe désactivé.","Пароль неправильный.","Contraseña desactivada","密碼解除了。","Wyłączone hasło","Jelszó kikapcsolva.","Şifre devre dışı."},
MANAGE_OWNER ={"%s is the room owner!","%s é o dono da sala!","%s est le maître du salon!","%s владелец комнаты!","%s es el dueño de la sala!","%s 是房主!","%s jest właścicielem pokoju.","%s a szoba tulajdonosa!","%s oda sahibi!"},
MANAGE_ADM ={"%s is now room manager.","%s agora é gerenciador da sala.","%s est maintenant maître du salon.","%s сейчас менеджер комнаты.","%s ahora es administrador de la sala.","%s 現在是房間管理員。","%s jest teraz pokojowym menadżerem.","%s mostmár szobakezelő.","%s şimdi oda yöneticisidir."},
MANAGE_ADM_REMOVE ={"%s is not room manager anymore.","%s não é mais gerenciador da sala.","%s n'est plus maître du salon.","%s больше не менеджер комнаты.","%s ya no es más administador.","%s 不再是房間管理員了。","%s nie jest już menadżerem.","%s már nem szobakezelő.","%s artık oda yöneticisi değil."},
MANAGE_KICK ={"%s kicked from round.","%s kickado da partida.","%s a été éjecté de la partie.","%s выгнали из раунда.","%s ha sido expulsado de la ronda.","%s 從遊戲中被踢除了。","%s został wyrzucony z bieżącej rundy.","%s kirúgva a játékból.","%s turdan atıldı."},
MANAGE_BAN ={"%s banned from room.","%s banido da sala.","%s a été banni du salon.","%s забанен в комнате.","%s ha sido sancionado de la sala.","%s 從房間中被踢除了。","%s został zbanowany w tym pokoju.","%s kitiltva a szobából.","%s odadan yasaklandı."},
MANAGE_UNBANED ={"%s unbanned from room.","%s desbanido da sala.","%s n'est plus banni du salon.","%s не забанен в комнате.","Se le ha removido la sanción a %s de la sala.","%s 的 ban 解除了。","%s został odbanowany w tym pokoju.","%s kitiltása feloldva.","%s odadan yasağın kaldırıldı."},
UNO_FAIL ={"You did not say UNO!","Você não disse UNO!","Vous n'avez pas dit UNO!","Вы не сказали УНО!","¡No dijiste UNO!","你沒有說 UNO!","Nie powiedziałeś UNO!","Nem mondtál UNO-t!","UNO demedin!"},
DRAW_TWO ={"Discard a +2 or draw %s cards!","Descarte um +2 ou compre %s cartas!","Défaussez un +2 ou tirez %s cartes!","Сбросьте +2 или возьмите %s карт(ы)!","¡Descarta un +2 o toma %s cartas!","發出 +2 卡牌或是罰抽 %s 張卡!","Odrzuć +2 lub dobierz %s kart!","Játssz ki egy +2-t vagy húzz %s kártyát!"," +2 atın veya %s kart çekin!"},
DRAW_FOUR ={"Discard a +4, challenge or draw %s cards!","Descarte um +4, desafie ou compre %s cartas!","Défaussez un +2, défiez, ou tirez %s cartes!","Сбросьте +4, бросьте вызов или возьмите %s карт(ы)!","¡Descarta un +4, desafía o toma %s cartas! ","發出 +4 卡牌, 質疑 或是罰抽 %s 張卡!","Odrzuć +4, wyzwanie lub dobierz %s kart!","Játssz ki egy +4-et, hívd ki az előző játékost vagy húzz %s kártyát!","Bir +4 atın, itiraz edin veya %s kart çekin!"},
DRAW_FOUR_ANTICHALLENGE ={"Discard a +4 or draw %s cards!","Descarte um +4 ou compre %s cartas!","Défaussez un +4 ou tirez %s cartes!","Сбросьте +4 или возьмите %s карт(ы)!","¡Descarta un +4 o toma %s cartas!","發出 +4 卡牌或是罰抽 %s 張卡!","Odrzuć +4 lub dobierz %s kart!","Játssz ki egy +4-et vagy húzz %s kártyát!","Bir +4 atın veya %s kart çekin!"},
DRAW_PLUS ={"Discard a card with + or draw %s cards!","Descarte uma carta com + ou compre %s cartas!","Défaussez une carte avec un + ou tirez %s cartes!","Сбросьте карту с + или возьмите %s карт(ы)!","¡Descarta una carta con + o toma %s cartas!","發出帶 + 號的卡或是罰抽 %s 張卡!","Odrzuć kartę z + lub dobierz %s kart!","Játssz ki egy kártyát + szimbólummal vagy húzz %s kártyát!"," + İşaretli bir kartı atın veya %s kart çekin!"},
DRAW_PLUS_FOUR ={"Discard a card with +, challenge or draw %s cards!","Descarte uma carta com +, desafie ou compre %s cartas!","Défaussez une carte avec un +, défiez, ou tirez %s cartes!","Сбросьте карту с +, бросьте вызов или возьмите %s карт(ы)!","¡Descarta una carta con +, desafía o toma %s cartas!","發出帶 + 號的卡, 質疑 或是罰抽 %s 張卡!","Odrzuć kartę z +, wyzwanie lub dobierz %s kart!","Játssz ki egy kártyát + szimbólummal, hívd ki az előző játékost vagy húzz %s kártyát!"," + İle bir kartı atın, itiraz edin veya %s kart çekin! "},
DRAW_PLUS_FOUR_ANTICHALLENGE ={"Discard a card with + or draw %s cards!","Descarte uma carta com + ou compre %s cartas!","Défaussez une carte avec un + ou tirez %s cartes!","Сбросьте карту с + или возьмите %s карт(ы)!","¡Descarta una carta con + o toma %s cartas!","發出帶 + 號的卡或是罰抽 %s 張卡!","Odrzuć kartę z + lub dobierz %s kart!","Játssz ki egy kártyát + szimbólummal vagy húzz %s kártyát!"," + İşaretli bir kartı atın veya %s kart çekin!"},
DRAW_HELL ={"Discard an action card or draw %s cards!","Descarte uma carta de ação ou compre %s cartas!","Défaussez une carte action ou tirez %s cartes!","Сбросьте карту действий или возьмите %s карт(ы)!","¡Descarta una carta de acción o toma %s cartas!","發出行動卡牌或是罰抽 %s 張卡!","Odrzuć kartę akcji lub dobierz %s kart!","Játssz ki egy akciókártyát vagy húzz %s kártyát!","Bir eylem kartını atın veya %s kart çekin!"},
DRAW_HELL_FOUR ={"Discard an action card, challenge or draw %s cards!","Descarte uma carta de ação, desafie ou compre %s cartas!","Défaussez une carte action, défiez, ou tirez %s cartes!","Сбросьте карту действий, бросьте вызов или возьмите %s карт(ы)!","¡Descarta una carta de acción, desafía o toma %s cartas!","發出行動卡牌, 質疑 或是罰抽 %s 張卡!","Odrzuć kartę akcji, wyzwanie lub dobierz %s kart!","Játssz ki egy akciókártyát, hívd ki az előző játékost vagy húzz %s kártyát!","Bir aksiyon kartını atın, itiraz edin veya %s kart çekin!"},
DRAW_HELL_FOUR_ANTICHALLENGE ={"Discard an action card or draw %s cards!","Descarte uma carta de ação ou compre %s cartas!","Défaussez une carte action ou tirez %s cartes!","Сбросьте карту действий или возьмите %s карт(ы)!","¡Descarta una carta de accióm o toma %s cartas!","發出行動卡牌或是罰抽 %s 張卡!","Odrzuć kartę akcji lub dobierz %s kart!","Játssz ki egy akciókártyát vagy húzz %s kártyát!","Bir aksyon kartı atın veya %s kart çekin!"},
DRAW_CHALLENGE ={"Challenge or draw %s cards!","Desafie ou compre %s cartas!","Défiez ou défaussez %s cartes!","Бросьте вызов или возьмите %s карты(ы)!","¡Desafía o toma %s cartas!","質疑或是罰抽 %s 張卡!","Wyzwanie lub dobranie %s kart!","Hívd ki az előző játékost vagy húzz %s kártyát!","İtiraz et veya %s kart çek!"},
WARN_PERFECTION ={"Play again!","Jogue novamente!","Rejouez!","Играть снова!","¡Juega otra vez!","再發一張卡!","Zagraj ponownie!","Játssz még egyszer.","Tekrar oyna!"},
WARN_STACKING ={"Play more %s or pass your turn.","Jogue outros %s ou passe a vez.","Play more %s or pass your turn.","Играй больше %s или пропусти свой ход.","Juega más %s o pasa tu turno.","多發一張 %s 或是輪到下一個玩家。","Zagraj więcej %s lub przeczekaj kolejkę.","Játssz még %s kártyát vagy add át a kört.","Daha fazla %s oynayın veya sıranızı geçin."},
WARN_UP_DOWN ={"Play a numerical card with a value of either 1 higher or 1 lower, or pass your turn.","Jogue um número acima ou abaixo ou passe a vez.","Jouez une carte numérique d'une valeur supérieure ou inférieure de 1 ou passez votre tour.","Сыграйте с цифровой картой со значением выше 1 или ниже 1, или пропустите ход.","Juega una carta numérica con un valor mayor o menor por uno, o pasa tu turno.","發出一張數值比剛剛 多/少 1 的數字卡牌, 或是輪到下一個玩家。","Graj numerowaną kartą z wartością większą od 1 lub mniejszą od 1, albo oddaj swoją kolejkę.","Játssz egy számkártyát amely értéke eggyel kisebb vagy nagyobb, vagy add át a köröd.","1 veya daha yüksek bir değere sahip bir sayısal kart oynayın veya sıranızı geçin."},
WARN_UP ={"Play a numerical card with a value of 1 higher, or pass your turn.","Jogue um número acima ou passe a vez.","Jouez une carte numérique d'une valeur supérieure de 1, ou passez votre tour.","Сыграйте с цифровой картой со значением выше 1 или пропусти ход.","Juega una carta numérica con un valor superior por uno, o pasa tu turno.","發出一張數值比剛剛多 1 的數字卡牌, 或是輪到下一個玩家。","Graj numerowaną kartą z wartością większą od 1, albo oddaj swoją kolejkę.","Játssz egy számkártyát amely értéke eggyel nagyobb, vagy add át a köröd.","Değeri 1 daha yüksek olan bir sayısal kart oynayın veya sıranızı geçin."},
WARN_DOWN ={"Play a numerical card with a value of 1 lower, or pass your turn.","Jogue um número abaixo ou passe a vez.","Jouez une carte numérique d'une valeur inférieure de 1, ou passez votre tour.","Сыграйте с цифровой картой со значением ниже 1 или пропустите ход.","Juega una carta numérica con un valor inferior por uno, o pasa tu turno.","發出一張數值比剛剛少 1 的數字卡牌, 或是輪到下一個玩家。","Graj numerowaną kartą z wartośnią mniejszą od 1, albo oddaj swoją kolejkę.","Játssz egy számkártyát amely értéke eggyel kisebb, vagy add át a köröd.","Değeri 1 daha düşük olan bir sayısal kart oynayın veya sıranızı geçin."},
WARN_IMITATE ={"Perform this emote!","Imite essa expressão!","Faîtes cette émote!","Выполните эту эмоцию!","¡Imita este emote!","做出這個動作!","Wykonaj tę emotkę!","Fejezd ki ezt az érzést!","Bu ifadeyi gerçekleştir!"},
ONLY_NUMBERS ={"You can only play numerical cards on this turn.","Você pode jogar apenas cartas numéricas neste turno.","Vous ne pouvez jouer que des cartes numériques à ce tour.","В этом ходу вы можете играть только с цифровыми картами.","Sólo puedes jugar cartas numéricas en este turno.","你只可以在這回合發出數字卡牌。","Możesz grać tylko kartami z numerami w tej kolejce.","A körödben csak számkártyát játszhatsz.","Bu sırada yalnızca sayısal kartları oynayabilirsiniz."},
WELCOME_TEXT ={"<j>Welcome to <b>UNO!</b> Press <vp>H <j>to learn how to play. Wait for the next map to play.","<j>Bem vindo ao <b>UNO!</b> Pressione <vp>H <j>para aprender como jogar. Aguarde o próximo mapa para jogar.","<j>Bienvenue dans <b>UNO!</b> Appuyez sur <vp>H<j> pour apprendre à jouer. Attendez la prochaine partie pour jouer.","<j>Добро подаловать в <b>УНО!</b> Нажми <vp>H <j>чтобы научиться играть. Дождитесь следующей карты, чтобы играть.","<j>¡Bienvenido/a a <b>UNO!</b> Presiona <vp>H <j>para aprender a jugar. Espera el siguiente mapa para jugar.","<j>歡迎來到 <b>UNO!</b> 請按 <vp>H 鍵 <j>了解遊戲玩法。 請等待下一張圖來加入遊戲。","<j>Witaj w <b>UNO</b> Kliknij <vp>H<j> by poczytać jak grać. Zaczekaj do następnej mapy by zagrać.","<j>Üdvözlet az <b>UNO</b> játékban! Nyomd meg a <vp>H <j>betűt, hogy megismerkedj a játékszabályokkal. Várd meg a következő pályát, hogy játszhass.","<b>UNO’ya  </b><j>hoş geldin!  Nasıl oynanacağını öğrenmek için <vp>H<j> tuşuna basın. Sonraki haritanın oynamasını bekleyin."},
WELCOME_DISCORD ={"<j>Enter #unotfm Discord group to interact with other players and pick up on game news: <vp>%s","<j>Entre no grupo de #unotfm no Discord para interagir com outros jogadores e ficar por dentro de novidades do jogo: <vp>%s","<j>Rejoignez le groupe Discord d'#unotfm pour intéragir avec les autres joueurs et être au courant des nouveautés sur le jeu: <vp>%s","<j>Вступите в группу #unotfm Discord, чтобы взаимодействовать с другими игроками и получать новости об игре: <vp>%s","<j>Entra al grupo de #unotfm en Discord para interactuar con otros jugadores y conocer antes todas las novedades: <vp>%s","<j>加入 #unotfm Discord 伺服器與其他玩家交流以及得到小遊戲最新的資訊: <vp>%s","<j>Wejdź w grupę #unotfm na Discordzie, aby wchodzić w interakcje z innymi graczami i odbierać wiadomości z gry: <vp>%s","<j>Lépj be az #unotfm Discord csoportba, hogy beszélgethess más játékosokkal, és elolvashasd a játékbeli híreket: <vp>%s","<j>Diğer oyuncularla etkileşim kurmak ve oyun haberlerini almak için #unotfm Discord sunucusuna katılın: <vp>%s"},
WARNING_SOURIS ={"Create an account on Transformice to be able to play in this room.","Crie uma conta no Transformice para poder jogar nesta sala.","Créez un compte sur Transformice pour pouvoir jouer dans ce salon.","Создайте аккаунт в Transformice, чтобы иметь возможность играть в этой комнате.","Crea una cuenta en Transformice para que se te permita el acceso a jugar.","註冊一個 Transformice 用戶來在這房間遊玩。","Załóż konto na Transformice by zagrać w tym pokoju.","Regisztrálj egy Transformice felhasználót, hogy ebben a szobában játszhass.","Bu odada oynayabilmek için Transformice'de bir hesap oluşturun."},
TIME_REMAINING ={"60 seconds remaining!","60 segundos restantes!","60 secondes restantes!","осталось 60 секунд!","¡Quedan 60 segundos!","剩下 60 秒!","Pozostało 60 sekund!","60 másodperc van hátra!","60 saniye kaldı!"},
WARNING_DATA ={"Your data was not loaded. Please reenter the room or return later.","Seus dados não foram carregados corretamente. Por favor reentre na sala ou volte mais tarde.","Vos données n'ont pas été chargées. Merci de partir et revenir, ou de rejoindre un peu plus tard.","Ваши данные не были загружены. Пожалуйста, войдите в комнату или вернитесь позже.","Tus datos no han sido cargados. Por favor, entra nuevamente a la sala o regresa después.","你的資料加載失敗。 請重新進入房間或是晚點再進來。","Twoje dane nie zostały wczytane. Proszę wrócić do pokoju za chwile lub później.","Nem tudtuk betölteni az adataid. Lépj be újra a szobába, vagy térj vissza később.","Verileriniz yüklenmedi. Lütfen odaya tekrar girin veya daha sonra geri dönün."},
CHAIR_UNLOCKED ={"You unlocked the chair '%s'!","Você desbloqueou a cadeira '%s'!","Vous avez débloqué la chaise \"%s\"!","Вы разблокировали стул '%s'!","¡La silla ''%s'' ha sido desbloqueada!","你解鎖了椅子 '%s'!","Odblokowałeś nowy fotel '%s'!","Feloldottad a következő trónt: '%s'!","%s' sandalyesinin kilidini açtınız!"},
RULE_UNLOCKED ={"You unlocked the rule '%s'!","Você desbloqueou a regra '%s'!","Vous avez débloqué la règle \"%s\"!","Вы разблокировали правило '%s'!","¡La regla ''%s'' ha sido desbloqueada!","你解鎖了規矩 '%s'!","Odblokowałeś zasadę '%s'!","Feloldottad a következő szabályt: '%s'!","%s' kuralının kilidini açtınız!"},
MEDAL_UNLOCKED ={"You unlocked a medal!","Você desbloqueou uma medalha!","Vous avez débloqué une médaille!","Вы разблокировали медаль!","¡Has desbloqueado una medalla!","你解鎖了一個獎牌!","Odblokowałeś medal!","Feloldottál egy medált!","Madalyayı açtın!"},
TIP_1 ={"Press the 'UNO!' button before playing your penultimate card.","Pressione o botão 'UNO!' antes de jogar sua penúltima carta.","Appuyez sur le bouton \"UNO!\" avant de jouer votre avant-dernière carte.","Нажмите кнопку «УНО!», прежде чем ложить вашу предпоследнюю карту.","Presiona el botón de ''UNO!'' antes de jugar tu penúltima carta. ","剩下最後二張卡牌的時候, 你在發牌之前應該先按 UNO 鍵。","Kliknij 'UNO' przed zagraniem twoją ostatnią kartą.","Nyomd meg az 'UNO!' gombot, mielőtt kijátszanád az utolsó előtti kártyád.","Sondan bir önceki kartınızı oynamadan önce 'UNO! düğmesine basın."},
TIP_2 ={"Click on the name of each rule to find out their meaning.","Clique nos nomes das regras para saber o que elas significam.","Cliquez sur le nom de chaque règle pour en savoir plus sur celles-ci.","Нажмите на название каждого правила, чтобы узнать их значение.","Da clic en el nombre de cada regla para conocer su significado.","點擊每一道規矩的名字來查看詳情。","Kliknij nazwę zasad by dowiedzieć się więcej.","Kattints a házszabályok neveire, hogy megtudd mit jelentenek.","Anlamlarını öğrenmek için her kuralın adına tıklayın."},
TIP_3 ={"The more you play, the more the delay to get a seat will increase.","Quanto mais partidas consecutivas você jogar, maior é o delay para pegar uma cadeira.","Plus vous jouez, plus le plus le délai pour obtenir une place augmentera.","Чем больше вы играете, тем больше будет увеличиваться задержка, чтобы получить место.","Cuanto más juegues, el retraso al escojer un asiento incrementará.","你玩的愈久, 你每局開始前坐下的緩衝時間愈久。","Jeśli grasz więcej, opóźnienie aby dostać krzesło wzrośnie.","Minél több játékot játszol egy huzamban, annál hosszabb ideig nem fogsz tudni leülni.","Ne kadar çok oynarsanız, koltuk alma gecikmesi o kadar artar."},
TIP_4 ={"Clicking on the wrong card will show it to the other players.","Clicar em carta errada fará você mostrá-la para os outros jogadores.","Cliquer sur la mauvaise carte la montrera aux autres joueurs.","Нажатие на неправильную карту покажет её другим игрокам.","Darle clic a la carta equivocada hará que sea mostrada a los demás jugadores.","要是按到了不能發出的卡牌它就會顯示給其他人看。","Kliknięcie niewłaściwej karty poskutkuje pokazaniem jej innym graczom.","A helytelen kártyára kattintás felfedi a kártyát a többi játékosnak.","Yanlış karta tıklamak onu diğer oyunculara gösterecektir."},
TIP_5 ={"If you stay idle for 2 rounds, you'll lose your chair!","Se você ficar ausente por 2 turnos seguidos, você perde o seu lugar!","Si vous restez inactif pendant 2 rounds, vous perdrez votre chaise!","Если вы будете бездействовать в течение 2 раундов, вы потеряете свое место!","¡Si te quedas ausente por dos rondas, perderás tu silla!","如果你掛著超過 2 回合, 你會失去你的座位並從遊戲中踢出!","Jeśli będziesz afk podczas 2 kolejek stracisz krzesło!","Ha két körön át tétlen maradsz, elveszíted az ülőhelyed!","2 tur boşta kalırsanız, sandalyenizi kaybedersiniz!"},
TIP_6 ={"If someone leaves the game, you can sit on their chair before their turn.","Se alguém sair da partida, você pode pegar seu lugar até que seja a vez dele.","Si quelqu'un quitte la partie, vous pouvez vous asseoir sur leur chaise avant son tour.","Если кто-то выйдет из игры, вы можете сесть на его место до своей очереди.","Si alguien deja el juego, podrás sentarse en su silla antes de que toque su turno.","如果有人中途離開了遊戲, 你可以在輪到他的回合前坐上他的座位取代他。","Jeśli ktoś opuści grę możesz zająć jego miejsce.","Ha valaki elhagyja a játékot, leülhetsz a helyére a köre előtt.","Biri oyunu terk ederse, sırası gelmeden onun sandalyesine oturabilirsiniz."},
TIP_7 ={"Create your own UNO room with your rules by going to #unotfm0Yournickname","Crie sua própria sala de UNO com suas regras indo em #unotfm0Seunick","Créez votre propre salon UNO, avec vos propres règles en allant en #unotfm0Votrepseudo","Создайте свою собственную комнату УНО с вашими правилами, перейдя в #unotfm0ТвойПсевдоним","Crea tu propia sala de UNO con tus propias reglas yendo a #unotfm0nombre#tag","你可以到 #unotfm0(你的名字) 創建你自己的 UNO 房間並使用自己設定的規矩遊玩 。","Stwórz własny pokój UNO z twoimi zasadami idąc do #unotfm0TwójNick","Készíts saját UNO szobát saját szabályokkal: #unotfm0Sajátnév","#Unotfm0KullanıcıAdınız adresine giderek kendi kurallarınızla UNO odanızı oluşturun"},
TIP_8 ={"Unlock house rules so you can use them in your private rooms.","Desbloqueie regras da casa para poder usar em suas salas privadas.","Débloquez des règles de la maison pour pouvoir les utiliser dans vos salons privés.","Разблокируйте домашние правила, чтобы вы могли использовать их в своих комнатах.","Desbloquea más reglas de la casa, las podrás usar en tus salas privadas.","解鎖自訂規矩之後你就可以在自己的私人房間裡使用。","Odblokuj domowe zasady których możesz używać w twoich prywatnych pokojach.","Ha feloldasz egy házszabályt, használhatod azt privát szobákban.","Ev kurallarının kilidini açın, böylece bunları özel odalarınızda kullanabilirsiniz."},
TIP_9 ={"Challenge a +4 only when you believe someone has played it unnecessarily.","Desafie um +4 apenas quando você acredita que alguém jogou de propósito.","Défiez un +4 uniquement lorsque vous pensez que quelqu'un l'a joué inutilement.","Бросьте вызов +4, только если вы считаете, что кто-то сыграл без необходимости.","Desafia un +4 solamente cuando creas que alguien la ha jugado innecesariamente.","你只應該在相信有人不適當的發出了 +4 卡牌後才作出質疑。","Wyzwij +4 tylko wtedy kiedy uważasz że ktoś je niepotrzebnie rozegrał.","Csak akkor hívj ki egy +4-et ha szerinted valaki feleslegesen játszotta ki."," +4'e yalnızca birinin gereksiz yere oynadığına inandığınızda itiraz edin."},
TIP_10 ={"Zero is the only number that has no duplicates in the deck.","O zero é o único número que não possui duplicatas no baralho.","Zéro est le seul nombre qui n'a pas de double dans le jeu.","Ноль - это единственное число, которое не имеет дубликатов в колоде.","El cero es el único numero que no tiene duplicados en la baraja.","0 號卡牌是唯一一個在牌庫中沒有重複的數字卡牌。","Zero jest jedyną liczbą która nie ma duplikatu w talii.","Csak a nullás kártyákból nincs másolat a pakliban.","Sıfır, destede kopyası olmayan tek sayıdır."},
TIP_11 ={"House rules can be unlocked in any room.","Regras da casa podem ser desbloqueadas em qualquer sala.","Les règles de la maison peuvent être débloquée dans n'importe quel salon.","Домашние правила можно разблокировать в любой комнате.","Reglas de la Casa se pueden desbloquear en cualquier sala.","自定規矩可以在任何 uno 房間中解鎖。","Domowe zasady można odblokować w każdym pokoju.","A házszabályokat bármely szobában fel lehet oldani.","Ev kuralları herhangi bir odada açılabilir."},
TIP_12 ={"Victories and chairs can only be obtained in rooms #unotfm1 to #unotfm9 with 4 or more players.","Vitórias e cadeiras só são adquiridos nas salas #unotfm1 até #unotfm9 com 4 ou mais jogadores.","Les victoires et les chaises peuvent être obtenues uniquement dans les salons #unotfm1 à #unotfm9 avec 4 joueurs ou plus","Победы и кресла можно получить только в комнатах с #unotfm1 до #unotfm9 с 4 или более игроками.","Victorias y sillas solamente pueden ser obtenidas en salas de #unotfm1 hasta #unotfm9 con cuatro o más jugadores.","勝利次數/資料 及椅子只可以在4人或以上的 #unotfm1 至 #unotfm9 房間裡得到。","Zwycięstwa i fotele mogą być odblokowywane tylko w pokojach #unotfm1 do #unotfm9 z 4 lub więcej graczy.","Győzelmeket és székeket csak 4 vagy több játékossal rendelkező, #unotfm1-től #unotfm9-ig terjedő tartományba tartozó szobákban lehet szerezni.","Zaferler ve sandalyeler yalnızca 4 veya daha fazla oyuncuyla #unotfm1 ile #unotfm9 arasındaki odalarda elde edilebilir."},
TIP_13 ={"Are the visual effects confusing you? You can disable visual effects from Transformice's configuration menu.","Os efeitos visuais estão te atrapalhando? Desative-os nas configurações do Transformice.","Les effets visuels vous troublent ? Vous pouvez désactiver les effets visuels à partir du menu de configuration de Transformice.","Вас смущают визуальные эффекты? Вы можете отключить их в меню конфигурации Transformice.","¿Los efectos visuales te están confundiendo? Puedes desactivarlos en cualquier momento desde el menú de opciones de Transformice.","視覺效果讓你困擾? 你可以在 Transformice 的設置菜單裡關閉效果。","Wizualne efekty mylą cię? Możesz wyłączyć wizualne efekty w ustawieniach Transformice.","Megzavarnak a vizuális effektek és hatások? Kikapcsolhatod őket a Transformice beállításaiban.","Görsel efektler kafanızı karıştırıyor mu? Görsel efektleri Transformice'nin konfigürasyon menüsünden devre dışı bırakabilirsiniz."},
TIP_14 ={"Click on the top card on the table to see the previously played card underneath it.","Clique na carta da mesa para ver a carta que está por baixo.","Cliquez sur la carte du haut de la table pour voir la carte précédemment jouée en dessous.","Нажмите на верхнюю карту на столе, чтобы увидеть под ней ранее сыгранную карту.","Da clic en la carta superior de la tabla para ver la carta anteriormente jugada debajo de ella.","點按桌面翻開了的卡來查看下面之前發出的卡牌。","Kliknij na górną kartę na stole by zobaczyć wcześniej zagraną.","Kattints az asztalon lévő kártyára, hogy lásd az előtte kijátszott, alatta lévő kártyát.","Altında daha önce oynanan kartı görmek için masanın üstündeki karta tıklayın."},
TIP_15 ={"Try memorizing the colors that your opponent doesn't have.","Procure memorizar cores que seus adversários não possuem.","Essayez de mémoriser les couleurs que vos adversaires n'ont pas.","Попробуйте запомнить цвета, которых нет у вашего оппонента.","Intenta memorizar los colores que tu oponente no tiene.","嘗試記著對手手中卡牌沒有的顏色。","Spróbuj zapamiętać kolory, których twój przeciwnik nie ma.","Próbáld meg megjegyezni, hogy milyen színnel nem rendelkeznek ellenfeleid.","Rakibinizin sahip olmadığı renkleri ezberlemeyi deneyin."},
TIP_16 ={"If you press space repeatedly at the beginning of the game, your chances of getting a chair are reduced.","Pressionar espaço muitas vezes diminui suas chances de garantir seu lugar no início da partida.","Si vous appuyez sur espace plusieurs fois au début d'une partie, les chances d'avoir une chaise sont réduites.","Если вы нажимаете пробел несколько раз в начале игры, ваши шансы получить место уменьшаются.","Si precionas espacio repetidamente al inicio del juego, las posibilidades de que obtengas una silla se reducirán.","如果你在遊戲要開始之前一直按空格鍵, 你得到座位的機率會減少。","Jeśli naciśniesz spację na początku gry, twoje szanse na zdobycie fotela są ograniczone.","Ha a játék kezdetekor folyamatosan nyomkodod a szóközt, a székszerzési esélyeid csökkennek.","Oyunun başında tekrar tekrar boşluk tuşuna basarsanız, sandalye alma şansınız azalır."},
TIP_17 ={"Complete objectives and win special chairs! Press C and click on a chair for more information about it.","Complete objetivos e adquira cadeiras especiais! Pressione C e clique nas cadeiras para mais informações.","Complétez vos objectifs et gagnez des chaises spéciales! Appuyez sur C et cliquez sur une chaise pour plus d'informations à son sujet.","Выполняй задания и выигрывай специальные кресла! Нажмите C и нажмите на стул для получения дополнительной информации о нём.","¡Completa objetivos y gana sillas especiales! Presiona C y da clic en una silla para más información al respecto.","達到指定要求來得到特別的椅子吧! 按 C鍵 及點擊椅子來查看它的資訊。","Spełniaj cele i wygrywaj specjalne fotele! Wciśnij C a następnie kliknij na wybrany fotel by zobaczyć informacje o nim.","Teljesíts célokat és nyerj érte különleges székeket! Nyomd meg a C betűt és kattints egy székre több információért.","Hedefleri tamamlayın ve özel sandalyeler kazanın! Daha fazla bilgi için C'ye basın ve bir sandalyeye tıklayın."},
TIP_18 ={"Wild cards are worth 50 points, action cards 20 and numerical cards are worth the number they depict (0,1,2...9).","Curingas valem 50 pontos, cartas de ação valem 20 e cartas numéricas valem seus próprios números de face.","Les cartes noires valent 50 points, les cartes action valent 20 et les cartes numériques valent le nombre qui leur est affiché (0,1,2...9).","Чёрные карты приносят 50 очков, карты действий 20 и цифровые карты приносят то число, которое они изображают (0,1,2...9).","Las cartas comodín tienen un valor de cincuenta puntos, las cartas de acción veinte y las cartas numéricas tienen el valor del respectivo número que tienen.","換色卡牌價值 50 分數, 行動卡牌價值 20分數而數字卡牌價值牌等於上面的數字 (0,1,2...9)。","Karty Wild warte są 50 punktów, karty akcji 20, a karty z numerami są warte numerom (0,1,2...9).","A Színváltó kártyák 50 pontot értnek, az akciókártyák 20 pontot, és a számkártyák a rajtuk ábrázolt szám értékével rendelkeznek.","Renk kartları 50 puan, aksiyon kartları 20 ve sayısal kartlar tasvir ettikleri sayıya değerdir (0,1,2 ... 9)."},
TIP_19 ={"The Reverse card has the effect of the Skip card when there are only 2 players in the round.","A carta Reverter tem o efeito da carta Pular quando há somente 2 jogadores na partida.","","Обратная карта имеет эффект карты пропуска, когда в раунде всего 2 игрока.","La carta de reversa tiene el efecto de la carta de omisión cuando hay dos jugadores en la ronda.","反轉卡在只有兩個玩家的情況下有著跟跳過卡牌一樣的效果。","Karta zmiany ruchu ma podobny efekt jak karta pomiń, gdy w grze są tylko 2 gracze.","A Visszafordító kártya a Kimaradsz kártya hatását veszi fel 2 játékost tartalmazó játékokban.","Ters kart, turda sadece 2 oyuncu varken Skip kartının etkisine sahiptir."},
TIP_20 ={"If you have any doubts about the rules, press H.","Dúvidas sobre as regras? Pressione H.","Si vous avez des doutes à propos des règles, appuyez sur H.","Если у вас есть какие-либо сомнения относительно правил, нажмите H.","Por cualquier duda respecto a las reglas, presiona H.","如果你對規矩有疑惑, 可以按 H鍵 查看。","Jeśli masz wątpliwości co do zasad wciśnij H.","Ha kételyeid merülnének fel a szabályokkal kapcsolatban, nyomd meg a H betűt, hogy felhozd a segítség ablakot.","Kurallar hakkında herhangi bir şüpheniz varsa, H'ye basın."},
TIP_21 ={"Do you want to know what a card does? Hold <b>Ctrl</b> and click on it!","Quer saber o que uma carta faz? Segure <b>Ctrl</b> e clique nela!","Vous voulez savoir ce qu'une carte fait? Appuyez sur <b>Ctrl</b> et cliquez dessus!","Вы хотите знать, что делает карта? Удержиайте <b>Ctrl</b> и нажмите на неё!","¿Quieres saber qué es lo que hace una carta? ¡Presiona <b>Ctrl</b> y cliquea en la cual desees conocer!","你想知道那一張卡牌可以幹嘛? 同時按著 <b>Ctrl</b> 及鼠標點擊它!","Chcesz wiedzieć co robi karta? Przytrzymaj klawisz <b>Ctrl</b> i kliknij na to!","Szeretnéd tudni mire képes egy kártya? Tartsd nyomva a <b>Ctrl</b> billentyűt és kattints rá!","Bir kartın ne işe yaradığını bilmek ister misiniz? <b>Ctrl</b> tuşunu basılı tutun ve üzerine tıklayın!"},
TIP_23 ={"Learn about the house rules by pressing U and clicking on their names.","Aprenda sobre as regras da casa pressionando U e clicando sobre os nomes delas.","Apprenez-en plus à propos des règles de la maison en appuyant sur U et en cliquant sur leur nom. Learn about the house rules by pressing U and clicking on their names.","Узнайте о домашних правилах, нажав U и на их имена.","Aprende las reglas de la casa presionando U y cliqueando en sus nombres.","按 U鍵 或點擊自訂規矩的名字來了解它們的內容。","Dowiedz się więcej o zasadach wciskając U i klikając nazwę zasady.","Ha szeretnél a házszabályokról tanulni, nyomd meg az U betűt, és kattints a nevükre.","U tuşuna basarak ve isimlerine tıklayarak ev kuralları hakkında bilgi edinin."},
TIP_24 ={"Try to have as many available moves as possible.","Procure ter o maior número de possíveis jogadas na mão.","Essayez de pouvoir faire le plus de déplacements que possible.","Постарайтесь сделать как можно больше доступных ходов.","Intenta tener la mayor cantidad de movimientos posibles.","嘗試讓自己有多一些可行的方法來獲得勝利。","Staraj się miec jak najwięcej dostępnych ruchów jak to możliwe.","Próbálj úgy játszani, hogy minél több lehetséges lépéssel és lehetőséggel tudj élni.","Mümkün olduğunca çok sayıda hamle yapmaya çalışın."},
TIP_25 ={"You can see other players' profiles by typing !p [username] or by clicking on their names during a game.","Veja o perfil de outros jogadores digitando !p [nome] ou clicando no nome deles durante a partida.","Vous pouvez voir le profil des autres joueurs en tapant !p [pseudo] ou en cliquant sur leur pseudo pendant la partie.","Вы можете просмотреть профили других игроков набрав !p [имя пользователя] или нажав на их имена во время игры.","Podrás ver el perfil de otros jugadores escribiendo !p [nombre] o cliqueando su nombre durante algún juego.","你可以輸入 !p [玩家名稱] 或是在遊戲裡點擊他們的名字來查看他們的個人資料。","Profile innych graczy możesz zobaczyć wpisując !p [nick] lub klikając na nazwy podczas gry.","Mások profilját megtekintheted a !p [felhasználónév] paranccsal, illetve ha rákattintasz a nevükre játék közben.","Diğer oyuncuların profillerini !p [kullanıcıAdı] yazarak veya oyun sırasında isimlerine tıklayarak görebilirsiniz."},
TIP_26 ={"Difficult to tell colors apart? Press O and activate colorblind mode to show symbols on the cards.","Dificuldades para diferenciar as cores? Pressione O e ative o modo daltônico para mostrar símbolos nas cartas.","","","","","","","Renkleri birbirinden ayırmak zor mu? Kartlarda sembolleri göstermek için O tuşuna basın ve renk körü modunu etkinleştirin."},
TIP_27 ={"When you show a card in Team Matches, only your partner can see it.","No Jogo em Duplas, as cartas que você mostra são visíveis apenas para sua dupla.","Quand vous montrez une carte dans une Partie en Équipe, seul votre coéquipier peut la voir.","Когда вы показываете карту в Командной Игре, её может видеть только ваш партнёр.","Cuando muestras una carta en partidas en equipo, sólo tu compañero puede verla.","當你在團隊模式中顯示卡牌, 只有你的搭檔才看的見。","Kiedy pokażesz kartę w Rundzie Drużynowej, tylko twój partnej może ją zobaczyć.","Ha felfedsz egy kártyát egy Csapatmérkőzésben, csak a társad láthatja.","Takım Maçlarında bir kart gösterdiğinizde, onu yalnızca partneriniz görebilir."},
TIP_28 ={"Complete quests and earn tickets to spend at the #unotfm shop! Press N for more information.","Conclua missões e receba tickets para gastar na loja do #unotfm! Pressione N para mais informações..","","","","","","","Görevleri tamamlayın ve #unotfm mağazasında harcayabileceğiniz biletler kazanın! Daha fazla bilgi için N'ye basın."},
TIP_29 ={"Your favorite map will appear in the room if you are the player with the most points.","O seu mapa favorito aparecerá na sala caso você seja o jogador com mais pontos.","","","","","","","En çok puana sahip oyuncuysanız, favori haritanız odada görünecektir."},
TIP_30 ={"At the #unotfm shop you can buy chairs and rules, among other cool items!","Na loja do #unotfm você pode comprar cadeiras, regras, entre outros itens legais!","","","","","","","#Unotfm mağazasından diğer harika öğelerin yanı sıra sandalye ve kurallar satın alabilirsiniz!"},
TIP_31 ={"The shop offers 10 random items. The prices and the color of the ticket charged can be different every day!","A loja oferece 10 itens aleatórios. Os preços e a cor do ticket cobrado podem ser diferentes a cada dia!","","","","","","","Dükkan rastgele 10 ürün sunuyor. Ücretlendirilen biletin fiyatları ve rengi her gün farklı olabilir!"},
TIP_32 ={"You receive a ticket for each victory and also randomly when playing games.","Você recebe um ticket por cada vitória e também alguns aleatoriamente ao jogar partidas.","","","","","","","Her zafer için ve ayrıca oyun oynarken rastgele bir bilet alırsınız."},
TIP_33 ={"#unotfm is a non-profit voluntary project. If you want to support it, visit the Credits area in the Menu.","O #unotfm é um projeto voluntário. Se você quiser apoiar, visite a área Créditos no Menu.","","","","","","","#unotfm, kar amacı gütmeyen gönüllü bir projedir. Desteklemek istiyorsanız, Menüdeki Krediler alanını ziyaret edin."},
TIP_34 ={"Consumables can be purchased at the #unotfm shop and provide you with some extra help.","Consumíveis podem ser comprados na loja do #unotfm e oferecem algumas ajudas para você.","","","","","","","Tüketim maddeleri #unotfm mağazasından satın alınabilir ve size ekstra yardım sağlayabilir."},
QUOTE_1 ={"welcome to my mansion","boas vindas à minha mansão","bienvenue dans mon manoir","добро пожаловать в мой особняк","bienvenido a mi mansión","歡迎來到我的大宅","witam w mojej rezydencji","üdvözöllek a kastélyomban","konağıma hoşgeldin"},
QUOTE_2 ={"how about we bet candy?","que tal apostarmos doces?","et si on pariait des bonbons?","как насчет ставок на конфеты?","¿qué tal si apostamos caramelos?","我們來打賭糖果怎麼樣?","jak zakładamy sie o cukierki?","mit szólnál, ha cukorban fogadnánk?","şekerleme bahse ne dersin?"},
QUOTE_3 ={"I arrived well in time for the party","cheguei bem a tempo para a festa","je suis arrivé dans les temps pour faire la fête","я прибыл вовремя на вечеринку","llegué en buen momento para la fiesta","我剛好準時在派對開始前參加","Przybyłem dobrze w czasie na imprezę.","úgy néz ki éppen időben érkeztem a bulihoz","Parti için zamanında geldim"},
QUOTE_4 ={"I hope you forgive me","espero que me perdoe","j'espère que tu me pardonneras","я надеюсь ты меня простишь","creo que te olvidastes de mí","我希望你會原諒我","Mam nadzieję, że mi wybaczysz","remélem meg tudsz nekem bocsátani","Umarım beni affedersin"},
QUOTE_5 ={"nice try","boa tentativa","bien essayé","хорошая попытка","buen intento","不錯的嘗試","Niezła próba","szép próbálkozás","iyi deneme"},
QUOTE_6 ={"mmmph mph","","","ммм ","hmmmmm hmmm","嗯嗯呃 呃","",""},
QUOTE_7 ={"%s plays worse than Buffy","%s joga pior que a Buffy","Buffy joue mieux que %s","%s играет хуже Buffy","%s juega peor que Buffy","%s 比 Buffy 玩的還要糟糕","%s gra gorzej niż Buffy","%s rosszabbul játszik mint Buffy","%s Buffy'den daha kötü oynuyor"},
QUOTE_8 ={"arggh!","","аргх!","啊呀!","","ahh!"},
QUOTE_9 ={"easy game","fácil fácil","c'était facile","лёгкая игра","juego sencillo","真容易","łatwa gra","könnyű","kolay oyun"},
QUOTE_10 ={"did anyone doubt my victory?","alguém duvidava da minha vitória?","quelqu'un a-t-il douté de ma victoire?","кто-нибудь сомневался в моей победе?","¿acaso alguien duda de mi victoria?","有人要否定我的勝利嗎?","Ktoś wątpił w moje zwycięstwo?","volt bárki, aki kételkedni mert a győzelmemben?","kimse benim zaferimden şüphe etti mi?"},
QUOTE_11 ={"this was a scheme! I want a rematch","isso foi complô! quero revanche","c'était un coup monté! je veux une revanche","это была схема! я хочу реванш","¡esto es culpa del sistema! exijo una revancha","這只是我計劃的一部分! 我要重來一局","to była fabuła! Chcę rewanżu","ez csak egy csel volt! új játékot követelek","bu bir plandı! Rövanş istiyorum"},
QUOTE_12 ={"my cards are great","minhas cartas estão ótimas","mes cartes sont intéressantes","мои карты великолепны","mis cartas son buenas","我手上的卡牌真棒","moje karty są świetne","a kártyáim remekek","kartlarım harika"},
QUOTE_13 ={"#!@%","","","","","","","",""},
QUOTE_85 ={"beginners' luck","sorte de principiante","la chance du débutant","новичкам везёт","suerte de principiante","新手運吧","fart","kezdő szerencséje","acemi şansı"},
QUOTE_86 ={"treachery!","na trairagem","triche!","предательство!","¡traición!","你背叛我!","zdrada!","árulás!","hıyanet!"},
QUOTE_87 ={"ok, sweetie","tá bem, meu amor","ok, ma puce","хорошо, милая","ok, cariño","很好, 寶貝","ok, kochanie","rendben, édesem","tamam tatlım"},
QUOTE_14 ={"does anyone need help?","alguém precisa de ajuda?","quelqu'un a besoin d'aide?","кому-нибудь нужна помощь?","¿nadie me quiere ayudar?","有人需要幫忙嗎?","czy ktoś potrzebuje pomocy?","szüksége van valakinek segítségre?","yardıma ihtiyacı var mı?"},
QUOTE_15 ={"uhu, I knew we could do it!","uhu, eu sabia que nós conseguiríamos!","huhu, je savais qu'on pouvait le faire!","юхуу, я знала, что мы можем это сделать!","¡huu, sabía que podíamos hacerlo!","呃, 我知道我們做的到!","uhu, wiedziałam, że możemy to zrobić!","uhu, tudtam hogy menni fog nekünk!","uhu, yapabileceğimizi biliyordum!"},
QUOTE_16 ={"good job!","mandou bem!","bien joué!","хорошая работа!","¡buen trabajo!","做的好!","dobra robota!","szép munka!","aferin!"},
QUOTE_17 ={"merry christmas! give me presents","feliz natal! doem presentes para mim","joyeux noël! donnez moi des cadeaux!","счастливого Рождества! подарите мне подарки","¡feliz navidad! denme mis regalos","聖誕快樂! 快給我禮物","wesołych świąt! dajcie mi prezenty","boldog karácsonyt! kérem az ajándékokat!","mutlu Noeller! bana hediyeler ver"},
QUOTE_18 ={"no presents for you, you phoney Santa Claus!","nada de presentes para você, seu papai noel fajuto!","pas de cadeaux pour toi, faux Père Noël !","нет подарков для тебя, ты фальшивый Санта-Клаус!","no hay regalos para ti, ¡tú... falso Santa Claus!","沒有給你的禮物, 你這假聖誕老人騙子!","żadnych prezentów dla ciebie, ty fałszywy Święty Mikołaju!","nem érdemelsz ajándékot, te kis hamis Télapó!","sana hediye yok, seni sahte Noel Baba!"},
QUOTE_19 ={"hohoho! merry christmas!","hohoho! feliz natal!","hohoho! joyeux noël!!","хо-хо-хо! счастливого Рождества!","¡hohoho! ¡feliz navidad!","呵呵呵! 聖誕快樂!","hohoho! wesołych świąt!","hohoho! boldog karácsonyt!","hohoho! mutlu Noeller!"},
QUOTE_20 ={"I thought you were just something grown-ups created to make us behave","achei que você era só uma invenção para sermos bons ratinhos","","я думал, что ты просто взрослый человек, созданный, чтобы заставить нас вести себя взрослее","pensé que solo eres alguien mayor hecho para hacernos comportarnos","我以為你只是為了讓我們乖乖聽話而塑造的人物","Myślałem, że jesteś kimś dorosłym stworzonym po to, abyśmy się zachowywali","Azt hittem te csak egy dolog vagy amelyet a felnőttek készítettek, hogy fogadjunk szót","Bizi uslu kılmak için yaratılmış yetişkinler olduğunu sanıyordum."},
QUOTE_21 ={"I thought you were just selling trinkets in room 801","e eu achei que você só vendia muambas na sala 801","je croyais que tu vendais des babioles dans le salon 801","я думал, что ты просто продавал безделушки в комнате 801","pensé que solo estabas vendiendo trincheras en la sala 801","我以為你只是在 801 房間賣廉價裝飾品的小鼠","Myślałem, że sprzedajesz ozdóbki w pokoju 801","Azt hittem bizsut árulsz a 801-es szobában","801 numaralı odada ıvır zıvır sattığını sanıyordum."},
QUOTE_22 ={"I'm the real Transformice Christmas NPC","eu que sou o verdadeiro NPC de natal do Transformice","je suis le vrai PNJ de noël sur Transformice","я настоящий Рождественский Transformice NPC","soy el verdadero NPC de navidad de Transformice","我是 Trasnformice 真正的聖誕 NPC","Jestem prawdziwym Myszkowym Świątecznym NPC","Én vagyok az igazi Transformice Karácsonyi NPC","Ben gerçek Transformice Noel NPC'siyim"},
QUOTE_23 ={"so why does nobody remember you?","então por que ninguém lembra de você?","alors pouquoi personne se souvient de toi?","так почему никто не помнит тебя?","¿por qué nadie te recuerda?","那為什麼沒有人記得你?","więc czemu nikt ciebie nie pamięta? ","nos, miért nem emlékszik rád senki?","Öyleyse neden kimse seni hatırlamıyor?"},
QUOTE_24 ={"why don't you go back to your shop?","por que você não volta para sua loja?","pourquoi ne retournes-tu pas à ton magasin?","почему бы тебе не вернуться в свой магазин?","¿por qué no te regresas a tu tienda?","為什麼你不回去你的店鋪繼續工作?","czemu nie wrócisz do swojego sklepu?","miért nem mész vissza a boltocskádba?","neden dükkanına geri dönmüyorsun?"},
QUOTE_25 ={"presents for everyone!","presentes para todos!","cadeaux pour tout le monde!","подарки для всех!","¡regalos para todos!","給所有人的聖誕禮物!","prezenty dla wszystkich!","ajándékok mindenkinek!","herkese hediyeler!"},
QUOTE_26 ={"yay","oba","","ура","","好棒","jej","","yeey"},
QUOTE_27 ={"except for you","menos para você","sauf pour toi","кроме тебя","excepto para ti","除了你","oprócz ciebie","kivéve neked","sen hariç"},
QUOTE_28 ={"%s behaved this year","%s se comportou muito bem neste ano","%s s'est bien comportée cette année","%s хорошо вёл себя в этом году","%s se portó bien este año","%s 今年有好好聽話哦","%s zachowywał się w tym roku","%s idén jól viselkedett","%s bu yıl iyi davrandı"},
QUOTE_29 ={"thank you! you are very kind","obrigado! você é muito gentil","merci! tu es très gentil","благодарю тебя! ты очень добрый","¡gracias! ¡eres muy amable!","謝謝! 你人真好","dziękuje! jesteś bardzo miły!","köszönöm! nagyon kedves tőled","teşekkür ederim! çok kibarsın"},
QUOTE_30 ={"why, you...","ora, seu...","pourquoi, tu...","почему, ты...","por qué, tú...","為什麼, 你...","czemu, ty...","miért, te kis...","neden sen..."},
QUOTE_31 ={"humph!","","","гм!","","碰!","","",""},
QUOTE_32 ={"thank you, but I'll leave this gift for %s","agradeço, mas vou deixar este presente para %s","merci, mais je laisserai ce cadeau à %s","спасибо, но я оставлю этот подарок для %s","gracias, pero dejaré este regalo para %s","謝謝, 但我會把這禮物送給 %s","dziękuję, ale dam ten prezent %s","köszönöm, de ezt az ajándékot inkább meghagyom %s számára","teşekkür ederim, ama bu hediyeyi %s için bırakacağım"},
QUOTE_33 ={"thanks for the gift, but I'd rather win","obrigado pelo presente, mas eu prefiro ganhar","merci pour le cadeau, mais je préfère gagner","спасибо за подарок, но лучше бы я выиграл","gracias por el regalo, pero prefiero ganar","謝謝你的禮物, 可是我比較想勝出這局遊戲","dziękuje za prezent, ale wole wygrać","köszönöm az ajándékot, de inkább nyernék","hediye için teşekkürler ama ben kazanmayı tercih ederim"},
QUOTE_34 ={"thanks for the gift, guys! merry christmas!","obrigado pelo presente, pessoal! feliz natal!","merci pour le cadeau les gars! joyeux noël!","спасибо за подарок, ребята! счастливого Рождества!","¡gracias por el regalo, chicos! ¡feliz navidad!","謝謝你的禮物, 各位! 聖誕快樂!","dziękuje za prezent, chłopaki! wesołych świąt!","köszönöm az ajándékot, srácok! boldog karácsonyt!","hediye için teşekkürler beyler! mutlu Noeller!"},
QUOTE_35 ={"now go back to your toys!","agora volte para seus brinquedinhos!","maintenant retournes à tes jouets!","теперь возвращайся к своим игрушкам!","¡ahora de vuelta a jugar!","現在你們繼續玩吧!","teraz wracaj do swoich zabawek!","most pedig menj szépen vissza a játékaidhoz!","şimdi oyuncaklarınıza geri dönün!"},
QUOTE_36 ={"great victory! thanks guys!","grande vitória! obrigado gente!","belle victoire! merci les gars!","отличная победа! спасибо, ребята!","¡gran victoria! ¡gracias chicos!","真是精彩的勝利! 謝謝各位!","wielkie zwycięstwo! dzięki chłopaki!","szép győzelem! köszönöm, srácok!","büyük zafer! teşekkürler beyler!"},
QUOTE_37 ={"you didn't deserve this!","você não merecia isso!","tu ne méritais pas ça!","ты этого не заслужил!","¡tú no mereces esto!","你才不值得勝利!","nie zasłużyłeś na to!","te nem ezt érdemelted volna!","bunu hak etmedin!"},
QUOTE_38 ={"zzzz...","","","","","","","",""},
QUOTE_39 ={"nom nom...","nam nam...","miam miam...","ням ням...","","呼 噢...","","",""},
QUOTE_40 ={"what, are we playing?","ué, estamos jogando?","quoi, est-ce qu'on joue?","что? мы играем?","¿qué? ¿estamos jugando?","什麼, 我們在玩嗎?","chwila, gramy?","hogy mi, már megy a játék?","ne oynuyoruz?"},
QUOTE_41 ={"did you start without me?","começaram sem mim?","as-tu commencé sans moi?","ты начал без меня?","¿empezastes sin mí?","你剛剛沒等我就開始了遊戲?","zaczeliście beze mnie?","elkezdtétek nélkülem?","bensiz mi başladın?"},
QUOTE_42 ={"it started? but no one warned me","começou? mas ninguém me avisou","ça a commencé? personne ne m'a prévenu","игра началась? но никто не предупредил меня","¿empezó? pero si nadie me había dicho","遊戲開始了? 可是沒有人提醒我","zaczęło się? nikt mnie nie ostrzegł","elkezdődött? de senki sem figyelmeztetett","başladı? ama kimse beni uyarmadı"},
QUOTE_43 ={"it's over already?","já acabou?","c'est déjà fini?","все уже кончено?","¿ya se acabó?","已經完結了嗎?","to już koniec?","máris vége?","çoktan bitti mi?"},
QUOTE_44 ={"I was not prepared!","eu não estava preparada!","j'étais pas prête!","я не был готова!","¡no estaba preparada!","我還沒有準備!","Nie byłam gotowa!","nem voltam felkészülve!","Hazır değildim!"},
QUOTE_45 ={"I won!","ganhei!","j'ai gagné!","я победила!","¡gané!","我勝出了!","Wygrałam!","én nyertem!","Kazandım!"},
QUOTE_46 ={"now I'm going to take a... zzzz","agora eu vou tirar um... zzzz","maintenant je vais faire une... zzzz","теперь я собираюсь взять... zzzz","ahora me voy a... zzzz","現在我要去睡一下了... zzzz","teraz wezmę... zzzz","most pedig lefekszek kicsit... zzzz...","şimdi bir ... zzzz alacağım"},
QUOTE_47 ={"let me play!","deixa eu jogar!","laisse moi jouer!","дай мне поиграть!","¡déjame jugar!","讓我玩嘛!","daj mi zagrać!","hadd játsszak én is!","oynamama izin ver!"},
QUOTE_48 ={"one less","menos um","un de moins","на одного меньше","uno menos","還差一個","jeden mniej","eggyel kevesebb!","bir tane daha az"},
QUOTE_49 ={"so close, but I am prepared","quase, mas estou preparada","si proche, mais je suis prête","так близко, но я готова","muy cerca, pero estoy preparada","差點, 不過我已經準備好了","tak blisko, ale jestem przygotowana","közeli, de fel vagyok készülve","çok yakın ama hazırım"},
QUOTE_50 ={"I AM ALREADY AWAKE","JÁ ESTOU ACORDADA","JE SUIS DÉJÀ RÉVEILLÉE","Я УЖЕ ПРОСНУЛАСЬ","ESTOY DESPIERTA OK","我.已.經.醒.來.了.","JUŻ SIĘ OBUDZIŁAM","MÁR ÉBREN VAGYOK","ZATEN UYANIYORDUM"},
QUOTE_51 ={"it's not fair!","não é justo!","c'est pas du jeu!","это нечестно!","¡no es justo!","這不公平!","to niesprawiedliwe!","nem ér!","bu adil değil!"},
QUOTE_52 ={"thanks ^^","obrigada ^^","merci ^^","спасибо ^^","gracias ^^","謝謝 ^^","dzięki ^^","köszönöm ^^","teşekkürler ^^"},
QUOTE_53 ={"%s is gone","%s se foi","%s est parti","%s ушёл","%s está perdido","%s 離開了","%s zniknął","%s eltűnt","%s gitti"},
QUOTE_54 ={"welcome to my temple!","boas vindas ao meu templo!","bienvenue dans mon temple!","добро пожаловать в мой храм!","¡bienvenido/a a mi templo!","歡迎來到我的廟宇!","witam w mojej świątyni!","üdvözöllek a templomomban!","tapınağıma hoş geldiniz!"},
QUOTE_55 ={"today you will be put to the test!","hoje vocês serão colocados a prova!","aujourd'hui tu seras mis à l'épreuve!","сегодня вас будут проверять!","¡hoy serán puestas a prueba tus capacidades!","今天你要面對一個挑戰!","dzisiaj zostaniecie wystawieni na próbę!","a mai napon te teszel megmérettetve!","bugün teste tabi tutulacaksın!"},
QUOTE_56 ={"get ready!","estejam preparados!","prépare-toi!","приготовьтесь!","¡prepárate!","準備囉!","przygotujcie się!","készülj fel!","Hazırlan!"},
QUOTE_57 ={"a penalty for anyone who dares to touch the sacred deck!","uma penalidade para quem ousar tocar no baralho sagrado!","une penalité pour tous ceux qui osent toucher le jeu sacré!","наказание для тех, кто осмелится прикоснуться к священной колоде!","¡le daré una penalización a quien se atreva a tocar el mazo sagrado!","誰敢碰那可怕的牌庫誰就會得到懲罰!","kara dla każdego, kto ośmieli się dotknąć świętej talii!","büntetés azoknak, akik hozzá mernek érni a szent paklihot!","kutsal güverteye dokunmaya cesaret eden herkes için bir ceza!"},
QUOTE_58 ={"winter has come! supplies are scarce!","o inverno chegou! os suprimentos estão escassos!","l'hiver est arrivé! les provisions se font rares!","зима пришла! запасы ограничены!","¡el invierno arrivó! las reservas se agotan...","冬天來了! 資源變稀少了!","nadeszła zima! dostawy są rzadkością!","a tél megérkezett! az ellátmányok szűkösek","kış geldi! malzeme kıt!"},
QUOTE_59 ={"peace? anything but that","paz? quase isso","paix? tout sauf ça","мир? что-нибудь кроме этого","¿paz? todo menos eso","和平? 除了這個其他的都沒所謂","pokój? cokolwiek ale to","békesség? bármit, csak azt nem","Barış? bundan başka bir şey"},
QUOTE_60 ={"deja vu","","déjà vu","дежавю","déjà vu","deja vu (幻覺記憶)","","",""},
QUOTE_61 ={"hurry up! time is running out!","se apressem! o tempo está acabando!","dépèche-toi! le temps presse!","поторопись! время идёт!","¡arriba! ¡es tiempo de marcharse!","快點! 要沒時間了!","szybciej! czas się kończy!","siess! fogy az időd!","acele et! zaman bitiyor!"},
QUOTE_62 ={"don't lose control!","não percam o controle!","ne perds pas le contrôle!","не теряй контроль!","¡no pierdas el contro!l","別失去理智!","nie trać kontroli!","ne veszítsd el az irányítást","kontrolü kaybetme!"},
QUOTE_63 ={"you are not ready","vocês não estão prontos","tu n'es pas prêt","ты не готов","no es suficiente","你還沒有準備好","nie jesteś gotowy","nem állsz készen","hazır değilsin"},
QUOTE_64 ={"better luck next time!","mais sorte da próxima vez!","plus de chance la prochaine fois!","повезёт в следующий раз!","¡buena suerte la próxima vez!","祝你下次好運!","następnym razem będzie lepiej!","sok sikert legközelebb!","bir dahaki sefere iyi şanslar!"},
QUOTE_65 ={"%s will be a great shaman!","%s será um ótimo shaman!","%s va être un excellent chamane!","%s будет великим шаманом!","¡%s será una gran chamán!","%s 將會成為一個強大的薩滿!","%s będzie świetnym szamanem!","%s kitűnő sámán lesz!","%s harika bir şaman!"},
QUOTE_66 ={"I'm mad, even though I shouldn't be","acho que estou sentindo raiva, mas eu não deveria","Je suis en colère, même si je ne devrais pas l'être","я злюсь, хотя я не должна быть такой","creo que estoy enfurecida, no debería de estarlo","我要抓狂了, 雖然我不應該這樣","Myślę, że jestem wściekły, a nie powinienem być","mérges vagyok, pedig nem kellene annak lennem","Kızmam gerekse bile kızgınım"},
QUOTE_67 ={"%s unlocked the title «Adorer»","%s desbloqueou o título «Adorador»","%s a débloqué le titre «Adorer»","%s разблокировал титул «Обожатель»","%s ha desbloqueado el título «Adorador»","%s 解鎖了稱號 «偶像»","%s odblokował tytuł «Wielbiciel»","%s megszerezte a(z) «Imádó» címet.","%s, «Hayran» unvanının kilidini açtı"},
QUOTE_68 ={"or not","só que não","ou pas","или нет","o no","不然呢","albo nie","vagy nem","ya da değil"},
QUOTE_69 ={"hey, how dare you!","ei, como ousa!","eh! comment oses-tu!","эй, как ты смеешь!","hey, ¡cómo pudiste!","喂, 你竟敢這樣對我!","hej, jak mogłeś! ","hé, hogy merészeled!","hey, nasıl cüret edersin!"},
QUOTE_70 ={"did you play this card on me? suffer the wrath of the sacred cannon!","jogaste esta carta em mim? sofra com a ira do cannon sagrado!","as-tu joué cette carte sur moi? did you play this card on me? subis la colère du canon sacré!","ты положил эту карту мне? терпи гнев священной пушки!","¿acabas de jugar esa carta en mí? ¡ahora sufrirás el dolor del cañón sagrado!","你剛剛是向我發出了這張卡嗎? 承受被嚇倒而憤怒的炮彈的反擊吧!","użyłeś tej karty na mnie? ponieś gniew świętej armaty!","ellenem merészelted játszani ezt a kártyát? tapasztald meg a szentelt ágyúgolyó haragját!","bu kartı bana mı oynadın? kutsal topun gazabına uğrayın!"},
QUOTE_71 ={"it could have been a better curse...","podia ter vindo uma maldição melhor...","ça aurait pu être une meilleure malédiction...","это могло быть лучшее проклятие...","pudo ser una mejor maldición...","那個本來可以是更好的詛咒...","mogło to być lepsze przekleństwo ...","lehetett volna valami jobb átok is...","daha iyi bir lanet olabilirdi ..."},
QUOTE_72 ={"you have a good taste for appearances, %s!","você tem um bom gosto para visuais, %s!","tu as un bon goût pour les apparences, %s!","у тебя хороший вкус к внешнему виду %s!","¡tienes un buen gusto por las apariencias, %s!","%s, 你對時裝的品味真好!","masz dobry gust do występów, %s!","remek divatérzéked van, %s!","görünümler konusunda iyi bir zevkin var, %s!"},
QUOTE_73 ={"we have visitors!","oba temos visitas!","on a des visiteurs!","у нас есть посетители!","¡tenemos visitantes!","我們有訪客了!","mamy gości!","látogatóink vannak!","ziyaretçilerimiz var!"},
QUOTE_74 ={"no bets! don't you remember what happened the last time?","nada de apostas! você sabe o que aconteceu da última vez","pas de paris! tu ne te souviens pas de ce qui s'est passé la dernière fois?","нет ставок! ты не помнишь, что случилось в прошлый раз?","¡sin apuestas! ¿no recuerdas lo que ocurrió la última vez?","別打賭! 你忘記了上次的事嗎?","bez zakładów! nie pamiętasz, co się stało ostatnim razem?","nincs fogadás! nem emlékszel mi történt legutóbb?","bahis yok! en son ne olduğunu hatırlamıyor musun?"},
QUOTE_75 ={"I will never forgive you!","eu não vou perdoar!","Je ne te pardonnerai jamais !","я никогда не прощу тебя!","¡nunca te lo perdonaré!","我不會原諒你的!","Nigdy Ci nie wybaczę!","soha nem bocsátok meg neked!","Seni asla affetmeyeceğim!"},
QUOTE_76 ={"my mother was right, I shouldn't have married a vampire","minha mãe estava certa, eu não devia ter casado com um vampiro","ma mère avait raison, je n'aurais pas du me marier avec un vampire.","моя мама была права, я не должен был жениться на вампире","mi madre tenía razón, nunca debí casarme con un vampiro","我媽說的對, 我不應該嫁給一個吸血鬼","moja matka miała rację, nie powinnam była poślubić wampira","az anyukámnak igaza volt, nem kellett volna hozzámennem egy vámpírhoz","annem haklıydı, bir vampirle evlenmemeliydim"},
QUOTE_77 ={"calm down, honey, it's just a game","calma, meu amor, é só um jogo","du calme, chéri, ce n'est qu'un jeu.","успокойся, милая, это просто игра","cálmate amigo, es sólo un juego","放輕鬆點, 寶貝, 這只是一個遊戲","uspokój się, kochanie, to tylko gra","nyugodj meg, édesem, ez csak egy játék","sakin ol tatlım, bu sadece bir oyun"},
QUOTE_78 ={"but they're still better than you","mas ainda não chega aos seus pés","mais ils sont toujours meilleurs que toi","но они все равно лучше тебя","pero ellos no son oponentes dignos para ti","可是他們還是比你玩的更好","ale one nie pasują do ciebie","de még mindig jobbak nálad","ama yine de senden daha iyiler"},
QUOTE_79 ={"congratulations, my love","parabéns, meu amor","félicitations, mon amour","поздравляю, моя любовь","felicidades, mi amor","恭喜, 我親愛的","gratulacje, kochanie","gratulálok, szerelmem","tebrikler aşkım"},
QUOTE_80 ={"can you choose what to draw? people, he's cheating!","você pode escolher o que vai comprar? gente ele tá trapaceando!","tu peux choisir la carte à tirer? les gens, c'est un tricheur!","ты можешь выбрать, что взять? люди, он обманывает!","¿puedes elegir que sortear? ¡gente, está haciendo trampa!","你可以選擇要抽到什麼卡? 各位, 他在作弊!","czy możesz wybrać to co chcesz dobrać? ludzie, on oszukuje!","kiválaszthatod mit húzol fel? emberek, egy csaló!","ne çekeceğini seçebilir misin? insanlar, hile yapıyor!"},
QUOTE_81 ={"I'm beginning to get the hang of it","já estou começando a pegar o jeito","je commence à m'y faire","я начинаю понимать это","estoy empezando a entender esto","我開始知道它的竅門了","Zaczynam rozumieć to","kezdem érteni a lényegét","Asmaya başlıyorum"},
QUOTE_82 ={"is that how you play?","é assim que se joga?","est-ce comme ça que tu joues?","так ты играешь?","¿así es como juegas?","這就是你的玩法?","to właśnie tak byś zagrał? ","szóval úgy kell játszani?","böyle mi oynuyorsun"},
QUOTE_83 ={"ok, now go take care of Voldemouse, he's crying","ok, agora vá cuidar do Voldemouse, ele está chorando","ok, maintenant, va t'occuper de Voldemouse, il est en train de pleurer","хорошо, теперь иди позаботься о Voldemouse, он плачет Voldemouse","bien, ahora ve a consolar a Voldemouse, está llorando","好的, 現在去照顧一下 Voldemouse, 他在哭了","ok, teraz zajmij się Voldemousem, on płacze","rendben, most figyelj oda Voldemouse-ra, elkezdett sírni","tamam şimdi git Voldemouse'a iyi bak, ağlıyor"},
QUOTE_84 ={"uno! hahahahaha","","","уно! ахахахаха","","uno! 哈哈哈哈哈","",""},
QUOTE_88 ={"this cave is melting, we'd better finish soon!","esta caverna está derretendo, melhor terminarmos logo!","cette cave est en train de fondre, on devrait terminer au plus tôt!","эта пещера тает, нам лучше поторопиться!","¡esta cueva se está derritiedo, deberíamos salir de aquí!","這個洞穴在融化, 我們最好快點把這局遊戲完結掉!","ta jaskinia topnieje, lepiej już niedługo kończyć!","olvadozik a barlang, fejezzük be minél hamarabb!","bu mağara eriyor, yakında bitirsek iyi olur!"},
QUOTE_89 ={"welcome to my house! I don't remember typing /inv...","bem vindos ao meu cafofo! ué eu não lembro de ter dado /inv...","bienvenue chez moi! je me souviens pas avoir tapé /inv...","добро пожаловать ко мне домой! Я не помню как печатать /inv...","¡bienvenido/a a mi casa! no me acuerdo de haber escrito /inv...","歡迎來到我家! 我記得我沒有輸入 /inv...","Witamy w moim domu! Nie pamiętam pisania / inv ...","üdvözöllek a házamban! nem emlékszem hogy beírtam volna hogy /inv...","Evime hoşgeldiniz! /İnv yazdığımı hatırlamıyorum ..."},
QUOTE_90 ={"how kind of you, %s!","bondade a sua, %s!","comme c'est gentil de ta part, %s!","how kind of you, %s!","¡cómo pudiste, %s!","%s, 你人真好!","jak miło z twojej strony, %s!","mily kedves tőled, %s!","ne kadar naziksin,%s!"},
QUOTE_91 ={"I'm just a snowmouse, I can't hold so many cards!","sou só um boneco de neve, não posso segurar tantas cartas!","je ne suis juste qu'une souris de neige, je ne peux pas tenir autant de cartes!","я просто снежная мышка, я не могу держать столько карт!","sólo soy un ratón de nieve, ¡no puedo tener tantas cartas!","我只是一個雪鼠, 我手拿不到那麼多卡牌啦!","Jestem tylko myszką ze śniegu, nie mogę trzymać tak wielu kart!","én csak egy szerény hóegér vagyok, nem tudok annyi kártyát tartani","Ben sadece bir kar faresiyim, bu kadar çok kart tutamıyorum!"},
QUOTE_92 ={"is there a title with my name?","será que existe um título com meu nome?","il y a un titre avec mon nom?","есть ли титул с моим именем?","¿hay un título con mi nombre?","是不是有一個稱號用上我的名字了?","czy istnieje tytuł z moim imieniem?","létezik egy cím a nevemmel?","benim adıma ait bir ünvan var mı?"},
QUOTE_93 ={"you're so quiet... let's break the ice, people!","vocês estão tão calados... vamos quebrar esse gelo galera!","vous êtes si silencieux... brisons la glace, tout le monde!","вы такой тихие... давайте сломаем лёд, люди!","estás muy tieso... ¡hay que romper el hielo, gente!","你真安靜... 我們來玩個破冰遊戲吧, 各位!","jesteś taki cichy ... pora przełamać lód, ludzie!","annyira csendesek vagytok.. törjük fel a jeget, emberek!","çok sessizsiniz ... buzları kıralım millet!"},
QUOTE_94 ={"...","","","","","","","",""},
QUOTE_95 ={"I think I'm melting!","acho que estou derretendo!","je crois que je fond!","я думаю, что я таю!","¡creo que me estoy derritiendo!","我覺得我在融化了!","Myślę, że topnieję!","úgy tűnik olvadok!","Sanırım eriyorum!"},
QUOTE_96 ={"great game! visit more often!","ótimo jogo! venham mais vezes!","super jeu! rends moi visite plus souvent!","отличная игра! приходите чаще!","¡buen juego! ¡visita más seguido!","好一場遊戲! 多點來探望我吧!","świetna gra! odwiedzaj częściej!","remek játék! meglátogathatnál gyakrabban!","İyi oyun! daha sık ziyaret edin!"},
QUOTE_97 ={"oh, no! %s's cards got wet!","oh, não! as cartas de %s molharam!","oh, non! les cartes %s sont mouillées!","ох, нет! у %s's промокли карты!","¡oh no! ¡las cartas de %s se mojaron!","噢, 不! %s 的卡牌都濕透了!","o nie! Karty %s zamoczyły się!","ó ne, %s kártyái benedvesedtek!","Oh hayır! %s kartların ıslandı!"},
QUOTE_98 ={"Papaille? don't talk to me about him! he sells canned snowmen...","Papaille? não me fale dele! ele vende bonecos de neve enlatados...","Papaille? ne me parle pas de lui, il vend des bonhommes de neige en conserve...","Papaille? не говори со мной о нём! он продает консервированных снеговиков...","¿Papaille? ¡no me hables de él! vende hombres de nieve enlatados...","Papaille? 不要跟我說到他! 他售賣罐裝雪人...","Papaille? nie mów mi o nim! sprzedaje puszkowane bałwany ...","Papaille? ne beszélj róla hozzám, konzerv hóembereket árul...","Papaille? benimle onun hakkında konuşma! konserve kardan adam satıyor ..."},
QUOTE_99 ={"nice title, %s!","título legal, %s!","joli titre, %s!","хороший титул, %s!","¡buen título, %s!","%s, 你的稱號不錯啊!","niezły tytuł, %s!","szép cím, %s!","güzel ünvan, %s!"},
QUOTE_100 ={"Jingle is too busy sending mice to fetch things for him","Jingle está muito ocupado mandando ratos buscarem as coisas para ele","Jingle est trop occupé à envoyer des souris chercher des choses pour lui","Jingle слишком занят, отправляя мышей за вещами для него","Jingle estará tan ocupado como para enviar ratones para recuparle cosas","Jingle 他常常忙著叫小鼠幫他找東西","Jingle jest zbyt zajęty wysyłaniem myszy do przyniesienia rzeczy dla niego.","Jingle túlságosan elfoglalt azzal, hogy egereket küld tárgyakat hordozni neki","Jingle, ona bir şeyler getiremeyecek kadar fare göndermekle meşgul"},
QUOTE_101 ={"Icemice is frozen, he can't talk","Icemice está congelado, ele não pode falar","Icemice est gelé, il ne peut pas parler","Icemice заморожен, он не может говорить","Icemice está congelado, no puede hablar","Icemice 是完全的凍住了, 他不能說話","Icemice jest zamrożony, nie może mówić","Icemice lefagyott, nem tud beszélni","Icemice dondu, konuşamaz"},
QUOTE_102 ={"I just don't know how he plays...","eu só não sei como ele joga...","je ne sais même pas comment il joue...","я просто не знаю, как он играет...","no sé cómo es que él juega...","我不知道他怎麼玩的...","Po prostu nie wiem jak on gra...","nem tudom hogy mégis hogyan tud játszani...","Nasıl oynadığını bilmiyorum ..."},
}


--[[ src/bots/autoplay.lua ]]--

BOT.B = { -- Autoplay
	img = "16004ade907.png",
	chair = "test",
	medal = "none",
	victory = 801000,
	autoPlay = function ()
		local n = ROUND.turn
		if ROUND.chair[n].mode == "BUSY" then
			if ROUND.chair[n].action then
				if ROUND.chair[n].action.func then
					local pool = {}
					for i, v in pairs(ROUND.chair[n].action.op) do
						table.insert(pool, i)
					end
					ROUND.chair[n].action.func(n, pool[math.random(#pool)])
				elseif ROUND.chair[n].action.name == "WILD" then
					local pool = {"red", "blue", "yellow", "green"}
					paintCard(pool[math.random(#pool)], n)
				elseif ROUND.chair[n].action.name == "TRACKING" then
					drawCardTracking(n, ROUND.chair[n].action.card[math.random(3)])
					eventMouse(ROUND.chair[n].owner, 350, 220, true)
				elseif ROUND.chair[n].action.name == "WISH" then
					makeWish(n, ROUND.chair[n].action.card[math.random(3)])
					eventMouse(ROUND.chair[n].owner, 350, 220, true)
				elseif ROUND.chair[n].action.name == "RULE" then
					selectRule(n, math.random(1,2))
				elseif ROUND.chair[n].action.name == "IMITATE" then
					emoteVerify(true)
				end
			elseif ROUND.chair[n].flag == "circuit" and not ROUND.chair[n].circuitPlayed and canPlayHand(n) then
				local pool = {}
				for i, v in pairs(ROUND.chair[n].hand) do
					if canPlay(n, i) then
						table.insert(pool, i)
					end
				end
				if #ROUND.chair[n].hand == 2 then
					sayUno(n)
				end
				ROUND.chair[n].circuitPlayed = true
				ROUND.chair[n].flag = "circuitused"
				drawChair(n)
				local img = tfm.exec.addImage(IMG.misc.robot, "!1000", ROUND.chair[n].x-50, 30)
				TIMER.img[img] = GLOBAL_TIME+500
				playCard(n, pool[math.random(#pool)])
			else
				local m = n
				eventMouse(ROUND.chair[n].owner, 350, 220, true)
				eventMouse(ROUND.chair[n].owner, 680, 280, true)
				if m == ROUND.turn then
					ROUND.time = GLOBAL_TIME + 3000
					updateTurnTimer()
				end
			end
		end
	end
}


--[[ src/bots/buffy.lua ]]--

BOT.Buffy = {
	img = "165e3e947ca.png",
	chair = "default",
	medal = "buffy",
	victory = 0,
	eventWelcome = function ()
		BOT.Buffy.uno = nil
		BOT.Buffy.play = nil
	end,
	eventWin = function ()
		if math.random() > 0.5 then
			quote("Buffy", "QUOTE_81")
			if math.random() > 0.5 then
				addFunctionTimer(quote, 4000, "Drekkemaus", "QUOTE_85")
			end
		end
	end,
	eventRandom = function (name)
		if name == "Buffy" and not BOT.Buffy.play and math.random() > 0.60 then
			quote("Buffy", "QUOTE_82")
			Bot.Buffy.play = true
		end
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.8 then
				eventEmotePlayed("Buffy", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.9 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
			local can = false
			for i, v in pairs(ROUND.chair[n].hand) do
				if canPlay(n, i) then
					missCard(n, v, 1000)
					jumpIn(ROUND.turn, n)
					updateArrow()
					playCard(n, i, false, true)
					break
				end
			end
		end
	end,
	autoPlay = function ()
		if ROUND.chair[ROUND.turn].mode == "BUSY" then
			eventMouse(ROUND.chair[ROUND.turn].owner, 750, 210)
			if ROUND.chair[ROUND.turn].action then
				if ROUND.chair[ROUND.turn].action.func then
					local pool = {}
					for i, v in pairs(ROUND.chair[ROUND.turn].action.op) do
						table.insert(pool, i)
					end
					local target = pool[math.random(#pool)]
					tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
					ROUND.chair[ROUND.turn].action.func(ROUND.turn, target)
				elseif ROUND.chair[ROUND.turn].action.name == "WILD" then
					local pool = {"red", "blue", "yellow", "green"}
					paintCard(pool[math.random(#pool)], ROUND.turn)
				elseif ROUND.chair[ROUND.turn].action.name == "TRACKING" then
					drawCardTracking(ROUND.turn, ROUND.chair[ROUND.turn].action.card[math.random(3)])
				elseif ROUND.chair[ROUND.turn].action.name == "WISH" then
					makeWish(ROUND.turn, ROUND.chair[ROUND.turn].action.card[math.random(3)])
				elseif ROUND.chair[ROUND.turn].action.name == "BAN" then
					makeBan(ROUND.turn, ROUND.chair[ROUND.turn].action.card[math.random(3)])
				elseif ROUND.chair[ROUND.turn].action.name == "RULE" then
					ROUND.chair[ROUND.turn].confuse = false
					selectRule(ROUND.turn, math.random(1,2))
				end
			else
				if canPlayHand(ROUND.turn) then
					local pool = {}
					for i, v in pairs(ROUND.chair[ROUND.turn].hand) do
						if canPlay(ROUND.turn, i) then
							table.insert(pool, i)
						end
					end
					if #ROUND.chair[ROUND.turn].hand == 2 then
						sayUno(ROUND.turn)
						if not BOT.Buffy.uno and math.random() > 0.5 then
							quote("Buffy", "QUOTE_84")
							BOT.Buffy.uno = true
						end
					end
					playCard(ROUND.turn, pool[math.random(#pool)])
				else
					if not (ROUND.chair[ROUND.turn].draw and not ROUND.chair[ROUND.turn].played) then
						eventMouse(ROUND.chair[ROUND.turn].owner, 350, 220, true)
					else
						ROUND.chair[ROUND.turn].confuse = false
						eventMouse(ROUND.chair[ROUND.turn].owner, 680, 280, true)
					end
				end
			end
		end
	end
}


--[[ src/bots/charlotte.lua ]]--

BOT.Charlotte = {
	sleep = true,
	imgAwake = "16114b7cd0c.png",
	imgSleepy = "16114b83a04.png",
	img = "16114b83a04.png",
	chair = "wood",
	medal = "charlotte",
	victory = 1000,
	eventBlock = function ()
		if math.random() > 0.5 then
			quote("Charlotte", "QUOTE_49")
		end
	end,
	eventInk = function (color)
		if ROUND.gameMode[color] then
			quote("Charlotte", "QUOTE_52")
		elseif not BOT.Charlotte.sleep then
			quote("Charlotte", "QUOTE_51")
		end
	end,
	eventPenalty = function ()
		local pool = {"QUOTE_47", "QUOTE_51"}
		if not BOT.Charlotte.sleep and math.random() > 0.5 then
			quote("Charlotte", pool[math.random(#pool)])
		end
	end,
	eventEliminate = function (name)
		local pool = {"QUOTE_48", "QUOTE_53"}
		if not BOT.Charlotte.sleep and math.random() > 0.5 then
			quote("Charlotte", pool[math.random(#pool)], name)
		end
	end,
	eventWelcome = function (i)
		BOT.Charlotte.img = BOT.Charlotte.imgSleepy
		BOT.Charlotte.sleep = true
		BOT.Charlotte.chat = false
		drawChair(i)
	end,
	eventWin = function ()
		quote("Charlotte", "QUOTE_45")
		if math.random() > 0.5 then
			addFunctionTimer(quote, 3000, "Charlotte", "QUOTE_46")
		end
		BOT.Charlotte.img = BOT.Charlotte.imgSleepy
	end,
	eventLose = function ()
		if BOT.Charlotte.sleep then
			quote("Charlotte", "QUOTE_43")
		elseif math.random() > 0.5 then
			quote("Charlotte", "QUOTE_44")
		end
		BOT.Charlotte.img = BOT.Charlotte.imgSleepy
	end,
	eventLoop = function (n)
		if not BOT.Charlotte.sleep then
			if ROUND.chair[ROUND.turn].action and ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.7 then
				eventEmotePlayed("Charlotte", ROUND.chair[ROUND.turn].action.action)
			elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.7 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
				local can = false
				for i, v in pairs(ROUND.chair[n].hand) do
					if canPlay(n, i) then
						missCard(n, v, 1000)
						jumpIn(ROUND.turn, n)
						updateArrow()
						playCard(n, i, false, true)
						break
					end
				end
			end
		end
	end,
	eventChat = function (p, msg)
		if not BOT.Charlotte.sleep and string.find(msg, "CHARLOTTE") and not BOT.Charlotte.chat then
			addFunctionTimer(quote, 3000, "Charlotte", "QUOTE_50")
			BOT.Charlotte.chat = true
		end
	end,
	autoPlay = function ()
		ROUND.chair[ROUND.turn].afk = false
		if BOT.Charlotte.sleep then
			if #ROUND.chair[ROUND.turn].hand >= 10 and not ROUND.accumulated then
				BOT.Charlotte.sleep = false
				BOT.Charlotte.img = BOT.Charlotte.imgAwake
				drawChair(ROUND.turn)
				power(ROUND.turn)
				local pool = {"QUOTE_40", "QUOTE_41", "QUOTE_42"}
				quote("Charlotte", pool[math.random(#pool)])
			elseif ROUND.time - GLOBAL_TIME > 5000 then
				ROUND.chair[ROUND.turn].afk = false
				ROUND.time = GLOBAL_TIME + 5000
				updateTurnTimer()
				if math.random() > 0.7 then
					local pool = {"QUOTE_38", "QUOTE_39"}
					quote("Charlotte", pool[math.random(#pool)])
				end
			end
		else
			local action = botMakeAction()
			if action == "DRAW" then
				BOT.Charlotte.eventPenalty()
			elseif action == "BLOCK" then
				BOT.Charlotte.eventBlock()
			end
		end
	end
}


--[[ src/bots/confuse.lua ]]--

BOT.A = { -- Confusão
	img = "16004ade907.png",
	chair = "test",
	medal = "none",
	victory = 801000,
	autoPlay = function ()
		if ROUND.chair[ROUND.turn].mode == "BUSY" then
			sayUno(ROUND.turn)
			if ROUND.chair[ROUND.turn].action then
				if ROUND.chair[ROUND.turn].action.func then
					local pool = {}
					for i, v in pairs(ROUND.chair[ROUND.turn].action.op) do
						table.insert(pool, i)
					end
					ROUND.chair[ROUND.turn].action.func(ROUND.turn, pool[math.random(#pool)])
				elseif ROUND.chair[ROUND.turn].action.name == "WILD" then
					local pool = {"red", "blue", "yellow", "green"}
					ROUND.chair[ROUND.turn].confuse = false
					paintCard(pool[math.random(#pool)], ROUND.turn)
				elseif ROUND.chair[ROUND.turn].action.name == "TRACKING" then
					drawCardTracking(ROUND.turn, ROUND.chair[ROUND.turn].action.card[math.random(3)])
				elseif ROUND.chair[ROUND.turn].action.name == "WISH" then
					ROUND.chair[ROUND.turn].confuse = false
					makeWish(ROUND.turn, ROUND.chair[ROUND.turn].action.card[math.random(3)])
				elseif ROUND.chair[ROUND.turn].action.name == "BAN" then
					ROUND.chair[ROUND.turn].confuse = false
					makeBan(ROUND.turn, ROUND.chair[ROUND.turn].action.card[math.random(3)])
				elseif ROUND.chair[ROUND.turn].action.name == "RULE" then
					ROUND.chair[ROUND.turn].confuse = false
					selectRule(ROUND.turn, math.random(1,2))
				end
			else
				if canPlayHand(ROUND.turn) then
					local pool = {}
					for i, v in pairs(ROUND.chair[ROUND.turn].hand) do
						if canPlay(ROUND.turn, i) then
							table.insert(pool, i)
						end
					end
					if math.random(0,#pool) > 0 then
						playCard(ROUND.turn, pool[math.random(#pool)])
					else
						if ROUND.chair[ROUND.turn].draw then
							ROUND.chair[ROUND.turn].confuse = false
							eventMouse(ROUND.chair[ROUND.turn].owner, 680, 280, true)
						else
							eventMouse(ROUND.chair[ROUND.turn].owner, 350, 220, true)
						end
					end
				else
					if not (ROUND.chair[ROUND.turn].draw and not ROUND.chair[ROUND.turn].played) then
						eventMouse(ROUND.chair[ROUND.turn].owner, 350, 220, true)
					else
						ROUND.chair[ROUND.turn].confuse = false
						eventMouse(ROUND.chair[ROUND.turn].owner, 680, 280, true)
					end
				end
			end
		end
	end
}


--[[ src/bots/drekkemaus.lua ]]--

BOT.Drekkemaus = {
	img = "15ed4ecf2e3.png",
	chair = "hell",
	medal = "drekkemaus",
	victory = 40000,
	eventWelcome = function ()
		if math.random() > 0.5 then 
			local pool = {"QUOTE_1", "QUOTE_3"}
			quote("Drekkemaus", pool[math.random(#pool)])
		else
			quote("Buffy", "QUOTE_73")
		end
		BOT.Drekkemaus.buffy = nil
		BOT.Drekkemaus.tracking = nil
		local pool = {"picnic", "metal", "paper", "carpet"}
		PLAYER.Drekkemaus.flagEquipped = pool[math.random(#pool)]
	end,
	eventWin = function ()
		local pool = {"QUOTE_9", "QUOTE_10"}
		if math.random() > 0.5 then
			quote("Drekkemaus", pool[math.random(#pool)])
			if math.random() > 0.5 then
				addFunctionTimer(quote, 3000, "Buffy", "QUOTE_83")
				addFunctionTimer(quote, 6000, "Drekkemaus", "QUOTE_87")
			end
		else
			quote("Buffy", "QUOTE_79")
		end
	end,
	eventLose = function (name)
		if math.random() > 0.5 then
			quote("Drekkemaus", "QUOTE_11")
		end
		if PLAYER[name].trophy.buffy then
			unlockTrophy(name, "drekkemaus")
		else
			unlockTrophy(name, "buffy")
		end
	end,
	eventBlock = function ()
		if math.random() > 0.5 then
			quote("Drekkemaus", "QUOTE_5")
		end
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.5 then
				eventEmotePlayed("Drekkemaus", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.5 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
			local can = false
			for i, v in pairs(ROUND.chair[n].hand) do
				if canPlay(n, i) then
					missCard(n, v, 1000)
					jumpIn(ROUND.turn, n)
					updateArrow()
					playCard(n, i, false, true)
					break
				end
			end
		end
	end,
	eventRandom = function (name)
		if name ~= "Buffy" and not BOT.Drekkemaus.buffy and math.random() > 0.985 then
			quote("Drekkemaus", "QUOTE_7", name)
			BOT.Drekkemaus.buffy = true
			if math.random() > 0.5 then
				addFunctionTimer(quote, 5000, "Buffy", "QUOTE_78")
			end
		end
	end,
	eventWeb = function ()
		if math.random() > 0.7 then
			quote("Drekkemaus", "QUOTE_6")
		end
	end,
	eventSorry = function ()
		if math.random() > 0.7 then
			quote("Drekkemaus", "QUOTE_4")
			local nextPlayer = nextChair(ROUND.turn)
			if ROUND.chair[nextPlayer].owner == "Buffy" then
				local pool = {"QUOTE_75", "QUOTE_76"}
				addFunctionTimer(quote, 5000, "Buffy", pool[math.random(#pool)])
			end
		end
	end,
	eventStart = function ()
		local pool = {"QUOTE_2", "QUOTE_12"}
		local rand = pool[math.random(#pool)]
		quote("Drekkemaus", rand)
		if rand == "QUOTE_2" then
			addFunctionTimer(quote, 5000, "Buffy", "QUOTE_74")
		end
	end,
	eventPenalty = function ()
		local previousPlayer = previousChair(ROUND.turn)
		if ROUND.chair[previousPlayer].owner == "Buffy" then
			quote("Drekkemaus", "QUOTE_86")
			addFunctionTimer(quote, 5000, "Buffy", "QUOTE_77")
		else
			local pool = {"QUOTE_8", "QUOTE_13"}
			if math.random() > 0.7 then
				quote("Drekkemaus", pool[math.random(#pool)])
			end
		end
	end,
	autoPlay = function ()
		local action = botMakeAction()
		if action == "TRACKING" and not BOT.Drekkemaus.tracking and math.random() > 0.7 then
			quote("Buffy", "QUOTE_80")
		elseif action == "BLOCK" or action == "CHALLENGE" then
			BOT.Drekkemaus.eventBlock()
		elseif action == "DRAW" then
			BOT.Drekkemaus.eventPenalty()
		elseif action == "PLAY" and ROUND.topCard.card[2] == "draw2" or ROUND.topCard.card[2] == "draw4" then
			BOT.Drekkemaus.eventSorry()
		end
	end
}


--[[ src/bots/elisah.lua ]]--

BOT.Elisah = {
	img = "163137ccd95.png",
	chair = "shaman",
	medal = "elisah",
	victory = 45000,
	eventWelcome = function ()
		BOT.Elisah.chat = false
		BOT.Elisah.ice = false
		BOT.Elisah.shoe = false
		BOT.Elisah.thorn = false
		BOT.Elisah.poison = false
		BOT.Elisah.anvil = false
		BOT.Elisah.time = false
		quote("Elisah", "QUOTE_54")
	end,
	eventStart = function ()
		if math.random() > 0.5 then
			quote("Elisah", "QUOTE_55")
			addFunctionTimer(quote, 3000, "Elisah", "QUOTE_56")
		end
	end,
	eventPenalty = function ()
		local pool = {"QUOTE_69", "QUOTE_70"}
		if math.random() > 0.5 then
			quote("Elisah", pool[math.random(#pool)])
		end
	end,
	eventCurse = function (curse)
		txt = {anvil="QUOTE_57", ice="QUOTE_58", shoe="QUOTE_59", thorn="QUOTE_60", time="QUOTE_61", poison="QUOTE_62"}
		if not BOT.Elisah[curse] then
			if curse == "ice" and math.random() > 0.5 then
				addFunctionTimer(quote, 1000, "Elisah", "QUOTE_71")
			elseif math.random() > 0.5 then
				addFunctionTimer(quote, 1000, "Elisah", txt[curse])
				BOT.Elisah[curse] = true
			end
		end
	end,
	eventWin = function ()
		local pool = {"QUOTE_63", "QUOTE_64"}
		quote("Elisah", pool[math.random(#pool)])
	end,
	eventLose = function (p)
		local pool = {"QUOTE_65", "QUOTE_66"}
		if p and math.random() > 0.5 then
			quote("Elisah", pool[math.random(#pool)], p)
		end
		unlockTrophy(p, "elisah")
	end,
	eventChat = function (p, msg)
		if msg == "Elisah" and not BOT.Elisah.chat then
			addFunctionTimer(quote, 3000, "Elisah", "QUOTE_67", p)
			addFunctionTimer(quote, 5000, "Elisah", "QUOTE_68")
			BOT.Elisah.chat = true
		end
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.7 then
				eventEmotePlayed("Elisah", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.5 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
			local can = false
			for i, v in pairs(ROUND.chair[n].hand) do
				if canPlay(n, i) then
					missCard(n, v, 1000)
					jumpIn(ROUND.turn, n)
					updateArrow()
					playCard(n, i, false, true)
					break
				end
			end
		end
	end,
	autoPlay = function ()
		local action = botMakeAction()
		if action == "DRAW" then
			BOT.Elisah.eventPenalty()
		end
	end
}


--[[ src/bots/elise.lua ]]--

BOT.Elise = {
	img = "15f5bca2c64.png",
	chair = "marine",
	medal = "none",
	victory = 0,
	eventWelcome = function ()
		quote("Elise", "QUOTE_14")
	end,
	eventWin = function ()
		quote("Elise", "QUOTE_15")
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.7 then
				eventEmotePlayed("Elise", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.7 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
			local can = false
			for i, v in pairs(ROUND.chair[n].hand) do
				if ROUND.topCard.card[1] == v[1] and ROUND.topCard.card[2] == v[2] then
					missCard(n, v, 1000)
					jumpIn(ROUND.turn, n)
					updateArrow()
					playCard(n, i)
					break
				end
			end
		elseif ROUND.turn ~= n and ROUND.gameMode.team and #ROUND.chair[n].hand == 1 and os.time() > ROUND.chair[n].clickDelay+8000 then
			missCard(n, 1, 2000, true)
		end
	end,
	autoPlay = function ()
		botMakeAction()
	end
}


--[[ src/bots/func.lua ]]--

function botMakeAction()
	local chair = ROUND.chair[ROUND.turn]
	sayUno(ROUND.turn)
	if chair.action then
		if chair.action.name == "WEB" then
			local target = nil
			local less = 30
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" and #v.hand < less and not v.action then
					target = i
					less = #v.hand
				end
			end
			if target then
				tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
				makeWeb(ROUND.turn, target)
			else
				makeWeb(ROUND.turn, ROUND.turn)
			end
			return "WEB", target
		elseif chair.action.name == "GIFT" then
			local target = nil
			local less = 30
			for i, v in pairs(ROUND.chair) do
				if i ~= ROUND.turn and v.owner ~= "Papaille" and v.mode ~= "DELETED" and #v.hand < less and not v.action then
					target = i
					less = #v.hand
				end
			end
			if target then
				tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
				makeGift(ROUND.turn, target)
			else
				makeGift(ROUND.turn, ROUND.turn)
			end
			return "GIFT", target
		elseif chair.action.name == "TRADE" then
			local target = nil
			local less = 30
			for i, v in pairs(ROUND.chair) do
				if i ~= ROUND.turn and v.mode ~= "DELETED" and #v.hand < less and not v.action then
					target = i
					less = #v.hand
				end
			end
			if target then
				tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
				makeTrade(ROUND.turn, target)
			else
				makeTrade(ROUND.turn, ROUND.turn)
			end
			return "TRADE", target
		elseif chair.action.name == "BATATA" then
			local target = nil
			local less = 30
			for i, v in pairs(ROUND.chair) do
				if i ~= ROUND.turn and v.mode ~= "DELETED" and #v.hand < less and not v.action then
					target = i
					less = #v.hand
				end
			end
			if target then
				tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
				makeBatata(ROUND.turn, target)
			else
				makeBatata(ROUND.turn, ROUND.turn)
			end
			return "BATATA", target
		elseif chair.action.name == "MIMIC" then
			local target = nil
			local bigger = 0
			for i, v in pairs(ROUND.chair) do
				if i ~= ROUND.turn and v.mode ~= "DELETED" and #v.hand > bigger then
					target = i
					bigger = #v.hand
				end
			end
			if target then
				tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
				makeMimic(ROUND.turn, target)
			else
				makeMimic(ROUND.turn, ROUND.turn)
			end
			return "MIMIC", target
		elseif chair.action.name == "THEFT" then
			local target = nil
			local bigger = 0
			for i, v in pairs(ROUND.chair) do
				if i ~= ROUND.turn and v.mode ~= "DELETED" and #v.hand > bigger then
					target = i
					bigger = #v.hand
				end
			end
			if target then
				tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
				makeTheft(ROUND.turn, target)
			else
				makeTheft(ROUND.turn, ROUND.turn)
			end
			return "THEFT", target
		elseif chair.action.name == "WILD" then
			local color = "red"
			if ROUND.topCard.card[2] == "simon" and chair.action.simon ~= "FINAL" then
				if math.random() > 0.7 then
					local pool = {"red", "blue", "yellow", "green"}
					color = pool[math.random(#pool)]
				else
					color = ROUND.simon[chair.action.simon]
				end
			else
				local pool = {"red", "blue", "yellow", "green"}
				for i, v in pairs(chair.hand) do
					if v[1] ~= "black" then
						for i=1, 5 do
							table.insert(pool, v[1])
						end
					end
				end
				color = pool[math.random(#pool)]
			end
			paintCard(color, ROUND.turn)
			return "WILD"
		elseif chair.action.name == "TRACKING" then
			local wild = false
			for i, v in pairs(chair.action.card) do
				if ROUND.deck[v][1] == "black" then
					wild = v
					break
				end
			end
			if wild then
				drawCardTracking(ROUND.turn, wild)
			else
				local discard = false
				for i, v in pairs(chair.action.card) do
					if ROUND.deck[v][1] == ROUND.topCard.card[1] or ROUND.deck[v][2] == ROUND.topCard.card[2] then
						discard = v
						break
					end
				end
				if discard then
					drawCardTracking(ROUND.turn, discard)
				else
					drawCardTracking(ROUND.turn, chair.action.card[math.random(3)])
				end
			end
			return "TRACKING"
		elseif chair.action.name == "WISH" then
			local wild = false
			for i, v in pairs(chair.action.card) do
				if ROUND.pile[v][1] == "black" then
					wild = v
					break
				end
			end
			if wild then
				makeWish(ROUND.turn, wild)
			else
				local discard = false
				for i, v in pairs(chair.action.card) do
					if ROUND.pile[v][1] == ROUND.topCard.card[1] or ROUND.pile[v][2] == ROUND.topCard.card[2] then
						discard = v
						break
					end
				end
				if discard then
					makeWish(ROUND.turn, discard)
				else
					makeWish(ROUND.turn, chair.action.card[math.random(3)])
				end
			end
			return "WISH"
		elseif chair.action.name == "BAN" then
			makeBan(ROUND.turn, chair.action.card[math.random(3)])
			return "BAN"
		elseif ROUND.chair[ROUND.turn].action.name == "RULE" then
			selectRule(ROUND.turn, math.random(1,2))
			return "RULE"
		end
	else
		if ROUND.accumulated and not ROUND.gameMode.hell then
			if ROUND.topCard.card[2] == "draw4" then
				local play = false
				for i, v in pairs(chair.hand) do
					if canPlay(ROUND.turn, i) then
						play = i
						break
					end
				end
				if play then
					playCard(ROUND.turn, play)
					return "BLOCK"
				else
					local previous = previousChair(ROUND.turn)
					local challenge = false
					for i, v in pairs(ROUND.chair[previous].hand) do
						if v[1] == ROUND.topCard.card2[1] then
							challenge = true
							break
						end
					end
					if challenge then
						challengeDrawFour(ROUND.turn)
						return "CHALLENGE"
					else
						eventMouse(chair.owner, 350, 220)
						return "DRAW"
					end
				end
			else
				local play = false
				for i, v in pairs(chair.hand) do
					if canPlay(ROUND.turn, i) then
						play = i
						break
					end
				end
				if play then
					playCard(ROUND.turn, play)
					return "BLOCK"
				else
					eventMouse(chair.owner, 350, 220)
					return "DRAW"
				end
			end
		elseif canPlayHand(ROUND.turn) and not chair.played then
			for i, v in pairs(chair.hand) do
				if v[2] == "batata" and canPlay(ROUND.turn, i) then
					playCard(ROUND.turn, i)
					return "PLAY"
				end
			end
			local score = {}
			local tier = {red=100, blue=100, yellow=100, green=100, black=1000, draw2=20, web=4, skip=6, reverse=6, clone=10, wild=60, draw4=80, half=200, thunder=2, rain=2, box=2, n0=4, n1=6, n2=6, n3=6, n4=6, n5=6, n6=6, n7=6, n8=6, n9=6}
			for i, v in pairs(chair.hand) do
				if canPlay(ROUND.turn, i) then
					score[i] = 0
					local have = {}
					for j, v in pairs(chair.hand) do
						if j ~= i then
							have[v[1]] = have[v[1]] and (have[v[1]] * 0.5) or 1
							have[v[2]] = have[v[2]] and (have[v[2]] * 0.5) or 1
						end
					end
					for j, v in pairs(have) do
						if tier[j] then
							score[i] = score[i] + tier[j]*v
						else
							score[i] = score[i] + 20*v
						end
					end
				end
			end
			local card = false
			local best = -1
			for i, v in pairs(score) do
				if v > best then
					card = i
					best = v
				end
			end
			if card then
				playCard(ROUND.turn, card)
				return "PLAY"
			end
		else
			if chair.draw then
				eventMouse(chair.owner, 680, 280)
				return "COMMON_DRAW"
			else
				eventMouse(chair.owner, 350, 220)
				return "PASS"
			end
		end
	end
end


--[[ src/bots/icemice.lua ]]--

BOT.Icemice = {
	img = "167d2c9497a.png",
	chair = "diamond",
	medal = "snowy",
	victory = 0,
	eventWelcome = function ()
		--quote("Elise", "QUOTE_14")
	end,
	eventWin = function ()
		--quote("Elise", "QUOTE_15")
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.7 then
				eventEmotePlayed("Icemice", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.7 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
			local can = false
			for i, v in pairs(ROUND.chair[n].hand) do
				if ROUND.topCard.card[1] == v[1] and ROUND.topCard.card[2] == v[2] then
					missCard(n, v, 1000)
					jumpIn(ROUND.turn, n)
					updateArrow()
					playCard(n, i)
					break
				end
			end
		end
	end,
	autoPlay = function ()
		botMakeAction()
	end
}


--[[ src/bots/jingle.lua ]]--

BOT.Jingle = {
	img = " 16004adc40b.png",
	chair = "gift",
	medal = "noel",
	victory = 251200,
	eventStart = function ()
		local dialog = math.random(4)
		if dialog == 1 then
			quote("Papaille", "QUOTE_17")
			if math.random(3) > 1 then
				addFunctionTimer(quote, 5000, "Jingle", "QUOTE_18")
			end
		elseif dialog == 2 then
			quote("Jingle", "QUOTE_19")
			if math.random(2) == 1 then
				addFunctionTimer(quote, 5000, "Papaille", "QUOTE_20")
				if math.random(2) == 1 then
					addFunctionTimer(quote, 10000, "Jingle", "QUOTE_21")
				end
			end
		elseif dialog == 3 then
			quote("Jingle", "QUOTE_22")
			if math.random(3) > 1 then
				addFunctionTimer(quote, 5000, "Papaille", "QUOTE_23")
				if math.random(2) == 1 then
					addFunctionTimer(quote, 10000, "Jingle", "QUOTE_24")
				end
			end
		elseif dialog == 4 then
			quote("Jingle", "QUOTE_25")
			if math.random(5) > 1 then
				addFunctionTimer(quote, 5000, "Papaille", "QUOTE_26")
				if math.random(5) == 1 then
					addFunctionTimer(quote, 10000, "Jingle", "QUOTE_27")
				end
			end
		end
	end,
	
	eventBlock = function ()
		if math.random() > 0.5 then
			local n = nextChair(ROUND.turn)
			quote("Jingle", "QUOTE_32", ROUND.chair[n].owner)
		end
	end,
	eventDonate = function ()
		if math.random() > 0.7 then
			quote("Jingle", "QUOTE_29")
		end
	end,
	eventPenalty = function ()
		if math.random() > 0.7 then
			quote("Jingle", "QUOTE_30")
		end
	end,
	eventWin = function ()
		if math.random(2) == 1 then
			quote("Jingle", "QUOTE_34")
			if math.random(2) == 1 then
				addFunctionTimer(quote, 3000, "Papaille", "QUOTE_35")
			end
		end
	end,
	eventLose = function (name)
		unlockTrophy(name, "noel")
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.6 then
				eventEmotePlayed("Jingle", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.7 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
			local can = false
			for i, v in pairs(ROUND.chair[n].hand) do
				if canPlay(n, i) then
					missCard(n, v, 1000)
					jumpIn(ROUND.turn, n)
					updateArrow()
					playCard(n, i, false, true)
					break
				end
			end
		end
	end,
	autoPlay = function ()
		local action, target = botMakeAction()
		if action == "GIFT" then
			quote("Jingle", "QUOTE_28", ROUND.chair[target].owner)
		elseif action == "DRAW" then
			BOT.Jingle.eventPenalty()
		elseif action == "BLOCK" then
			BOT.Jingle.eventBlock()
		end
	end
}


--[[ src/bots/ninguem_v2.lua ]]--

BOT.Ninguem_v2 = {
	img = "1712da199c2.png",
	chair = "max",
	medal = "none",
	victory = 0,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" then
				eventEmotePlayed("Ninguem_v2", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.3 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
			local can = false
			for i, v in pairs(ROUND.chair[n].hand) do
				if ROUND.topCard.card[1] == v[1] and ROUND.topCard.card[2] == v[2] then
					missCard(n, v, 1000)
					jumpIn(ROUND.turn, n)
					updateArrow()
					playCard(n, i)
					break
				end
			end
		end
	end,
	autoPlay = function ()
		botMakeAction()
	end
}


--[[ src/bots/papaille.lua ]]--

BOT.Papaille = {
	img = "16004ade907.png",
	chair = "candy",
	medal = "noel",
	victory = 801000,
	eventWin = function ()
		if math.random(2) == 1 then
			quote("Papaille", "QUOTE_36")
			if math.random(2) == 1 then
				addFunctionTimer(quote, 3000, "Jingle", "QUOTE_37")
			end
		end
	end,
	eventPenalty = function ()
		if math.random() > 0.7 then
			quote("Papaille", "QUOTE_31")
		end
	end,
	eventBlock = function ()
		if math.random() > 0.5 then
			quote("Papaille", "QUOTE_33")
		end
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.5 then
				eventEmotePlayed("Papaille", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.7 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
			local can = false
			for i, v in pairs(ROUND.chair[n].hand) do
				if canPlay(n, i) then
					missCard(n, v, 1000)
					jumpIn(ROUND.turn, n)
					updateArrow()
					playCard(n, i, false, true)
					break
				end
			end
		end
	end,
	autoPlay = function ()
		local action = botMakeAction()
		if action == "DRAW" then
			BOT.Papaille.eventPenalty()
		elseif action == "BLOCK" then
			BOT.Papaille.eventBlock()
		end
	end
}


--[[ src/bots/snowy.lua ]]--

BOT.Snowy = {
	img = "167d2c921bb.png",
	chair = "fire",
	medal = "snowy",
	victory = 0,
	eventWelcome = function ()
		BOT.Snowy.title = false
		BOT.Snowy.chat = false
		BOT.Snowy.talk = false
		local pool = {"QUOTE_88", "QUOTE_89"}
		quote("Snowy", pool[math.random(#pool)])
	end,
	eventWin = function ()
		quote("Snowy", "QUOTE_96")
	end,
	eventDonate = function (p)
		if math.random() > 0.5 then
			quote("Snowy", "QUOTE_90", p)
		end
	end,
	eventPenalty = function ()
		if math.random() > 0.7 then
			quote("Snowy", "QUOTE_91")
		end
	end,
	eventEliminate = function (name)
		if name == "Snowy" then
			if math.random() > 0.5 then
				quote("Snowy", "QUOTE_95", name)
			end
		elseif math.random() > 0.8 then
			quote("Snowy", "QUOTE_97", name)
		end
	end,
	eventLose = function (name)
		unlockTrophy(name, "snowy")
	end,
	eventChat = function (p, msg)
		if not BOT.Snowy.talk then
			if string.find(msg, "jingle") then
				addFunctionTimer(quote, 3000, "Snowy", "QUOTE_100")
				BOT.Snowy.talk = true
			elseif string.find(msg, "papaille") then
				addFunctionTimer(quote, 3000, "Snowy", "QUOTE_98")
				BOT.Snowy.talk = true
			elseif string.find(msg, "icemice") then
				addFunctionTimer(quote, 3000, "Snowy", "QUOTE_101")
				addFunctionTimer(quote, 5000, "Snowy", "QUOTE_102")
				BOT.Snowy.talk = true
			end
		end
	end,
	eventRandom = function (name)
		if not BOT.Snowy.title then
			if tfm.get.room.playerList[name] and tfm.get.room.playerList[name].title == 244 then
				quote("Snowy", "QUOTE_99", name)
				BOT.Snowy.title = true
			elseif math.random() > 0.985 then
				quote("Snowy", "QUOTE_92")
				BOT.Snowy.title = true
			end
		end
		if not BOT.Snowy.chat and math.random() > 0.985 then
			quote("Snowy", "QUOTE_93")
			addFunctionTimer(quote, 3000, "Icemice", "QUOTE_94")
			BOT.Snowy.chat = true
		end
	end,
	eventLoop = function (n)
		if ROUND.chair[ROUND.turn].action then
			if ROUND.chair[ROUND.turn].action.name == "IMITATE" and math.random() > 0.7 then
				eventEmotePlayed("Snowy", ROUND.chair[ROUND.turn].action.action)
			end
		elseif ROUND.gameMode.jumpin and ROUND.turn ~= n and math.random() > 0.7 and not ROUND.chair[ROUND.turn].action and not ROUND.chair[n].action and not isCursed(n, "poison") and not ROUND.chair[n].confuse then
			local can = false
			for i, v in pairs(ROUND.chair[n].hand) do
				if ROUND.topCard.card[1] == v[1] and ROUND.topCard.card[2] == v[2] then
					missCard(n, v, 1000)
					jumpIn(ROUND.turn, n)
					updateArrow()
					playCard(n, i)
					break
				end
			end
		end
	end,
	autoPlay = function ()
		botMakeAction()
	end
}


--[[ src/libs/custom.lua ]]--

function customAddAction(p, name)
	local blank = {
		DRAW = {action=name, who="NEXT", amount="2"},
		DISCARD = {action=name, who="ALL", amount="#3", condition="ANY"},
		SHOW = {action=name, who="ALL", condition="ANY"},
		SKIP = {action=name, who="NEXT"},
		DONATE = {action=name, who="YOURSELF", who2="CHOOSE", amount="1", condition="ANY"},
		SWAP = {action=name, who="YOURSELF", who2="CHOOSE"},
		TRADE = {action=name, who="YOURSELF", who2="CHOOSE"},
		ELIMINATE = {action=name, who="CHOOSE"},
	}
	if p == OWNER and blank[name] and #CONFIG.custom.action < 5 then
		table.insert(CONFIG.custom.action, blank[name])
	else
		tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
	end
end

function customEditAction(p, action, atribute, value)
	-- EDIÇÕES PERMITIDAS
	local can = {
		DRAW = {who=1, amount=1},
		DISCARD = {who=1, condition=1, amount=1},
		SHOW = {who=1, condition=1},
		SKIP = {who=1},
		DONATE = {who=1, who2=1, condition=1, amount=1},
		SWAP = {who=1, who2=1},
		TRADE = {who=1, who2=1},
		ELIMINATE = {who=1},
	}
	--
	local edit = CONFIG.custom.action[action]
	if p==OWNER and edit and can[edit.action][atribute] then
		if atribute == "who" then
			if value ~= CONFIG.custom.action[action].who2 then
				edit[atribute] = value
			else
				tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
			end
		elseif atribute == "who2" then
			if value ~= CONFIG.custom.action[action].who then
				edit[atribute] = value
			else
				tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
			end
		else
			edit[atribute] = value
		end
	else
		tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
	end
end

function customRemoveAction(p, action)
	local can = true
	for i, v in pairs(CONFIG.custom.action) do
		if v.amount == "&"..action then
			can = false
			break
		end
	end
	if p==OWNER and CONFIG.custom.action[action] and can then
		for i, v in pairs(CONFIG.custom.action) do
			if v.amount and v.amount:sub(1,1) == "&" then
				local num = tonumber(v.amount:sub(2))
				if num > action then
					v.amount = "&"..num-1
				end
			end
		end
		table.remove(CONFIG.custom.action, action)
	else
		tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
	end
end

function customValidAmount(action, str)
	local unt = str:match("^#(%d)$")
	local ret = str:match("^%&(%d)$")
	local x, y = str:match("^(%d)%-(%d)$")
	if unt and tonumber(unt) then
		local n = tonumber(unt)
		return n >= 0 and n <= 10
	elseif ret and tonumber(ret) then
		local n = tonumber(ret)
		return n >= 1 and n < action
	elseif x and y and tonumber(x) and tonumber(y) then
		local x = tonumber(x)
		local y = tonumber(y)
		return y > x and x >= 0 and x <= 10 and y >= 0 and y <= 10
	elseif tonumber(str) then
		local n = tonumber(str)
		return n >= 0 and n <= 10
	end
end

function customEditCopies(color)
	CONFIG.custom.color[color] = (CONFIG.custom.color[color]+1)%5
end

function printAction(p, action)
	local order = {"who", "who2", "amount", "condition"}
	local txt = ""
	local l = {
		YOURSELF = "WHO_YOURSELF",
		NEXT = "WHO_NEXT",
		PREVIOUS = "WHO_PREVIOUS",
		ALL = "WHO_ALL",
		OTHERS = "WHO_OTHERS",
		CHOOSE = "WHO_CHOOSE",
		RANDOM = "WHO_RANDOM",
		RANDOM2 = "WHO_RANDOM2",
		RANDOM3 = "WHO_RANDOM3",
		ANY = "CONDITION_ANY",
		NUMBER = "CONDITION_NUMBER",
		ACTION = "CONDITION_ACTION",
		RED = "CONDITION_RED",
		BLUE = "CONDITION_BLUE",
		YELLOW = "CONDITION_YELLOW",
		GREEN = "CONDITION_GREEN",
		WILD = "CONDITION_WILD",
		SAME = "CONDITION_SAME"
	}
	for i, v in pairs(order) do
		if CONFIG.custom.action[action][v] then
			if v == "amount" then
				local unt = CONFIG.custom.action[action][v]:match("^#(%d)$")
				local ret = CONFIG.custom.action[action][v]:match("^%&(%d)$")
				local x, y = CONFIG.custom.action[action][v]:match("^(%d)%-(%d)$")
				if unt then
					txt = txt .. string.format("<j><a href='event:edit %s %s'>[%s]</a> ", action, v, string.format(translate(p, "AMOUNT_UNTIL"), unt))
				elseif ret then
					txt = txt .. string.format("<j><a href='event:edit %s %s'>[%s]</a> ", action, v, string.format(translate(p, "AMOUNT_RETURN"), ret))
				elseif x and y then
					txt = txt .. string.format("<j><a href='event:edit %s %s'>[%s]</a> ", action, v, string.format(translate(p, "AMOUNT_RANGE"), x, y))
				else
					txt = txt .. string.format("<j><a href='event:edit %s %s'>[%s]</a> ", action, v, string.format(translate(p, "AMOUNT_X"), CONFIG.custom.action[action][v]))
				end
			else
				txt = txt .. string.format("<j><a href='event:edit %s %s'>[%s]</a><n> ", action, v, translate(p, l[CONFIG.custom.action[action][v]] or "OPA"))
			end
		end
	end
	return string.format("<v>%d)<n> %s <r><a href='event:remove %s'>[x]</a>\n\t%s", action, translate(p, "ACTION_"..CONFIG.custom.action[action].action), action, txt)
end

function printAdd(p)
	local pool = {"DRAW", "DONATE", "DISCARD", "SHOW", "SKIP", "SWAP", "TRADE", "ELIMINATE"}
	local txt = "<p align='center'>"
	for i, v in pairs(pool) do
		txt = txt .. string.format("<a href='event:add %s'>%s\n", v, translate(p, "ACTION_"..v))
	end
	return txt .. string.format("<a href='event:exit'><r>[%s]", translate(p, "CLOSE"))
end

function printOptions(p, action, atribute)
	local can = {
		DRAW = {who={"YOURSELF","NEXT","PREVIOUS","ALL","OTHERS","CHOOSE","RANDOM","RANDOM2","RANDOM3"}},
		DISCARD = {who={"YOURSELF","NEXT","PREVIOUS","ALL","OTHERS","CHOOSE","RANDOM","RANDOM2","RANDOM3"}, condition={"ANY","NUMBER","ACTION","RED","BLUE","YELLOW","GREEN","WILD","SAME"}},
		SHOW = {who={"YOURSELF","NEXT","PREVIOUS","ALL","OTHERS","CHOOSE","RANDOM","RANDOM2","RANDOM3"}, condition={"ANY","NUMBER","ACTION","RED","BLUE","YELLOW","GREEN","WILD","SAME"}},
		SKIP = {who={"YOURSELF","NEXT","PREVIOUS","ALL","OTHERS","CHOOSE","RANDOM","RANDOM2","RANDOM3"}},
		DONATE = {who={"YOURSELF","NEXT","PREVIOUS","CHOOSE","RANDOM"}, who2={"YOURSELF","NEXT","PREVIOUS","CHOOSE","RANDOM"}, condition={"ANY","NUMBER","ACTION","RED","BLUE","YELLOW","GREEN","WILD","SAME"}},
		SWAP = {who={"YOURSELF","NEXT","PREVIOUS","CHOOSE","RANDOM"}, who2={"YOURSELF","NEXT","PREVIOUS","CHOOSE","RANDOM"}},
		TRADE = {who={"YOURSELF","NEXT","PREVIOUS","CHOOSE","RANDOM"}, who2={"YOURSELF","NEXT","PREVIOUS","CHOOSE","RANDOM"}},
		ELIMINATE = {who={"YOURSELF","NEXT","PREVIOUS","ALL","OTHERS","CHOOSE","RANDOM","RANDOM2","RANDOM3"}},
	}
	local l = {
		YOURSELF = "WHO_YOURSELF",
		NEXT = "WHO_NEXT",
		PREVIOUS = "WHO_PREVIOUS",
		ALL = "WHO_ALL",
		OTHERS = "WHO_OTHERS",
		CHOOSE = "WHO_CHOOSE",
		RANDOM = "WHO_RANDOM",
		RANDOM2 = "WHO_RANDOM2",
		RANDOM3 = "WHO_RANDOM3",
		ANY = "CONDITION_ANY",
		NUMBER = "CONDITION_NUMBER",
		ACTION = "CONDITION_ACTION",
		RED = "CONDITION_RED",
		BLUE = "CONDITION_BLUE",
		YELLOW = "CONDITION_YELLOW",
		GREEN = "CONDITION_GREEN",
		WILD = "CONDITION_WILD",
		SAME = "CONDITION_SAME"
	}
	local txt = "<p align='center'>"
	for i, v in pairs(can[CONFIG.custom.action[action].action][atribute]) do
		txt = txt .. string.format(string.format("<a href='event:edit2 %s %s %s'>%s\n", action, atribute, v, translate(p, l[v] or "OPA")))
	end
	return txt .. string.format("<a href='event:exit'><r>[%s]", translate(p, "CLOSE"))
end


--[[ src/libs/data.lua ]]--

PACK = {
	chairs = {"default","red","blue","yellow","green","white","fire","water","earth","air","rainbow","wood","stone","gold","diamond","king","luck","angel","junky","shaman","beach","cine","hell","cards","candy","cheese","fraise","illuminati","gift","bog","got","hamburguer","skull","school","time","pencil","chess","show","anvil","garden","falls","unicorn","psycho","television","radio","newspaper","cat","potato","rip","apple","heart","breakfast","bones","chocolate","marine","loot","random","astral","computer","elemental","guitar","popcorn","trash","wonderland","friend","football","cuphead","bootcamp","gaga","gothic","mecatopus","pumpkin","ufo","aquarium","help","font","chimney","circus","cisne","coffee","croissant","space","mermaid","phone","quartz","snowman","totoro","vangogh","chest","coca","flamingo","honey","old","pineapple","sack","smartphone","vampire","moon","max","bill","horn","toast","pizza","samson","fashion","undertale","forest","kiss","mountain","pikachu","simpsons","truelove","cyan","orange","pink","purple","black","toxic","thunder","crystal","dark","light","eclipse","toothless","lightfury","kratos","shenlong","spider"},

	rules = {"nochallenge","mini","maxi","noaction","clean","nocombo","supercombo","hell","satisfaction","insatisfaction","camouflage","flash","limit","jumpin","black","revelation","stack","perfection","tracking","mulligan","overload","peace","death","gift","trade","carousel","chair","spy","rain","equality","imitate","meep","random","bomb","rule","chess","steal","fastdraw","hard","web","thunder","clone","sequence","luck","box","wish","ink","confuse","shiny","neighbor","team","batata","limbo","curse","magnet","portal","compass","mess","custom","tornado","theft","ban","simon","half","paradox","oddeven","mimic","mix","justice","bluegreen","elise","charlotte","elisah", "drekkemaus","buffy","jingle","papaille","snowy","icemice","key","share"},

	medals = {"none", "beta", "drekkemaus", "noel", "charlotte", "elisah", "buffy", "snowy"},

	panels = {"default", "picnic", "metal", "paper", "carpet", "disco", "cloud", "circuit"},
}

function packChair(t)
	local str = ""
	for i, v in pairs(PACK.chairs) do
		t[v] = t[v] == true and "1" or t[v]
		str = str .. (t and t[v] or "0")
	end
	return str
end

function packRules(t)
	local str = ""
	for i, v in pairs(PACK.rules) do
		t[v] = t[v] == true and "1" or t[v]
		str = str .. (t and t[v] or "0")
	end
	return str
end

function packTrophy(t)
	local str = ""
	for i, v in pairs(PACK.medals) do
		t[v] = t[v] == true and "1" or t[v]
		str = str .. (t and t[v] or "0")
	end
	return str
end

function packFlag(t)
	local str = ""
	for i, v in pairs(PACK.panels) do
		t[v] = t[v] == true and "1" or t[v]
		str = str .. (t and t[v] or "0")
	end
	return str
end

function unpackChair(str)
	local t = {}
	for i=1, #str do
		if str:sub(i,i) and str:sub(i,i) ~= "0" then
			t[PACK.chairs[i]] = tonumber(str:sub(i,i))
		end
	end
	return t
end

function unpackRules(str)
	local t = {}
	for i=1, #str do
		if str:sub(i,i) and str:sub(i,i) ~= "0" then
			t[PACK.rules[i]] = tonumber(str:sub(i,i))
		end
	end
	return t
end

function unpackTrophy(str)
	local t = {}
	for i=1, #str do
		if str:sub(i,i) and str:sub(i,i) ~= "0" then
			t[PACK.medals[i]] = tonumber(str:sub(i,i))
		end
	end
	return t
end

function unpackFlag(str)
	local t = {}
	for i=1, #str do
		if str:sub(i,i) and str:sub(i,i) ~= "0" then
			t[PACK.panels[i]] = tonumber(str:sub(i,i))
		end
	end
	return t
end

function saveData(p)
	if p:sub(1,1) ~= "*" and PLAYER[p] and PLAYER[p].loaded and not BOT[p] then
		--PLAYER[p].rules.nochallenge = true
		PLAYER[p].trophy.none = PLAYER[p].trophy.none or 1
		PLAYER[p].skin.default = PLAYER[p].skin.default or 1
		PLAYER[p].skinEquiped = PLAYER[p].skinEquiped or "default"
		PLAYER[p].trophyEquiped = PLAYER[p].trophyEquiped or "none"
		PLAYER[p].flagEquipped = PLAYER[p].flagEquipped or "default"
		local stats = playerData.load(p, "uno")
		if stats then
			stats.spectator = PLAYER[p].stats.spectator
			stats.round = PLAYER[p].stats.round
			stats.win = PLAYER[p].stats.victory.all
			stats.team = PLAYER[p].stats.victory.team
			stats.red = PLAYER[p].stats.victory.red
			stats.blue = PLAYER[p].stats.victory.blue
			stats.green = PLAYER[p].stats.victory.green
			stats.yellow = PLAYER[p].stats.victory.yellow
			stats.wild = PLAYER[p].stats.victory.wild
			stats.cian = PLAYER[p].stats.victory.cian
			stats.orange = PLAYER[p].stats.victory.orange
			stats.pink = PLAYER[p].stats.victory.pink
			stats.purple = PLAYER[p].stats.victory.purple
			stats.white = PLAYER[p].stats.victory.white
			stats.lightWin = PLAYER[p].stats.victory.lightWin
			stats.darkWin = PLAYER[p].stats.victory.darkWin
			stats.mess = PLAYER[p].stats.victory.mess
			stats.skin = packChair(PLAYER[p].skin)
			stats.rules = packRules(PLAYER[p].rules)
			stats.trophy = packTrophy(PLAYER[p].trophy)
			stats.flags = packFlag(PLAYER[p].flags)
			stats.skinEquiped = PLAYER[p].skinEquiped
			stats.trophyEquiped = PLAYER[p].trophyEquiped
			stats.flagEquipped = PLAYER[p].flagEquipped
			stats.shadow = PLAYER[p].shadow and "1" or "0"
			stats.challengePopup = PLAYER[p].challengePopup and "1" or "0"
			stats.colorblind = PLAYER[p].colorBlind and "1" or "0"
			stats.bell = PLAYER[p].bell and "1" or "0"
			stats.community = PLAYER[p].community
			stats.match = PLAYER[p].match
			stats.challenge = PLAYER[p].challenge
			stats.team = PLAYER[p].stats.victory.team
			stats.pencil = PLAYER[p].pencil
			stats.chess = PLAYER[p].chess
			stats.portal1= PLAYER[p].portal1
			stats.portal2 = PLAYER[p].portal2
			stats.block = PLAYER[p].block
			stats.action = PLAYER[p].action
			stats.dayStreak = PLAYER[p].dayStreak
			stats.lastDayPlayed = PLAYER[p].lastDayPlayed
			system.savePlayerData(p, playerData.pack(p))
		end
	end
end

function instanceData()
	return {
		skin = {default=1},
		rules = {},
		trophy = {none=1},
		flags = {default=1},
		lights = {yellow=true},
		--maps = {none=true},
		skinEquiped = "default",
		trophyEquiped = "none",
		flagEquipped = "default",
		lightEquiped = "yellow",
		--mapEquiped = "none",
		shadow = true,
		challengePopup = true,
		colorBlind = false,
		bell = false,
		community = "auto",
		challenge = 0, -- GOT throne
		pencil = 0, -- pencil throne
		chess = 0, -- chess throne
		portal1 = 0, -- lightfury throne
		portal2 = 0, -- toothless throne
		block = 0, -- soccer throne
		action = 0, -- rosequartz throne
		dayStreak = 0, -- asgore throne
		lastDayPlayed = 0,
		--powerup = {
		--	shiny = 0,
		--	uno = 0,
		--	bot = 0,
		--	mallet = 0,
		--	lamp = 0,
		--	rematch = 0
		--},
		--coin = {
		--	red = 0,
		--	blue = 0,
		--	yellow = 0,
		--	green = 0,
		--},
		--bank = {},
		--missions = {},
		--lastDayEntered = 0,
		--buyed = {},
		--converted = false,

		-- not save
		spaceDelay = os.time(),
		chairDelay = 0,
		sequence = 0, -- school throne
		chair = false,
		coffee = os.time(), -- coffee throne

		--
		stats = {
			spectator = 0, -- rounds watched
			round = 0,
			victory = {
				all = 0,
				team = 0,
				red = 0,
				blue = 0,
				green = 0,
				yellow = 0,
				wild = 0,
				cian = 0,
				orange = 0,
				pink = 0,
				purple = 0,
				white = 0,
				lightWin = 0,
				darkWin = 0,
				mess = 0
			}
		}
	}
end

DATATYPE = {
	spectator = {type="number"},
	round = {type="number"},
	win = {type="number", name="all"},
	team = {type="number"},
	red = {type="number"},
	blue = {type="number"},
	green = {type="number"},
	yellow = {type="number"},
	wild = {type="number"},
	cian = {type="number"},
	orange = {type="number"},
	pink = {type="number"},
	purple = {type="number"},
	white = {type="number"},
	mess = {type="number"},
	lightWin = {type="number"},
	darkWin = {type="number"},
	skin = {type="table", default="1", func=unpackChair},
	rules = {type="table", default="0", func=unpackRules},
	trophy = {type="number", default="1", func=unpackTrophy},
	flags = {type="number", default="1", func=unpackFlag},
	skinEquiped = {type="string", default="default"},
	trophyEquiped = {type="number", default="none"},
	flagEquipped = {type="number", default="default"},
	shadow = {type="boolean", default="1"},
	challengePopup = {type="boolean", default="1"},
	colorBlind = {type="boolean", default="0"},
	bell = {type="boolean", default="0"},
	community = {type="string", default="auto"},
	challenge = {type="number"},
	pencil = {type="number"},
	chess = {type="number"},
	portal1 = {type="number"},
	portal2 = {type="number"},
	block = {type="number"},
	action = {type="number"},
	dayStreak = {type="number"},
	lastDayPlayed = {type="number"},
}

function newData()
	local data = {}
	for i, v in pairs(DATATYPE) do
		data[i] = v.default or "0"
	end
	return data
end


--[[ src/libs/end_game.lua ]]--

function scoreHand(n)
	local sum = {n0=0, n1=1, n2=2, n3=3, n4=4, n5=5, n6=6, n7=7, n8=8, n9=9, skip=20, reverse=20, draw2=20, wild=50, draw4=50, peace=20, death=20, carousel=20, trade=20, gift=20, random=20, spy=20, tornado=20, chair=20, imitate=20, silence=20, equal=20}
	local score = 0
	for i, v in pairs(ROUND.chair[n].hand) do
		score = score + (sum[v[2]] or 20)
	end
	return score
end

function endGame(p, card, winners, mode)
	if ROUND.state == "FINISH" then
		return false
	end
	winningEffect()
	ROUND.state = "FINISH"
	ROUND.time = GLOBAL_TIME + 10000
	local score = 0
	local qtdPlayers = 0
	for i, v in pairs(ROUND.chair) do
		if v.owner and v.owner ~= "" then
			qtdPlayers = qtdPlayers + 1
		end
	end
	for i=10001, 10005 do
		ui.removeTextArea(i)
	end
	ui.removeTextArea(10)
	ui.removeTextArea(11)
	ui.removeTextArea(12)
	ui.removeTextArea(27)
	ui.removeTextArea(32)
	ui.removeTextArea(33)
	if p and ROUND.chair[PLAYER[p].chair].mode == "BUSY" then
		local pp = false
		local ccont = 0
		local qtdBots = 0
		if ROUND.chair[PLAYER[p].chair].team then
			for i, v in pairs(ROUND.team[ROUND.chair[PLAYER[p].chair].team]) do
				ccont = ccont + 1
				if PLAYER[p].chair ~= i and ROUND.chair[i].owner ~= "" and PLAYER[ROUND.chair[i].owner] and PLAYER[ROUND.chair[i].owner].chair then
					pp = ROUND.chair[i].owner
					break
				end
				if ccont >= 2 then
				--  break
				end
			end
		end
		if BOT[p] and BOT[p].eventWin then
			BOT[p].eventWin()
		end
		if pp and BOT[pp] and BOT[pp].eventWin then
			BOT[pp].eventWin()
		end
		ROUND.turn = nextChair(ROUND.turn)
		-- rules
		ui.addTextArea(13, "", nil, 0, 0, 800, 400, 1, 1, 0.2, false)
		if pp then
			for i, v in pairs(PLAYER) do
				ui.addTextArea(14, string.format("<p align='center'><font size='40px' color='#ffffff'>%s", string.format(translate(i, "TEAM_WON"), nickHashtag(p), nickHashtag(pp))), i, 0, 160, 800, 400, 1, 1, 0.7, false)
				tfm.exec.chatMessage("<j>"..string.format(translate(i, "TEAM_WON"), nickHashtag(p), nickHashtag(pp)), i)
				if not v.chair then
					v.chairDelay = 0
				end
			end
		else
			for i, v in pairs(PLAYER) do
				ui.addTextArea(14, string.format("<p align='center'><font size='40px' color='#ffffff'>%s", string.format(translate(i, "PLAYER_WON"), nickHashtag(p))), i, 0, 160, 800, 400, 1, 1, 0.7, false)
				tfm.exec.chatMessage("<j>"..string.format(translate(i, "PLAYER_WON"), nickHashtag(p)), i)
				if not v.chair then
					v.chairDelay = 0
				end
			end
		end
		for i, v in pairs(ROUND.chair) do
			updateHand(i)
			if BOT[v.owner] then
				CONFIG.chair[i] = nil
				if BOT[v.owner].eventLose then
					BOT[v.owner].eventLose(p)
				end
				qtdBots = qtdBots + 1
			elseif v.owner ~= "" then
				if (v.mode == "BUSY" or v.score) and v.owner ~= p and v.owner ~= pp then
					local tempScore = scoreHand(i)
					score = score + tempScore
					if not BOT[p] then
						SCORE[p] = SCORE[p] and (SCORE[p] + tempScore) or tempScore
					end
					if CONFIG.scoreBy == "SCORE_2" then
						tfm.exec.setPlayerScore(v.owner, tempScore, true)
					else
						ui.addTextArea(3010+i, "<p align='center'><font size='30px' color='#000000'><b>"..tempScore, nil, v.x-49, 331, 100, nil, 0, 0, 0, false)
						ui.addTextArea(3000+i, "<p align='center'><font size='30px'><b><j>"..tempScore, nil, v.x-50, 330, 100, nil, 0, 0, 0, false)
					end
				end
				if v.owner and v.owner ~= "" and PLAYER[v.owner] then
					if (CONFIG.ranked and tfm.get.room.uniquePlayers >= 4) or RANKED then
						PLAYER[v.owner].stats.round = PLAYER[v.owner].stats.round + 1
						if PLAYER[v.owner].stats.round >= 1000 then
							unlockChair(v.owner, "stone")
						elseif PLAYER[v.owner].stats.round >= 100 then
							unlockChair(v.owner, "wood")
						end
						if PLAYER[v.owner].stats.round >= 2500 then
							unlockChair(v.owner, "cat")
						end
						if PLAYER[v.owner].stats.round >= 5000 then
							unlockChair(v.owner, "garden")
						end
						if PLAYER[v.owner].stats.round >= 7500 then
							unlockChair(v.owner, "friend")
						end
						if PLAYER[v.owner].stats.round >= 10000 then
							unlockChair(v.owner, "anvil")
						end
						if not v.playedChair then
							unlockChair(v.owner, "bog")
						end
						if ROUND.chair[nextChair(i)].skin.id == "vampire" or ROUND.chair[previousChair(i)].skin.id == "vampire" then
							unlockChair(v.owner, "vampire")
						end
						local today = math.floor(os.time()/86400000)
						if PLAYER[v.owner].lastDayPlayed and PLAYER[v.owner].lastDayPlayed ~= today then
							if PLAYER[v.owner].lastDayPlayed + 1 == today then
								PLAYER[v.owner].dayStreak = PLAYER[v.owner].dayStreak + 1
							else
								PLAYER[v.owner].dayStreak = 1
							end
							PLAYER[v.owner].lastDayPlayed = today
							if PLAYER[v.owner].dayStreak >= 7 then
								unlockChair(v.owner, "fashion")
							end
							if PLAYER[v.owner].dayStreak >= 15 then
								unlockChair(v.owner, "undertale")
							end
						end
					end
				else
					CONFIG.chair[i] = nil
				end
			end
		end
		if pp then
			score = math.ceil(score/2)
		end
		if CONFIG.scoreBy == "SCORE_1" then
			tfm.exec.setPlayerScore(p, score, true)
			ui.addTextArea(3010+PLAYER[p].chair, "<p align='center'><font size='30px' color='#000000'><b>"..score, nil, ROUND.chair[PLAYER[p].chair].x-49, 51, 100, nil, 0, 0, 0, false)
			ui.addTextArea(3000+PLAYER[p].chair, "<p align='center'><font size='30px'><b><vp>"..score, nil, ROUND.chair[PLAYER[p].chair].x-50, 50, 100, nil, 0, 0, 0, false)
			if pp then
				tfm.exec.setPlayerScore(pp, score, true)
				ui.addTextArea(3010+PLAYER[pp].chair, "<p align='center'><font size='30px' color='#000000'><b>"..score, nil, ROUND.chair[PLAYER[pp].chair].x-49, 51, 100, nil, 0, 0, 0, false)
				ui.addTextArea(3000+PLAYER[pp].chair, "<p align='center'><font size='30px'><b><vp>"..score, nil, ROUND.chair[PLAYER[pp].chair].x-50, 50, 100, nil, 0, 0, 0, false)
			end
		elseif CONFIG.scoreBy == "SCORE_3" then
			tfm.exec.setPlayerScore(p, 1, true)
			if pp then
				tfm.exec.setPlayerScore(pp, 1, true)
			end
		end
		PLAYER[p].chairDelay = 0
		if pp then
			PLAYER[pp].chairDelay = 0
		end
		ROUND.winner = p
		local contRules = 0
		for i, v in pairs(ROUND.gameMode) do
			unlockRule(p, i)
			if pp then
				unlockRule(pp, i)
			end
			contRules = contRules + 1
		end
		if countRules(PLAYER[p].rules) >= CONFIG.qtdRule then
			unlockChair(p, "candy", true)
			unlockRule(p, "custom", true)
		end
		if pp then
			if countRules(PLAYER[pp].rules) >= CONFIG.qtdRule then
				unlockChair(pp, "candy", true)
				unlockRule(pp, "custom", true)
			end
		end
		if not BOT[p] and not ROUND.spectator and qtdBots == 9 then
			local canUnlock = true
			for i, v in pairs(ROUND.gameMode) do
				if RULE[i].type ~= "BOSS" and RULE[i].type ~= "EXTRA" then
					canUnlock = false
					break
				end
			end
			if canUnlock then
				unlockFlag(p, "circuit", true)
			end
			unlockChair(p, "max", true)
		end
		if OWNER ~= "Ninguem#0095" and PLAYER[OWNER] and tfm.get.room.uniquePlayers >= qtdPlayers and math.random(100) <= qtdPlayers*5 then
			for i, v in pairs(PLAYER) do
				if v.chair then
					unlockChair(i, "show", true)
				else
					unlockChair(i, "smartphone", true)
				end
			end
		end
		addFunctionTimer(function()
			if (CONFIG.ranked and qtdPlayers >= 4 and tfm.get.room.uniquePlayers >= 4) or RANKED then
				if pp then
					PLAYER[p].stats.victory.team = PLAYER[p].stats.victory.team + 1
					PLAYER[pp].stats.victory.team = PLAYER[pp].stats.victory.team + 1
					if PLAYER[p].stats.victory.team >= 100 then
						unlockChair(p, "breakfast")
					end
					if PLAYER[pp].stats.victory.team >= 100 then
						unlockChair(pp, "breakfast")
					end
					if PLAYER[p].stats.victory.team >= 250 then
						unlockChair(p, "hamburguer")
					end
					if PLAYER[pp].stats.victory.team >= 250 then
						unlockChair(pp, "hamburguer")
					end
					if PLAYER[p].stats.victory.team >= 487.5 then
						unlockChair(p, "croissant")
					end
					if PLAYER[pp].stats.victory.team >= 487.5 then
						unlockChair(pp, "croissant")
					end
					if PLAYER[p].stats.victory.team >= 600 then
						unlockChair(p, "toast")
					end
					if PLAYER[pp].stats.victory.team >= 600 then
						unlockChair(pp, "toast")
					end
					if PLAYER[p].stats.victory.team >= 1000 then
						unlockChair(p, "pizza")
					end
					if PLAYER[pp].stats.victory.team >= 1000 then
						unlockChair(pp, "pizza")
					end
					
					if PLAYER[p].stats.victory.team >= 10 then
						unlockRule(p, "team", true)
					end
					if PLAYER[pp].stats.victory.team >= 10 then
						unlockRule(pp, "team", true)
					end
					if p == "Elise" then
						unlockChair(pp, "marine")
					end
					if pp and not BOT[p] and not BOT[pp] then
						if tfm.get.room.playerList[p].spouseId == tfm.get.room.playerList[pp].id then
							unlockChair(p, "cisne")
							unlockChair(pp, "cisne")
						end
					end
					if card then
						for i, v in pairs(ROUND.chair[PLAYER[pp].chair].hand) do
							if card[1] == v[1] and card[2] == v[2] then
								unlockChair(p, "eclipse")
								break
							end
						end
					end
				elseif not BOT[p] then
					PLAYER[p].stats.victory.all = PLAYER[p].stats.victory.all + 1
					if PLAYER[p].stats.victory.all >= 1000 then
						unlockChair(p, "diamond")
					elseif PLAYER[p].stats.victory.all >= 100 then
						unlockChair(p, "gold")
					end
					if PLAYER[p].stats.victory.all >= 2000 then
						unlockChair(p, "unicorn")
					end
					if PLAYER[p].stats.victory.all >= 3000 then
						unlockChair(p, "cheese")
					end
				end
				if card then
					if ROUND.portal.side == "orange" then
						if card[1] == "red" then
							PLAYER[p].stats.victory.red = PLAYER[p].stats.victory.red + 1
							if PLAYER[p].stats.victory.red >= 100 then
								unlockChair(p, "fire")
							end
							if PLAYER[p].stats.victory.red >= 300 then
								unlockFlag(p, "picnic")
							end
							unlockChair(p, "red")
						elseif card[1] == "blue" then
							PLAYER[p].stats.victory.blue = PLAYER[p].stats.victory.blue + 1
							if PLAYER[p].stats.victory.blue >= 100 then
								unlockChair(p, "water")
							end
							if PLAYER[p].stats.victory.blue >= 300 then
								unlockFlag(p, "metal")
							end
							unlockChair(p, "blue")
						elseif card[1] == "yellow" then
							PLAYER[p].stats.victory.yellow = PLAYER[p].stats.victory.yellow + 1
							if PLAYER[p].stats.victory.yellow >= 100 then
								unlockChair(p, "earth")
							end
							if PLAYER[p].stats.victory.yellow >= 300 then
								unlockFlag(p, "paper")
							end
							unlockChair(p, "yellow")
						elseif card[1] == "green" then
							PLAYER[p].stats.victory.green = PLAYER[p].stats.victory.green + 1
							if PLAYER[p].stats.victory.green >= 100 then
								unlockChair(p, "air")
							end
							if PLAYER[p].stats.victory.green >= 300 then
								unlockFlag(p, "carpet")
							end
							unlockChair(p, "green")
						elseif card[1] == "black" then
							PLAYER[p].stats.victory.wild = PLAYER[p].stats.victory.wild + 1
							if PLAYER[p].stats.victory.wild >= 100 then
								unlockChair(p, "rainbow")
							end
							if PLAYER[p].stats.victory.wild >= 300 then
								unlockFlag(p, "disco")
							end
							unlockChair(p, "white")
						end
					else
						if card[1] == "red" then
							PLAYER[p].stats.victory.cian = PLAYER[p].stats.victory.cian + 1
							if PLAYER[p].stats.victory.cian >= 15 then
								unlockChair(p, "toxic")
							end
							unlockChair(p, "cyan")
						elseif card[1] == "blue" then
							PLAYER[p].stats.victory.orange = PLAYER[p].stats.victory.orange + 1
							if PLAYER[p].stats.victory.orange >= 15 then
								unlockChair(p, "thunder")
							end
							unlockChair(p, "orange")
						elseif card[1] == "yellow" then
							PLAYER[p].stats.victory.purple = PLAYER[p].stats.victory.purple + 1
							if PLAYER[p].stats.victory.purple >= 15 then
								unlockChair(p, "dark")
							end
							unlockChair(p, "purple")
						elseif card[1] == "green" then
							PLAYER[p].stats.victory.pink = PLAYER[p].stats.victory.pink + 1
							if PLAYER[p].stats.victory.pink >= 15 then
								unlockChair(p, "crystal")
							end
							unlockChair(p, "pink")
						elseif card[1] == "black" then
							PLAYER[p].stats.victory.white = PLAYER[p].stats.victory.white + 1
							if PLAYER[p].stats.victory.white >= 15 then
								unlockChair(p, "light")
							end
							unlockChair(p, "black")
						end
					end
					if card[2] == "batata" then
						unlockChair(p, "potato")
					end
					if card[2] == "thunder" then
						unlockChair(p, "pikachu")
					end
					if card[2] == "portal" and card[1] == "green" and ROUND.portal.side == "blue" then
						unlockChair(p, "forest")
					end
					if mode == "JUMPIN" then
						unlockChair(p, "popcorn")
					end
					if ROUND.subitDeath then
						unlockChair(p, "help")
						if card[2] == "tornado" then
							unlockChair(p, "mountain")
						end
					end
				elseif mode then
					if mode == "ELIMINATION" then
						unlockChair(p, "skull")
						if pp then
							unlockChair(pp, "skull")
						end
					elseif mode == "TIME" then
						unlockChair(p, "time")
						if pp then
							unlockChair(pp, "time")
						end
					end
				end
				if os.time() - ROUND.startTime < 60000 then
					unlockChair(p, "chocolate")
					if pp then
						unlockChair(pp, "chocolate")
					end
				end
				-- candy
				if ROUND.chair[PLAYER[p].chair].luck then
					unlockChair(p, "mermaid")
				end
				-- CONFUSO
				if ROUND.chair[PLAYER[p].chair].confuse or isCursed(PLAYER[p].chair, "poison") then
					unlockChair(p, "pineapple")
				end
				if ROUND.accumulated then
					unlockChair(p, "king")
				end
				if ROUND.chair[PLAYER[p].chair].underTime then
					unlockChair(p, "angel")
				end
				if ROUND.chair[PLAYER[p].chair].maxDraw == 0 then
					unlockChair(p, "luck")
				end
				if ROUND.chair[PLAYER[p].chair].maxHand >= 15 then
					unlockChair(p, "junky")
				end
				if ROUND.gameMode.mess then
					if not BOT[p] then
						PLAYER[p].stats.victory.mess = PLAYER[p].stats.victory.mess or 0
						PLAYER[p].stats.victory.mess = PLAYER[p].stats.victory.mess + 1
						if PLAYER[p].stats.victory.mess >= 50 then
							unlockFlag(p, "cloud")
						end
						unlockChair(p, "psycho")
					end
					if pp and PLAYER[pp] then
						PLAYER[pp].stats.victory.mess = PLAYER[pp].stats.victory.mess + 1
						if PLAYER[pp].stats.victory.mess >= 50 then
							unlockFlag(pp, "cloud")
						end
						unlockChair(pp, "psycho")
					end
				end
				if not ROUND.chair[PLAYER[p].chair].saidUno then
					unlockChair(p, "bootcamp")
				end
				if moonPhase() == 5 then
					unlockChair(p, "moon")
				end
				if contRules == 0 then
					unlockChair(p, "old")
				elseif contRules >= 5 then
					unlockChair(p, "flamingo")
				end
				if ROUND.gameMode.portal or ROUND.gameMode.mess then
					if ROUND.portal.side == "orange" then
						PLAYER[p].portal1 = 1
						PLAYER[p].stats.victory.lightWin = PLAYER[p].stats.victory.lightWin + 1
						if PLAYER[p].stats.victory.lightWin >= 10 then
							unlockChair(p, "lightfury")
						end
						if pp and not BOT[pp] then
							PLAYER[pp].portal1 = 1
							PLAYER[pp].stats.victory.lightWin = PLAYER[pp].stats.victory.lightWin + 1
							if PLAYER[pp].stats.victory.lightWin >= 10 then
								unlockChair(pp, "lightfury")
							end
						end
					elseif ROUND.portal.side == "blue" then
						PLAYER[p].portal2 = 1
						PLAYER[p].stats.victory.darkWin = PLAYER[p].stats.victory.darkWin + 1
						if PLAYER[p].stats.victory.darkWin >= 10 then
							unlockChair(p, "toothless")
						end
						if pp and not BOT[pp] then
							PLAYER[pp].portal2 = 1
							PLAYER[pp].stats.victory.darkWin = PLAYER[pp].stats.victory.darkWin + 1
							if PLAYER[pp].stats.victory.darkWin >= 10 then
								unlockChair(pp, "toothless")
							end
						end
					end
					if (PLAYER[p].portal1 + PLAYER[p].portal2) == 2 then
						unlockChair(p, "wonderland")
					end
					if pp and (PLAYER[pp].portal1 + PLAYER[pp].portal2) == 2 then
						unlockChair(pp, "wonderland")
					end
				end
				if not BOT[p] then
					if not RANKED and tfm.get.room.playerList[p].score+score >= 3000 then
						unlockChair(p, "shaman")
					end
					if RANKED then
						PLAYER[p].stats.ranking.scoreWeek = PLAYER[p].stats.ranking.scoreWeek + score
					end
				end
				if pp then
					if not BOT[pp] then
						if not RANKED and tfm.get.room.playerList[pp].score+score >= 3000 then
							unlockChair(pp, "shaman")
						end
						if RANKED then
							PLAYER[pp].stats.ranking.scoreWeek = PLAYER[pp].stats.ranking.scoreWeek + score
						end
					end
				end
				if not BOT[p] and useFraise(p) then
					unlockChair(p, "fraise")
				end
				if not BOT[p] and useFish(p) then
					unlockChair(p, "aquarium")
				end
				if not BOT[p] and useTree(p) then
					unlockChair(p, "chimney")
				end
				if not BOT[p] and isNaked(p) then
					unlockChair(p, "simpsons")
				end
				addFunctionTimer(function()
					for i, v in pairs(PLAYER) do
						if not BOT[i] and tfm.get.room.playerList[i] and i:sub(1,1) ~= "*" then
							if not v.chair then
								v.stats.spectator = v.stats.spectator + 1
								if v.stats.spectator >= 1000 then
									unlockChair(i, "cine")
								elseif v.stats.spectator >= 100 then
									unlockChair(i, "beach")
								end
								if v.stats.spectator >= 2500 then
									unlockChair(i, "newspaper")
								end
								if v.stats.spectator >= 5000 then
									unlockChair(i, "radio")
								end
								if v.stats.spectator >= 7500 then
									unlockChair(i, "television")
								end
								if v.stats.spectator >= 10000 then
									unlockChair(i, "computer")
								end
							end
							
						end
						saveData(i)
					end
				end, 500)
			end
		end,500)
	elseif winners then
		ui.addTextArea(13, "", nil, 0, 0, 800, 400, 1, 1, 0.2, false)
		for i, v in pairs(PLAYER) do
			ui.addTextArea(14, string.format("<p align='center'><font size='40px' color='#ffffff'>%s", translate(i, "PLAYER_TIED")).."\n<font size='30px'>"..table.concat(winners, ", "), i, 0, 160, 800, 400, 1, 1, 0.7, false)
			tfm.exec.chatMessage("<j>"..translate(i, "PLAYER_TIED").."("..table.concat(winners, ", ")..")", i)
			if not v.chair then
				v.chairDelay = 0
			end
		end
	else
		ui.addTextArea(13, "", nil, 0, 0, 800, 400, 1, 1, 0.2, false)
		for i, v in pairs(PLAYER) do
			ui.addTextArea(14, string.format("<p align='center'><font size='40px' color='#ffffff'>%s", translate(i, "PLAYER_LOST")), i, 0, 160, 800, 400, 1, 1, 0.7, false)
			tfm.exec.chatMessage("<j>"..translate(i, "PLAYER_LOST"), i)
			if not v.chair then
				v.chairDelay = 0
			end
		end
		if CONFIG.ranked and qtdPlayers >= 4 and tfm.get.room.uniquePlayers >= 4 then
			for i, v in pairs(PLAYER) do
				if not BOT[i] and tfm.get.room.playerList[i] and i:sub(1,1) ~= "*" then
					if not v.chair and v.notAfk then
						v.stats.spectator = v.stats.spectator + 1
						if v.stats.spectator >= 1000 then
							unlockChair(i, "cine")
						elseif v.stats.spectator >= 100 then
							unlockChair(i, "beach")
						end
					end
					saveData(i)
				end
			end
		end
	end
	if not ROUND.startTime or os.time() - ROUND.startTime < 180000 then
		CONFIG.noRules = true
	end
end


--[[ src/libs/event_control.lua ]]--

function checkVars(nameFunc, values, types, recursion)
	if not recursion then
		--checkVars("checkVars", {nameFunc, values, types}, {"string", "table", "table"}, true)
	elseif #values ~= #types then
		error("checkVars() : the tables must have the same size", 2)
	end
	for i=1, #types do
		if type(types[i]) == "table" then
			local ok = false
			for j, v in pairs(types[i]) do
				if type(values[i]) == v then
					ok = true
					break
				end
			end
			if not ok then
				error(string.format("%s() : %s expected as argument %s, got %s", nameFunc, table.concat(types[i], "|"), i, type(values[i])), 3)
			end
		elseif type(values[i]) ~= types[i] then
			error(string.format("%s() : %s expected as argument %s, got %s", nameFunc, types[i], i, type(values[i])), 3)
		end
	end
end

function stopScript(err, func, ...)
	local args = table.pack(...)
	local valuesStr = {}
	for i=1, args.n do
		local v = args[i]
		table.insert(valuesStr, v == nil and "nil" or v == true and "true" or v == false and "false" or type(v) == "table" and table.tostring(v) or type(v) == "function" and "function" or type(v) == "string" and ('"'..v..'"') or v)
	end
	err = string.format("%s\n%s(%s)- %s\n<j>Please, send this error to Ninguem#0095", err, func, table.concat(valuesStr, ", "), VERSION)
	tfm.exec.chatMessage("<r>[ERROR] "..err)
	ui.addTextArea(9999999999999, "", nil, 0, 0, 800, 400, nil, nil, 0.9, true)
	ui.addTextArea(9999999999998, "<p align='center'><font color='#ffffff'><font size='14px'>Oh no! We broke this room! :(</font>\n\n"..err.."\n\n<n>If you want to play more #unotfm, go to another room. This room is broken.", nil, 0, 170, 800, nil, 0, 0, 0, true)
	ERROR = true
	tfm.exec.setRoomMaxPlayers(1)
end

--[[



-- ## Eventos ## --

function eventMouse(p, x, y)
	if not ERROR then
		local ok, err = pcall(EventMouse, p, x, y)
		if not ok then
			stopScript(err, "eventMouse", p, x, y)
		end
	end
end

function eventChatCommand(p, cmd)
	if not ERROR then
		local ok, err = pcall(EventChatCommand, p, cmd)
		if not ok then
			stopScript(err, "eventChatCommand", p, cmd)
		end
	end
end

function eventKeyboard(p, key, down, x, y)
	if not ERROR then
		local ok, err = pcall(EventKeyboard, p, key, down, x, y)
		if not ok then
			stopScript(err, "eventKeyboard", p, key, down, x, y)
		end
	end
end

function eventTextAreaCallback(id, player, cmd)
	if not ERROR then
		local ok, err = pcall(EventTextAreaCallback, id, player, cmd)
		if not ok then
			stopScript(err, "eventTextAreaCallback", id, player, cmd)
		end
	end
end

function eventPopupAnswer(id, player, msg)
	if not ERROR then
		local ok, err = pcall(EventPopupAnswer, id, player, msg)
		if not ok then
			stopScript(err, "eventPopupAnswer", id, player, msg)
		end
	end
end

function eventPlayerRespawn(p)
	if not ERROR then
		local ok, err = pcall(EventPlayerRespawn, p)
		if not ok then
			stopScript(err, "EventPlayerRespawn", p)
		end
	end
end

function eventPlayerDied(p)
	if not ERROR then
		local ok, err = pcall(EventPlayerDied, p)
		if not ok then
			stopScript(err, "eventPlayerDied", p)
		end
	end
end

function eventChatMessage(p, msg)
	if not ERROR then
		local ok, err = pcall(EventChatMessage, p, msg)
		if not ok then
			stopScript(err, "eventChatMessage", p, msg)
		end
	end
end

function eventEmotePlayed(p, id, arg)
	if not ERROR then
		local ok, err = pcall(EventEmotePlayed, p, id, arg)
		if not ok then
			stopScript(err, "eventEmotePlayed", p, id, arg)
		end
	end
end

function eventLoop(current, remaining)
	if not ERROR then
		local ok, err = pcall(EventLoop, current, remaining)
		if not ok then
			stopScript(err, "eventLoop", current, remaining)
		end
	end
end

function eventNewPlayer(p)
	if not ERROR then
		local ok, err = pcall(EventNewPlayer, p)
		if not ok then
			stopScript(err, "eventNewPlayer", p)
		end
	end
end

function eventPlayerLeft(p)
	if not ERROR then
		local ok, err = pcall(EventPlayerLeft, p)
		if not ok then
			stopScript(err, "eventPlayerLeft", p)
		end
	end
end

function eventNewGame()
	if not ERROR then
		local ok, err = pcall(EventNewGame)
		if not ok then
			stopScript(err, "eventNewGame")
		end
	end
end

function eventPlayerDataLoaded(p, data)
	if not ERROR then
		local ok, err = pcall(EventPlayerDataLoaded, p, data)
		if not ok then
			stopScript(err, "eventPlayerDataLoaded", p, data)
		end
	end
end]]--


--[[ src/libs/event_sheduler.lua ]]--

local runtime = 0
local onEvent
do
	local os_time = os.time
	local math_floor = math.floor
	local runtime_check = 0
	local events = {}
	local scheduled = {_count = 0, _pointer = 1}
	local paused = false
	local runtime_threshold = 20
	local _paused = false

	local function runScheduledEvents()
		local count, pointer = scheduled._count, scheduled._pointer

		local data
		while pointer <= count do
			data = scheduled[pointer]
			-- An event can have up to 5 arguments. In this case, this is faster than table.unpack.
			data[1](data[2], data[3], data[4], data[5], data[6])
			pointer = pointer + 1

			if runtime >= runtime_threshold then
				scheduled._count = count
				scheduled._pointer = pointer
				return false
			end
		end
		scheduled._pointer = pointer
		return true
	end

	--[[
	local function emergencyShutdown(limit_players, err)
		if limit_players then
			message = 'Game crashed :/ Please go to another room'
			tfm.exec.setRoomMaxPlayers(1)
		end
		room.requiredPlayers = 1000
		--genLobby()

		for _, event in next, events do
			event._count = 0
		end
	end]]--

	function onEvent(name, callback)
		local evt
		if events[name] then
			evt = events[name]
		else
			evt = {_count = 0}
			events[name] = evt

			-- An event can have up to 5 arguments. In this case, this is faster than `...`
			local function caller(when, a, b, c, d, e)
				for index = 1, evt._count do
					evt[index](a, b, c, d, e)

					if os_time() >= when then
						break
					end
				end
			end

			local schedule = name ~= "Loop"
			local done, result
			local event_fnc
			event_fnc = function(a, b, c, d, e)
				if ERROR then return false end
				local start = os_time()
				local this_check = math_floor(start / 4000)
				if runtime_check < this_check then
					runtime_check = this_check
					runtime = 0
					paused = false

					if not runScheduledEvents() then
						runtime_check = this_check + 1
						paused = true
						return
					end

					if _paused then
						--message = 'Resuming game...'
						--tfm.exec.chatMessage('Resuming game...')
						ui.removeTextArea(9999999999999)
						ui.removeTextArea(9999999999998)
						_paused = false
					end
				elseif paused then
					if schedule then
						scheduled._count = scheduled._count + 1
						scheduled[scheduled._count] = {event_fnc, a, b, c, d, e}
					end
					return
				end

				done, result = pcall(caller, start + runtime_threshold - runtime, a, b, c, d, e)
				if not done then
					--TFM.chatMessage(result)

					return stopScript(result, name, a, b, c, d, e)
				end

				runtime = runtime + (os_time() - start)

				if runtime >= runtime_threshold then
					if not _paused then
						--message = 'Pausing game...'
						--tfm.exec.chatMessage('Pausing game...')
						ui.addTextArea(9999999999999, "", nil, 0, 0, 800, 400, nil, nil, 0.4, true)
						for i, v in pairs(PLAYER) do
							ui.addTextArea(9999999999998, "<p align='center'><font size='20px'>\n<j>"..translate(i, "PROCESSING"), i, 0, 0, 800, nil, nil, nil, 0.7, true)
						end
					end

					runtime_check = this_check + 1
					paused = true
					_paused = true
					scheduled._count = 0
					scheduled._pointer = 1
				end
			end

			_G["event" .. name] = event_fnc
		end

		evt._count = evt._count + 1
		evt[evt._count] = callback
	end
end


--[[ src/libs/game_control.lua ]]--

function resetTimer()
	local t = 10000
	if isCursed(ROUND.turn, "time") then
		t = 3000
	elseif ROUND.gameMode.flash or ROUND.chair[ROUND.turn].mode == "EMPTY" then
		t = 5000
	end
	ROUND.time = GLOBAL_TIME + t
end

function canPlay(n, c)
	checkVars("canPlay", {n, c}, {"number", {"number", "table"}}, recursion)
	local card = type(c) == "number" and ROUND.chair[n].hand[c] or c -- carta a ser comparada
	local top = ROUND.topCard.card -- carta do topo
	if not top then return false end
	local can = {
			n0 = {"x","n1"},
			n1 = {"n0","n2"},
			n2 = {"n1","n3"},
			n3 = {"n2","n4"},
			n4 = {"n3","n5"},
			n5 = {"n4","n6"},
			n6 = {"n5","n7"},
			n7 = {"n6","n8"},
			n8 = {"n7","n9"},
			n9 = {"n8","x"},
		}
	local trafficMatch = {
		odd = {n1=1, n3=1, n5=1, n7=1, n9=1},
		even = {n0=1, n2=1, n4=1, n6=1, n8=1}
	}
	local mix = {mix1=true, mix2=true, mix3=true}
	local bg = {blue=true, green=true}
	if card.lock then return false end
	if ROUND.turn == n then
		if ROUND.accumulated then
			local numeric = isNumeric(card)
			local peace = numeric or not (ROUND.chair[n].peace or (ROUND.gameMode.clean and #ROUND.chair[n].hand == 1))
			--return ROUND.gameMode.hell and not (isNumeric(card) or isNumeric(top)) and not (ROUND.chair[n].peace or (ROUND.gameMode.clean and #ROUND.chair[n].hand == 1)) or ROUND.accumulated.allowed[card[2]]
			
			return (ROUND.gameMode.hell and not numeric or ROUND.accumulated.allowed[card[2]]) and peace
		else
			local numeric = isNumeric(card) -- carta é numerica
			local hell = ROUND.gameMode.hell and not (numeric or isNumeric(top)) -- satisfaz a regra do inferno
			local peace = numeric or not (ROUND.chair[n].peace or (ROUND.gameMode.clean and #ROUND.chair[n].hand == 1)) -- satisfaz a regra da paz e final limpo
			local traffic = not ROUND.traffic or not (trafficMatch[ROUND.traffic][card[2]] and #ROUND.chair[n].hand == 1) -- satisfaz a regra do par ou ímpar
			local matchSymbol = false
			if ROUND.gameMode.neighbor and numeric then
				matchSymbol = can[card[2]][1] == top[2] or can[card[2]][2] == top[2]
			else
				matchSymbol = card[2] == top[2] or (mix[card[2]] and mix[top[2]])
			end
			local matchColor = card[1] == top[1] or (ROUND.gameMode.bluegreen and bg[card[1]] and bg[top[1]]) or card[1] == "black" -- combina a cor
			local whiteList = not ROUND.chair[n].whiteList or ROUND.chair[n].whiteList[c]
			return (hell or matchSymbol or matchColor) and peace and whiteList and traffic
		end
	elseif ROUND.gameMode.jumpin and not ROUND.chair[ROUND.turn].action and card[2] ~= "black" and card[2] == top[2] and (card[1] == top[1] or (ROUND.gameMode.bluegreen and bg[card[1]] and bg[top[1]])) then -- condições pro corte
		return (isNumeric(card) or not (ROUND.chair[n].peace or (ROUND.gameMode.clean and #ROUND.chair[n].hand == 1))) and (not ROUND.traffic or not (trafficMatch[ROUND.traffic][card[2]] and #ROUND.chair[n].hand == 1))
	end
end

function canPlayHand(n, card)
	for i, v in pairs(ROUND.chair[n].hand) do
		if canPlay(n, i) then
			return true
		end
	end
end

function mustBeEliminated(n)
	return (ROUND.limit and #ROUND.chair[n].hand > ROUND.limit or bombInHand(n)) and ROUND.chair[n].mode ~= "DELETED" and ROUND.chair[n].owner ~= "Charlotte"
end

function limboTimer()
	if ROUND.gameMode.limbo then
		if ROUND.limbo then
			if GLOBAL_TIME > ROUND.limbo and ROUND.limit > 1 then
				ROUND.limit = ROUND.limit - 1
				for i, v in pairs(ROUND.chair) do
					if mustBeEliminated(i) then
						eliminate(i)
					else
						updateScore(i)
						explosion(0, v.x, 135, 5, 20)
					end
				end
				ui.removeTextArea(28)
				ROUND.limbo = GLOBAL_TIME+60000
				if ROUND.limit == 4 then
					for i, v in pairs(ROUND.chair) do
						if v.mode == "BUSY" then
							unlockChair(v.owner, "bones")
						end
					end
				end
			end
		else
			ROUND.limbo = GLOBAL_TIME+60000
		end
	end
end

function randomActionCard()
	local symbol = {"draw2", "draw2", "draw2", "skip", "skip", "skip", "reverse", "reverse", "reverse"}
	local color = {"red", "blue", "green", "yellow"}
	local nope = {mix=true, chess=true, box=true, bomb=true, batata=true, draw99=true, half=true}
	for i, v in pairs(RULE) do
		if (ROUND.gameMode[i] or (ROUND.gameMode.mess and not RULE[i].notMess)) and RULE[i].card and not nope[i] then
			table.insert(symbol, i)
		end
	end
	return {color[math.random(#color)], symbol[math.random(#symbol)]}
end

function isEndGame(form)
	if ROUND.state == "PLAY" then
		local win = {}
		local live = {}
		local card = (form=="PLAY" or form=="JUMPIN") and ROUND.topCard.card
		for i, v in pairs(ROUND.chair) do
			if v.mode == "BUSY" then
				table.insert(live, v.owner)
				if #v.hand == 0 then
					table.insert(win, v.owner)
				end
			end
		end
		if #win > 0 then
			if form == "BAN" then
				for i, v in pairs(win) do
					unlockChair(v, "ufo")
				end
			elseif form == "LINK" then
				for i, v in pairs(win) do
					if ROUND.chair[PLAYER[v].chair].mimic then
						unlockChair(v, "bill")
					end
				end
			end
		end
		if #win == 1 then
			endGame(win[1], card, nil, form)
		elseif #win > 1 then
			for i, v in pairs(win) do
				unlockChair(v, "horn")
			end
			endGame(nil, nil, win, form)
		elseif live == 1 then
			endGame(live[1], nil, nil, "ELIMINATION")
		elseif live == 2 and ROUND.gameMode.team and ROUND.chair[live[1]].team == ROUND.chair[live[2]].team then
			endGame(live[1], nil, nil, "ELIMINATION")
		end
		return #win > 0
	end
end

function resetBatata(n)
	for i, v in pairs(ROUND.chair[n].hand) do
		if v[2] == "batata" then
			return false
		end
	end
	ROUND.chair[n].batata = 1
end

function batataTimer(n, dontReset)
	local found = false
	local index = false
	local locked = false
	for i, v in pairs(ROUND.chair[n].hand) do
		if v[2] == "batata" then
			found = v
			index = i
		end
		if v.lock then
			v.lock = false
			locked = true
		end
	end
	if not dontReset then
		if ROUND.chair[n].cardsPlayed == 0 and ROUND.love ~= 0 then
			if PLAYER[ROUND.chair[n].owner] and PLAYER[ROUND.chair[n].owner].faustao then
				tfm.exec.chatMessage("Reverse chain broke (batataTimer)", ROUND.chair[n].owner)
			end
			ROUND.love = 0
		end
		ROUND.chair[n].cardsPlayed = 0
	end
	if found then
		ROUND.chair[n].batata = ROUND.chair[n].batata + 1
		if ROUND.chair[n].batata > 5 then
			missCard(n, found, 2000)
			local card = table.remove(ROUND.chair[n].hand, index)
			eliminate(n)
			changeColorBatata(card)
			local pool = {}
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					table.insert(pool, i)
				end
			end
			local target = pool[math.random(#pool)]
			if target then
				table.insert(ROUND.chair[target].hand, card)
				missCard(target, card, 2000)
				explosion(5, ROUND.chair[target].x, 100, 5, 10)
				sortHand(ROUND.chair[target].hand)
				showCardsGainned(target, 1)
				updateHand(target)
				updateScore(target)
				if mustBeEliminated(target) then
					eliminate(target)
				end
			end
		else
			updateHand(n)
		end
	elseif locked then
		updateHand(n)
	else
		ROUND.chair[n].batata = 1
	end
	
end

function changeColorBatata(card)
	local pool = {red=1, blue=1, yellow=1, green=1}
	pool[card[1]] = nil
	local color = {}
	for i, v in pairs(pool) do
		table.insert(color, i)
	end
	--local color = {"red", "blue", "yellow", "green"}
	card[1] = color[math.random(#color)]
end

function actionCardEffect()
	local fx = {red=13, blue=1, yellow=11, green=9}
	y = 210 - (#ROUND.pile/108 * 10)
	for i=1, 10 do
		local vel = i/10*75
		tfm.exec.displayParticle(fx[ROUND.topCard.card[1]] or 0, 430, y+vel, -math.random(7,15)/5, (vel-37)/20, 0, 0)
	end
	for i=1, 10 do
		local vel = i/10*75
		tfm.exec.displayParticle(fx[ROUND.topCard.card[1]] or 0, 480, y+vel, math.random(7,15)/5, (vel-37)/20, 0, 0)
	end
end

function actionCard(n, action)
	ROUND.chair[n].action = {name="PLAY"}
	ROUND.time = GLOBAL_TIME + 10000
	addFunctionTimer(function()
		ROUND.chair[n].action = nil
		if action then
			action(n)
		else
			n0(n)
		end
	end, 1000)
end


function isCursed(n, curse)
	return ROUND.chair[n].curse == curse
end

function winningEffect()
	if ROUND.chatWarning then
		if ROUND.winningEffect then
			tfm.exec.removeImage(ROUND.winningEffect)
		end
		local winning = false
		local score = math.huge
		for i, v in pairs(ROUND.chair) do
			local qtd = scoreHand(i)
			if v.mode ~= "DELETED" and qtd < score then
				winning = i
				score = qtd
				if #v.hand == 0 then
					break
				end
			end
		end
		if winning then
			ROUND.winningEffect = tfm.exec.addImage(IMG.misc.winning, "!1000", ROUND.chair[winning].x-50, -5, p)
		end
	end
end

function isAstral()
	if ROUND and ROUND.state == "PLAY" then
		local cont = 0
		local all = 0
		for i, v in pairs(ROUND.chair) do
			if v.mode ~= "DELETED" then
				all = all + 1
				if #v.hand == 1 then
					cont = cont + 1
				end
			end
		end
		if cont == all and cont >= 6 then
			for i, v in pairs(ROUND.chair) do
				if v.mode == "BUSY" then
					unlockChair(v.owner, "astral")
				end
			end
		end
	end
end

function isCuphead()
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" and #v.hand == 1 and v.hand2 and #v.hand2 == 1 then
			unlockChair(v.owner, "cuphead")
		end
	end
end

function isCoffee(p)
	if PLAYER[p] then
		if PLAYER[p].coffee then
			return os.time() - PLAYER[p].coffee > 14400000
		else
			PLAYER[p].coffee = os.time()
		end
	end
end 

function saidUno()
	for i, v in pairs(ROUND.chair) do
		if v.uno == "uno" then
			v.saidUno = true
		end
	end
end

function addBlockPoint(p)
	if PLAYER[p] and PLAYER[p].block and validRoom() then
		PLAYER[p].block = PLAYER[p].block + 1
		if PLAYER[p].block >= 100 then
			unlockChair(p, "football")
		end
	end
end

function shieldInHand(n)
	for i, v in pairs(ROUND.chair[n].hand) do
		if v[2] == "half" then
			return true
		end
	end
end

function chestInHand(n)
	for i, v in pairs(ROUND.chair[n].hand) do
		if v[2] == "chest" then
			return true
		end
	end
end

function tryDraw(n, qtd, ever, pass, recursion)
	if ROUND.chair[n].mode ~= "DELETED" then
		if not isCursed(n, "ice") then
			if isCursed(n, "anvil") then
				qtd = qtd + 1
			end
			if shieldInHand(n) and qtd > 1 then
				qtd = math.ceil(qtd / 2)
				missCard(n, {"black","half"}, 2000)
			end
			mimicDraw(n, qtd, recursion)
			if ROUND.chair[n].owner == "Icemice" then
				local pool = {}
				for i, v in pairs(ROUND.chair) do
					if i~=n and v.mode ~= "DELETED" then
						table.insert(pool, i)
					end
				end
				if #pool > 0 then
					local rand = pool[math.random(#pool)]
					tryDraw(rand, 1, false, false, true)
					local img = tfm.exec.addImage(IMG.misc.pow, "!1000", ROUND.chair[rand].x-50, 30)
					TIMER.img[img] = os.time()+1000
					explosion(11, ROUND.chair[rand].x, 80, 10, 20)
				end
			end
			if (isCursed(n, "thorn") or ever and ROUND.subitDeath) and ROUND.chair[n].owner ~= "Charlotte" then
				eliminate(n, pass)
			else
				drawCard(n, qtd)
				if mustBeEliminated(n) then
					eliminate(n, pass)
				end
			end
		else
			updateHand(n)
		end
	end
end

function whichCard(n, x)
	local chair = ROUND.chair[n]
	if #chair.hand > 16 then
		local i = #chair.hand
		while i > 0 do
			local xx = (i-1)/(#chair.hand-1)*750
			if x > xx and x < xx+50 then
				return i, chair.hand[i]
			end
			i = i - 1
		end
	else
		for i=1, #chair.hand do
			local xx = 400-#chair.hand*25+50*(i-1)
			if x > xx and x < xx+50 then
				return i, chair.hand[i]
			end
		end
	end
end

function whichPlayer(n, x)
	for i, v in pairs(ROUND.chair) do
		if x > v.x - 30 and x < v.x + 30 then
			return i
		end
	end
end

function nextChair(n)
	local sum = {LEFT = -1, RIGHT = 1}
	local cont = 20
	n = n or 1
	repeat
		n = n + sum[ROUND.flow or "LEFT"]
		n = n > #ROUND.chair and 1 or n < 1 and #ROUND.chair or n
		cont = cont - 1
		if cont <= 0 then
			n = nil
			break
		end
	until ROUND.chair[n].mode == "BUSY" or ROUND.chair[n].mode == "FREE"
	return n
end

function previousChair(n)
	local sum = {LEFT = 1, RIGHT = -1}
	repeat
		n = n + sum[ROUND.flow]
		n = n > #ROUND.chair and 1 or n < 1 and #ROUND.chair or n
	until ROUND.chair[n].mode == "BUSY" or ROUND.chair[n].mode == "FREE"
	return n
end

function giveCard(n, card, dontPass)
	explosion(5, ROUND.chair[n].x, 100, 5, 5)
	table.insert(ROUND.chair[n].hand, card)
	sortHand(ROUND.chair[n].hand)
	ROUND.chair[n].uno = nil
	updateHand(n)
	--updateShadow(n)
	updateScore(n)
	if #ROUND.chair[n].hand > ROUND.chair[n].maxHand then
		ROUND.chair[n].maxHand = #ROUND.chair[n].hand
	end
	if #ROUND.chair[n].hand > 25 and not ROUND.chair[n].notTrash then
		unlockChair(ROUND.chair[n].owner, "trash")
	end
	showCardsGainned(n, 1)
	if not dontPass then
		passTurn()
		batataTimer(n)
	end
end

function sortHand(hand)
	table.sort(hand, function(a, b)
		if type(a) == "table" and type(b) == "table" then
			local s = {compass=-1, shield=0, n0=0, n1=1, n2=2, n3=3, n4=4, n5=5, n6=6, n7=7, n8=8, n9=9, skip=10, reverse=11, draw2=12, wild=13, simon=13, draw4=14, chair=15, carousel=16, spy=17 , flood=18, gift=19, imitate=20, death=21, peace=22, luck=23, web=24, box=25, wish=26, trade=27, meep=28, equality=29, rain=30, portal=31, rule=32, steal=33, thunder=34, ink=35, confuse=36, batata=37, curse=38, tornado=39, theft=40, ban=41, dice=42, paradox=43, oddeven=44, mimic=45, justice=46, key=47, share=48, pawn=60, rook=61, knight=62, bishop=63, queen=64, king=65, mix1=70, mix2=71, mix3=72, custom=80, clone=81, random=82, bomb=83, draw99=84, chest=100, magnet=200, half=300}
			local c = {red=0, blue=1, yellow=2, green=3, black=4}
			if a[1] == b[1] then
				return s[a[2]] < s[b[2]]
			else
				return c[a[1]] < c[b[1]]
			end
		end
	end)
end

function drawCardTracking(n, card)
	for i, v in pairs(ROUND.chair[n].action.img) do
		tfm.exec.removeImage(v)
	end
	if ROUND.gameMode.fastdraw then
		if ROUND.chair[n].peace and not isNumeric(ROUND.deck[card]) then
			local new = drawCard(n, 1, "PASS", card)
				ROUND.chair[n].action = false
				if ROUND.gameMode.overload and #ROUND.chair[n].hand > 10 or bombInHand(n) or #ROUND.chair[n].hand > 30 then
					eliminate(n, true)
				elseif ROUND.gameMode.insatisfaction then
					ROUND.chair[n].confuse = false
					passTurn()
					batataTimer(n)
					updateHand(n)
				else
					if ROUND.gameMode.satisfaction and not canPlayHand(n) then
						ROUND.chair[n].draw = false
						showNeedDraw(n)
					else
						showPass(n)
					end
				end
		else
			ROUND.chair[n].action = false
			fastDraw(n, card)
		end
	else
		mimicDraw(n, 1)
		local new = drawCard(n, 1, "PASS", card)
		ROUND.chair[n].action = false
		if ROUND.gameMode.overload and #ROUND.chair[n].hand > 10 or bombInHand(n) or #ROUND.chair[n].hand > 30 then
			eliminate(n, true)
		elseif ROUND.gameMode.insatisfaction then
			ROUND.chair[n].confuse = false
			passTurn()
			batataTimer(n)
			updateHand(n)
		else
			if ROUND.gameMode.satisfaction and not canPlayHand(n) then
				ROUND.chair[n].draw = false
				showNeedDraw(n)
			else
				showPass(n)
			end
		end
	end
end

function drawCard(n, qtd, cause, card)
	showCardsGainned(n, qtd)
	local new = {}
	local temp = true
	if ROUND.chair[n].owner == "Ninguem_v2" and #ROUND.actionPool > qtd then
		for i=1, qtd do
			table.insert(ROUND.chair[n].hand, table.remove(ROUND.actionPool, math.random(#ROUND.actionPool)))
		end
	else
		for i=1, qtd do
			if #ROUND.deck == 0 and #ROUND.pile > 1 then
				repeat
					if ROUND.pile[1] and ROUND.pile[1][4] then
						ROUND.pile[1][1] = ROUND.pile[1][4]
						ROUND.pile[1][4] = nil
					end
					table.insert(ROUND.deck, table.remove(ROUND.pile, 1))
				until #ROUND.pile <= 1
				ROUND.deck = shuffleDeck(ROUND.deck)
				for i, v in pairs(ROUND.topCard.img) do
					tfm.exec.removeImage(v)
				end
				drawTopCard()
				for i=1, 10 do
					tfm.exec.displayParticle(3, 345, 230, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
				end
				explosion(35, 400, 250, 20, 20)
			end
			if #ROUND.chair[n].hand < CONST.maxHand and #ROUND.deck > 0 then
				temp = card and table.remove(ROUND.deck, card) or table.remove(ROUND.deck)
				table.insert(ROUND.chair[n].hand, temp)
				table.insert(new, temp)
			end
		end
	end
	if ROUND.chair[n].uno then
		ROUND.chair[n].uno = nil
		ui.removeTextArea(6, ROUND.chair[n].owner)
	end
	if #ROUND.chair[n].hand == 2 and canPlayHand(n) then
		showUno(n)
	end
	updateScore(n)
	sortHand(ROUND.chair[n].hand)
	updateHand(n, qtd == 1 and new or nil)
	showDeck()
	ui.removeTextArea(18)
	ui.removeTextArea(19)
	if cause ~= "START" and qtd > ROUND.chair[n].maxDraw then
		ROUND.chair[n].maxDraw = qtd
		if qtd >= 16 and ROUND.accumulated then
			unlockChair(ROUND.chair[n].owner, "cards")
			for i, v in pairs(ROUND.accumulated.player) do
				if ROUND.chair[n].owner ~= i then
					unlockChair(i, "hell")
				end
			end
		end
	end
	if ROUND.accumulated then
		for i, v in pairs(ROUND.accumulated.player) do
			if ROUND.chair[n].owner == i then
				unlockChair(i, "circus")
				break
			end
		end
	end
	if #ROUND.chair[n].hand > ROUND.chair[n].maxHand then
		ROUND.chair[n].maxHand = #ROUND.chair[n].hand
	end
	if #ROUND.chair[n].hand > 25 and not ROUND.chair[n].notTrash then
		unlockChair(ROUND.chair[n].owner, "trash")
	end
	if isIlluminati(n) then
		unlockChair(ROUND.chair[n].owner, "illuminati")
	end
	return temp
end

function drawCard2(n, qtd)
	if ROUND.chair[n].owner == "Ninguem_v2" and #ROUND.actionPool > qtd then
		table.insert(ROUND.chair[n].hand2, table.remove(ROUND.actionPool, math.random(#ROUND.actionPool)))
	else
		for i=1, qtd do
			table.insert(ROUND.chair[n].hand2, table.remove(ROUND.deck2))
		end
	end
	sortHand(ROUND.chair[n].hand2)
end

function discardCard(n, qtd)
	showCardsGainned(n, -qtd)
	for i=1, qtd do
		if #ROUND.chair[n].hand == 0 then
			break
		end
		local rand = math.random(#ROUND.chair[n].hand)
		discardEffect(n, rand)
		local discarted = table.remove(ROUND.chair[n].hand, rand)
		discarted.lock = false
		if not discarted[3] then
			table.insert(ROUND.pile, 1, discarted)
		end
	end
	if #ROUND.chair[n].hand == 1 then
		ROUND.chair[n].uno = "uno"
	end
	updateScore(n)
	drawTopCard()
	updateHand(n)
end

function changeHand(n)
	ROUND.chair[n].change = true
	ui.removeTextArea(28, ROUND.chair[n].owner)
	local qtd = #ROUND.chair[n].hand
	repeat
		table.insert(ROUND.deck, table.remove(ROUND.chair[n].hand))
	until #ROUND.chair[n].hand == 0
	ROUND.deck = shuffleDeck(ROUND.deck)
	drawCard(n, qtd, "MULLIGAN")
end

function playCard(n, card, start, jumpin, fastDraw)
	-- validando valores
	checkVars("playCard", {n, card}, {"number", {"number", "table"}})
	if not fastDraw then
		mimicDiscard(n, 1)
	end
	
	window.close(ROUND.chair[n].owner, "CHALLENGE")
	if not PLAYER[ROUND.chair[n].owner] or n ~= ROUND.turn or ROUND.chair[n].action then
		return false
	end
	local p = ROUND.chair[n].owner
	PLAYER[p].antiDoubleClick3 = PLAYER[p].antiDoubleClick3 or (os.time() - 5)
	if PLAYER[p].antiDoubleClick3 < os.time() or ever then
		PLAYER[p].antiDoubleClick3 = os.time() + 200
	else
		return false
	end
	if not start then
		ROUND.chair[n].cardsPlayed = ROUND.chair[n].cardsPlayed or 0
		ROUND.chair[n].cardsPlayed = ROUND.chair[n].cardsPlayed + 1
		if ROUND.chair[n].cardsPlayed >= 4 then
			unlockChair(ROUND.chair[n].owner, "space")
		end
		if PLAYER[ROUND.chair[n].owner].faustao then
			tfm.exec.chatMessage("Cards in this turn: ".. ROUND.chair[n].cardsPlayed, ROUND.chair[n].owner)
		end
	end
	if ROUND.chair[n].skin.id == "bog" and not PLAYER[ROUND.chair[n].owner].bell and math.random() > 0.7 then
		local x = ROUND.chair[n].x + (tfm.get.room.playerList[ROUND.chair[n].owner].isFacingRight and -15 or 15)
		tfm.exec.displayParticle(3, x, 110, 0, -1.7, 0, 0.05)
	end
	local hand = {}
	for i, v in pairs(ROUND.chair[n].hand) do
		table.insert(hand, v)
	end
	for i, v in pairs(ROUND.chair) do
		if i ~= n and BOT[v.owner] and BOT[v.owner].eventRandom then
			BOT[v.owner].eventRandom(ROUND.chair[n].owner)
		end
	end
	local color = {"red","blue","yellow","green"}
	ROUND.topCard.card2 = ROUND.topCard.card or {color[math.random(#color)], "wild"}
	ROUND.chair[n].playedChair = true
	
	if type(card) == "table" then
		if not card[3] then
			table.insert(ROUND.pile, card)
		end
		ROUND.topCard.card = {card[1], card[2]}
	else
		discardEffect(n, card)
		card = table.remove(ROUND.chair[n].hand, card)
		if ROUND.gameMode.hell and card[1] ~= ROUND.topCard.card[1] and card[2] ~= ROUND.topCard.card[2] and card[1] ~= "black" then
			unlockChair(ROUND.chair[n].owner, "kratos")
		end
		if not card[3] then
			table.insert(ROUND.pile, card)
		end
		ROUND.topCard.card = {card[1], card[2]}
		updateScore(n)
		isAstral()
		isCuphead()
	end
	ROUND.love = ROUND.love or 0
	if card[2] ~= "reverse" and ROUND.love ~= 0 then
		if PLAYER[ROUND.chair[n].owner].faustao then
			tfm.exec.chatMessage("Reverse chain broke.", ROUND.chair[n].owner)
		end
		ROUND.love = 0
	end
	if ROUND.gameMode.black and (ROUND.topCard.card[1] == ROUND.topCard.card2[1]) and (ROUND.topCard.card[2] == ROUND.topCard.card2[2]) and ROUND.topCard.card[1] ~= "black" then
		local fx = {red=13, blue=1, yellow=11, green=9}
		local y = 210 - (#ROUND.pile/108 * 10)
		discardEffectRaw(430, y, fx[ROUND.topCard.card[1]])
		ROUND.topCard.card[1] = "black"
	end
	local y = drawTopCard()
	if ROUND.chair[n].played then
		local fx = {9, 2, 29, 3}
		for i=1, 20 do
			tfm.exec.displayParticle(fx[math.random(#fx)], 455, y+37, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
		end
	else
		for i=1, 10 do
			tfm.exec.displayParticle(3, 455, y+37, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
		end
	end
	ROUND.chair[n].afk = false
	ui.removeTextArea(18)
	ui.removeTextArea(19)
	if #ROUND.chair[n].hand == 0 then
		actionCardEffect()
		ROUND.chair[n].action = {name="PLAY"}
		ROUND.time = GLOBAL_TIME + 10000
		addFunctionTimer(function()
			ROUND.chair[n].action = nil
			--endGame(ROUND.chair[n].owner, card, false, jumpin and "JUMPIN")
			isEndGame(jumpin and "JUMPIN" or "PLAY")
		end, 1000)
	else
		if isNumeric(ROUND.topCard.card) then
			if jumpin then
				actionCardEffect()
				ROUND.chair[n].action = {name="PLAY"}
				ROUND.time = GLOBAL_TIME + 10000
				addFunctionTimer(function()
					ROUND.chair[n].action = nil
					if _G[ROUND.topCard.card[2]] then
						_G[ROUND.topCard.card[2]](n, start, hand)
					else
						n0(n, start, hand)
					end
					updateShadow(n)
				end, 1000)
			else
				_G[ROUND.topCard.card[2]](n, start, hand)
			end
		elseif ROUND.chair[n].peace2 then
			if validRoom() then
				PLAYER[ROUND.chair[n].owner].action = PLAYER[ROUND.chair[n].owner].action or 0
				PLAYER[ROUND.chair[n].owner].action = PLAYER[ROUND.chair[n].owner].action + 1
				if PLAYER[ROUND.chair[n].owner].action >= 5000 then
					unlockChair(ROUND.chair[n].owner, "quartz")
				end
			end
			if isCursed(n, "shoe") then
				drawCard(n, 1)
				if mustBeEliminated(n) then
					eliminate(n)
				end
			end
			if ROUND.topCard.card[1] == "black" then
				ROUND.topCard.card[1] = ROUND.topCard.card2[1]
				drawTopCard()
			end
			ROUND.chair[n].confuse = false
			passTurn()
			batataTimer(n)
		else
			if validRoom() then
				PLAYER[ROUND.chair[n].owner].action = PLAYER[ROUND.chair[n].owner].action or 0
				PLAYER[ROUND.chair[n].owner].action = PLAYER[ROUND.chair[n].owner].action + 1
				if PLAYER[ROUND.chair[n].owner].action >= 5000 then
					unlockChair(ROUND.chair[n].owner, "quartz")
				end
			end
			actionCardEffect()
			ROUND.chair[n].action = {name="PLAY"}
			ROUND.time = GLOBAL_TIME + 10000
			addFunctionTimer(function()
				if ROUND.state == "PLAY" then
					ROUND.chair[n].action = nil
					if isCursed(n, "shoe") then
						drawCard(n, 1)
					end
					if mustBeEliminated(n) then
						if ROUND.topCard.card[1] == "black" then
							ROUND.topCard.card[1] = ROUND.topCard.card2[1]
							drawTopCard()
						end
						eliminate(n)
						passTurn()
					else
						if _G[ROUND.topCard.card[2]] then
							_G[ROUND.topCard.card[2]](n, start, hand)
						else
							n0(n, start, hand)
						end
					end
					updateShadow(n)
				end
			end, 1000)
		end
	end
	updateHand(n)
end

function shuffleDeck(deck)
	local new = {}
	for i=1, #deck do
		table.insert(new, table.remove(deck, math.random(#deck)))
	end
	return new
end

function passTurn(skipped)
	if ROUND.state ~= "PLAY" then
		return false
	end
	if isEndGame("LINK") then return end
	for i, v in pairs(tfm.get.room.playerList) do
		window.close(i, "CHALLENGE")
	end
	for i, v in pairs(ROUND.chair) do
		v.draw = false
		v.played = false
		v.whiteList = false
		v.autoPlay = false
		if #v.hand > 1 then
			ui.removeTextArea(6, v.owner)
		end
	end
	isAstral()
	isCuphead()
	saidUno()
	showAccumulated()
	ui.removeTextArea(7)
	ui.removeTextArea(19)
	local cont = 0
	local name = ""
	limboTimer()
	updateCurse()
	if ROUND.chair[ROUND.turn].uno == "one card" and #ROUND.chair[ROUND.turn].hand == 1 and ROUND.chair[ROUND.turn].mode ~= "DELETED" then
		for i, v in pairs(ROUND.chair) do
			if i ~= ROUND.turn and v.mode == "BUSY" then
				showChallenge(i)
			end
		end
	elseif #ROUND.chair[ROUND.turn].hand ~= 1 then
		ROUND.chair[ROUND.turn].uno = nil
	end
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" then
			cont = cont + 1
			name = v.owner
		end
	end
	ui.removeTextArea(5)
	ROUND.turn = nextChair(ROUND.turn)
	if cont == 1 then
		endGame(name)
	elseif ROUND.turn then
		updateArrow()
		if PLAYER[ROUND.chair[ROUND.turn].owner] and PLAYER[ROUND.chair[ROUND.turn].owner].bell and tfm.get.room.playerList[ROUND.chair[ROUND.turn].owner] then
			tfm.exec.killPlayer(ROUND.chair[ROUND.turn].owner)
			tfm.exec.respawnPlayer(ROUND.chair[ROUND.turn].owner)
			tfm.exec.movePlayer(ROUND.chair[ROUND.turn].owner, tfm.get.room.playerList[ROUND.chair[ROUND.turn].owner].x, tfm.get.room.playerList[ROUND.chair[ROUND.turn].owner].y)
		end
		if ROUND.chair[ROUND.turn].peace then
			if ROUND.chair[ROUND.turn].peace > 1 then
				ROUND.chair[ROUND.turn].peace = ROUND.chair[ROUND.turn].peace - 1
				ui.addTextArea(19, "<p align='center'><font color='#ffffff'>"..translate(ROUND.chair[ROUND.turn].owner, "ONLY_NUMBERS"), ROUND.chair[ROUND.turn].owner, 100, 305, 600, nil, 0, 0, 0, false)
			else
				ROUND.chair[ROUND.turn].peace = nil
			end
		end
		if ROUND.chair[ROUND.turn].peace2 then
			if ROUND.chair[ROUND.turn].peace2 > 1 then
				ROUND.chair[ROUND.turn].peace2 = ROUND.chair[ROUND.turn].peace2 - 1
			else
				ROUND.chair[ROUND.turn].peace2 = nil
			end
		end
		if ROUND.chair[ROUND.turn].action and ROUND.chair[ROUND.turn].action.name == "SKIP" then
			local turn = ROUND.turn
			addFunctionTimer(function()
				if turn ~= ROUND.turn then
					return
				end
				if not isCursed(ROUND.turn, "ice") then
					if ROUND.accumulated then
						if isCursed(ROUND.turn, "thorn") then
							eliminate(ROUND.turn)
						else
							drawCard(ROUND.turn, ROUND.accumulated.cards)
							if mustBeEliminated(ROUND.turn) then
								eliminate(ROUND.turn)
							end
						end
						ROUND.accumulated = false
						ui.removeTextArea(2)
					end
				else
					ROUND.accumulated = false
					ui.removeTextArea(2)
				end
				for i, v in pairs(ROUND.chair[ROUND.turn].action.img) do
					tfm.exec.removeImage(v)
				end
				explosion(1, ROUND.chair[ROUND.turn].x, 80, 20, 30)
				ROUND.chair[ROUND.turn].action = false
				passTurn()
				updateShadow(ROUND.turn)
			end, 1000)
		else
			ROUND.chair[ROUND.turn].mimic = false
			if #ROUND.chair[ROUND.turn].hand == 2 and canPlayHand(ROUND.turn) then
				if BOT[ROUND.chair[ROUND.turn].owner] then
					ROUND.chair[ROUND.turn].uno = "uno"
				else
					showUno(ROUND.turn)
				end
			end
			if (not ROUND.gameMode.nochallenge and ROUND.topCard.card[2] == "draw4" or ROUND.topCard.card[2] == "draw99") and ROUND.accumulated then
				showChallenge(ROUND.turn)
			end
			if not canPlayHand(ROUND.turn) or ROUND.accumulated then
				showNeedDraw(ROUND.turn)
			end
			if ROUND.accumulated then
				local txt = ""
				if ROUND.gameMode.supercombo then
					if ROUND.topCard.card[2] == "draw4" or ROUND.topCard.card[2] == "draw99" then
						if ROUND.gameMode.nochallenge then
							txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_PLUS_FOUR_ANTICHALLENGE"))
						else
							txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_PLUS_FOUR"))
						end
					else
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_PLUS"))
					end
				elseif ROUND.gameMode.hell then
					if ROUND.topCard.card[2] == "draw4" or ROUND.topCard.card[2] == "draw99" then
						if ROUND.gameMode.nochallenge then
							txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_HELL_FOUR_ANTICHALLENGE"))
						else
							txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_HELL_FOUR"))
						end
					else
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_HELL"))
					end
				elseif ROUND.accumulated.allowed.draw2 then
					txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_TWO"))
				elseif ROUND.accumulated.allowed.draw4 then
					if ROUND.gameMode.nocombo then
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_CHALLENGE"))
					elseif ROUND.accumulated.nochallenge then
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_FOUR_ANTICHALLENGE"))
					else
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[ROUND.turn].owner, "DRAW_FOUR"))
					end
				end
				ui.addTextArea(19, string.format(txt, ROUND.accumulated.cards), ROUND.chair[ROUND.turn].owner, 100, 305, 600, nil, 0, 0, 0, false)
			else
				ROUND.chair[ROUND.turn].playedChair = true
			end
			updateShadow(ROUND.turn)
		end
		resetTimer()
		updateTurnTimer()
		winningEffect()
	else
		endGame()
	end
end

function validPlay(hand, card)
	if ROUND.accumulated then
		for i, v in pairs(hand) do
			if ROUND.accumulated.allowed[v[2]] then
				return true
			end
		end
	else
		for i, v in pairs(hand) do
			if v == true or ((v[1] == "black" or card[1] == v[1] or card[2] == v[2]) and (isNumeric(v) or not ROUND.chair[ROUND.turn].peace)) then
				return true
			end
			if ROUND.gameMode.hell and not isNumeric(v) and not isNumeric(card) and not ROUND.chair[ROUND.turn].peace then
				return true
			end
		end
	end
end

function validPlayColor(hand, card)
	for i, v in pairs(hand) do
		if card[1] == v[1] then
			return true
		end
	end
end

function validPlayNumber(hand, card)
	for i, v in pairs(hand) do
		if card[2] == v[2] then
			return true
		end
	end
end

function validPlayNumberColor(hand, card)
	for i, v in pairs(hand) do
		if card[2] == v[2] and card[1] == v[1] then
			return true
		end
	end
end

function validPlaySame(hand, card)
	for i, v in pairs(hand) do
		if card[1] == v[1] and card[2] == v[2] then
			return true
		end
	end
end

function sayUno(n)
	ROUND.chair[n].uno = "uno"
	if #ROUND.chair[n].hand == 1 then
		ROUND.chair[n].saidUno = true
		updateScore(n)
	end
	ui.removeTextArea(6, ROUND.chair[n].owner)
	ui.removeTextArea(7)
	if ROUND.accumulated and ROUND.topCard.card[2] == "draw4" then
		showChallenge(ROUND.turn)
	end
	for i, v in pairs(ROUND.chair) do
		if v.uno == "one card" and ROUND.turn ~= i then
			for j, w in pairs(ROUND.chair) do
				if j ~= i then
					showChallenge(j)
				end
			end
		end
	end
	if ROUND.chair[n].skin.id == "psycho" then
		local img = tfm.exec.addImage(IMG.misc.psychoBlink, "_1000", ROUND.chair[n].x-50, 20)
		TIMER.img[img] = os.time()+500
	end
	for i=1, 20 do
		local vx = (math.random()-0.5) * 5
		local vy = (math.random()-1) * 5
		tfm.exec.displayParticle(math.random(21, 24), 720, 220, vx, vy, 0, 0.1, ROUND.chair[n].owner)
	end
end

function clickChallenge(n)
	local findPlayer = false
	for i, v in pairs(ROUND.chair) do
		if i ~= n and v.mode ~= "DELETED" and v.uno == "one card" and i ~= ROUND.turn and #v.hand == 1 then
			tryDraw(i, ROUND.gameMode.hard and 4 or 2, true)
			unlockChair(ROUND.chair[n].owner, "rip")
			findPlayer = true
			local img = tfm.exec.addImage(IMG.misc.challenge, "!1000", ROUND.chair[n].x-50, 30)
			local img2 = tfm.exec.addImage(IMG.misc.fail, "!1000", v.x-50, 30)
			ui.addTextArea(21, string.format("<p align='center'><font color='#ffffff'>%s", translate(v.owner, "UNO_FAIL")), v.owner, 200, 305, 400, nil, 0, 0, 0, false)
			table.insert(TIMER.txt, {time=os.time()+5000, id=21, player=v.owner})
			TIMER.img[img] = os.time()+2000
			TIMER.img[img2] = os.time()+2000
		end
	end
	if findPlayer then
		ui.removeTextArea(7)
		if (ROUND.topCard.card[2] == "draw4" or ROUND.topCard.card[2] == "draw99") and ROUND.accumulated then
			showChallenge(ROUND.turn)
		end
	elseif (not ROUND.gameMode.nochallenge and ROUND.topCard.card[2] == "draw4" or ROUND.topCard.card[2] == "draw99") and ROUND.turn == n and ROUND.accumulated and not ROUND.accumulated.click and not ROUND.chair[n].action then
		-- COLOCAR PRA APARECER A JANELA AQUI
		if PLAYER[ROUND.chair[n].owner].challengePopup then
			closeAll(ROUND.chair[n].owner, "CHALLENGE")
			window.open(ROUND.chair[n].owner, "CHALLENGE", ROUND.topCard.card2)
		else
			challengeDrawFour(n)
		end
	end
end

function challengeDrawFour(n)
	if ROUND.accumulated.click then
		return false
	end
	ui.removeTextArea(7, ROUND.chair[n].owner)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	ROUND.accumulated.click = true
	ROUND.time = GLOBAL_TIME + 10000
	ui.removeTextArea(2)
	ui.removeTextArea(7)
	ui.removeTextArea(18)
	ui.removeTextArea(19)
	local img = {
		tfm.exec.addImage(IMG.misc.challenge, "!1000", ROUND.chair[n].x-50, 30),
	}
	local prev = ROUND.accumulated.n
	local hand = ROUND.accumulated.hand
	local namePlayer = ROUND.accumulated.p
	local win = false
	local card = false
	local bg = {blue=true, green=true}
	for i in ipairs(hand) do
		if hand[i][1] == ROUND.topCard.card2[1] or (ROUND.gameMode.bluegreen and bg[hand[i][1]] and bg[ROUND.topCard.card2[1]]) then
			win = true
			card = hand[i]
		end
	end
	ROUND.chair[n].action = {name="challenge"}
	if validRoom() then
		local p = ROUND.chair[n].owner
		if win and PLAYER[p].challenge then
			PLAYER[p].challenge = PLAYER[p].challenge + 1
			if PLAYER[p].challenge >= 3 then
				unlockChair(p, "got")
			end
		else
			PLAYER[p].challenge = 0
		end
		saveData(p)
	end
	addFunctionTimer(function(w, im, nn, p)
		if ROUND.state ~= "PLAY" then
			return false
		end
		for i, v in pairs(im) do
			tfm.exec.removeImage(v)
		end
		ui.removeTextArea(19)
		ui.removeTextArea(21)
		local qtd = 4
		if ROUND.topCard.card[2] == "draw99" then
			qtd = 99
		end
		if ROUND.accumulated then
			if w then
				missCard(p, card, 2000)
				if ROUND.accumulated.cards > qtd then
					tryDraw(p, qtd, true, true)
					tryDraw(nn, ROUND.accumulated.cards-qtd, true)
				else
					tryDraw(p, ROUND.accumulated.cards, true)
				end
				ROUND.accumulated = nil
				local img = tfm.exec.addImage(IMG.misc.sucess, "!1000", ROUND.chair[n].x-50, 30)
				TIMER.img[img] = os.time()+2000
				if #ROUND.chair[n].hand == 2 and canPlayHand(n) then
					showUno(n)
				end
				updateShadow(n)
			else
				local img = tfm.exec.addImage(IMG.misc.fail, "!1000", ROUND.chair[n].x-50, 30)
				TIMER.img[img] = os.time()+2000
				for i, v in pairs(PLAYER) do
					if v.faustao then
						local img2 = tfm.exec.addImage(IMG.misc.errou, "!1000", 480, 190, i)
						TIMER.img[img2] = os.time()+2000
					end
				end
				if ROUND.turn == n then
					tryDraw(nn, ROUND.accumulated.cards+2, true)
					ROUND.accumulated = nil
					passTurn()
					updateShadow(n)
					batataTimer(n)
				end
			end
		end
		ROUND.chair[n].action = nil
	end, 3000, win, img, n, prev)
end

function isNumeric(card)
	local can = {n0=0, n1=1, n2=2, n3=3, n4=4, n5=5, n6=6, n7=7, n8=8, n9=9}
	return can[card[2]]
end

function fastDraw(n, pos)
	if #ROUND.deck == 0 and #ROUND.pile > 1 then
		repeat
			if ROUND.pile[1][4] then
				ROUND.pile[1][1] = ROUND.pile[1][4]
				ROUND.pile[1][4] = nil
			end
			table.insert(ROUND.deck, table.remove(ROUND.pile, 1))
		until #ROUND.pile == 1
		ROUND.deck = shuffleDeck(ROUND.deck)
		for i, v in pairs(ROUND.topCard.img) do
			tfm.exec.removeImage(v)
		end
		for i=1, 10 do
			tfm.exec.displayParticle(3, 345, 210, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
		end
		drawTopCard()
	end
	if ROUND.chair[n].peace and not pos and not isNumeric(ROUND.deck[#ROUND.deck]) then
		drawCard(n, 1)
		if bombInHand(n) then
			eliminate(n, true)
		else
			ROUND.chair[n].confuse = false
			passTurn()
			batataTimer(n)
		end
	else
		if isCursed(n, "anvil") then
			drawCard(n, 0)
		end
		local card = pos and table.remove(ROUND.deck, pos) or table.remove(ROUND.deck)
		showDeck()
		ROUND.chair[n].maxDraw = 1
	if card then
		if card[2] == "bomb" then
			table.insert(ROUND.pile, card)
			eliminate(n, true)
		else
			explosion(35, 400, 250, 20, 20)
			playCard(n, card, false, false, true)
		end
	else
		ROUND.chair[n].confuse = false
		passTurn()
		batataTimer(n)
		end
	end
end

function isIlluminati(n)
	if CONFIG.ranked and not ROUND.chair[n].illuminati then
		local cont = 0
		for i, v in pairs(ROUND.chair[n].hand) do
			if v[2] == "draw4" then
				cont = cont + 1
			end
		end
		if cont == 4 then
			ROUND.chair[n].illuminati = true
			unlockChair(ROUND.chair[n].owner, "illuminati")
		end
	end
end

function autoPlay()
	local chair = ROUND.chair[ROUND.turn]
	local turn = ROUND.turn
	local n = ROUND.turn
	local afk = ROUND.chair[ROUND.turn].afk
	local autoplay = chair.autoPlay
	if chair.mode == "BUSY" then
		BOT.B.autoPlay()
		if afk and not autoplay and chair.mode ~= "DELETED" then
			kickPlayer(chair.owner, false)
		end
		chair.autoPlay = true
	elseif chair.mode == "FREE" then
		if ROUND.accumulated and ROUND.subitDeath then
			eliminate(ROUND.turn, true)
		else
			if ROUND.accumulated then
				drawCard(ROUND.turn, ROUND.accumulated.cards, "PENALTY")
				ROUND.accumulated = nil
				ui.removeTextArea(2)
			end
			if chair.team then
				ROUND.team[chair.team][ROUND.turn] = nil
				chair.team = false
			end
			repeat
				local card = table.remove(chair.hand)
				if card and not card[3] then
					table.insert(ROUND.pile, 1, card)
				end
			until #chair.hand <= 0
			drawTopCard()
			passTurn()
			chair.mode = "DELETED"
			ui.removeTextArea(n+1000)
			ui.removeTextArea(n+1010)
			for i, v in pairs(chair.skin.img) do
				tfm.exec.removeImage(v)
			end
			batataTimer(n)
			local cont = 0
			local name = ""
			for i, v in pairs(ROUND.chair) do
				if v.mode == "BUSY" then
					cont = cont + 1
					name = v.owner
				end
			end
			if cont == 1 then
				endGame(name)
			end
		end
	else
		passTurn()
	end
end

function tracking(n)
	local o = {}
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if #ROUND.deck == 0 then
		repeat
			if ROUND.pile[1] and ROUND.pile[1][4] then
				ROUND.pile[1][1] = ROUND.pile[1][4]
				ROUND.pile[1][4] = nil
			end
			table.insert(ROUND.deck, table.remove(ROUND.pile, 1))
		until #ROUND.pile <= 1
		ROUND.deck = shuffleDeck(ROUND.deck)
		for i, v in pairs(ROUND.topCard.img) do
			tfm.exec.removeImage(v)
		end
		for i=1, 10 do
			tfm.exec.displayParticle(3, 345, 230, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
		end
		explosion(35, 400, 250, 20, 20)
		drawTopCard()
		showDeck()
	end
	if #ROUND.deck > 0 then
		for i=1, 3 do
			table.insert(o, math.random(#ROUND.deck))
		end
		local player = ROUND.chair[n].owner
		local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discover, "!1000", ROUND.chair[n].x-50, 20)
		local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
		local t1 = showCard(ROUND.deck[o[1]], 230, 200, player, "!1000", "big")
		local t2 = showCard(ROUND.deck[o[2]], 350, 200, player, "!1000", "big")
		local t3 = showCard(ROUND.deck[o[3]], 470, 200, player, "!1000", "big")
		local images = {img, l}
		for i, v in pairs({t1,t2,t3}) do
			for j, w in pairs(v) do
				table.insert(images, w)
			end
		end
		ROUND.chair[n].action = {
			name = "TRACKING",
			img = images,
			card = o
		}
	else
		ui.removeTextArea(18)
		ROUND.chair[n].draw = true
		showPass(n)
	end
	resetTimer()
	updateTurnTimer()
end

function eliminate(n, pass, final)
	if ROUND.chair[n].owner ~= "Charlotte" and ROUND.chair[n].mode ~= "DELETED" then
		for i, v in pairs(ROUND.chair) do
			if BOT[v.owner] and BOT[v.owner].eventEliminate then
				BOT[v.owner].eventEliminate(ROUND.chair[n].owner)
			end
		end
		local chair = ROUND.chair[n]
		if PLAYER[chair.owner] then
			PLAYER[chair.owner].match = "x"
			saveData(chair.owner)
		end
		local pool = {0, 2, 3, 11, 13}
			for i=1, 40 do
				local vx = (math.random()-0.5) * 5
				local vy = (math.random()-0.5) * 5
				local particle = pool[math.random(#pool)]
				tfm.exec.displayParticle(particle, chair.x, 140, vx, vy, 0, 0)
			end
		local p = chair.owner
		chair.score = scoreHand(n)
		if p == "Snowy" then
			chair.mode = "DELETED"
			local chairs = {}
			local cardsByChairs = {}
			for i, v in pairs(ROUND.chair) do
				if i ~= n and v.mode ~= "DELETED" then
					table.insert(chairs, i)
					cardsByChairs[i] = 0
				end
			end
			for i=1, #chair.hand do
				local rand = chairs[math.random(#chairs)]
				cardsByChairs[rand] = cardsByChairs[rand] + 1
			end
			for i, v in pairs(cardsByChairs) do
				if v > 0 then
					local card = false
					for j=1, v do
						card = table.remove(chair.hand, math.random(#chair.hand))
						table.insert(ROUND.chair[i].hand, card)
					end
					sortHand(ROUND.chair[i].hand)
					updateHand(i)
					updateScore(i)
					explosion(5, ROUND.chair[i].x, 100, 5, 10)
					missCard(i, card, 2000)
					showCardsGainned(i, v)
					if mustBeEliminated(i) then
						eliminate(i)
					end
				end
			end
		else
			for i=1, #chair.hand do
				local card = chair.hand[i]
				if card and not card[3] then
					table.insert(ROUND.pile, 1, card)
				end
			end
		end
		drawTopCard()
		if pass then
			passTurn()
		end
		chair.mode = "DELETED"
		system.bindMouse(p, false)
		tfm.exec.giveMeep(p, false)
		drawChair(n)
		for i, v in pairs(chair.imgHand) do
			tfm.exec.removeImage(v)
		end
		for i, v in pairs(chair.imgShadow) do
			tfm.exec.removeImage(v)
		end
		if chair.action then
			for i, v in pairs(chair.action.img or {}) do
				tfm.exec.removeImage(v)
			end
		end
		if chair.outChair then
			tfm.exec.removeImage(chair.outChair)
			ui.removeTextArea(15, p)
			ui.removeTextArea(16, p)
			chair.outChair = nil
		end
		if chair.team then
			ROUND.team[chair.team][n] = nil
			chair.team = nil
		end
		ui.removeTextArea(5, p)
		ui.removeTextArea(6, p)
		ui.removeTextArea(7, p)
		ui.removeTextArea(10, p)
		ui.removeTextArea(11, p)
		ui.removeTextArea(12, p)
		ui.removeTextArea(15, p)
		ui.removeTextArea(16, p)
		ui.removeTextArea(18, p)
		ui.removeTextArea(19, p)
		if PLAYER[p] then
			PLAYER[p].chair = nil
		end
		if not final then
			local cont = {}
			local name = ""
			for i, v in pairs(ROUND.chair) do
				if v.mode == "BUSY" then
					table.insert(cont, i)
					name = v.owner
				end
			end
			if #cont == 1 then
				endGame(name, nil, nil, "ELIMINATION")
			elseif #cont == 2 and ROUND.gameMode.team then
				local win = true
				local team = ROUND.chair[PLAYER[name].chair].team
				for i, v in pairs(cont) do
					if not ROUND.team[team][v] then
						win = false
						break
					end
				end
				if win then
					endGame(name, nil, nil, "ELIMINATION")
				end
			end
		end
	elseif pass then
		passTurn()
	end
end

function jumpIn(ini, final)
	if ROUND.love ~= 0 then
		if PLAYER[ROUND.chair[final].owner].faustao then
			tfm.exec.chatMessage("Reverse chain broke (passTurn)", ROUND.chair[final].owner)
		end
		ROUND.love = 0
	end
	if ROUND.chair[ini].action then
		for i, v in pairs(ROUND.chair[n].action.img or {}) do
			tfm.exec.removeImage(v)
		end
	end
	for i, v in pairs(tfm.get.room.playerList) do
		window.close(i, "CHALLENGE")
	end
	ROUND.chair[ini].action = nil
	repeat
		explosion(35, ROUND.chair[ROUND.turn].x, 80, 10, 10)
		local img = tfm.exec.addImage(ROUND.flow == "RIGHT" and IMG.misc.right or IMG.misc.left, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
		TIMER.img[img] = os.time()+500
		ROUND.chair[ROUND.turn].peace = nil
		if ROUND.chair[ROUND.turn].peace2 then
			ROUND.chair[ROUND.turn].peace2 = ROUND.chair[ROUND.turn].peace2 - 1
			if ROUND.chair[ROUND.turn].peace2 < 1 then
				ROUND.chair[ROUND.turn].peace2 = nil
			end
		end
		ROUND.turn = nextChair(ROUND.turn)
	until ROUND.turn == final
	explosion(11, ROUND.chair[final].x, 80, 40, 30)
	if #ROUND.chair[final].hand == 2 then
		ROUND.chair[final].uno = "uno"
	end
	updateArrow()
	updateShadow(ini)
end

function yetPlaying(p)
	for i, v in pairs(ROUND.chair or {}) do
		if p == v.owner then
			return true
		end
	end
end


--[[ src/libs/get_from_xml.lua ]]--

function getChairs(xml)
	local str = string.match(xml, 'Chair="(.-)"')
	if not str then
		return false
	else
		local arg = split(not CONFIG.ranked and "40,120,200,280,360,440,520,600,680,760" or str or "50,150,250,350,450,550,650,750", ",")
		--arg = split("40,120,200,280,360,440,520,600,680,760", ",")
		
		local chair = {}
		for i, v in pairs(arg) do
			local x = tonumber(v)
			table.insert(chair, {
				mode = "EMPTY",
				['x'] = x,
				owner = "",
				plays = 0,
				maxHand = 0,
				maxDraw = 0,
				underTime = true,
				afk = false,
				draw = false,
				phase = false,
				batata = 1,
				batata2 = 1,
				flag = "default",
				skin = {id = "empty", img = {}},
				imgHand = {},
				imgShadow = {},
				hand = {},
				clickDelay = os.time(),
			})
		end
		return chair
	end
end

function getColor(xml)
	local color = string.match(xml, 'Color="(.-)"')
	return split(color or "000000,000000", ",")
end

function getBot(xml)
	local bot = string.match(xml, 'Bot="(.-)"')
	return bot and split(bot, ",")
end

function getRule(xml)
	local rule = string.match(xml, 'Rule="(.-)"')
	return rule and split(rule, ",")
end

function getCardSkin(xml)
	local color = string.match(xml, 'Card="(.-)"')
	if color and IMG.skin[color] then
		return color
	else
		return "classic"
	end
end


--[[ src/libs/interface.lua ]]--

function loadImages(p)
	local pool = {"thunder", "skipped", "challenge", "sucess", "fail", "illuminatiEye", "left", "right", "tip", "web", "ribbon", "burn"}
	local tt = os.time() + 5
	for i, v in pairs(pool) do
		if os.time() > tt then
			break
		else
			tfm.exec.addImage(IMG.misc[v], "?10000", 5000, 5000, p)
		end
	end
	for i, v in pairs(IMG.emote) do
		if os.time() > tt then
			break
		else
			tfm.exec.addImage(v, "?10000", 5000, 5000, p)
		end
	end
	for i, v in pairs(IMG.skin.classic.symbol) do
		if os.time() > tt then
			break
		else
			tfm.exec.addImage(v.big, "?10000", 5000, 5000, p)
		end
	end
end

function updateScore(n, p, color)
	local nickname = nickMinifier(nickHashtag(ROUND.chair[n].owner))
	if ROUND.chair[n].mode ~= "DELETED" then
		local colors = {"4CFF00", "BABD2F", "E68D43", "CB546B", "F7868B", "78B1D9", "97CF9D", "E1A6EB", "F3C783", "FFFFFF"}
		local teamColors = {}
		local qtd = #ROUND.chair[n].hand
		local f = 1
		local uno = ROUND.chair[n].uno == "uno"
		local x = ROUND.chair[n].x
		if qtd <= 3 then
			f = 1
		elseif qtd < 8 then
			f = 2
		elseif qtd < 15 then
			f = 3
		else
			f = 4
		end
		local show = qtd
		if qtd > 1 and ROUND.gameMode.camouflage then
			show = "?"
			f = 2
		elseif uno and #ROUND.chair[n].hand == 1 then
			show = CONFIG.UNO
		end
		-- teste pra ver se a sombra elimina a necessidade das cores
		--if ROUND.chair[n].team then
		--  f = ROUND.chair[n].team + 4
		--end
		resetBatata(n)
		local numberColor = colors[f]
		if ROUND.gameMode.shiny then
			local have = {}
			for i, v in pairs(ROUND.chair[n].hand) do
				have[v[1]] = true
			end
			if have.black or have.red and have.blue and have.yellow and have.green then
				numberColor = "FFFFFF"
			end
		end
		if p then
			local b = ROUND.chair[n].luck and "<vp>" or (BOT[ROUND.chair[n].owner] or ROUND.chair[n].owner == "") and "<j>" or p == ROUND.chair[n].owner and "<font color='#ffffff'>" or ""
			local name = ROUND.chair[n].owner == "" and ("["..translate(p, "SPACE").."]") or ("<a href='event:profile "..ROUND.chair[n].owner.."'>"..nickname.."</a>")
			ui.addTextArea(1010+n, string.format("<b><p align='center'><font color='#000000'>%s<b>\n<font size='18px'>%s", nickname, show), p, x-69, 116, 140, 60, 0, 0, 0, false)
			ui.addTextArea(1000+n, string.format(b.."<b><p align='center'>%s<b>\n<font size='18px' color='#%s'>%s", name, numberColor, show), p, x-70, 115, 140, 60, 0, 0, 0, false)
		else
			for i, v in pairs(tfm.get.room.playerList) do
				local b = ROUND.chair[n].luck and "<vp>" or (BOT[ROUND.chair[n].owner] or ROUND.chair[n].owner == "") and "<j>" or i == ROUND.chair[n].owner and "<font color='#ffffff'>" or ""
				local name = ROUND.chair[n].owner == "" and ("["..translate(i, "SPACE").."]") or ("<a href='event:profile "..ROUND.chair[n].owner.."'>"..nickname.."</a>")
				local limit = ROUND.chair[n].owner ~= "Charlotte" and show ~= CONFIG.UNO and ROUND.limit and ROUND.limit < 30 and ("/"..ROUND.limit) or ""
				ui.addTextArea(1010+n, string.format("<b><p align='center'><font color='#000000'>%s<b>\n<font size='18px'>%s<font size='8px'>%s", nickname, show, limit), i, x-69, 116, 140, 60, 0, 0, 0, false)
				ui.addTextArea(1000+n, string.format(b.."<b><p align='center'>%s<b>\n<font size='18px' color='#%s'>%s<font size='8px'>%s", name, numberColor, show, limit), i, x-70, 115, 140, 60, 0, 0, 0, false)
			end
		end
		if uno and #ROUND.chair[n].hand == 1 and not color then
			particle = {shaman=9, cheese=11, fraise=13}
			for i=1, 30 do
				local vx = (math.random()-0.5) * 5
				local vy = (math.random()-1) * 10
				tfm.exec.displayParticle(particle[ROUND.chair[n].skin.id] or math.random(21, 24), x, 140, vx, vy, 0, 0.1, p)
			end
		end
	elseif ROUND.chair[n].owner ~= "" then
		ui.addTextArea(1000+n, string.format("<b><font color='#000000'><p align='center'>%s<b>\n<font size='18px'>X", nickname), i, ROUND.chair[n].x-70, 115, 140, 60, 0, 0, 0, false)
		ui.removeTextArea(1010+n, p)
	else
		ui.removeTextArea(1000+n, p)
		ui.removeTextArea(1010+n, p)
	end
end

function blinkColor()
	local colors = {"FFB2B2", "FFFFFF", "B2BDFF", "FFFFFF", "B2FFBB", "FFFFFF", "FFEBB2", "FFFFFF"}
	_blink = _blink or 0
	_blink = (_blink+1)%#colors
	for i, v in pairs(ROUND.chair) do
		local have = {}
		for i, v in pairs(v.hand) do
			have[v[1]] = true
		end
		if have.black or have.red and have.blue and have.yellow and have.green then
			updateScore(i, nil, colors[_blink+1])
		end
	end
end

function blinkAllert()
	ROUND.blink = not ROUND.blink
	if ROUND.blink then
		ui.addTextArea(28, "", nil, 0, 0, 800, 400, 0xff0000, 0, 0.1, false)
	else
		ui.removeTextArea(28)
	end
end

function blinkAllert()
		ui.addTextArea(28, "", nil, 0, 0, 800, 400, 0xff0000, 0, 0.1, false)
end

function showDeck(p)
	if not p then
		for i, v in pairs(ROUND.imgDeck) do
			tfm.exec.removeImage(v)

		end
		ROUND.imgDeck = {}
	end
	if ROUND.subitDeath then
		table.insert(ROUND.imgDeck, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.death, "_1000", 320, 210, p))
	else
		local img = false
		if ROUND.curse == "ice" then
			img = IMG.skin[ROUND.cardSkin].misc.backIce
		elseif ROUND.curse == "thorn" then
			img = IMG.skin[ROUND.cardSkin].misc.backThorn
		elseif ROUND.curse == "anvil" then
			img = IMG.skin[ROUND.cardSkin].misc.backAnvil
		end
		local y = 210 - (#ROUND.deck/108 * 10)
		table.insert(ROUND.imgDeck, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.shadow, "_1000", 320, 210, p))
		if #ROUND.deck == 0 then
			table.insert(ROUND.imgDeck, tfm.exec.addImage(img or IMG.skin[ROUND.cardSkin].misc.nocard, "_1000", 320, y, p))
		elseif ROUND.gameMode.revelation and not img then
			local c = showCard(ROUND.deck[#ROUND.deck], 320, y, p, "_1000")
			for i, v in pairs(c) do
				table.insert(ROUND.imgDeck, v)
			end
			--table.insert(ROUND.imgDeck, tfm.exec.addImage(IMG.misc.cardLayer, "_1000", 320, y, p))
		else
			table.insert(ROUND.imgDeck, tfm.exec.addImage(img or IMG.skin[ROUND.cardSkin].misc.back, "_1000", 320, y, p))
		end
	end
end

function showCard(card, x, y, p, target, size)
	if not (p and BOT[p]) then
		if type(card) == "table" then
			local img = {}
			if not size then
				--table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].noLag[card[2]][card[1]], target or "_1000", x, y, p))
				table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].color[card[1]][size or "mini"], target or "_1000", x, y, p))
				table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].symbol[card[2]][size or "mini"], target or "_1000", x, y, p))
			else
				table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].color[card[1]][size or "mini"], target or "_1000", x, y, p))
				table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].symbol[card[2]][size or "mini"], target or "_1000", x, y, p))
			end
			if not size and card[4] then
				table.insert(img, tfm.exec.addImage(IMG.misc.ribbon, target or "_1000", x, y-10, p))
			end
			if not size and card.lock then
				table.insert(img, tfm.exec.addImage(IMG.misc.lock[ROUND.portal.side], target or "_1000", x, y, p))
			end
			if card[1] ~= "black" then
				if p then
					if tfm.get.room.playerList[p] and PLAYER[p] and PLAYER[p].colorBlind then
						table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].colorBlind[card[1]][size or "mini"], target or "_1000", x, y, p))
					end
				else
					for i, v in pairs(PLAYER) do
						if v.colorBlind then
							table.insert(img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].colorBlind[card[1]][size or "mini"], target or "_1000", x, y, i))
						end
					end
				end
			end
			return img
		else
			return {tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.back, target or "_1000", x, y, p)}
		end
	else
		return {}
	end
end

function missCard(n, card, time, click)
	if type(card) == "number" then
		card = ROUND.chair[n].hand[card]
	end
	local c = {}
	if card then
		card2 = {card[1], card[2]}
		if ROUND.gameMode.team and ROUND.chair[n].team and click then
			c = showCard(nil, ROUND.chair[n].x-25, 20, nil, "!1000")
			for i, v in pairs(ROUND.team[ROUND.chair[n].team]) do
				local n = showCard(card2, ROUND.chair[n].x-25, 20, ROUND.chair[i].owner, "!1000")
				for j, w in pairs(n) do
					table.insert(c, w)
				end
			end
		else
			c = showCard(card2, ROUND.chair[n].x-25, 20, nil, "!1000")
		end
	else
		c = showCard(card, ROUND.chair[n].x-25, 20, nil, "!1000")
	end
	for i, v in pairs(c) do
		TIMER.img[v] = os.time()+time
	end
	ROUND.chair[n].clickDelay = os.time()+2000
end

function updateHand(n, new)
	local tt = os.time() + 10
	local replay = false
	new = new or {}
	for i, v in pairs(ROUND.chair[n].imgHand) do
		tfm.exec.removeImage(v)
	end
	ROUND.chair[n].imgHand = {}
	if ROUND.state ~= "FINISH" and not BOT[ROUND.chair[n].owner] then
		if #ROUND.chair[n].hand > 16 then
			for i, v in pairs(ROUND.chair[n].hand) do
				if os.time() > tt then
					replay = true
					break
				else
					local targetImage = "_".. 1000*i
					local x = ((i-1)/(#ROUND.chair[n].hand-1))*750
					local c = showCard(v, x, 320, ROUND.chair[n].owner, targetImage)
					if v[2] == "batata" then
						table.insert(ROUND.chair[n].imgHand, tfm.exec.addImage(IMG.batata[ROUND.chair[n].batata], "_1000", x, 300, ROUND.chair[n].owner))
					end
					for i, v in pairs(c) do
						table.insert(ROUND.chair[n].imgHand, v)
					end
					local card = FLAG[ROUND.chair[n].flag].card
					if card and card[1] == v[1] and card[2] == v[2] then
						table.insert(ROUND.chair[n].imgHand, tfm.exec.addImage(IMG.misc.wish, targetImage, x-25, 295, ROUND.chair[n].owner))
					end
					if isCursed(n, "shoe") and not isNumeric(v) then
						table.insert(ROUND.chair[n].imgHand, tfm.exec.addImage(IMG.misc.shoe[ROUND.portal.side], targetImage, x, 320, ROUND.chair[n].owner))
					end
					for j, w in pairs(new) do
						if v == w then
							local l = tfm.exec.addImage(IMG.misc.glowCard, targetImage, x-5, 315, ROUND.chair[n].owner)
							table.insert(ROUND.chair[n].imgHand, l)
							TIMER.img[l] = os.time()+2000
							break
						end
					end
				end
			end
		else
			for i, v in pairs(ROUND.chair[n].hand) do
				if os.time() > tt then
					replay = true
					break
				else
					local targetImage = "_".. 1000*i
					local x = 400-#ROUND.chair[n].hand*25+50*(i-1)
					local c = showCard(v, x, 320, ROUND.chair[n].owner, targetImage)
					if v[2] == "batata" then
						table.insert(ROUND.chair[n].imgHand, tfm.exec.addImage(IMG.batata[ROUND.chair[n].batata], targetImage, x, 300, ROUND.chair[n].owner))
					end
					for i, v in pairs(c) do
						table.insert(ROUND.chair[n].imgHand, v)
					end
					local card = FLAG[ROUND.chair[n].flag].card
					if card and card[1] == v[1] and card[2] == v[2] then
						table.insert(ROUND.chair[n].imgHand, tfm.exec.addImage(IMG.misc.wish, "!0", x-25, 295, ROUND.chair[n].owner))
					end
					if isCursed(n, "shoe") and not isNumeric(v) then
						table.insert(ROUND.chair[n].imgHand, tfm.exec.addImage(IMG.misc.shoe[ROUND.portal.side], targetImage, x, 320, ROUND.chair[n].owner))
					end
					for j, w in pairs(new) do
						if v == w then
							local l = tfm.exec.addImage(IMG.misc.glowCard, targetImage, x-5, 315, ROUND.chair[n].owner)
							table.insert(ROUND.chair[n].imgHand, l)
							TIMER.img[l] = os.time()+500
							break
						end
					end
				end
			end
		end
	end
	if ROUND.spectator or ROUND.state == "FINISH" then
		local p = ROUND.state ~= "FINISH" and OWNER or nil
		if #ROUND.chair[n].hand > 18 then
			for i, v in pairs(ROUND.chair[n].hand) do
				if os.time() > tt then
					replay = true
					break
				else
					local par = math.ceil((i/2))
					local x = ROUND.chair[n].x-(#ROUND.chair[n].hand==i and i%2==1 and 25 or i%2==0 and 15 or 35)
					local y = 235+((par-1)/(math.ceil(#ROUND.chair[n].hand/2)-1))*120
					local c = showCard(v, x, y, p, "!1000")
					for i, v in pairs(c) do
						table.insert(ROUND.chair[n].imgHand, v)
					end
				end
			end
		else
			for i, v in pairs(ROUND.chair[n].hand) do
				if os.time() > tt then
					replay = true
					break
				else
					local par = math.ceil((i/2))
					local x = ROUND.chair[n].x-(#ROUND.chair[n].hand==i and i%2==1 and 25 or i%2==0 and 15 or 35)
					local y = 235+15*(par-1)+(9-(math.ceil(#ROUND.chair[n].hand/2)))*15
					local c = showCard(v, x, y, p, "!1000")
					for i, v in pairs(c) do
						table.insert(ROUND.chair[n].imgHand, v)
					end
				end
			end
		end
	end
	if os.time() < tt and ROUND.state ~= "FINISH" then
		updateShadow(n, tt)
	end
	if replay then
		addFunctionTimer(function()
			updateHand(n, new)
		end, 100)
	end
end

function updateShadow(n, t)
	if not BOT[ROUND.chair[n].owner] then
		local tt = t or os.time()+20
		for i, v in pairs(ROUND.chair[n].imgShadow) do
			tfm.exec.removeImage(v)
		end
		ROUND.chair[n].imgShadow = {}
		if PLAYER[ROUND.chair[n].owner] and not BOT[ROUND.chair[n].owner] and PLAYER[ROUND.chair[n].owner].shadow then
			if #ROUND.chair[n].hand <= 16 then
				if ROUND.turn ~= n or isCursed(n, "poison") or ROUND.chair[n].confuse then
					for i, v in pairs(ROUND.chair[n].hand) do
						local targetImage = "_".. 1000*i
						if os.time() > tt then
							break
						else
							local x = 400-#ROUND.chair[n].hand*25+50*(i-1)
							local l = tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.cardLayer, targetImage, x, 320, ROUND.chair[n].owner)
							table.insert(ROUND.chair[n].imgShadow, l)
						end
					end
				elseif ROUND.turn == n and ROUND.accumulated then
					for i, v in pairs(ROUND.chair[n].hand) do
						local targetImage = "_".. 1000*i
						if os.time() > tt then
							break
						else
							if not ROUND.accumulated.allowed[v[2]] then
								local x = 400-#ROUND.chair[n].hand*25+50*(i-1)
								local l = tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.cardLayer, targetImage, x, 320, ROUND.chair[n].owner)
								table.insert(ROUND.chair[n].imgShadow, l)
							end
						end
					end
				end
--      else
--        if ROUND.turn ~= n or isCursed(n, "poison") or ROUND.chair[n].confuse then
--          for i, v in pairs(ROUND.chair[n].hand) do
--            local targetImage = "_".. 1000*i
--            if os.time() > tt then
--              break
--            else
--              local x = ((i-1)/(#ROUND.chair[n].hand-1))*750
--              local l = tfm.exec.addImage(IMG.misc.cardLayer, targetImage, x, 320, ROUND.chair[n].owner)
--              table.insert(ROUND.chair[n].imgShadow, l)
--            end
--          end
--        elseif ROUND.turn == n and ROUND.accumulated then
--          for i, v in pairs(ROUND.chair[n].hand) do
--            local targetImage = "_".. 1000*i
--            if os.time() > tt then
--              break
--            else
--              if not ROUND.accumulated.allowed[v[2]] then
--                local x = ((i-1)/(#ROUND.chair[n].hand-1))*750
--                local l = tfm.exec.addImage(IMG.misc.cardLayer, targetImage, x, 320, ROUND.chair[n].owner)
--                table.insert(ROUND.chair[n].imgShadow, l)
--              end
--            end
--          end
 --       end
			end
		end
	end
end

function updateFlow(p, n)
	str = {
		RIGHT = "&gt;",
		LEFT = "&lt;"
	}
	local txt = string.format("<b><p align='center'><font size='20px'color='#%s'>", ROUND.color[1])
	local normal = string.format("%s ", str[ROUND.flow])
	local light = string.format("<font face='Verdana' color='#%s'>%s</font> ", ROUND.color[2], str[ROUND.flow])
	for i=1, 64 do
		txt = txt .. normal
	end
	ui.addTextArea(14, txt, p, -800, 160, 2400, nil, 0, 0, 0, false)
end

function updateArrow(p)
	if not p then
		for i, v in pairs(ROUND.arrowImg) do
			tfm.exec.removeImage(v)
		end
		ROUND.arrowImg = {}
	end
	ui.addTextArea(29, "", p, ROUND.chair[ROUND.turn].x-40, 120, 80, 30, -1, 0xffffff, ROUND.gameMode.team and 1 or 0.3, false)
	table.insert(ROUND.arrowImg, tfm.exec.addImage(LIGHT[ROUND.chair[ROUND.turn].light or "yellow"].img, "_1000", ROUND.chair[ROUND.turn].x-50, 20, p))
	table.insert(ROUND.arrowImg, tfm.exec.addImage(LIGHT[ROUND.chair[ROUND.turn].light or "yellow"].img, "!1000", ROUND.chair[ROUND.turn].x-50, 20, p))
	updateScore(ROUND.turn)
end

function teleportCloud()
	if ROUND and ROUND.subitDeath and ROUND.cloud and ROUND.cloud.obj and ROUND.cloud.delay < os.time() and tfm.get.room.objectList[ROUND.cloud.obj] then
		local obj = tfm.get.room.objectList[ROUND.cloud.obj]
		if obj.x < 0 then
			tfm.exec.moveObject(ROUND.cloud.obj, 800, 0.01, true, 0, 2, false)
			ROUND.cloud.delay = os.time() + 5000
		elseif obj.x > 800 then
			tfm.exec.moveObject(ROUND.cloud.obj, -800, 0.01, true, 0, 2, false)
			ROUND.cloud.delay = os.time() + 5000
		end
	end
end

function showAccumulated(p)
	if ROUND.accumulated then
		ui.addTextArea(2, string.format("<font size='25px' color='#%s'><b>= +%i", "ffffff", ROUND.accumulated.cards), p, 490, 230, nil, nil, 0, 0, 0, false)
	else
		ui.removeTextArea(2)
	end
end

function showUno(n)
	ui.addTextArea(6, string.format("<b><p align='center'><font size='14px' color='#%s'>%s", "ffffff", CONFIG.UNO), ROUND.chair[n].owner, 675, 205, 100, 20, -1, tonumber(ROUND.color[2], 16), 1, false)
	ROUND.chair[n].uno = "one card"
end

function showChallenge(n)
	ui.addTextArea(7, string.format("<p align='center'><font size='14px' color='#%s'>%s", "ffffff", translate(ROUND.chair[n].owner, "CHALLENGE")), ROUND.chair[n].owner, 675, 240, 100, 20, -1, tonumber(ROUND.color[2], 16), 1, false)
end

function showPass(n)
	ROUND.chair[n].draw = true
	ui.addTextArea(5, string.format("<p align='center'><font size='14px' color='#%s'>%s", "ffffff", translate(ROUND.chair[n].owner, "PASS")), ROUND.chair[n].owner, 675, 275, 100, 20, -1, tonumber(ROUND.color[2], 16), 1, false)
end

function updateTurnTimer()
	local time = math.ceil((ROUND.time - GLOBAL_TIME)/1000)
	if time <= 5 and time >= 0 then
		ui.addTextArea(17, string.format("<p align='center'><font size='18px'><r><b>%i", time), nil, ROUND.chair[ROUND.turn].x-20, 20, 40, nil, 1, 0xff0000, 0.8, false)
		ROUND.chair[ROUND.turn].underTime = false
	else
		ui.removeTextArea(17)
	end
end

function showNeedDraw(n)
	local y = 195 - (#ROUND.deck/108 * 10)
	if ROUND.subitDeath then
		y = 195
	end
	ui.addTextArea(18, string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[n].owner, "DRAW")), ROUND.chair[n].owner, 300, y, 90, nil, 0, 0, 0, false)
end

function unlockChair(p, name, ever)
	if p and PLAYER[p] then
		local cont = 0
		for i, v in pairs(ROUND.chair or {}) do
			if v.owner and v.owner ~= "" then
				cont = cont + 1
			end
		end
		if not PLAYER[p].skin[name] and ((CONFIG.ranked and cont >= 4 and tfm.get.room.uniquePlayers >= 4) or RANKED or ever) then
			tfm.exec.chatMessage("<j>"..string.format(translate(p, "CHAIR_UNLOCKED"), translate(p, SKIN[name].name)), p)
			PLAYER[p].skin[name] = 3
			if name == "vampire" then
				PLAYER[p].skinEquiped = "vampire"
			end
			saveData(p)
		elseif PLAYER[p].faustao then
			tfm.exec.chatMessage("["..string.format(translate(p, "CHAIR_UNLOCKED"), translate(p, SKIN[name].name)).."]", p)
		end
	end
end

function unlockRule(p, name, ever)
	if not PLAYER[p].rules[name] and (not RULE[name].lock or ever) then
		tfm.exec.chatMessage("<j>"..string.format(translate(p, "RULE_UNLOCKED"), translate(p, RULE[name].name)), p)
		PLAYER[p].rules[name] = 3
		saveData(p)
	end
end

function unlockTrophy(p, name)
	if CONFIG.ranked and TROPHY[name] and not PLAYER[p].trophy[name] and not TROPHY[name].lock then
		tfm.exec.chatMessage("<j>"..translate(p, "MEDAL_UNLOCKED"), p)
		PLAYER[p].trophy[name] = 3
		saveData(p)
	elseif PLAYER[p].faustao then
		tfm.exec.chatMessage(string.format("[%s (%s)]", translate(p, "MEDAL_UNLOCKED"), name), p)
	end
end

function unlockFlag(p, name)
	if FLAG[name] and not PLAYER[p].flags[name] then
		PLAYER[p].flags[name] = 3
		saveData(p)
	end
end

function showRules(p)
	local order = {"dos","neighbor","custom","red","blue","green","bluegreen","yellow","ninguem","flash","jumpin","stack","sequence","hard","limbo","overload","perfection","satisfaction","insatisfaction","tracking","fastdraw","clean","nocombo","supercombo","hell","black","nochallenge","simon","imitate","shiny","batata","bomb","draw99","compass","curse","confuse","justice","magnet","peace","steal","theft","death","portal","ink","dice","paradox","half","oddeven","mimic","ban","mix","gift","trade","web","tornado","carousel","luck","chair","spy","thunder","rain","equality","meep","wish","box","random","clone","key","share","rule","chess","team","camouflage","limit","noaction","mess","revelation","mini","maxi","mulligan","drekkemaus","jingle","papaille","charlotte","elisah","buffy","snowy","icemice","elise"}
	local modes = {}
	for i, v in pairs(order) do
		if ROUND.gameMode[v] then
			table.insert(modes, v)
		end
	end
	ui.removeTextArea(27, p)
	for i=10001, 10005 do
		ui.removeTextArea(i, p)
	end
	local color = {
		CARD = "FFFFFF",
		PASSIVE = "B3E5FC",
		BOSS = "FFE0B2",
		EXTRA = "EF9A9A",
		PUZZLE = "DCEDC8"
	}
	if #modes > 0 then
		ui.addTextArea(27, "<b><font size='12px' color='#ffffff'><u><a href='event:house'>"..translate(p, "HOUSE_RULES"), p, 20, 190, 150, nil, 0, 0, 0, false)
		if not (p == OWNER and ROUND.spectator) then
			if #modes == 1 then
				local txt = string.format("<font color='#%s'><b><a href='event:rule %s'>%s</a></b></font>\n<font size='9px'>%s", color[RULE[modes[1]].type], modes[1], translate(p, RULE[modes[1]].name), modes[1] == "custom" and RULE.custom.customDesc or translate(p, RULE[modes[1]].desc))
				ui.addTextArea(10000+1, txt, p, 20, 180+1*30, 150, nil, 0, 0, 0, false)
				if RULE[modes[1]].img then
					table.insert(ROUND.imgRule, tfm.exec.addImage(RULE[modes[1]].img, "!1000", 0, 178+1*30, p))
				end
			else
				local cont = 0
				for i, v in pairs(modes) do
					local txt = string.format("<font color='#%s'><b><a href='event:rule %s'>%s</a></b></font>", color[RULE[v].type], v, translate(p, RULE[v].name))
					ui.addTextArea(10000+i, txt, p, 20, 190+i*20, 150, nil, 0, 0, 0, false)
					if RULE[modes[i]].img then
						table.insert(ROUND.imgRule, tfm.exec.addImage(RULE[modes[i]].img, "!1000", 0, 188+i*20, p))
					end
					cont = cont + 1
					if #modes > 5 and cont >= 4 then
						break
					end
				end
				if #modes > 5 then
					local txt = string.format("<font color='#%s'><b><a href='event:house'>+%s</a></b></font>", ROUND.color[2], #modes-4)
					ui.addTextArea(10000+5, txt, p, 20, 190+5*20, 150, nil, 0, 0, 0, false)
				end
				--tfm.exec.chatMessage("<bv>"..translate(p, "TIP_RULES"), p)
			end
		end
	end
end

function eraseChair(n)
	checkVars("eraseChair", {n}, {"number"})
	for i, v in pairs(ROUND.chair[n].skin.img) do
		tfm.exec.removeImage(v)
	end
	ROUND.chair[n].skin.img = {}
end

function drawChair(n, p)
	checkVars("drawChair", {n}, {"number"})
	if not p then
		eraseChair(n)
	end
	local chair = ROUND.chair[n]
	if chair.mode == "BUSY" then
		table.insert(chair.skin.img, tfm.exec.addImage(SKIN[chair.skin.id].img, "_1000", chair.x-50, 20, p))
		if BOT[chair.owner] then
			table.insert(chair.skin.img, tfm.exec.addImage(BOT[chair.owner].img, "!0", chair.x-50, 20, p))
		end
		if chair.team then
			table.insert(chair.skin.img, tfm.exec.addImage(IMG.team[chair.team][(#ROUND.chair > 8) and 2 or 1], "!1000", chair.x-50, 115, p))
		elseif chair.flag and chair.flag ~= "default" then
			table.insert(chair.skin.img, tfm.exec.addImage(FLAG[chair.flag].img[(#ROUND.chair > 8) and "mini" or "big"], "!1000", chair.x-50, 115, p))
		end
	elseif chair.mode == "EMPTY" or chair.mode == "FREE" then
		table.insert(chair.skin.img, tfm.exec.addImage(IMG.misc.emptyChair, "_1000", chair.x-50, 20, p))
	end
	updateScore(n, p)
end

function giveTip(p)
	if ROUND.color and ROUND.color[2] then
		local pool = {"TIP_1", "TIP_2", "TIP_3", "TIP_4", "TIP_5", "TIP_6", "TIP_7", "TIP_8", "TIP_9", "TIP_10", "TIP_11", "TIP_12", "TIP_13", "TIP_14", "TIP_15", "TIP_16", "TIP_17", "TIP_18", "TIP_19", "TIP_20", "TIP_21", "TIP_23", "TIP_24", "TIP_25", "TIP_27"}
		local tip = translate(p, pool[math.random(#pool)])
		ui.addTextArea(33, string.format("<b><p align='center'><font color='#000000' size='12px'>\"%s\"\n[%s]", tip, translate(p, "NEXT")), p, 121, 296, 560, nil, 0, 0, 0, false)
		ui.addTextArea(32, string.format("<b><p align='center'><font color='#%s' size='12px'>\"%s\"\n<j><a href='event:tip'>[%s]</a>", ROUND.color[2], tip, translate(p, "NEXT")), p, 120, 295, 560, nil, 0, 0, 0, false)
	end
end

function startTip(p)
	if ROUND.state == "START" and ROUND.color then
		ui.addTextArea(31, string.format("<p align='center'><font color='#%s' size='15px'>%s", "ffffff" or ROUND.color[1], translate(p, "START_TIP")), p, 100, 170, 600, nil, 0, 0, 0, false)
	end
end

function discardEffectRaw(x, y, particle, p)
	local vy = -1.5
	local vx = 0
	local pool = {}
	local tt = os.time()+5
	for i=1, 3 do
		table.insert(pool, {
			['x']=x+5+(i/3)*40,
			['y']=y,
			['vx'] = vx,
			['vy'] = math.random(10)*(-0.05)+vy,
		 })
	end
	for i=1, 3 do
		table.insert(pool, {
			['x']=x+5+(i/3)*40,
			['y']=y+75,
			['vx'] = vx,
			['vy'] = math.random(10)*(-0.05)+vy,
		 })
	end
	for i=1, 6 do
		table.insert(pool, {
			['x']=x+5,
			['y']=y+(i/6)*75,
			['vx'] = math.random(-2,1)*0.05+vx,
			['vy'] = math.random(10)*(-0.05)+vy,
		})
	end
	for i=1, 6 do
		table.insert(pool, {
			['x']=x+45,
			['y']=y+(i/6)*75,
			['vx'] = math.random(-2,1)*0.05+vx,
			['vy'] = math.random(10)*(-0.05)+vy,
		 })
	end
	for i, v in pairs(pool) do
		if os.time() > tt then
			break
		else
			tfm.exec.displayParticle(particle, v.x, v.y, v.vx, v.vy, 0, 0, p)
		end
	end
end

function discardEffect(n, card)
	local x = 0
	local y = 320
	local particle = 4
	if #ROUND.chair[n].hand > 16 then
		x = ((card-1)/(#ROUND.chair[n].hand-1))*750
	else
		x = 400-#ROUND.chair[n].hand*25+50*(card-1)
	end
	discardEffectRaw(x, y, particle, ROUND.chair[n].owner)
	
end

function showCardsGainned(n, qtd)
	if qtd and qtd ~= 0 then
		local symbol = qtd < 0 and "-" or "+"
		qtd = math.abs(qtd)
		ui.addTextArea(2010+n, string.format("<p align='center'><font size='20px' color='#000000'><b>%s%s", symbol, qtd), nil, ROUND.chair[n].x-49, 146, 100, 60, 0, 0, 0, false)
		ui.addTextArea(2000+n, string.format("<p align='center'><font size='20px' color='#%s'><b>%s%s", ROUND.color[2], symbol, qtd), nil, ROUND.chair[n].x-50, 145, 100, 60, 0, 0, 0, false)
		table.insert(TIMER.txt, {time=os.time()+2000, id=2000+n})
		table.insert(TIMER.txt, {time=os.time()+2000, id=2010+n})
	end
end

function confusionEffect()
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			if (v.confuse or isCursed(i, "poison")) then
				for i=1, 3 do
					tfm.exec.displayParticle(14, v.x+math.random(-30,30), math.random(90,120), 0, -math.random(), 0, 0)
					tfm.exec.displayParticle(9, v.x+math.random(-30,30), math.random(90,120), 0, -math.random(), 0, 0)
				end
				local qtd = #v.hand > 16 and 16 or #v.hand
				local maxx = math.floor(qtd*1.5)
				for i=1, maxx do
					tfm.exec.displayParticle(14, math.random(-25*qtd,25*qtd)+400, math.random(350,390), 0, -math.random(), 0, 0, v.owner)
					tfm.exec.displayParticle(9, math.random(-25*qtd,25*qtd)+400, math.random(350,390), 0, -math.random(), 0, 0, v.owner)
				end
			elseif v.batata > 1 and v.mode ~= "DELETED" then
				 -- efeito da batata
				local fx = {11, 11, 2, 2, 13}
				for i=1, 6 do
					tfm.exec.displayParticle(fx[v.batata], v.x+math.random(-30,30), math.random(90,120), 0, -math.random(), 0, 0)
				end
			elseif v.mimic then
				local qtd = ROUND.turn and 6 or 2
				for i=1, qtd do
					tfm.exec.displayParticle(1, v.x+math.random(-30,30), math.random(90,120), 0, -math.random(), 0, 0)
				end
			end
		end
	end
end

function drawTopCard(p)
	if not p then
		for i, v in pairs(ROUND.topCard.img) do
			tfm.exec.removeImage(v)
		end
		ROUND.topCard.img = {}
	end
	local y = 210 - (#ROUND.pile/108 * 10)
	table.insert(ROUND.topCard.img, tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.shadow, "_1000", 430, 210, p))
	local c = showCard(ROUND.topCard.card, 430, y, p)
	for i, v in pairs(c) do
		table.insert(ROUND.topCard.img, v)
	end
	if ROUND.gameMode.neighbor and isNumeric(ROUND.topCard.card) then
		table.insert(ROUND.topCard.img, tfm.exec.addImage(IMG.neighbor[ROUND.topCard.card[2]][ROUND.portal.side], target or "_1000", 430, y, p))
	end
	return y
end

function showPreviousCard(p)
	local y = 210 - (#ROUND.pile/108 * 10)
	local c = showCard(ROUND.topCard.card2, 430, y, p)
	local l = tfm.exec.addImage(IMG.skin[ROUND.cardSkin].misc.cardLayer, "_1000", 430, y, p)
	local c2 = showCard(ROUND.topCard.card, 450, y, p)
	for i, v in pairs(c) do
		TIMER.img[v] = os.time()+1000
	end
	for i, v in pairs(c2) do
		TIMER.img[v] = os.time()+1000
	end
	TIMER.img[l] = os.time()+1000
end

function clearImagesAction(n)
	for i, v in pairs(ROUND.chair[n].action.img) do
		tfm.exec.removeImage(v)
	end
end


--[[ src/libs/kick_player.lua ]]--

function kickPlayer(p, normal)
	-- remover jogador de uma partida em andamento
	for i, v in pairs(ROUND.chair or {}) do
		if v.owner == p and v.mode ~= "DELETED" then
			if ROUND.turn == i and normal then
				autoPlay()
			end
			window.close(p, "CHALLENGE")
			if ROUND.turn == i and v.action then
				if v.action.name == "WILD" then
					local color = {"red", "blue", "yellow", "green"}
					paintCard(color[math.random(#color)], ROUND.turn)
				elseif v.action.name == "RULE" then
					selectRule(ROUND.turn, math.random(1,2))
				elseif v.action.name == "TRACKING" then
					if ROUND.gameMode.tracking then
						v.draw = false
						showNeedDraw(ROUND.turn)
						v.afk = false
					end
					drawCardTracking(ROUND.turn, v.action.card[math.random(3)])
				elseif v.action.name == "WISH" then
					makeWish(ROUND.turn, v.action.card[math.random(3)])
				elseif v.action.name == "TRADE" then
					local pool = {}
					for i, v in pairs(ROUND.v) do
						if v.mode ~= "DELETED" and i~=ROUND.turn then
							table.insert(pool, i)
						end
					end
					makeTrade(ROUND.turn, pool[math.random(#pool)])
				elseif v.action.name == "GIFT" then
					local pool = {}
					for i, v in pairs(ROUND.v) do
						if v.mode ~= "DELETED" and i~=ROUND.turn then
							table.insert(pool, i)
						end
					end
					makeGift(ROUND.turn, pool[math.random(#pool)])
				elseif v.action.name == "WEB" then
					local pool = {}
					for i, v in pairs(ROUND.v) do
						if v.mode ~= "DELETED" and not v.action or i==ROUND.turn then
							table.insert(pool, i)
						end
					end
					makeWeb(ROUND.turn, pool[math.random(#pool)])
				elseif v.action.name == "IMITATE" then
					emoteVerify(true)
				end
			end
			if ROUND.mode ~= "DELETED" and (ROUND.state == "PLAY" or ROUND.state == "MULLIGAN") then
				if v.outChair then
					tfm.exec.removeImage(v.outChair)
					ui.removeTextArea(15, p)
					ui.removeTextArea(16, p)
					v.outChair = nil
				end
				v.mode = "FREE"
				v.owner = ""
				updateScore(i)
				local x = v.x
				for i, w in pairs(v.imgHand) do
					tfm.exec.removeImage(w)
				end
				for i, w in pairs(v.imgShadow) do
					tfm.exec.removeImage(w)
				end
				for i, w in pairs(v.skin.img) do
					tfm.exec.removeImage(w)
				end
				ui.removeTextArea(5, p)
				ui.removeTextArea(6, p)
				ui.removeTextArea(7, p)
				ui.removeTextArea(10, p)
				ui.removeTextArea(11, p)
				ui.removeTextArea(12, p)
				ui.removeTextArea(15, p)
				ui.removeTextArea(16, p)
				ui.removeTextArea(18, p)
				ui.removeTextArea(19, p)
				system.bindMouse(p, false)
				v.skin.id = "empty"
				v.flag = "default"
				drawChair(i)
				local cont = 0
				local name = ""
				for i, v in pairs(ROUND.chair) do
					if v.mode == "BUSY" then
						cont = cont + 1
						name = v.owner
					end
				end
				if cont == 1 then
					endGame(name)
				end
			elseif ROUND.state == "START" and v.mode ~= "DELETED" then
				v.mode = "EMPTY"
				v.owner = ""
				v.skin.id = "empty"
				drawChair(i)
				local cont = 0
				local name = ""
				for i, v in pairs(ROUND.chair) do
					if v.mode == "BUSY" then
						cont = cont + 1
						name = v.owner
					end
				end
					
				if cont == 1 then
					endGame(name)
				end
			end
			PLAYER[p].chair = nil
		end
	end
end


--[[ src/libs/moon_phase.lua ]]--

function moonPhase()
		-- http://jivebay.com/calculating-the-moon-phase/
		local day, month, year = tonumber(os.date("%d")), tonumber(os.date("%m")), tonumber(os.date("%Y"))

		if month < 3 then
				year = year - 1
				month = month + 12
		end
		month = month + 1

		local Y = 365.25 * year
		local M = 30.6 * month
		local daysElapsed = (Y + M + day - 694039.09) / 29.5305882
		daysElapsed = math.floor(((daysElapsed % 1) * 8) + .5)

		return bit32.band(daysElapsed, 7) + 1
		-- 4 = lua cheia
end


--[[ src/libs/player_data.lua ]]--

playerData = {
	p = {},
	unpack = function(p, str)
		-- lê uma string no formato e salva na tabela
		if str == "#" or str == "" or not str then
			playerData.p[p] = {}
			playerData.p[p].uno = {
				spectator = 0,
				round = 0,
				win = 0,
				red = 0,
				blue = 0,
				green = 0,
				yellow = 0,
				wild = 0,
				mess = 0,
				scoreWeek = 0,
				scoreGlobal = 0,
				season = 0,
				gold = 0,
				silver = 0,
				bronze = 0,
				skin = packChair({default=1}),
				rules = packRules({nochallenge=1}),
				trophy = packTrophy({none=1}),
				flags = packFlag({default=1}),
				skinEquiped = "default",
				trophyEquiped = "none",
				flagEquipped = "default"
			}
			return playerData.p[p]
		else
			playerData.p[p] = {}
			local arg = split(str, ",")
			if arg[1] == "C" then
				arg = split(playerData.updateFormatCD(str), ",")
			end
			local minigameData = split(arg[3] or "", "|") -- minigame1|minigame2|...
			for i, v in pairs(minigameData) do
				local gameData = split(v, "@") -- name@values
				playerData.p[p][gameData[1]] = {}
				local vars = split(gameData[2], ";") -- var1;var2;var3;...
				for j, w in pairs(vars) do
					local s = split(w, "=") -- index=value
					playerData.p[p][gameData[1]][s[1]] = s[2]
				end
			end
			playerData.p[p].time = tonumber(arg[2], 16)
			return playerData.p[p]
		end
	end,
	pack = function(p)
		-- retorna uma string com os dados prontos para salvar
		local str = {}
		for i, v in pairs(playerData.p[p]) do
			if i ~= "time" and i ~= "p" then
				local values = {}
				for j, w in pairs(v) do
					table.insert(values, string.format("%s=%s", j, w))
				end
				table.insert(str, string.format("%s@%s", i,table.concat(values, ";")))
			end
		end
		return string.format("D,%x,%s", os.time(), table.concat(str, "|"))
	end,
	load = function(p, minigame)
		-- retorna a tabela com os dados coletados do minigame
		return playerData.p[p] and playerData.p[p][minigame]
	end,
	save = function(p, minigame, data)
		-- salva uma tabela com os dados
		if playerData.p[p] then
			playerData.p[p][minigame] = data
			return true
		end
		return false
	end,
	free = function(p)
		-- desaloca os dados da tabela
		playerData.p[p] = nil
	end,
	updateFormatCD = function(str)
		local arg = split(str, ",")
		local t = {}
		local str = {}
		t.score = arg[3]
		t.rank = arg[4]
		t.first = arg[5]
		t.podio = arg[6]
		t.completed = arg[7]
		t.round= arg[8]
		t.kill= arg[9]
		for i, v in pairs(t) do
			table.insert(str, string.format("%s=%s", i, v))
		end
		return string.format("D,%x,circuit@%s", os.time(), table.concat(str, ";"))
	end
}


--[[ src/libs/player_sit.lua ]]--

function playerSit(p, chair, n)
	if p:sub(1,1) ~= "*" and PLAYER[p] and (ROUND.state ~=  "PLAY" or #chair.hand > 0) and not (p == OWNER and ROUND.spectator) and ROUND.state ~= "FINISH" then
		for i, v in pairs(chair.skin.img) do
			tfm.exec.removeImage(v)
		end
		PLAYER[p].chair = n
		if PLAYER[p].chairDelay < 6000 then
			PLAYER[p].chairDelay = PLAYER[p].chairDelay + 1000
		end
		chair.owner = p
		chair.mode = "BUSY"
		if PLAYER[p].skinEquiped == "random" then
			if math.random() > 0.99 then
				chair.skin.id = "cheeseclassic"
			else
				local pool = {}
				for i, v in pairs(PLAYER[p].skin) do
					if i ~= "random" then
						table.insert(pool, i)
					end
				end
				chair.skin.id = pool[math.random(#pool)]
			end
		else
			chair.skin.id = PLAYER[p].skinEquiped
			chair.light = PLAYER[p].lightEquiped
		end
		chair.skin.img = {}
		drawChair(n)
		if not BOT[p] then
			tfm.exec.movePlayer(p, chair.x, 110)
		end
		system.bindMouse(p, true)
		updateScore(n)
		if ROUND.state == "PLAY" then
			ui.removeTextArea(32, p)
			ui.removeTextArea(33, p)
			local color = tonumber(ROUND.color[1], 16)
			local v = chair
			ui.addTextArea(10, string.format("<b><p align='center'><font size='14px' color='#%s'>%s", ROUND.color[1], CONFIG.UNO), p, 675, 205, 100, 20, -1, color, 1, false)
			ui.addTextArea(11, string.format("<p align='center'><font size='14px' color='#%s'>%s", ROUND.color[1], translate(p, "CHALLENGE")), p, 675, 240, 100, 20, -1, color, 1, false)
			ui.addTextArea(12, string.format("<p align='center'><font size='14px' color='#%s'>%s", ROUND.color[1], translate(p, "PASS")), p, 675, 275, 100, 20, -1, color, 1, false)
			updateHand(n)
			if n == ROUND.turn then
				if #v.hand == 2 and canPlayHand(n) then
					showUno(n)
				end
				if ROUND.accumulated and ROUND.accumulated.allowed.draw4 then
					showChallenge(n)
				end
				if not canPlayHand(n) or ROUND.accumulated then
					showNeedDraw(n)
				end
				if ROUND.accumulated then
					local txt = ""
					if ROUND.accumulated.allowed.draw2 then
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(v.owner, "DRAW_TWO"))
					elseif ROUND.accumulated.allowed.draw4 then
						txt = string.format("<p align='center'><font color='#ffffff'>%s", translate(v.owner, "DRAW_FOUR"))
					end
					ui.addTextArea(19, string.format(txt, ROUND.accumulated.cards), v.owner, 100, 305, 600, nil, 0, 0, 0, false)
				end
			end
		elseif ROUND.state == "MULLIGAN" and not chair.change then
			ui.removeTextArea(32, p)
			ui.removeTextArea(33, p)
			local txt = "<p align='center'><font size='14px' color='#ffffff'>"..translate(p, "CHANGE_HAND")
			ui.addTextArea(28, txt, p, 350, 293, 100, 20, -1, tonumber(ROUND.color[2], 16), 1, false)
		elseif ROUND.state == "START" and CONFIG.ranked and tfm.get.room.uniquePlayers >= 4 then
			if PLAYER[p].lastChair == n then
				PLAYER[p].school = PLAYER[p].school + 1
				if PLAYER[p].school >= 3 then
					unlockChair(p, "school", true)
				end
			else
				PLAYER[p].lastChair = n
				PLAYER[p].school = 1
			end
		end
	end
end


--[[ src/libs/progress.lua ]]--

function progress(p, tab, name)
	if tab == "chairs" then
		return progressChair(p, name)
	elseif tab == "panels" then
		return progressFlag(p, name)
	end
end

function progressChair(p, skin)
	if skin == "fire" then
		return PLAYER[p].stats.victory.red, 100
	elseif skin == "water" then
		return PLAYER[p].stats.victory.blue, 100
	elseif skin == "earth" then
		return PLAYER[p].stats.victory.yellow, 100
	elseif skin == "air" then
		return PLAYER[p].stats.victory.green, 100
	elseif skin == "rainbow" then
		return PLAYER[p].stats.victory.wild, 100
	elseif skin == "toxic" then
		return PLAYER[p].stats.victory.cian, 15
	elseif skin == "thunder" then
		return PLAYER[p].stats.victory.orange, 15
	elseif skin == "crystal" then
		return PLAYER[p].stats.victory.pink, 15
	elseif skin == "dark" then
		return PLAYER[p].stats.victory.purple, 15
	elseif skin == "light" then
		return PLAYER[p].stats.victory.white, 15
	elseif skin == "toothless" then
		return PLAYER[p].stats.victory.darkWin, 10
	elseif skin == "lightfury" then
		return PLAYER[p].stats.victory.lightWin, 10
	elseif skin == "wood" then
		return PLAYER[p].stats.round, 100
	elseif skin == "stone" then
		return PLAYER[p].stats.round, 1000
	elseif skin == "cat" then
		return PLAYER[p].stats.round, 2500
	elseif skin == "garden" then
		return PLAYER[p].stats.round, 5000
	elseif skin == "friend" then
		return PLAYER[p].stats.round, 7500
	elseif skin == "anvil" then
		return PLAYER[p].stats.round, 10000
	elseif skin == "gold" then
		return PLAYER[p].stats.victory.all, 100
	elseif skin == "diamond" then
		return PLAYER[p].stats.victory.all, 1000
	elseif skin == "unicorn" then
		return PLAYER[p].stats.victory.all, 2000
	elseif skin == "cheese" then
		return PLAYER[p].stats.victory.all, 3000
	elseif skin == "breakfast" then
		return PLAYER[p].stats.victory.team, 100
	elseif skin == "hamburguer" then
		return PLAYER[p].stats.victory.team, 250
	elseif skin == "croissant" then
		return PLAYER[p].stats.victory.team, 487.5
	elseif skin == "toast" then
		return PLAYER[p].stats.victory.team, 600
	elseif skin == "pizza" then
		return PLAYER[p].stats.victory.team, 1000
	elseif skin == "shaman" and validRoom() then
		return tfm.get.room.playerList[p].score, 3000
	elseif skin == "beach" then
		return PLAYER[p].stats.spectator, 100
	elseif skin == "cine" then
		return PLAYER[p].stats.spectator, 1000
	elseif skin == "newspaper" then
		return PLAYER[p].stats.spectator, 2500
	elseif skin == "radio" then
		return PLAYER[p].stats.spectator, 5000
	elseif skin == "television" then
		return PLAYER[p].stats.spectator, 7500
	elseif skin == "computer" then
		return PLAYER[p].stats.spectator, 10000
	elseif skin == "candy" then
		return countRules(PLAYER[p].rules), CONFIG.qtdRule
	elseif skin == "wonderland" then
		return PLAYER[p].portal1 + PLAYER[p].portal2, 2
	elseif skin == "got" then
		return PLAYER[p].challenge, 3
	elseif skin == "school" and validRoom() then
		return PLAYER[p].school or 0, 3
	elseif skin == "pencil" then
		return PLAYER[p].pencil, 100
	elseif skin == "chess" then
		return PLAYER[p].chess, 25
	elseif skin == "football" then
		return PLAYER[p].block, 100
	elseif skin == "quartz" then
		return PLAYER[p].action, 5000
	elseif skin == "coffee" then
		return math.floor((os.time() - PLAYER[p].coffee) / 3600000), 4
	elseif skin == "fashion" then
		return PLAYER[p].dayStreak, 7
	elseif skin == "undertale" then
		return PLAYER[p].dayStreak, 15
	end
end

function progressFlag(p, skin)
	if skin == "picnic" then
		return PLAYER[p].stats.victory.red, 300
	elseif skin == "metal" then
		return PLAYER[p].stats.victory.blue, 300
	elseif skin == "paper" then
		return PLAYER[p].stats.victory.yellow, 300
	elseif skin == "carpet" then
		return PLAYER[p].stats.victory.green, 300
	elseif skin == "disco" then
		return PLAYER[p].stats.victory.wild, 300
	elseif skin == "cloud" then
		return PLAYER[p].stats.victory.mess, 50
	end
end


--[[ src/libs/start_game.lua ]]--

function randomGameMode()
	local rules = getRule(tfm.get.room.xmlMapInfo.xml)
	if rules and ((CONFIG.ranked and tfm.get.room.uniquePlayers >= 6) or CONFIG.test or #rules == 0) then
		for i, v in pairs(rules) do
			ROUND.gameMode[v] = true
		end
	elseif not CONFIG.random then
		if CONFIG.noRules then
			CONFIG.noRules = false
		else
			local modes = {"mini","maxi","jumpin","jumpin","jumpin","stack","stack","stack","supercombo","supercombo","mulligan","mulligan","mulligan","rule","rule","random","tracking","limit","flash","chess","chess","ninguem_v2"}
			for i, v in pairs(RULE) do
				if v.public then
					table.insert(modes, i)
				end
			end
			local cont = 0
			if CONFIG.ranked and not RANKED and tfm.get.room.uniquePlayers >= 8 and math.random() > 0.85 then
				cont = cont + 1
				ROUND.gameMode.team = true
			end
			while (math.random(1,10) > 4+cont) and (#modes > 0) and cont < 4 do
				local n = table.remove(modes, math.random(#modes))
				cont = cont + 1
				ROUND.gameMode[n] = true
				for i, v in pairs(RULE[n].conflict or {}) do
					ROUND.gameMode[v] = nil
				end
				if n == "satisfaction" or n == "portal" then
					ROUND.gameMode.stack = true
					for i, v in pairs(RULE.stack.conflict or {}) do
						ROUND.gameMode[v] = nil
					end
				end
			end
		end
	else
		for i, v in pairs(CONFIG.rule) do
			if v then
				ROUND.gameMode[i] = true
			end
		end
	end
	if ROUND.gameMode.custom then
		RULE.custom.customDesc = CONFIG.custom.desc
		ROUND.custom = {}
		for i, v in pairs(CONFIG.custom.action) do
			ROUND.custom[i] = {}
			for j, w in pairs(v) do
				ROUND.custom[i][j] = w
			end
		end
	end
end

function startGame()
	ROUND.state = "WAIT"
	ui.removeTextArea(31)
	ROUND.flow = "RIGHT"
	ROUND.deck = {}
	ROUND.actionPool = {}
	local color = {"red","blue","yellow","green"}
	DECK.batata[1][1] = color[math.random(#color)]
	local skins = {}
	for i, v in pairs(DECK) do
		if RULE[i] and i ~= "bomb" and not RULE[i].notMess then
			for _, w in pairs(v) do
				table.insert(ROUND.actionPool, {w[1], w[2], true, true})
			end
		end
	end
	addFunctionTimer(function()
		if ROUND.gameMode.noaction then
			for i, v in pairs(DECK.numbers) do
				table.insert(ROUND.deck, {v[1], v[2]})
			end
		elseif ROUND.gameMode.mess then
			for i, v in pairs(DECK.mess) do
				table.insert(ROUND.deck, {v[1], v[2]})
			end
			for i, mode in pairs(RULE) do
				if DECK[i] and i ~= "bomb" and not mode.notMess then
					for _, v in pairs(DECK[i]) do
						table.insert(ROUND.deck, {v[1], v[2]})
					end
				end
			end
		else
			for i, v in pairs(DECK.vanilla) do
				table.insert(ROUND.deck, {v[1], v[2]})
			end
			for i, mode in pairs(RULE) do
				if ROUND.gameMode[i] and DECK[i] and i ~= "bomb" then
					for _, v in pairs(DECK[i]) do
						table.insert(ROUND.deck, {v[1], v[2]})
					end
				end
			end
			if ROUND.gameMode.supercombo then
				local pool = {{"red","shield"},{"blue","shield"},{"green","shield"},{"yellow","shield"}}
				for i=1, #ROUND.deck do
					if ROUND.deck[i][2] == "n0" then
						ROUND.deck[i] = table.remove(pool)
					end
				end
			end
			if ROUND.gameMode.simon then
				for i=1, 4 do
					for j, v in pairs(ROUND.deck) do
						if v[2] == "wild" then
							table.remove(ROUND.deck, j)
							break
						end
					end
				end
			end
			if ROUND.gameMode.custom then
				for i, v in pairs(CONFIG.custom.color) do
					for j=1, v do
						table.insert(ROUND.deck, {i,"custom"})
					end
				end
			end
		end
		addFunctionTimer(function()
			ROUND.deck = shuffleDeck(ROUND.deck)
			updateFlow()
			local cont = 0
			local pool = {}
			for i, v in pairs(ROUND.chair) do
				if v.mode == "BUSY" then
					cont = cont + 1
				else
					table.insert(pool, i)
				end
			end
			if cont % 2 == 1 and ROUND.gameMode.team then
				local chair = pool[math.random(#pool)]
				explosion(3, ROUND.chair[chair].x, 80, 10, 20)
				playerSit("Elise", ROUND.chair[chair], chair)
				if BOT.Elise.eventWelcome then
					BOT.Elise.eventWelcome()
				end
				cont = cont + 1
			end
			local max = math.ceil(cont/2)
			cont = 0
			local players = {}
			pool = {1, 2, 3, 4, 5}
			pool = shuffleDeck(pool)
			
			ROUND.gameMode2 = {}
			ROUND.deck2 = {}
			ROUND.pile2 = {}
			ROUND.portal = {side="orange", img={}}
			for i, v in pairs(ROUND.deck) do
				table.insert(ROUND.deck2, {v[1], v[2]})
			end
			ROUND.deck2 = shuffleDeck(ROUND.deck2)
			for i, v in pairs(ROUND.gameMode) do
				ROUND.gameMode2[i] = true
			end
			addFunctionTimer(function()
				for i, v in pairs(ROUND.chair) do
					if v.mode == "EMPTY" or v.mode == "FREE" or not PLAYER[v.owner] then
						v.mode = "DELETED"
						drawChair(i)
					else
						table.insert(skins, {player = v.owner, skin = v.skin.id})
						if BOT[v.owner] and BOT[v.owner].eventStart then
							BOT[v.owner].eventStart()
						end
						table.insert(players, i)
						ui.removeTextArea(32, v.owner)
						ui.removeTextArea(33, v.owner)
						local color = tonumber(ROUND.color[1], 16)
						ui.addTextArea(10, string.format("<b><p align='center'><font size='14px' color='#%s'>%s", ROUND.color[1], CONFIG.UNO), v.owner, 675, 205, 100, 20, -1, color, 1, false)
						ui.addTextArea(11, string.format("<p align='center'><font size='14px' color='#%s'>%s", ROUND.color[1], translate(v.owner, "CHALLENGE")), v.owner, 675, 240, 100, 20, -1, color, 1, false)
						ui.addTextArea(12, string.format("<p align='center'><font size='14px' color='#%s'>%s", ROUND.color[1], translate(v.owner, "PASS")), v.owner, 675, 275, 100, 20, -1, color, 1, false)
						if ROUND.gameMode.team then
							v.team = pool[(cont-1)%max+1]
							ROUND.team[v.team][i] = true
							drawChair(i)
							cont = cont + 1
						elseif not RANKED and not CONFIG.noFlags then
							v.flag = PLAYER[v.owner].flagEquipped
							drawChair(i)
						else
							v.flag = "default"
						end
					end
				end
				addFunctionTimer(function()
					for i, v in pairs(ROUND.chair) do
						if not PLAYER[v.owner] then
							v.mode = "DELETED"
							drawChair(i)
						elseif v.mode ~= "DELETED" then
							local cards = ROUND.gameMode.maxi and 9 or ROUND.gameMode.mini and 4 or 7
							v.hand2 = {}
							if v.owner == "Buffy" then
								drawCard(i, cards-2, "START")
							elseif v.owner == "Elisah" then
								drawCard(i, cards-3, "START")
								local color = {"red", "blue", "yellow", "green"}
								for i=1, 3 do
									table.insert(v.hand, {table.remove(color, math.random(#color)), "curse", true})
								end
								showCardsGainned(i, cards)
								updateScore(i)
							elseif v.owner == "Papaille" then
								drawCard(i, cards+2, "START")
							else
								drawCard(i, cards, "START")
							end
							drawCard2(i, 4)
							local color = v.hand[1][1]
							local sameColor = true
							if ROUND.gameMode.bluegreen and (color == "green" or color == "blue") then
								for j, w in pairs(v.hand) do
									if w[1] ~= "green" or w[1] ~= "blue" then
										sameColor = false
										break
									end
								end
							else
								for j, w in pairs(v.hand) do
									if w[1] ~= color then
										sameColor = false
										break
									end
								end
							end
							if sameColor then
								unlockChair(v.owner, "loot")
							end
						end
					end
					ROUND.turn = players[math.random(#players)]
					if #skins >= 8 then
						local compare = skins[1].skin
						local isTheSame = true
						for i, v in pairs(skins) do
							if v.skin ~= compare then
								isTheSame = false
							end
						end
						if isTheSame then
							for i, v in pairs(skins) do
								unlockChair(v.player, "vangogh")
							end
						end
					end
					for i, v in pairs(PLAYER) do
						if not v.chair then
							--tfm.exec.chatMessage("<bl>"..translate(i, "TIP_26"), i)
							v.spaceDelay = 0
							v.lastChair = nil
							v.school = 0
						end
						if v.chairDelayTimer then
							if v.chairDelayTimer.img then
								tfm.exec.removeImage(v.chairDelayTimer.img)
							end
							v.chairDelayTimer = nil
						end
						if useTotoro(i) then
							unlockChair(i, "totoro")
						end
					end
					if ROUND.gameMode.mulligan then
						mulligan()
					else
						addFunctionTimer(roundBegin, 500)
					end
				end, 500)
				
			end, 500)
		end, 500)
	end, 500)
end

function roundBegin()
	ROUND.state = "PLAY"
	ROUND.time = GLOBAL_TIME + (ROUND.gameMode.flash and 5000 or 10000)
	ROUND.startTime = os.time()
	if ROUND.gameMode.limit then
		tfm.exec.setGameTime(360)
	else
		tfm.exec.setGameTime(720)
	end
	local rand = 0
	repeat
		rand = math.random(#ROUND.deck)
	until ROUND.deck[rand][2] ~= "draw4"
	playCard(ROUND.turn, table.remove(ROUND.deck, rand), true)
	if ROUND.gameMode.bomb or ROUND.gameMode.mess then
		table.insert(ROUND.deck, math.random(#ROUND.deck), {"black","bomb"})
	end
	if ROUND.gameMode.team then
		local color = {0xF11C25, 0x006DB8, 0x3CA646, 0xC858DB, 0xE99715}
		for i, v in pairs(ROUND.chair) do
			if v.mode ~= "DELETED" then
				for j, w in pairs(ROUND.team[v.team]) do
					if j ~= i then
						ui.addTextArea(90001, "<p align='center'><font color='#ffffff' size='10px'>"..translate(v.owner, "TEAM_DESCRIPTION"), v.owner, ROUND.chair[j].x-60, 20, 120, nil, color[v.team], 0xffffff, 1, false)
						break
					end
				end
				ui.addTextArea(50, "<p align='center'><font color='#ffffff'>"..translate(v.owner, "TEAM_SHOW_CARD"), v.owner, 200, 375, 400, nil, nil, nil, 1, false)
			end
		end
		table.insert(TIMER.txt, {time=os.time()+10000, id=90001})
		table.insert(TIMER.txt, {time=os.time()+20000, id=50})
	elseif ROUND.gameMode.mess then
		for i, v in pairs(ROUND.chair) do
			if v.mode ~= "DELETED" then
				ui.addTextArea(50, "<p align='center'><font color='#ffffff'>"..translate(v.owner, "TIP_21"), v.owner, 200, 375, 400, nil, nil, nil, 1, false)
			end
		end
		table.insert(TIMER.txt, {time=os.time()+20000, id=50})
	end
	returnCards()
	showDeck()
	updateArrow()
	ui.removeTextArea(28)
end

function mulligan()
	ROUND.state = "MULLIGAN"
	ROUND.time = GLOBAL_TIME+10000
	for i, v in pairs(ROUND.chair) do
		local txt = "<p align='center'><font size='14px' color='#ffffff'>"..translate(v.owner, "CHANGE_HAND")
		ui.addTextArea(28, txt, v.owner, 350, 293, 100, 20, -1, tonumber(ROUND.color[2], 16), 1, false)
	end
end

function returnCards()
	for i, v in pairs(ROUND.chair) do
		if PLAYER[v.owner] then
			local count = 0
			local card = false
			if v.flag == "cloud" then
				local card = table.remove(ROUND.actionPool, math.random(#ROUND.actionPool))
				table.insert(v.hand, card)
				count = count + 1
			end
			if PARADOX[v.owner] then
				for j, w in pairs(PARADOX[v.owner]) do
					table.insert(v.hand, w)
				end
				card = PARADOX[v.owner][1]
				PARADOX[v.owner] = false
				count = count + 1
			end
			if count > 0 then
				local img = tfm.exec.addImage(IMG.misc.portal, "!1000", v.x-50, 5)
				TIMER.img[img] = os.time()+1500
				missCard(i, card, 2000)
				explosion(1, v.x, 80, 40, 40)
				showCardsGainned(i, ROUND.gameMode.mulligan and count or #v.hand)
				sortHand(v.hand)
				if mustBeEliminated(i) then
					eliminate(i)
				else
					updateHand(i)
					updateScore(i)
				end
			end
		end
	end
end


--[[ src/libs/table_to_string.lua ]]--

-- http://lua-users.org/wiki/TableUtils

function table.val_to_str ( v )
	if "string" == type( v ) then
		v = string.gsub( v, "\n", "\\n" )
		if string.match( string.gsub(v,"[^'\"]",""), '^"+$' ) then
			return "'" .. v .. "'"
		end
		return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
	else
		return "table" == type( v ) and table.tostring( v ) or
			tostring( v )
	end
end

function table.key_to_str ( k )
	if "string" == type( k ) and string.match( k, "^[_%a][_%a%d]*$" ) then
		return k
	else
		return "[" .. table.val_to_str( k ) .. "]"
	end
end

function table.tostring( tbl )
	local result, done = {}, {}
	for k, v in ipairs( tbl ) do
		table.insert( result, table.val_to_str( v ) )
		done[ k ] = true
	end
	for k, v in pairs( tbl ) do
		if not done[ k ] then
			table.insert( result,
				table.key_to_str( k ) .. "=" .. table.val_to_str( v ) )
		end
	end
	return "{" .. table.concat( result, "," ) .. "}"
end


--[[ src/libs/timers.lua ]]--

TIMER = {
	txt = {},
	img = {},
	obj = {},
	func = {}
}

function addImageTimer(u, a, x, y, t, p)
	-- função pronta pra criar imagem e definir seu timer, requer TIMER.img
	-- -- String u: URL da imagem em atelier801.com
	-- -- String a: Alvo da imagem, como em tfm.exec.addImage()
	-- -- Number x: Coordenada x da imagem
	-- -- Number y: Coordenada y da imagem
	-- -- Number t: Tempo de duração da imagem em milissegundos
	-- -- String p: Para quem será exibida a imagem, se NIL será para todos
	-- -- Return: Number (id da imagem para poder ser removida antes do timer)
	local i = tfm.exec.addImage(u, a, x, y, p)
	if i then
		TIMER.img[i] = os.time()+t
	end
	return i
end

function delImagesTimer(tt)
	-- procura imagens pra apagar, requer TIMER.img
	local apagar = {}
	for i, v in pairs(TIMER.img) do
		if tt and tt+10 < os.time() then
			break
		elseif v < os.time() then
			tfm.exec.removeImage(i)
			table.insert(apagar, i)
		end
	end
	for i=1, #apagar do
		TIMER.img[apagar[i]] = nil
	end
end

function addObjectTimer(o, x, y, a, t, vx, vy, g)
	-- função pronta pra criar um objeto e definir seu tempo
	-- -- Number o: id de tipo de objeto
	-- -- Number x: coordenada x de criação
	-- -- Number y: coordenada y de criação
	-- -- Number a: ângulo do objeto
	-- -- Number t: tempo de duração do objeto em milissegundos
	-- -- Number vx: velocidade x do objeto
	-- -- Number vy: velocidade y do objeto
	-- -- Boolean g: true se o objeto é fantasma
	-- -- Return: Number (id do objeto criado para remover manualmente)
	local i = tfm.exec.addShamanObject(o, x, y, a or 0, vx or 0, vy or 0, g)
	TIMER.obj[i] = os.time() + t
	return i
end

function delObjectTimer(tt)
	-- procura objetos pra apagar, requer TIMER.objeto
	local apagar={}
	for i, v in pairs(TIMER.obj) do
		if tt and tt+10 < os.time() then
			break
		elseif v < os.time() then
			tfm.exec.removeObject(i)
			table.insert(apagar, i)
		end
	end
	for i=1, #apagar do
		TIMER.obj[apagar[i]] = nil
	end
end

function addFunctionTimer(f, t, ...)
	-- define uma função e especifica quando deve ser executada
	-- -- Function f: função a ser executada
	-- -- Number t: tempo até ser executado
	-- -- Os próximo valores são parâmetros da função enviada
	table.insert(TIMER.func, {exec=f, time=GLOBAL_TIME+t, arg=table.pack(...)})
end

function execFunctionTimer(tt)
	-- procura por funções para executar
	local apagar={}
	for i, v in pairs(TIMER.func) do
		if tt and tt+10 < os.time() then
			break
		elseif v.time < GLOBAL_TIME then
			v.exec(table.unpack(v.arg or {}))
			table.insert(apagar, i)
		end
		--if v.time < os.time() then
		--  v.exec(table.unpack(v.arg or {}))
		--  table.insert(apagar, i)
		--end
	end
	for i=1, #apagar do
		table.remove(TIMER.func, apagar[i])
	end
end

function delTxtTimer(tt)
	-- procura textos pra apagar, requer TIMER.txt
	local apagar = {}
	for i, v in pairs(TIMER.txt) do
		if tt and tt+20 < os.time() then
			break
		elseif v.time < os.time() then
			table.insert(apagar,i)
			ui.removeTextArea(v.id, v.player)
		end
	end
	for i=1, #apagar do
		TIMER.txt[apagar[i]] = nil
	end
end


--[[ src/libs/using_look.lua ]]--

function useFraise(p)
	if tfm.get.room.playerList[p] then
		local look = split(tfm.get.room.playerList[p].look, ",")
		local mouth = split(look[4], "_")
		return mouth[1] == "19"
	end
end

function useFish(p)
	if tfm.get.room.playerList[p] then
		local look = split(tfm.get.room.playerList[p].look, ",")
		local ear = split(look[3], "_")
		return ear[1] == "7"
	end
end

function useTree(p)
	if tfm.get.room.playerList[p] then
		local look = split(tfm.get.room.playerList[p].look, ";")
		return look[1] == "35"
	end
end

function useTotoro(p)
	if tfm.get.room.playerList[p] then
		local look = split(tfm.get.room.playerList[p].look, ";")
		local fur = look[1]
		local moreLook = split(look[2], ",")
		local head = split(moreLook[1], "_")
		local neck = split(moreLook[5], "_")
		return fur == "81" and (head[1] == "171" or neck[1] == "23")
	end
end

function isNaked(p)
	return tfm.get.room.playerList[p] and tfm.get.room.playerList[p].look == "1;0,0,0,0,0,0,0,0,0"
end


--[[ src/libs/util.lua ]]--

function emptyFunc()
end

function nickFormat(p)
	if p:sub(1,1) == "*" then
		return p
	else
		return string.gsub(p:lower(), '%a', function(k) return string.upper(k) end, 1)
	end
end

function nickHashtag(data, doNotNormalize)
	local nickname = data:gmatch('(.-)#[0-9]+$')() or data
	local tag = data:gmatch('#([0-9]+)$')() or '0000'
	nickname = doNotNormalize and nickname or nickname:lower():gsub('%a', string.upper, 1)
	return nickname, tag
end

function nickLength(p)
	local cont = 0
	local tier = {["_"]=3, M=3, m=3, W=3, w=3, i=1, l=1}
	for i=1, #p do
		cont = cont + (tier[p:sub(i,i)] or 2)
	end
	return cont
end

function nickMinifier(p)
	local l = 21
	if nickLength(p) > l then
		local tier = {["_"]=3, M=3, m=3, W=3, w=3, i=1, l=1}
		local cont = 0
		for i=1, #p do
			cont = cont + (tier[p:sub(i,i)] or 2)
			if cont >= l-1 then
				return p:sub(1,i).."."
			end
		end
		return p:sub(1,9).."."
	else
		return p
	end
end

function whichNick(p)
	if tfm.get.room.playerList[nickFormat(p)] then
		return nickFormat(p)
	else
		p = nickHashtag(p)
		local found = {}
		for i, v in pairs(tfm.get.room.playerList) do
			if nickHashtag(i) == p then
				table.insert(found, i)
			end
		end
		if #found == 1 then
			return found[1]
		end
	end
end

function isAdm(p)
	return ADM[p]
end

function roomOwner()
	local n = tfm.get.room.name:match("#unotfm%d+(.*)")
	if n and #n > 3 then
		local arg = split(n, " ")
		arg = split(arg[1], "-")
		arg = split(arg[1], "#")
		return #arg[1] >= 3 and nickFormat(arg[1])
	end
end

function split(t,s)
	-- retorna uma table com a string dividida
	-- -- String t = texto a ser dividido
	-- -- String s = símbolo de separação (opcional)
	local a={}
	for i,v in string.gmatch(t,string.format("[^%s]+",s or "%s")) do
		table.insert(a,i)
	end
	return a
end

function explosion(id, x, y, vezes, vel)
	-- faz uma mini explosão de partículas
	-- -- Number id = id das partículas
	-- -- Number x = coordenada x do centro
	-- -- Number y = coordenada y do centro
	-- -- Number vezes = número de partículas
	-- -- Number vel = velocidade máxima
	for i=1, vezes do
		tfm.exec.displayParticle(id, x, y, math.random(-vel,vel)/10, math.random(-vel,vel)/10, 0, 0)
	end
end
--[[
function translate(p, k, a, b, c, d, e)
	-- Retorna o texto correspondente à comunidade do jogador fornecido, requer tabela LANG
	-- -- String p = nome de um jogador
	-- -- String k = chave de tradução
	-- -- Return = String
	local cmm = "en"
	cmm = PLAYER[p] and PLAYER[p].community or "auto"
	cmm = cmm == "auto" and tfm.get.room.playerList[p] and tfm.get.room.playerList[p].community or cmm
	--if tfm.get.room.playerList[p] and tfm.get.room.playerList[p].community then
	--  cmm = tfm.get.room.playerList[p].community
	--end
	return a and string.format(LANG[cmm] and LANG[cmm][k] or LANG.en[k] or ("$" .. k), a, b, c, d, e) or (LANG[cmm] and LANG[cmm][k] or LANG.en[k] or ("$" .. k))
end
]]--

LANGT = {en=1, br=2, fr=3, es=4, ru=5, cn=6, pl=7, hu=8, tr=9}
function translate(p, k, a, b, c, d, e)
	if not k then
		return "#ERROR"
	end
	if not LANG[k] then 
		return "$"..k
	end
	local cmm = PLAYER[p] and PLAYER[p].community or "auto"
	cmm = cmm == "auto" and tfm.get.room.playerList[p] and tfm.get.room.playerList[p].community or cmm
	cmm = LANGT[cmm] or 1
	cmm = (not LANG[k][cmm] or LANG[k][cmm] == "") and 1 or cmm
	return a and string.format(LANG[k][cmm], a, b, c, d, e) or LANG[k][cmm]
end

function translatedChatMessage(k, p, a, b, c, d, e)
	-- Mostra o texto traduzido no chat, requer função translate()
	-- -- String k = chave de tradução
	-- -- String p = nome de um jogador, se nil será exibido para todos
	if p then
		tfm.exec.chatMessage(translate(p, k, a, b, c, d, e), p)
	else
		for i in pairs(tfm.get.room.playerList) do
			tfm.exec.chatMessage(translate(i, k), i)
		end
	end
end



function newMap()
	local map = CONFIG.music and MUSIC[math.random(#MUSIC)] or MAP[math.random(#MAP)]
	if tfm.get.room.uniquePlayers >= 6 and CONFIG.ranked and not CONFIG.noRules then
		if CONFIG.mapEvent and (math.random() < CONFIG.eventRate or CONFIG.actualTimer >= CONFIG.pityTimer) then
			CONFIG.actualTimer = 0
			map = CONFIG.mapEvent
		else
			CONFIG.actualTimer = CONFIG.actualTimer + 1
		end
	end
	if type(map) == "table" then
		map = map[math.random(#map)]
	end
	tfm.exec.newGame(map)
end

function validMap()
	if tfm.get.room.currentMap:sub(1,1)=="@" and tfm.get.room.xmlMapInfo then
		local str = string.match(tfm.get.room.xmlMapInfo.xml, 'Chair="(.-)"')
		if str then
			return split(str)
		end
	end
end

function quote(p, key, add)
	local find = false
	for i, v in pairs(ROUND.chair) do
		if v.owner == p and v.mode ~= "DELETED" then
			find = true
			break
		end
	end
	if CONFIG.ranked and find then
		for i, v in pairs(tfm.get.room.playerList) do
			tfm.exec.chatMessage(string.format("<v>[%s] <n>%s", p, string.format(translate(i, key), add)), i)
		end
	end
end

function quoteFake(p, msg)
	for i, v in pairs(tfm.get.room.playerList) do
		tfm.exec.chatMessage(string.format("<v>[%s] <n>%s", p, msg), i)
	end
end

function allChairs()
	if ROUND and ROUND.chair then
		local p = 0
		local cont = 0
		for i, v in pairs(ROUND.gameMode) do
			if BOT[nickFormat(i)] then
				p = p + 1
			end
		end
		for i, v in pairs(tfm.get.room.playerList) do
			if i:sub(1,1) ~= "*" then
				p = p + 1
			end
		end
		for i, v in pairs(ROUND.chair) do
			if v.mode == "BUSY" then
				cont = cont + 1
			end
		end
		if cont > 1 and cont == #ROUND.chair or p == cont then
			return true
		end
	end
end

function colorNick(p)
	local color = 0
	if p == OWNER then
		color = 0xFFB677
	elseif isAdm(p) then
		color = 0x77C6FF
	elseif BANNED[p] then
		color = 0xFF7777
	end
	tfm.exec.setNameColor(p, color)
end

function countRules(rules)
	local cont = 0
	for i, v in pairs(rules) do
		if not RULE[i].notCount then
			cont = cont + 1
		end
	end
	return cont
end

function validRoom()
	if ROUND.chair then
		local cont = 0
		for i, v in pairs(ROUND.chair) do
			if v.mode ~= "DELETED" then
				cont = cont + 1
			end
		end
		if cont >= 4 and tfm.get.room.uniquePlayers >= cont and CONFIG.ranked or RANKED then
			return true
		end
	end
end


--[[ src/libs/window.lua ]]--

window = {}
do
	local w = {}
	window.open = function(p, id, ...)
		if p and id and w[id] and not window.isOpened(p, id) then
			w[id].player[p] = w[id].player[p] or {fixed={}, dynamic={}, var={}}
			local fixed = w[id].player[p].fixed
			fixed.txt, fixed.img = w[id].open(p, w[id].player[p].var, ...)
			if w[id].update then
				local dynamic = w[id].player[p].dynamic
				dynamic.txt, dynamic.img = w[id].update(p, w[id].player[p].var, ...)
			end
			w[id].player[p].opened = true
		end
	end
	window.close = function(p, id)
		if p and id and w[id] and window.isOpened(p, id) then
			if w[id].player[p].fixed then
				for i, v in pairs(w[id].player[p].fixed.img or {}) do
					tfm.exec.removeImage(v)
				end
				for i, v in pairs(w[id].player[p].fixed.txt or {}) do
					ui.removeTextArea(v, p)
				end
			end
			if w[id].player[p].dynamic then
				for i, v in pairs(w[id].player[p].dynamic.img or {}) do
					tfm.exec.removeImage(v)
				end
				for i, v in pairs(w[id].player[p].dynamic.txt or {}) do
					ui.removeTextArea(v, p)
				end
			end
			w[id].player[p].dynamic = {}
			w[id].player[p].fixed = {}
			w[id].player[p].opened = false
		end
	end
	window.update = function(p, id, ...)
		if p and id and w[id] and window.isOpened(p, id) then
			if w[id].update then
				if w[id].player[p].dynamic then
					for i, v in pairs(w[id].player[p].dynamic.img or {}) do
						tfm.exec.removeImage(v)
					end
					for i, v in pairs(w[id].player[p].dynamic.txt or {}) do
						ui.removeTextArea(v, p)
					end
				end
				w[id].player[p].dynamic = {}
				local dynamic = w[id].player[p].dynamic
				dynamic.txt, dynamic.img = w[id].update(p, w[id].player[p].var, ...)
			else
				window.close(p, id)
				window.open(p, id, ...)
			end
		end 
	end
	window.isOpened = function(p, id)
		return w[id] and w[id].player[p] and w[id].player[p].opened
	end
	window.create = function(id, func, func2)
		if w[id] then
			for i, v in pairs(w[id].player) do
				window.close(i, id)
			end
		end
		if id and func then
			w[id] = {
				open = func,
				update = func2,
				player = {}
			}
		end
	end
	window.getVars = function(p, id)
		return w[id] and w[id].player[p] and w[id].player[p].var
	end
	closeAll = function(p, exception)
		for i, v in pairs(w) do
			if i~= exception then
				window.close(p, i)
			end
		end
	end
end


--[[ src/cards/ban.lua ]]--

function ban(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	if #ROUND.pile > 1 then
		local o = {}
		local pool = {}
		local rand = false
		for i, v in pairs(ROUND.chair[n].hand) do
			table.insert(pool, i)
		end
		for i=1, 3 do
			if #pool >= 1 then
				rand = table.remove(pool, math.random(#pool))
			end
			table.insert(o, rand)
		end
		local player = ROUND.chair[n].owner
		local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discover, "!100", ROUND.chair[n].x-50, 20)
		local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
		local t1 = showCard(ROUND.chair[n].hand[o[1]], 230, 200, player, "!1000", "big")
		local t2 = showCard(ROUND.chair[n].hand[o[2]], 350, 200, player, "!1000", "big")
		local t3 = showCard(ROUND.chair[n].hand[o[3]], 470, 200, player, "!1000", "big")
		local images = {img, l}
		for i, v in pairs({t1,t2,t3}) do
			for j, w in pairs(v) do
				table.insert(images, w)
			end
		end
		ROUND.chair[n].action = {
			name = "BAN",
			img = images,
			card = o
		}
		resetTimer()
		updateTurnTimer()
	else
		passTurn()
		batataTimer(n)
	end
end

function banCard(deck, card)
	local lastCard = false
	local qtd = 0
	repeat
		local notFind = true
		for i, v in pairs(deck) do
			if card[2] == v[2] then
				qtd = qtd + 1
				lastCard = v
				notFind = false
				table.remove(deck, i)
				break
			end
		end
	until notFind
	return lastCard, qtd
end

function makeBan(n, card)
	for i, v in pairs(ROUND.chair[n].action.img) do
		tfm.exec.removeImage(v)
	end
	ROUND.chair[n].action = false
	local choice = ROUND.chair[n].hand[card]
	local rand = math.random(#ROUND.chair[n].hand)
	banCard(ROUND.pile, choice)
	banCard(ROUND.deck, choice)
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			local c, qtd = banCard(v.hand, choice)
			if c then
				missCard(i, c, 2000)
				local img = tfm.exec.addImage(IMG.misc.burn, "!1000", v.x-25, 20)
				TIMER.img[img] = os.time()+2000
				if #v.hand == 1 then
					v.uno = "uno"
				end
				showCardsGainned(i, -qtd)
				updateHand(i)
				updateScore(i)
			end
		end
	end
	ROUND.gameMode[choice[2]] = nil
	drawTopCard()
	showDeck()
	for i, v in pairs(tfm.get.room.playerList) do
		showRules(i)
	end
	if not isEndGame("BAN") then
		passTurn()
		batataTimer(n)
	end
end


--[[ src/cards/batata.lua ]]--

function batata(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	local option = {}
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and i ~= n then
			table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
			option[i] = true
		end
	end
	if ROUND.chair[n].batataFlag then
		unlockChair(ROUND.chair[n].owner, "sack")
	else
		ROUND.chair[n].batataFlag = true
	end
	ROUND.chair[n].action = {
		name = "BATATA",
		img = image,
		op = option,
		func = makeBatata
	}
	resetTimer()
	updateTurnTimer()
end

function makeBatata(n, target)
	if target then
		if not ROUND.chair[target].action or n == target then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
			local card = ROUND.topCard.card
			if ROUND.pile[#ROUND.pile][2] == "batata" then
				table.remove(ROUND.pile)
			end
			changeColorBatata(card)
			table.insert(ROUND.chair[target].hand, card)
			missCard(target, card, 2000)
			explosion(5, ROUND.chair[target].x, 100, 5, 10)
			sortHand(ROUND.chair[target].hand)
			showCardsGainned(target, 1)
			updateHand(target)
			updateScore(target)
			if mustBeEliminated(target) then
				eliminate(target)
			end
			ROUND.topCard.card = ROUND.topCard.card2
			drawTopCard()
			passTurn()
			ROUND.chair[n].confuse = false
			batataTimer(n)
			updateShadow(n)
		end
	else
		passTurn()
		ROUND.chair[n].confuse = false
		batataTimer(n)
		updateShadow(n)
	end
end


--[[ src/cards/bomb.lua ]]--

function bomb(n)
	local card = table.remove(ROUND.pile)
	table.insert(ROUND.deck, math.random(#ROUND.deck+1), card)
	showDeck()
	ROUND.topCard.card = ROUND.topCard.card2
	drawTopCard()
	local y = 195 - (#ROUND.deck/108 * 10)
	local img = showCard({"black","bomb"}, 320, y, nil, "!1000")
	for i, v in pairs(img) do
		TIMER.img[v] = os.time()+2000
	end
	ui.addTextArea(90000, string.format("<p align='center'><font size='20px' color='#%s'><b>+", "000000")..#DECK[name], nil, 320, y+76, 51, 60, 0, 0, 0, false)
	ui.addTextArea(90001, string.format("<p align='center'><font size='20px' color='#%s'><b>+", "FFFFFF")..#DECK[name], nil, 320, y+75, 50, 60, 0, 0, 0, false)
	table.insert(TIMER.txt, {time=os.time()+2000, id=90000})
	table.insert(TIMER.txt, {time=os.time()+2000, id=90001})
	passTurn()
	ROUND.chair[n].confuse = false
	batataTimer(n)
	updateShadow(n)
end

function bombInHand(n)
	for i, v in pairs(ROUND.chair[n].hand) do
		if v[2] == "bomb" then
			local c = showCard({"black","bomb"}, ROUND.chair[n].x-25, 20, nil, "!1000")
			for i, v in pairs(c) do
				TIMER.img[v] = os.time()+2000
			end
			return true
		end
	end
end


--[[ src/cards/box.lua ]]--

function box(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	for i, v in pairs(ROUND.chair) do
		if (v.mode == "BUSY" or v.mode == "FREE") then
			giveCard(i, {"black","random",true,true}, true)
			missCard(i, {"black","random",true,true}, 2000)
			if mustBeEliminated(i) then
				eliminate(i)
			end
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/carousel.lua ]]--

function carousel(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local hand = ROUND.chair[n].hand
	local aux = {}
	local c = n
	repeat
		c = nextChair(c)
		aux = ROUND.chair[c].hand
		ROUND.chair[c].hand = hand
		hand = aux
		if #ROUND.chair[c].hand == 1 then
			ROUND.chair[c].uno = "uno"
		else
			ROUND.chair[c].uno = nil
		end
		if isIlluminati(c) then
			unlockChair(ROUND.chair[c].owner, "illuminati")
		end
		if #ROUND.chair[c].hand > ROUND.chair[c].maxHand then
			ROUND.chair[c].maxHand = #ROUND.chair[c].hand
		end
		if #ROUND.chair[c].hand > 25 and not ROUND.chair[c].notTrash then
			unlockChair(ROUND.chair[c].owner, "trash")
		end
		if ROUND.chair[c].mode == "BUSY" then
			updateHand(c)
		end
		updateScore(c)
		explosion(3, ROUND.chair[c].x, 135, 3, 20)
		explosion(35, ROUND.chair[c].x, 135, 3, 5)
	until c == n
	if chestInHand(n) then
		unlockChair(ROUND.chair[n].owner, "chest")
	end
	local vel = {RIGHT=12, LEFT=-12}
	for i=-500, 1300, 50 do
		tfm.exec.displayParticle(35, i, math.random(130,150), vel[ROUND.flow], 0, 0, 0)
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/chair.lua ]]--

function chair(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local chairs = {}
	local pos = {}
	local name = {}
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and n ~= i then
			table.insert(chairs, v)
			table.insert(pos, {i, v.x})
			name[i] = v.owner
			if v.action and v.action.name == "SKIP" then
				for j, w in pairs(v.action.img) do
					tfm.exec.removeImage(w)
				end
			end
		end
	end
	ROUND.team[1] = {}
	ROUND.team[2] = {}
	ROUND.team[3] = {}
	ROUND.team[4] = {}
	ROUND.team[5] = {}
	local max = #pos
	for i=1, max do
		local rand = table.remove(pos, math.random(#pos))
		ROUND.chair[rand[1]] = table.remove(chairs)
		ROUND.chair[rand[1]].x = rand[2]
		local c = ROUND.chair[rand[1]]
		if c.owner ~= "" and PLAYER[c.owner] then
			PLAYER[c.owner].chair = rand[1]
		end
		if #c.hand == 1 then
			c.uno = "uno"
		end
	end
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and i ~= n then
			if v.action and v.action.name == "SKIP" then
				v.action.img = {tfm.exec.addImage(IMG.misc.web, "!1000", v.x-50, 30)}
			end
			if v.owner == name[i] then
				unlockChair(v.owner, "guitar")
			end
			if ROUND.gameMode.team then
				local next = nextChair(i)
				local previous = previousChair(i)
				if v.team == ROUND.chair[next].team or v.team == ROUND.chair[previous].team then
					unlockChair(ROUND.chair[i].owner, "honey")
				end
			end
			drawChair(i)
			updateHand(i)
			explosion(3, v.x, 100, 20, 10)
		end
		if v.mode ~= "DELETED" then
			if v.team then
				ROUND.team[v.team][i] = true
			end
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/charlotte.lua ]]--

function red(n)
	local find = false
	for i, v in pairs(ROUND.chair[n].hand) do
		if isNumeric(v) then
			find = i
			break
		end
	end
	if find then
		local target = false
		local min = math.huge
		for i, v in pairs(ROUND.chair) do
			if i ~= n and v.mode ~= "DELETED" then
				if #v.hand == 10 then
					target = i
					break
				elseif #v.hand < min then
					min = #v.hand
					target = i
				end
			end
		end
		missCard(target, ROUND.chair[n].hand[find], 2000)
		explosion(5, ROUND.chair[target].x, 100, 5, 10)
		donateByIndex(n, target, find)
		sortHand(ROUND.chair[target].hand)
		if #ROUND.chair[n].hand == 1 then
			ROUND.chair[n].uno = "uno"
		end
		showCardsGainned(n, -1)
		showCardsGainned(target, 1)
		updateScore(n)
		updateScore(target)
		drawTopCard()
		updateHand(n)
		updateHand(target)
		if mustBeEliminated(target) then
			eliminate(target)
		end
	end
	if #ROUND.chair[n].hand == 0 then
		endGame(ROUND.chair[n].owner)
	else
		passTurn()
		batataTimer(n)
	end
end

function blue(n)
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and n ~= i then
			v.peace = 2
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function yellow(n)
	local pool = {}
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and i ~= n then
			table.insert(pool, i)
		end
	end
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	TIMER.img[l] = os.time()+500
	local r = table.remove(pool, math.random(#pool))
	if r then
		local img = tfm.exec.addImage(IMG.misc.thunder, "!1000", ROUND.chair[r].x-50, 15)
		TIMER.img[img] = os.time()+500
		explosion(0, ROUND.chair[r].x, 115, 10, 30)
		tryDraw(r, math.random(3))
	end
	passTurn()
	batataTimer(n)
end

function green(n)
	local target = false
	local min = math.huge
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			if #v.hand < min then
				min = #v.hand
				target = i
			end
		end
	end
	if target and #ROUND.chair[n].hand > min then
		discardCard(n, #ROUND.chair[n].hand-min)
		explosion(9, ROUND.chair[n].x, 135, 5, 10)
		explosion(35, ROUND.chair[n].x, 135, 3, 5)
		explosion(9, ROUND.chair[target].x, 135, 5, 10)
		explosion(35, ROUND.chair[target].x, 135, 3, 5)
	end
	passTurn()
	batataTimer(n)
end

function power(n)
  table.insert(ROUND.pile, table.remove(ROUND.chair[n].hand, math.random(#ROUND.chair[n].hand)))
  ROUND.topCard.card2 = ROUND.topCard.card
  ROUND.topCard.card[2] = "ruleBoss"
  local y = drawTopCard()
  if #ROUND.chair[n].hand == 1 then
    ROUND.chair[n].uno = "uno"
  end
  updateHand(n)
  updateScore(n)
  local fx = {red=13, blue=1, yellow=11, green=9}
  y = 210 - (#ROUND.pile/108 * 10)
  for i=1, 10 do
    local vel = i/10*75
    tfm.exec.displayParticle(fx[ROUND.topCard.card[1]] or 0, 430, y+vel, -math.random(7,15)/5, (vel-37)/20, 0, 0)
  end
  for i=1, 10 do
    local vel = i/10*75
    tfm.exec.displayParticle(fx[ROUND.topCard.card[1]] or 0, 480, y+vel, math.random(7,15)/5, (vel-37)/20, 0, 0)
  end
  ROUND.chair[n].action = {name="PLAY"}
  ROUND.time = GLOBAL_TIME + 10000
  addFunctionTimer(function()
    ROUND.chair[n].action = nil
    _G[ROUND.topCard.card[2]](n)
  end, 1000)
end


--[[ src/cards/clone.lua ]]--

function clone(n)
	local wild = {wild="black", draw4="black", king="black", queen="black", half="black", simon="black"}
	ROUND.topCard.card[2] = ROUND.topCard.card2[2]
	ROUND.topCard.card[1] = wild[ROUND.topCard.card2[2]] or ROUND.topCard.card2[1]
	local y = drawTopCard()
	tfm.exec.displayParticle(12, 455, y+37, 0, 0, 0, 0)
	ROUND.chair[n].action = nil
	_G[ROUND.topCard.card[2]](n)
end


--[[ src/cards/compass.lua ]]--

function compass(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	ROUND.chair[n].compass = ROUND.chair[n].compass or 0
	ROUND.chair[n].compass = ROUND.chair[n].compass + 1
	if ROUND.chair[n].compass < 3 then
		showProgress(n)
		passTurn()
		batataTimer(n)
	elseif ROUND.chair[n].compass == 3 then
		showProgress(n)
		ROUND.chair[n].action = {name="PLAY"}
		ROUND.time = os.time() + 10000
		addFunctionTimer(function()
			ROUND.chair[n].action = nil
			giveCard(n, {ROUND.topCard.card[1],"chest",true,true}, true)
			missCard(n, {ROUND.topCard.card[1],"chest",true,true}, 2000)
			passTurn()
			batataTimer(n)
		end, 2000)
	else
		passTurn()
		batataTimer(n)
	end
	ROUND.chair[n].confuse = false
end

function showProgress(n)
	local text = ROUND.chair[n].compass.."/3"
	ui.addTextArea(7000+n, "<p align='center'><font size='30px' color='#000000'><b>"..text, nil, ROUND.chair[n].x-50, 50, 100, 60, 0, 0, 0, false)
	ui.addTextArea(7010+n, "<p align='center'><font size='30px' color='#FFD800'><b>"..text, nil, ROUND.chair[n].x-52, 48, 100, 60, 0, 0, 0, false)
	table.insert(TIMER.txt, {time=os.time()+2000, id=7000+n})
	table.insert(TIMER.txt, {time=os.time()+2000, id=7010+n})
	explosion(11, ROUND.chair[n].x, 70, 7*ROUND.chair[n].compass, 20)
end

function chest(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	endGame(ROUND.chair[n].owner, ROUND.topCard.card)
	unlockChair(ROUND.chair[n].owner, "falls")
end


--[[ src/cards/confuse.lua ]]--

function confuse(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	ROUND.chair[n].confuse = true
	explosion(14, ROUND.chair[n].x, 100, 20, 20)
	passTurn()
	batataTimer(n)
end


--[[ src/cards/curse.lua ]]--

function curse(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local pool = {}
	for i, v in pairs(CURSE) do
		table.insert(pool, i)
	end
	local player = 0
	local rand = pool[math.random(#pool)]
	ROUND.curse = rand
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			player = player + 1
		end
		if BOT[v.owner] and BOT[v.owner].eventCurse then
			BOT[v.owner].eventCurse(ROUND.curse)
		end
	end
	ROUND.curseTime = CURSE[rand].turns * player + 2
	ROUND.time = GLOBAL_TIME + 10000
	ROUND.chair[n].action = {
		name = "CURSE",
	}
	--local img = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0)
	local img2 = tfm.exec.addImage(CURSE[rand].img, "!1000", 383, 200)
	for i, v in pairs(tfm.get.room.playerList) do
		ui.addTextArea(71, "<p align='center'><font color='#ffffff' size='20px'>"..translate(i, CURSE[rand].desc), i, 150, 245, 500, nil, 1, 1, 0.7, false)
	end
	showDeck()
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			if v.owner ~= "Elisah" then
				v.curse = ROUND.curse
			end
			updateHand(i)
		end
	end
	addFunctionTimer(function()
		ROUND.chair[n].action = false
		ui.removeTextArea(71)
		--tfm.exec.removeImage(img)
		tfm.exec.removeImage(img2)
		passTurn()
		updateShadow(n)
	end, 4000)
end

function showCurse(p)
	PLAYER[p].curseDelay = PLAYER[p].curseDelay or 0
	if ROUND.curse and PLAYER[p].curseDelay < os.time() then
		ui.addTextArea(71, "<p align='center'><font color='#ffffff' size='20px'>"..translate(p, CURSE[ROUND.curse].desc), p, 150, 245, 500, nil, 1, 1, 0.7, false)
		table.insert(TIMER.txt, {time=os.time()+4000, id=71})
		PLAYER[p].curseDelay = os.time()+5000
	end
end

function updateCurse()
	ui.removeTextArea(70)
	if ROUND.curseImage then
		tfm.exec.removeImage(ROUND.curseImage)
	end
	if ROUND.curse and ROUND.curseTime then
		ROUND.curseTime = ROUND.curseTime - 1
		if ROUND.curseTime <= 0 then
			ROUND.curse = nil
			showDeck()
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					v.curse = nil
					updateHand(i)
				end
			end
		else
			ui.addTextArea(70, string.format("<a href='event:curse'><p align='center'><font color='#%s' size='30px'>%s", ROUND.color[2], ROUND.curseTime), nil, 375, 240, 50, nil, 0, 0, 0, false)
			ROUND.curseImage = tfm.exec.addImage(CURSE[ROUND.curse].img, "!1000", 383, 200)
		end
	end
end


--[[ src/cards/custom.lua ]]--

function custom(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local needChoice = false
	local onlyOthers = false
	local skipAction = false
	local nextPlayer = false
	local previousPlayer = false
	for i, v in pairs(ROUND.custom) do
		if v.who == "CHOOSE" or v.who2 == "CHOOSE" then
			needChoice = true
			if v.action == "DONATE" or v.action == "SWAP" or v.action == "TRADE" then
				if v.who == "YOURSELF" or v.who2 == "YOURSELF" then
					onlyOthers = true
				elseif v.who == "NEXT" or v.who2 == "NEXT" then
					nextPlayer = true
				elseif v.who == "PREVIOUS" or v.who2 == "PREVIOUS" then
					previousPlayer = true
				end
			elseif v.action == "SKIP" then
				skipAction = true
			end
		end
	end
	if needChoice then
		local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
		local options = {}
		local cont = 0
		for i, v in pairs(ROUND.chair) do
			if (v.mode == "BUSY" or v.mode == "FREE") and not(skipAction and v.action) and not(i == n and onlyOthers) and not(nextPlayer and i == nextChair(n)) and not(previousPlayer and i == previousChair(n)) then
				table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
				options[i] = true
				cont = cont + 1
			end
		end
		if cont > 0 then
			ROUND.chair[n].action = {
				name = "CUSTOM",
				img = image,
				op = options,
				func = makeCustomAction,
			}
			resetTimer()
			updateTurnTimer()
		else
			passTurn()
			batataTimer(n)
			ROUND.chair[n].confuse = false
		end
	else
		makeCustomAction(n)
	end
end

function makeCustomAction(n, target)
	if target and ROUND.chair[n].action.op[target] or not target then
		if ROUND.chair[n].action then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
		end
		local can = {} -- pode apenas os não alvos
		local pool2 = {} -- pode todos (não doze, é POOL2)
		local prev = previousChair(n)
		local prox = nextChair(n)
		local yourself = n
		local sort = 0
		local returnedValues = {}
		for i, v in pairs(ROUND.chair) do
			if v.mode ~= "DELETED" then
				can[i] = true
				table.insert(pool2, i)
				returnedValues[i] = {0, 0, 0, 0, 0}
			end
		end
		for i, v in pairs(ROUND.custom) do
			if v.who == "YOURSELF" or v.who2 == "YOURSELF" then
				can[n] = false
			elseif v.who == "CHOOSE" or v.who2 == "CHOOSE" and target then
				can[target] = false
			elseif v.who == "NEXT" or v.who2 == "NEXT" then
				can[prox] = false
			elseif v.who == "PREVIOUS" or v.who2 == "PREVIOUS" then
				can[prev] = false
			elseif v.who == "RANDOM" then
				sort = 1
			elseif v.who == "RANDOM2" then
				sort = 2
			elseif v.who == "RANDOM3" then
				sort = 3
			end
		end
		local pool = {}
		for i, v in pairs(can) do
			if v then
				table.insert(pool, i)
			end
		end
		local rand = {}
		local randomTarget = false
		if sort == 1 and #pool2 > 0 then
			randomTarget = table.remove(pool2, math.random(#pool2))
		else
			for i=1, sort do
				if #pool > 0 then
					table.insert(rand, table.remove(pool, math.random(#pool)))
				else
					break
				end
			end
		end
		local t = {}
		t.yourself = yourself
		t.target = target
		t.prev = prev
		t.prox = prox
		t.randomTarget = randomTarget
		t.rand = rand
		if target then
			local img = tfm.exec.addImage(IMG.misc.thunder, "!1000", ROUND.chair[target].x-50, 15)
			TIMER.img[img] = os.time()+500
		end
		for i, v in pairs(ROUND.custom) do
			if customEffects[v.action] then
				customEffects[v.action](v, i, t, returnedValues)
			end
		end
		isEndGame()
		ROUND.chair[n].confuse = false
		passTurn()
		batataTimer(n)
	end
end

customEffects = {
	DRAW = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] then
			makeDraw(unique[action.who], action, num, returnedValues)
		elseif action.who == "ALL" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					makeDraw(i, action, num, returnedValues)
				end
			end
		elseif action.who == "OTHERS" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" and i ~= targets.yourself then
					makeDraw(i, action, num, returnedValues)
				end
			end
		elseif action.who == "RANDOM2" then
			makeDraw(targets.rand[1], action, num, returnedValues)
			makeDraw(targets.rand[2], action, num, returnedValues)
		elseif action.who == "RANDOM3" then
			makeDraw(targets.rand[1], action, num, returnedValues)
			makeDraw(targets.rand[2], action, num, returnedValues)
			makeDraw(targets.rand[3], action, num, returnedValues)
		end
	end,
	ELIMINATE = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] then
			eliminate(unique[action.who], false, true)
		elseif action.who == "ALL" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					eliminate(i, false, true)
				end
			end
		elseif action.who == "OTHERS" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" and i ~= targets.yourself then
					eliminate(i, false, true)
				end
			end
		elseif action.who == "RANDOM2" then
			eliminate(targets.rand[1], false, true)
			eliminate(targets.rand[2], false, true)
		elseif action.who == "RANDOM3" then
			eliminate(targets.rand[1], false, true)
			eliminate(targets.rand[2], false, true)
			eliminate(targets.rand[3], false, true)
		end
	end,
	SKIP = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] then
			makeSkip(unique[action.who])
		elseif action.who == "ALL" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					makeSkip(i)
				end
			end
		elseif action.who == "OTHERS" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" and i ~= targets.yourself then
					makeSkip(i)
				end
			end
		elseif action.who == "RANDOM2" then
			makeSkip(targets.rand[1])
			makeSkip(targets.rand[2])
		elseif action.who == "RANDOM3" then
			makeSkip(targets.rand[1])
			makeSkip(targets.rand[2])
			makeSkip(targets.rand[3])
		end
	end,
	TRADE = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] and unique[action.who2] then
			makeCustomTrade(unique[action.who], unique[action.who2])
		end
	end,
	SWAP = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		local index = {YOURSELF="yourself", NEXT="prox", PREVIOUS="prev", CHOOSE="target", RANDOM="randomTarget"}
		if unique[action.who] and unique[action.who2] then
			makeSwap(unique[action.who], unique[action.who2])
			local temp = targets[index[action.who]]
			targets[index[action.who]] = targets[index[action.who2]]
			targets[index[action.who2]] = temp
		end
	end,
	SHOW = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] then
			customShow(unique[action.who], action, num, returnedValues)
		elseif action.who == "ALL" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					customShow(i, action, num, returnedValues)
				end
			end
		elseif action.who == "OTHERS" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" and i ~= targets.yourself then
					customShow(i, action, num, returnedValues)
				end
			end
		elseif action.who == "RANDOM2" then
			customShow(targets.rand[1], action, num, returnedValues)
			customShow(targets.rand[2], action, num, returnedValues)
		elseif action.who == "RANDOM3" then
			customShow(targets.rand[1], action, num, returnedValues)
			customShow(targets.rand[2], action, num, returnedValues)
			customShow(targets.rand[3], action, num, returnedValues)
		end
	end,
	DISCARD = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] then
			customDiscard(unique[action.who], action, num, returnedValues)
		elseif action.who == "ALL" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" then
					customDiscard(i, action, num, returnedValues)
				end
			end
		elseif action.who == "OTHERS" then
			for i, v in pairs(ROUND.chair) do
				if v.mode ~= "DELETED" and i ~= targets.yourself then
					customDiscard(i, action, num, returnedValues)
				end
			end
		elseif action.who == "RANDOM2" then
			customDiscard(targets.rand[1], action, num, returnedValues)
			customDiscard(targets.rand[2], action, num, returnedValues)
		elseif action.who == "RANDOM3" then
			customDiscard(targets.rand[1], action, num, returnedValues)
			customDiscard(targets.rand[2], action, num, returnedValues)
			customDiscard(targets.rand[3], action, num, returnedValues)
		end
	end,
	DONATE = function(action, num, targets, returnedValues)
		local unique = {YOURSELF=targets.yourself, NEXT=targets.prox, PREVIOUS=targets.prev, CHOOSE=targets.target, RANDOM=targets.randomTarget}
		if unique[action.who] and unique[action.who2] then
			makeCustomDonate(unique[action.who], unique[action.who2], action, num, returnedValues)
		end
	end,
}

function makeCustomDonate(n, m, action, num, returnedValues)
	local unt = action.amount:match("^#(%d)$")
	local ret = action.amount:match("^%&(%d)$")
	local x, y = action.amount:match("^(%d)%-(%d)$")
	if n and m then
		if unt then
			returnedValues[n][num] = donateUntil(n, m, tonumber(unt), action.condition)
		elseif ret then
			returnedValues[n][num] = donateCommon(n, m, returnedValues[n][tonumber(ret)], action.condition)
		elseif x and y then
			returnedValues[n][num] = donateCommon(n, m, math.random(tonumber(x), tonumber(y)), action.condition)
		elseif tonumber(action.amount) then
			returnedValues[n][num] = donateCommon(n, m, tonumber(action.amount), action.condition)
		end
		updateScore(n)
		updateScore(m)
		drawTopCard()
		updateHand(n)
		updateHand(m)
	end
end

function donateCommon(n, m, qtd, mode)
	if ROUND.chair[n].mode ~= "DELETED" and ROUND.chair[m].mode ~= "DELETED" and qtd > 0 then
		local cont = 0
		local card = false
		for i=1, qtd do
			local pool = resultCards(ROUND.chair[n].hand, mode)
			card = ROUND.chair[n].hand[pool]
			if #pool > 0 then
				donateByIndex(n, m, pool[math.random(#pool)])
				cont = cont + 1
			else
				break
			end
		end
		sortHand(ROUND.chair[m].hand)
		if cont > 0 then
			missCard(m, cont == 1 and card, 2000)
			explosion(5, ROUND.chair[m].x, 100, 5, 10)
			showCardsGainned(n, -cont)
			showCardsGainned(m, cont)
		end
		if mustBeEliminated(n) then
			eliminate(n)
		end
		return cont
	end
	return qtd
end

function donateUntil(n, m, qtd, mode)
	if ROUND.chair[n].mode ~= "DELETED" and ROUND.chair[m].mode ~= "DELETED" and qtd < #ROUND.chair[n].hand then
		local discarted = #ROUND.chair[n].hand - qtd
		local cont = 0
		local card = false
		for i=1, discarted do
			local pool = resultCards(ROUND.chair[n].hand, mode)
			card = ROUND.chair[n].hand[pool]
			if #pool > 0 then
				donateByIndex(n, m, pool[math.random(#pool)])
				cont = cont + 1
			else
				break
			end
		end
		sortHand(ROUND.chair[m].hand)
		if cont > 0 then
			missCard(m, cont == 1 and card, 2000)
			explosion(5, ROUND.chair[m].x, 100, 5, 10)
			showCardsGainned(n, -cont)
			showCardsGainned(m, cont)
		end
		if mustBeEliminated(n) then
			eliminate(n)
		end
		return cont
	end
	return 0
end

function donateByIndex(n, m, card)
	local discarted = table.remove(ROUND.chair[n].hand, card)
	table.insert(ROUND.chair[m].hand, discarted)
end

function customDiscard(n, action, num, returnedValues)
	local unt = action.amount:match("^#(%d)$")
	local ret = action.amount:match("^%&(%d)$")
	local x, y = action.amount:match("^(%d)%-(%d)$")
	if n then
		if unt then
			returnedValues[n][num] = discardUntil(n, tonumber(unt), action.condition)
			mimicDiscard(n, returnedValues[n][num])
		elseif ret then
			returnedValues[n][num] = discardCommon(n, returnedValues[n][tonumber(ret)], action.condition)
			mimicDiscard(n, returnedValues[n][num])
		elseif x and y then
			returnedValues[n][num] = discardCommon(n, math.random(tonumber(x), tonumber(y)), action.condition)
			mimicDiscard(n, returnedValues[n][num])
		elseif tonumber(action.amount) then
			returnedValues[n][num] = discardCommon(n, tonumber(action.amount), action.condition)
			mimicDiscard(n, returnedValues[n][num])
		end
		updateScore(n)
		drawTopCard()
		updateHand(n)
	end
end

function discardCommon(n, qtd, mode)
	if ROUND.chair[n].mode ~= "DELETED" and qtd > 0 then
		local cont = 0
		local card = false
		for i=1, qtd do
			local pool = resultCards(ROUND.chair[n].hand, mode)
			card = ROUND.chair[n].hand[pool]
			if #pool > 0 then
				discardByIndex(n, pool[math.random(#pool)])
				cont = cont + 1
			else
				break
			end
		end
		if cont == 1 then
			missCard(n, card, 2000)
		end
		showCardsGainned(n, -cont)
		return cont
	end
	return qtd
end

function discardUntil(n, qtd, mode)
	if ROUND.chair[n].mode ~= "DELETED" and qtd < #ROUND.chair[n].hand then
		local discarted = #ROUND.chair[n].hand - qtd
		local cont = 0
		local card = false
		for i=1, discarted do
			local pool = resultCards(ROUND.chair[n].hand, mode)
			card = ROUND.chair[n].hand[pool]
			if #pool > 0 then
				discardByIndex(n, pool[math.random(#pool)])
				cont = cont + 1
			else
				break
			end
		end
		if cont == 1 then
			missCard(n, card, 2000)
		end
		showCardsGainned(n, -cont)
		return cont
	end
	return 0
end

function discardByIndex(n, card)
	local discarted = table.remove(ROUND.chair[n].hand, card)
	discarted.lock = false
	if not discarted[3] then
		table.insert(ROUND.pile, 1, discarted)
	end
end

function resultCards(hand, mode)
	local pool = {}
	local comp = {RED="red", BLUE="blue", YELLOW="yellow", GREEN="green", WILD="black", SAME=ROUND.topCard.card[1]}
	for i, v in pairs(hand) do
		if mode == "ANY" or v[1] == comp[mode] or mode == "NUMBER" and isNumeric(v) or mode == "ACTION" and not isNumeric(v) then
			table.insert(pool, i)
		end
	end
	return pool
end

function customShow(n, action, num, returnedValues)
	if n and ROUND.chair[n].mode ~= "DELETED" then
		local pool = resultCards(ROUND.chair[n].hand, action.condition)
		if #pool > 0 then
			missCard(n, ROUND.chair[n].hand[pool[math.random(#pool)]], 2000)
			returnedValues[n][num] = 1
		end
	end
end

function makeSwap(n, m)
	if n and m and ROUND.chair[n].mode ~= "DELETED" and ROUND.chair[m].mode ~= "DELETED" then
		for j, w in pairs(ROUND.chair[n].skin.img) do
			tfm.exec.removeImage(w)
		end
		for j, w in pairs(ROUND.chair[m].skin.img) do
			tfm.exec.removeImage(w)
		end
		local temp = ROUND.chair[n].x
		ROUND.chair[n].x = ROUND.chair[m].x
		ROUND.chair[m].x = temp
		temp = ROUND.chair[n]
		ROUND.chair[n] = ROUND.chair[m]
		ROUND.chair[m] = temp
		if ROUND.gameMode.team then
			ROUND.team[1] = {}
			ROUND.team[2] = {}
			ROUND.team[3] = {}
			ROUND.team[4] = {}
			ROUND.team[5] = {}
			for i, v in pairs(ROUND.chair) do
				ROUND.team[v.team][i] = true
			end
		end
		for i, v in pairs({n, m}) do
			tfm.exec.movePlayer(ROUND.chair[v].owner, ROUND.chair[v].x, 110)
			if #ROUND.chair[v].hand == 1 then
				ROUND.chair[v].uno = "uno"
			end
			drawChair(v)
			explosion(3, ROUND.chair[v].x, 100, 20, 10)
		end
	end
end

function makeCustomTrade(n, target)
	if n and target and ROUND.chair[n].mode ~= "DELETED" and ROUND.chair[target].mode ~= "DELETED" then
		local aux = ROUND.chair[n].hand
		ROUND.chair[n].hand = ROUND.chair[target].hand
		ROUND.chair[target].hand = aux
		updateHand(n)
		updateHand(target)
		if #ROUND.chair[target].hand == 1 then
			ROUND.chair[target].uno = "uno"
		else
			ROUND.chair[target].uno = nil
		end
		if #ROUND.chair[n].hand == 1 then
			ROUND.chair[n].uno = "uno"
		else
			ROUND.chair[n].uno = nil
		end
		if isIlluminati(n) then
			unlockChair(ROUND.chair[n].owner, "illuminati")
		end
		if isIlluminati(target) then
			unlockChair(ROUND.chair[target].owner, "illuminati")
		end
		if #ROUND.chair[n].hand > ROUND.chair[n].maxHand then
			ROUND.chair[n].maxHand = #ROUND.chair[n].hand
		end
		if #ROUND.chair[target].hand > ROUND.chair[target].maxHand then
			ROUND.chair[target].maxHand = #ROUND.chair[target].hand
		end
		updateScore(n)
		updateScore(target)
		explosion(3, ROUND.chair[n].x, 135, 5, 20)
		explosion(3, ROUND.chair[target].x, 135, 5, 20)
		tfm.exec.displayParticle(37, ROUND.chair[target].x, 90, 0, 0, 0, 0)
		tfm.exec.displayParticle(37, ROUND.chair[ROUND.turn].x, 90, 0, 0, 0, 0)
	end
end

function makeSkip(n)
	if n and ROUND.chair[n].mode ~= "DELETED" and not ROUND.chair[n].action then
		ROUND.chair[n].action = {
			name = "SKIP",
			img = {tfm.exec.addImage(IMG.misc.web, "!1000", ROUND.chair[n].x-50, 30)}
		}
		explosion(1, ROUND.chair[n].x, 80, 20, 30)
	end
end

function makeDraw(n, action, num, returnedValues)
	local unt = action.amount:match("^#(%d)$")
	local ret = action.amount:match("^%&(%d)$")
	local x, y = action.amount:match("^(%d)%-(%d)$")
	if n then
		if unt then
			returnedValues[n][num] = drawUntil(n, tonumber(unt))
		elseif ret then
			returnedValues[n][num] = commonDraw(n, returnedValues[n][tonumber(ret)])
		elseif x and y then
			returnedValues[n][num] = commonDraw(n, math.random(tonumber(x), tonumber(y)))
		elseif tonumber(action.amount) then
			returnedValues[n][num] = commonDraw(n, tonumber(action.amount))
		end
	end
end

function drawUntil(n, qtd)
	if ROUND.chair[n].mode ~= "DELETED" and qtd > #ROUND.chair[n].hand then
		local drawed = qtd - #ROUND.chair[n].hand
		tryDraw(n, drawed)
		return drawed
	end
	return 0
end

function commonDraw(n, qtd)
	if ROUND.chair[n].mode ~= "DELETED" and qtd > 0 then
		tryDraw(n, qtd)
	end
	return qtd
end


--[[ src/cards/death.lua ]]--

function death(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	if not ROUND.subitDeath then
		tfm.exec.addPhysicObject(0, 400, 530, {height=10, width=3000})
		ROUND.cloud.obj = tfm.exec.addShamanObject(63, 400, 500, 0, 2, 0, false)
		ROUND.cloud.delay = os.time()+5000
		ROUND.subitDeath = true
		tfm.exec.addImage(IMG.misc.cloud, "#"..ROUND.cloud.obj, -1200, -500)
		showDeck()
		for i=1, 10 do
			tfm.exec.displayParticle(3, 345, 210, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/donate.lua ]]--

function gift(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	local option = {}
	for i, v in pairs(ROUND.chair) do
		if v.owner ~= "Papaille" and (v.mode == "BUSY" or v.mode == "FREE") and i ~= n then
			table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
			option[i] = true
		end
	end
	ROUND.chair[n].action = {
		name = "GIFT",
		img = image,
		op = option,
		func = makeGift
	}
	resetTimer()
	updateTurnTimer()
end

function makeGift(n, target, qtd)
	qtd = qtd or 1
	if target then
		local temp = {}
		if n ~= target and ROUND.chair[target].mode ~= "DELETED" and (ROUND.chair[target].owner ~= "Papaille" or ROUND.chair[n].owner == "Jingle") then
			if ROUND.chair[n].action then
				for i, v in pairs(ROUND.chair[n].action.img) do
					tfm.exec.removeImage(v)
				end
			end
			ROUND.chair[n].action = false
			if BOT[ROUND.chair[target].owner] and BOT[ROUND.chair[target].owner].eventDonate then
				BOT[ROUND.chair[target].owner].eventDonate(ROUND.chair[n].owner)
			end
			if qtd >= 5 then
				unlockChair(ROUND.chair[n].owner, "heart")
			end
			if qtd > #ROUND.chair[n].hand then
				qtd = #ROUND.chair[n].hand
			end
			for i=1, qtd do
				local rand = math.random(#ROUND.chair[n].hand)
				temp = table.remove(ROUND.chair[n].hand, rand)
				if temp[2] == "draw4" then
					unlockChair(ROUND.chair[n].owner, "coca")
				end
				discardEffect(n, rand)
				table.insert(ROUND.chair[target].hand, temp)
			end
			missCard(target, qtd == 1 and temp, 2000)
			explosion(5, ROUND.chair[target].x, 100, 5, 10)
			sortHand(ROUND.chair[target].hand)
			ROUND.chair[target].uno = nil
			ROUND.chair[target].loveList = ROUND.chair[target].loveList or {}
			table.insert(ROUND.chair[target].loveList, ROUND.chair[n].owner)
			updateHand(n)
			updateHand(target)
			if #ROUND.chair[n].hand == 1 then
				ROUND.chair[n].uno = "uno"
			end
			if isIlluminati(target) then
				unlockChair(ROUND.chair[target].owner, "illuminati")
			end
			if #ROUND.chair[target].hand > ROUND.chair[target].maxHand then
				ROUND.chair[target].maxHand = #ROUND.chair[target].hand
			end
			if #ROUND.chair[target].hand > 25 and not ROUND.chair[target].notTrash then
				unlockChair(ROUND.chair[target].owner, "trash")
			end
			if ROUND.chair[n].loveList then
				for i, v in pairs(ROUND.chair[n].loveList) do
					if v == ROUND.chair[target].owner then
						unlockChair(ROUND.chair[n].owner, "kiss")
						break
					end
				end
			end
			updateScore(n)
			updateScore(target)
			showCardsGainned(n, -qtd)
			showCardsGainned(target, qtd)
			if mustBeEliminated(target) then
				eliminate(target)
				unlockChair(ROUND.chair[n].owner, "snowman")
			end
			if #ROUND.chair[n].hand == 0 then
				local name = ROUND.chair[n].owner
				endGame(ROUND.chair[n].owner)
				unlockChair(name, "gift")
			else
				passTurn()
				ROUND.chair[n].confuse = false
				batataTimer(n)
				updateShadow(n)
			end
		end
	else
		if ROUND.chair[n].action then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
		end
		passTurn()
		batataTimer(n)
		updateShadow(n)
	end
end


--[[ src/cards/draw2.lua ]]--

function draw2(n)
	if ROUND.gameMode.nocombo then
		ROUND.turn = nextChair(ROUND.turn)
		local target = ROUND.turn
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
		tryDraw(target, 2)
		local img = tfm.exec.addImage(ROUND.flow == "RIGHT" and IMG.misc.right or IMG.misc.left, "!1000", ROUND.chair[target].x-50, 30)
		TIMER.img[img] = os.time()+1000
		explosion(35, ROUND.chair[target].x, 80, 50, 10)
	else
		if ROUND.accumulated then
			ROUND.accumulated.cards = ROUND.accumulated.cards + 2
			ROUND.accumulated.player[ROUND.chair[n].owner] = true
			addBlockPoint(ROUND.chair[n].owner)
		else
			ROUND.accumulated = {allowed = {draw2=true}, player = {}, cards = 2}
			ROUND.accumulated.player[ROUND.chair[n].owner] = true
			if ROUND.gameMode.supercombo then
				ROUND.accumulated.allowed = {draw2=true, draw4=true, draw99=true, shield=true}
			end
		end
		showAccumulated()
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
end


--[[ src/cards/draw4.lua ]]--

function draw4(n, hand)
	ui.removeTextArea(2)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	local target = nextChair(n)
	if ROUND.chair[target].action and ROUND.chair[target].action.name == "SKIP" then
		unlockChair(ROUND.chair[n].owner, "pumpkin")
	end
	if not ROUND.gameMode.nochallenge or not ROUND.gameMode.nocombo then
		if ROUND.accumulated then
			ROUND.accumulated.cards = ROUND.accumulated.cards + 4
			ROUND.accumulated.player[ROUND.chair[n].owner] = true
			addBlockPoint(ROUND.chair[n].owner)
			--
			if not hand then
				hand = {}
				for i, v in pairs(ROUND.chair[n].hand) do
					table.insert(hand, v)
				end
			end
			--
			ROUND.accumulated.hand = hand
			ROUND.accumulated.p = ROUND.chair[n].owner
			ROUND.accumulated.n = n
		else
			local hand = {}
			for i, v in pairs(ROUND.chair[n].hand) do
				table.insert(hand, v)
			end
			ROUND.accumulated = {allowed = {draw4=true}, player = {}, cards = 4, ["n"]=n, p=ROUND.chair[n].owner, ["hand"]=hand}
			ROUND.accumulated.player[ROUND.chair[n].owner] = true
			if ROUND.gameMode.supercombo then
				ROUND.accumulated.allowed = {draw2=true, draw4=true, draw99=true, shield=true}
			elseif ROUND.gameMode.nocombo then
				ROUND.accumulated.allowed.draw4 = nil
			end
		end
	end
	local player = ROUND.chair[n].owner
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	local t1 = showCard({"red","draw4"}, 170, 200, player, "!1000", "big")
	local t2 = showCard({"blue","draw4"}, 290, 200, player, "!1000", "big")
	local t3 = showCard({"yellow","draw4"}, 410, 200, player, "!1000", "big")
	local t4 = showCard({"green","draw4"}, 530, 200, player, "!1000", "big")
	local images = {img, l}
	for i, v in pairs({t1,t2,t3,t4}) do
		for j, w in pairs(v) do
			table.insert(images, w)
		end
	end
	if ROUND.topCard.card2 and (ROUND.topCard.card2[2] == "wild" or ROUND.topCard.card2[2] == "draw4") and validRoom() then
		if PLAYER[player].pencil then
			PLAYER[player].pencil = PLAYER[player].pencil + 1
		else
			PLAYER[player].pencil = 0
		end
		if PLAYER[player].pencil >= 100 then
			unlockChair(player, "pencil")
		end
	end
	ROUND.chair[n].action = {
		name = "WILD",
		img = images,
		plusfour = true,
	}
	for i, v in pairs(ROUND.chair) do
		if v.skin.id == "illuminati" then
			local img = tfm.exec.addImage(IMG.misc.illuminatiEye, "_1000", v.x-50, 20)
			TIMER.img[img] = os.time()+500
		end
	end
	resetTimer()
	updateTurnTimer()
end


--[[ src/cards/draw99.lua ]]--

function draw99(n)
	ui.removeTextArea(2)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if not ROUND.gameMode.nochallenge or not ROUND.gameMode.nocombo then
		if ROUND.accumulated then
			ROUND.accumulated.cards = ROUND.accumulated.cards + 99
			ROUND.accumulated.player[ROUND.chair[n].owner] = true
			addBlockPoint(ROUND.chair[n].owner)
			if not hand then
				hand = {}
				for i, v in pairs(ROUND.chair[n].hand) do
					table.insert(hand, v)
				end
			end
			ROUND.accumulated.hand = hand
			ROUND.accumulated.p = ROUND.chair[n].owner
			ROUND.accumulated.n = n
		else
			local hand = {}
			for i, v in pairs(ROUND.chair[n].hand) do
				table.insert(hand, v)
			end
			ROUND.accumulated = {allowed = {draw99=true}, player = {}, cards = 99, ["n"]=n, p=ROUND.chair[n].owner, ["hand"]=hand}
			ROUND.accumulated.player[ROUND.chair[n].owner] = true
			if ROUND.gameMode.supercombo then
				ROUND.accumulated.allowed = {draw2=true, draw4=true, draw99=true, shield=true}
			elseif ROUND.gameMode.nocombo then
				ROUND.accumulated.allowed.draw99 = nil
			end
		end
	end
	local player = ROUND.chair[n].owner
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	local t1 = showCard({"red","draw99"}, 170, 200, player, "!1000", "big")
	local t2 = showCard({"blue","draw99"}, 290, 200, player, "!1000", "big")
	local t3 = showCard({"yellow","draw99"}, 410, 200, player, "!1000", "big")
	local t4 = showCard({"green","draw99"}, 530, 200, player, "!1000", "big")
	local images = {img, l}
	for i, v in pairs({t1,t2,t3,t4}) do
		for j, w in pairs(v) do
			table.insert(images, w)
		end
	end
	if ROUND.topCard.card2 and (ROUND.topCard.card2[2] == "wild" or ROUND.topCard.card2[2] == "draw4") and validRoom() then
		if PLAYER[player].pencil then
			PLAYER[player].pencil = PLAYER[player].pencil + 1
		else
			PLAYER[player].pencil = 0
		end
		if PLAYER[player].pencil >= 100 then
			unlockChair(player, "pencil")
		end
	end
	ROUND.chair[n].action = {
		name = "WILD",
		img = images,
		plusfour = true,
	}
	resetTimer()
	updateTurnTimer()
end


--[[ src/cards/emote.lua ]]--

function imitate(n)
	ui.removeTextArea(70)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local pool = {0, 1, 2, 3, 4, 5, 6, 7}
	local rand = pool[math.random(#pool)]
	local image = {tfm.exec.addImage(IMG.emote[rand], "!1000", 350, 190)}
	ROUND.chair[n].action = {
		name = "IMITATE",
		img = image,
		action = rand,
		player = {}
	}
	ROUND.time = GLOBAL_TIME + 10000
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" then
			ui.addTextArea(19, "<p align='center'><font color='#ffffff'>"..translate(v.owner, "WARN_IMITATE"), v.owner, 100, 305, 600, nil, 0, 0, 0, false)
		end
	end
	updateTurnTimer()
	if BOT.Charlotte.sleep and rand == 6  then
		eventEmotePlayed("Charlotte", 6)
	end
end

function emoteVerify(final)
	local name = {}
	local actual = ROUND.turn
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and not ROUND.chair[ROUND.turn].action.player[i] then
			table.insert(name, i)
		end
	end
	local qtd = #name == 1 and 2 or 1
	if final or #name == 1 then
		if ROUND.turn and ROUND.chair[ROUND.turn] then
			for i, v in pairs(ROUND.chair[ROUND.turn].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[ROUND.turn].action = nil
		end
		for j, w in pairs(name) do
			local img = tfm.exec.addImage(IMG.misc.fail, "!1000", ROUND.chair[w].x-50, 30)
			TIMER.img[img] = os.time()+2000
			if not isCursed(w, "ice") then
				if isCursed(w, "thorn") then
					eliminate(w)
				else
					drawCard(w, qtd)
					if mustBeEliminated(w) then
						eliminate(w)
					end
				end
				mimicDraw(w, qtd)
			end
		end
		passTurn()
		ROUND.chair[actual].confuse = false
		batataTimer(actual)
		updateShadow(actual)
	end
end


--[[ src/cards/equality.lua ]]--

function equality(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" or v.mode == "FREE" then
			if #v.hand > 3 then
				discardCard(i, #v.hand-3)
			elseif #v.hand < 3 then
				tryDraw(i, 3-#v.hand)
			end
			explosion(9, v.x, 135, 5, 10)
			explosion(35, v.x, 135, 3, 5)
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/half.lua ]]--

function half(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local player = ROUND.chair[n].owner
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	local t1 = showCard({"red","half"}, 170, 200, player, "!1000", "big")
	local t2 = showCard({"blue","half"}, 290, 200, player, "!1000", "big")
	local t3 = showCard({"yellow","half"}, 410, 200, player, "!1000", "big")
	local t4 = showCard({"green","half"}, 530, 200, player, "!1000", "big")
	local images = {img, l}
	for i, v in pairs({t1,t2,t3,t4}) do
		for j, w in pairs(v) do
			table.insert(images, w)
		end
	end
	ROUND.chair[n].action = {
		name = "WILD",
		img = images
	}
	resetTimer()
	updateTurnTimer()
	showAccumulated()
end


--[[ src/cards/ink.lua ]]--

function ink(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local target = nextChair(ROUND.turn)
	local change = {}
	for i, v in pairs(ROUND.chair[target].hand) do
		if v[1] ~= "black" then
			if v[3] or v[2] == "batata" then
				v[1] = ROUND.topCard.card[1]
			else
				table.insert(ROUND.pile, 1, v)
				table.insert(change, i)
			end
		end
	end
	if BOT[ROUND.chair[target].owner] and BOT[ROUND.chair[target].owner].eventInk then
		BOT[ROUND.chair[target].owner].eventInk(ROUND.topCard.card[1])
	end
	for i, v in pairs(change) do
		ROUND.chair[target].hand[v] = {ROUND.topCard.card[1], ROUND.chair[target].hand[v][2], true}
	end
	if ROUND.topCard.card[1] == "black" then
		unlockChair(ROUND.chair[target].owner, "gothic")
	end
	local fx = {red=13, blue=1, yellow=11, green=9, black=0}
	for i=1, 20 do
		tfm.exec.displayParticle(fx[ROUND.topCard.card[1]], math.random(-50,50)+ROUND.chair[target].x, 15, 0, math.random()*4, 0, 0, nil)
	end
	local qtd = #ROUND.chair[target].hand > 16 and 16 or #ROUND.chair[target].hand
	local maxx = math.floor(qtd*1.5)
	for i=1, maxx do
		tfm.exec.displayParticle(fx[ROUND.topCard.card[1]], math.random(-25*qtd,25*qtd)+400, math.random(290,330), 0, math.random()*3, 0, 0, ROUND.chair[target].owner)
		tfm.exec.displayParticle(fx[ROUND.topCard.card[1]], math.random(-25*qtd,25*qtd)+400, math.random(290,330), 0, math.random()*3, 0, 0, ROUND.chair[target].owner)
	end
	addFunctionTimer(function()
		for i=1, 20 do
			tfm.exec.displayParticle(fx[ROUND.topCard.card[1]], math.random(-50,50)+ROUND.chair[target].x, 15, 0, math.random()*4, 0, 0, nil)
		end
		local qtd = #ROUND.chair[target].hand > 16 and 16 or #ROUND.chair[target].hand
		local maxx = math.floor(qtd*1.5)
		for i=1, maxx do
			tfm.exec.displayParticle(fx[ROUND.topCard.card[1]], math.random(-25*qtd,25*qtd)+400, math.random(290,330), 0, math.random()*3, 0, 0, ROUND.chair[target].owner)
			tfm.exec.displayParticle(fx[ROUND.topCard.card[1]], math.random(-25*qtd,25*qtd)+400, math.random(290,330), 0, math.random()*3, 0, 0, ROUND.chair[target].owner)
		end
	end, 200)
	
	sortHand(ROUND.chair[target].hand)
	updateHand(target)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/justice.lua ]]--

function justice(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	
	local qtd = 0
	
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" and i ~= n and #v.hand < #ROUND.chair[n].hand then
			qtd = qtd + 1
			explosion(9, v.x, 135, 5, 10)
			explosion(35, v.x, 135, 3, 5)
		end
	end
	
	if qtd >= #ROUND.chair[n].hand then
		qtd = #ROUND.chair[n].hand - 1
	end

	if qtd > 0 then
		ROUND.time = GLOBAL_TIME + 10000
		ROUND.chair[n].action = {
			name = "JUSTICE",
		}
		addFunctionTimer(function()
			ROUND.chair[n].action = false
			discardCard(n, qtd)
			mimicDiscard(n, qtd)
			explosion(9, ROUND.chair[n].x, 135, 5, 10)
			explosion(35, ROUND.chair[n].x, 135, 3, 5)
			if #ROUND.chair[n].hand == 1 then
				ROUND.chair[n].uno = "uno"
			end
			updateHand(n)
			updateScore(n)
			passTurn()
			updateShadow(n)
			batataTimer(n)
			ROUND.chair[n].confuse = false
		end, 1000)
	else
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
end


--[[ src/cards/lock.lua ]]--

function key(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local count = 0
	for i, v in pairs(ROUND.chair) do
		if i ~= n and v.mode ~= "DELETED" then
			local pool = {}
			for j, w in pairs(v.hand) do
				if not w.lock then
					table.insert(pool, j)
				end
			end
			if #pool > 0 then
				local rand = table.remove(pool, math.random(#pool))
				v.hand[rand].lock = true
				if #pool > 0 then
					local rand = table.remove(pool, math.random(#pool))
					v.hand[rand].lock = true
				end
				updateHand(i)
				for j=1, 5 do
					local vx = (math.random()-0.5) * 5
					local vy = (math.random()-1) * 8
					tfm.exec.displayParticle(13, v.x, 140, vx, vy, 0, 0.1)
				end
			end
			count = count + #pool
		end
	end
	if count == 0 then
		unlockChair(ROUND.chair[n].owner, "samson")
	end
	
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/luck.lua ]]--

function luck(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	ROUND.chair[n].luck = true
	explosion(22, ROUND.chair[n].x, 120, 20, 20)
	updateScore(n)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/madchess.lua ]]--

function effectPawn(n)
	tryDraw(previousChair(n), 1)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function effectRook(n)
	tryDraw(previousChair(n), 2)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function effectKnight(n)
	local arrow = {LEFT = "RIGHT", RIGHT = "LEFT"}
	ROUND.flow = arrow[ROUND.flow]
	updateFlow(nil, ROUND.flowLight)
	for i=0, 800, 20 do
		tfm.exec.displayParticle(3, i, 177, 0, 0, 0, 0)
	end
	ROUND.turn = nextChair(ROUND.turn)
	tryDraw(ROUND.turn, 1)
	local img = tfm.exec.addImage(ROUND.flow == "RIGHT" and IMG.misc.right or IMG.misc.left, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
	TIMER.img[img] = os.time()+1000
	explosion(35, ROUND.chair[ROUND.turn].x, 80, 50, 10)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function effectBishop(n)
	makeGift(n, previousChair(n), 1)
end

function effectQueen(n)
	local prev = previousChair(n)
	if #ROUND.chair[prev].hand < 10 then
		tryDraw(prev, 10-#ROUND.chair[prev].hand)
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function effectKing(n)
	makeGift(n, previousChair(n), #ROUND.chair[n].hand-1)
end

function pawn(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local effect = {pawn=effectPawn, rook=effectRook, bishop=effectBishop, knight=effectKnight, queen=effectQueen, king=effectKing}
	local text = {pawn="KILL_PAWN", rook="KILL_ROOK", bishop="KILL_BISHOP", knight="KILL_KNIGHT", queen="KILL_QUEEN", king="KILL_KING"}
	if effect[ROUND.topCard.card2[2]] then
		if validRoom() then
			local player = ROUND.chair[n].owner
			PLAYER[player].chess = PLAYER[player].chess + 1
			if PLAYER[player].chess >= 25 then
				unlockChair(player, "chess")
			end
		end
		effect[ROUND.topCard.card2[2]](n)
		local y = 195 - (#ROUND.pile/108 * 10)
		for i, v in pairs(tfm.get.room.playerList) do
			ui.addTextArea(34, string.format("<p align='center'><font color='#ffffff'>%s", translate(i, text[ROUND.topCard.card2[2]])), i, 400, y, 110, nil, 0, 0, 0, false)
		end
		table.insert(TIMER.txt, {time=os.time()+2000, id=34})
	else
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
end
rook, knight, bishop = pawn, pawn, pawn

function queen(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local player = ROUND.chair[n].owner
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	local t1 = showCard({"red","queen"}, 170, 200, player, "!1000", "big")
	local t2 = showCard({"blue","queen"}, 290, 200, player, "!1000", "big")
	local t3 = showCard({"yellow","queen"}, 410, 200, player, "!1000", "big")
	local t4 = showCard({"green","queen"}, 530, 200, player, "!1000", "big")
	local images = {img, l}
	for i, v in pairs({t1,t2,t3,t4}) do
		for j, w in pairs(v) do
			table.insert(images, w)
		end
	end
	ROUND.chair[n].action = {
		name = "WILD",
		img = images
	}
	resetTimer()
	updateTurnTimer()
	showAccumulated()
end

function king(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local player = ROUND.chair[n].owner
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	local t1 = showCard({"red","king"}, 170, 200, player, "!1000", "big")
	local t2 = showCard({"blue","king"}, 290, 200, player, "!1000", "big")
	local t3 = showCard({"yellow","king"}, 410, 200, player, "!1000", "big")
	local t4 = showCard({"green","king"}, 530, 200, player, "!1000", "big")
	local images = {img, l}
	for i, v in pairs({t1,t2,t3,t4}) do
		for j, w in pairs(v) do
			table.insert(images, w)
		end
	end
	ROUND.chair[n].action = {
		name = "WILD",
		img = images
	}
	resetTimer()
	updateTurnTimer()
	showAccumulated()
end


--[[ src/cards/magnet.lua ]]--

function magnet(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	
	local pool = {}
	
	local i = #ROUND.chair[n].hand
	local cont = 0
	local bg = {green = true, blue = true}
	while i > 0 do
		if ROUND.chair[n].hand[i][1] == ROUND.topCard.card[1] or (ROUND.gameMode.bluegreen and bg[ROUND.chair[n].hand[i][1]] and bg[ROUND.topCard.card[1]]) then
			discardByIndex(n, i)
			discardEffect(n, i)
			cont = cont + 1
		end
		i = i - 1
	end
	local xmax = ROUND.chair[n].x-450
	local ymax = 135-250
	local fx = {red=13, blue=1, yellow=11, green=9, black=1}
	local color = fx[ROUND.topCard.card[1]]
	local dist = math.ceil(math.sqrt(math.pow(xmax,2)+math.pow(ymax,2))/20)
	local qtd = cont * dist
	for i=0, qtd do
		local x = 450 + xmax*(i/qtd)
		local y = 250 + ymax*(i/qtd)
		tfm.exec.displayParticle(color, x+math.random(-8,8), y+math.random(-8,8), 0, 0, 0, 0, nil)
	end
	explosion(9, ROUND.chair[n].x, 135, 5, 10)
	explosion(35, ROUND.chair[n].x, 135, 3, 5)
	mimicDiscard(n, cont)
	if cont > 0 then
		showCardsGainned(n, -cont)
	end
	if cont >= 5 then
		unlockChair(ROUND.chair[n].owner, "mecatopus")
	end
	if #ROUND.chair[n].hand <= 0 then
		endGame(ROUND.chair[n].owner, ROUND.topCard.card)
	else
		if #ROUND.chair[n].hand == 1 then
			ROUND.chair[n].uno = "uno"
		end
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
	updateHand(n)
	updateScore(n)
end


--[[ src/cards/meep.lua ]]--

function meep(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	ROUND.chair[n].meep = true
	tfm.exec.giveMeep(ROUND.chair[n].owner)
	tfm.exec.displayParticle(10, ROUND.chair[n].x, 90, 0, 0, 0, 0, nil)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/mimic.lua ]]--

function mimic(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	local option = {}
	for i, v in pairs(ROUND.chair) do
		if (v.mode == "BUSY" or v.mode == "FREE") and i ~= n then
			table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
			option[i] = true
		end
	end
	ROUND.chair[n].action = {
		name = "MIMIC",
		img = image,
		op = option,
		func = makeMimic
	}
	resetTimer()
	updateTurnTimer()
end

function makeMimic(n, target)
	if target then
		if not ROUND.chair[target].action or n == target then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
			ROUND.chair[n].mimic = target
			local img = tfm.exec.addImage(IMG.misc.linked, "!1000", ROUND.chair[n].x-50, 30)
			local img2 = tfm.exec.addImage(IMG.misc.linked, "!1000", ROUND.chair[target].x-50, 30)
			TIMER.img[img] = os.time()+1000
			TIMER.img[img2] = os.time()+1000
			passTurn()
			batataTimer(n)
			updateShadow(n)
		end
	else
		passTurn()
		ROUND.chair[n].confuse = false
		batataTimer(n)
		updateShadow(n)
	end
end

function mimicDraw(n, qtd, recursion)
	for i, v in pairs(ROUND.chair) do
		if v.mimic == n and (not recursion or v.owner ~= "Icemice") then
			tryDraw(i, qtd)
		end
	end
end

function mimicDiscard(n, qtd)
	local winners = {}
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" and v.mimic == n then
			discardCard(i, qtd)
			if #v.hand == 0 then
				table.insert(winners, i)
			end
		end
	end
	return winners
end




--[[ src/cards/mix.lua ]]--

function mix1(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local arrow = {LEFT = "RIGHT", RIGHT = "LEFT"}
	ROUND.flow = arrow[ROUND.flow]
	updateFlow(nil, ROUND.flowLight)
	for i=0, 800, 20 do
		tfm.exec.displayParticle(3, i, 177, 0, 0, 0, 0)
	end
	ROUND.turn = nextChair(ROUND.turn)
	local img = tfm.exec.addImage(IMG.misc.skipped, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
	TIMER.img[img] = os.time()+1000
	explosion(35, ROUND.chair[ROUND.turn].x, 80, 50, 10)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function mix2(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local arrow = {LEFT = "RIGHT", RIGHT = "LEFT"}
	ROUND.flow = arrow[ROUND.flow]
	updateFlow(nil, ROUND.flowLight)
	for i=0, 800, 20 do
		tfm.exec.displayParticle(3, i, 177, 0, 0, 0, 0)
	end
	local target = nextChair(ROUND.turn)
	tryDraw(target, 2)
	ROUND.turn = target
	local img = tfm.exec.addImage(ROUND.flow == "RIGHT" and IMG.misc.right or IMG.misc.left, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
	TIMER.img[img] = os.time()+1000
	explosion(35, ROUND.chair[ROUND.turn].x, 80, 50, 10)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function mix3(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	ROUND.turn = nextChair(ROUND.turn)
	local img = tfm.exec.addImage(IMG.misc.skipped, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
	TIMER.img[img] = os.time()+1000
	explosion(35, ROUND.chair[ROUND.turn].x, 80, 50, 10)
	local target = nextChair(ROUND.turn)
	tryDraw(target, 2)
	ROUND.turn = target
	local img = tfm.exec.addImage(ROUND.flow == "RIGHT" and IMG.misc.right or IMG.misc.left, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
	TIMER.img[img] = os.time()+1000
	explosion(35, ROUND.chair[ROUND.turn].x, 80, 50, 10)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/mysterious.lua ]]--

function random(n)
	ROUND.time = GLOBAL_TIME + (ROUND.gameMode.flash and 5000 or 10000)
	ROUND.chair[n].action = {name="random"}
	ROUND.topCard.card = randomActionCard()
	ROUND.topCard.card[3] = nil
	drawTopCard()
	local y = drawTopCard()
	tfm.exec.displayParticle(12, 455, y+37, 0, 0, 0, 0)
	ROUND.chair[n].action = nil
	_G[ROUND.topCard.card[2]](n)
end


--[[ src/cards/numbers.lua ]]--

function n0(n, start)
	ROUND.chair[n].zero = ROUND.chair[n].zero or {}
	if ROUND.topCard.card[2] == "n0" then
		ROUND.chair[n].zero[ROUND.topCard.card[1]] = true
		if ROUND.chair[n].zero.red and ROUND.chair[n].zero.blue and ROUND.chair[n].zero.yellow and ROUND.chair[n].zero.green then
			unlockChair(ROUND.chair[n].owner, "elemental")
		end
	end
	if ROUND.chair[n].owner == "Charlotte" and ROUND.gameMode[ROUND.topCard.card[1]] then
		actionCardEffect()
		actionCard(n, _G[ROUND.topCard.card[1]])
	elseif ROUND.topCard.card[2] == "n0" and FLAG[ROUND.chair[n].flag].color == ROUND.topCard.card[1] and not ROUND.chair[n].peace2 then
		actionCardEffect()
		actionCard(n, _G[FLAG[ROUND.chair[n].flag].func])
	elseif ROUND.gameMode.stack and not start then
		local can = {}
		local stack = false
		for i, v in pairs(ROUND.chair[n].hand) do
			if v[2] == ROUND.topCard.card[2] then
				can[i] = true
				stack = true
			end
		end
		if stack then
			if #ROUND.chair[n].hand == 2 then
				showUno(n)
			end
			ROUND.chair[n].played = true
			ROUND.chair[n].whiteList = can
			showPass(n)
			ui.addTextArea(19, string.format("<p align='center'><font color='#ffffff'>"..translate(ROUND.chair[n].owner, "WARN_STACKING"), ROUND.topCard.card[2]:sub(2,2)), ROUND.chair[n].owner, 200, 305, 400, nil, 0, 0, 0, false)
		else
			passTurn()
			batataTimer(n)
			ROUND.chair[n].confuse = false
		end
	elseif ROUND.gameMode.sequence and not start then
		local can = {
			n0 = {"x","n1"},
			n1 = {"n0","n2"},
			n2 = {"n1","n3"},
			n3 = {"n2","n4"},
			n4 = {"n3","n5"},
			n5 = {"n4","n6"},
			n6 = {"n5","n7"},
			n7 = {"n6","n8"},
			n8 = {"n7","n9"},
			n9 = {"n8","x"},
		}
		local sequence = false
		local pool = {}
		if ROUND.chair[n].played then
			if can[ROUND.topCard.card2[2]][1] == ROUND.topCard.card[2] then
				ROUND.chair[n].played = "DOWN"
			elseif can[ROUND.topCard.card2[2]][2] == ROUND.topCard.card[2] then
				ROUND.chair[n].played = "UP"
			end
		end
		if ROUND.chair[n].played == "DOWN" then
			for i, v in pairs(ROUND.chair[n].hand) do
				if ROUND.topCard.card[1] == v[1] and can[ROUND.topCard.card[2]][1] == v[2] then
					pool[i] = true
					sequence = true
				end
			end
		elseif ROUND.chair[n].played == "UP" then
			for i, v in pairs(ROUND.chair[n].hand) do
				if ROUND.topCard.card[1] == v[1] and can[ROUND.topCard.card[2]][2] == v[2] then
					pool[i] = true
					sequence = true
				end
			end
		else
			for i, v in pairs(ROUND.chair[n].hand) do
				if ROUND.topCard.card[1] == v[1] and (can[ROUND.topCard.card[2]][1] == v[2] or can[ROUND.topCard.card[2]][2] == v[2]) then
					pool[i] = true
					sequence = true
				end
			end
		end
		if sequence then
			if #ROUND.chair[n].hand == 2 then
				showUno(n)
			end
			ROUND.chair[n].whiteList = pool
			if ROUND.chair[n].played then
				if ROUND.chair[n].played == true then
					if ROUND.chair[n].played == "DOWN" then
						ui.addTextArea(19,"<p align='center'><font color='#ffffff'>"..translate(ROUND.chair[n].owner, "WARN_DOWN"), ROUND.chair[n].owner, 200, 305, 400, nil, 0, 0, 0, false)
					elseif ROUND.chair[n].played == "UP" then
						ui.addTextArea(19,"<p align='center'><font color='#ffffff'>"..translate(ROUND.chair[n].owner, "WARN_UP"), ROUND.chair[n].owner, 200, 305, 400, nil, 0, 0, 0, false)
					end
				else
					local text = {DOWN="WARN_DOWN", UP="WARN_UP"}
					ui.addTextArea(19,"<p align='center'><font color='#ffffff'>"..translate(ROUND.chair[n].owner, text[ROUND.chair[n].played]), ROUND.chair[n].owner, 200, 305, 400, nil, 0, 0, 0, false)
				end
			else
				ROUND.chair[n].played = true
				ui.addTextArea(19,"<p align='center'><font color='#ffffff'>"..translate(ROUND.chair[n].owner, "WARN_UP_DOWN"), ROUND.chair[n].owner, 200, 305, 400, nil, 0, 0, 0, false)
			end
		else
			passTurn()
			batataTimer(n)
			ROUND.chair[n].confuse = false
		end
	elseif ROUND.gameMode.perfection and not start and isNumeric(ROUND.topCard.card) == #ROUND.chair[n].hand+1 then
		ROUND.turn = previousChair(ROUND.turn)
		explosion(37, ROUND.chair[n].x, 80, 10, 10)
		ui.addTextArea(19, string.format("<p align='center'><font color='#ffffff'>%s", translate(ROUND.chair[n].owner, "WARN_PERFECTION")), ROUND.chair[n].owner, 200, 305, 400, nil, 0, 0, 0, false)
		passTurn()
		batataTimer(n, true)
	else
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
end
n1, n2, n3, n4, n5, n6, n7, n8, n9 = n0, n0, n0, n0, n0, n0, n0, n0, n0


--[[ src/cards/panels.lua ]]--

function picnicFlag(n)
	local pool = {}
	local lastCard = {0,0}
	for i, v in pairs(ROUND.chair[n].hand) do
		if v[1] == lastCard[1] and v[2] == lastCard[2] then
			table.insert(pool, i)
		else
			lastCard = v
		end
	end
	if #pool > 0 then
		local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
		local option = {}
		for i, v in pairs(ROUND.chair) do
			if v.owner ~= "Papaille" and (v.mode == "BUSY" or v.mode == "FREE") and i ~= n then
				table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
				option[i] = true
			end
		end
		ROUND.chair[n].action = {
			name = "PICNIC",
			img = image,
			op = option,
			card = pool[math.random(#pool)],
			func = makePicnicGift
		}
		resetTimer()
		updateTurnTimer()
	else
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
end

function makePicnicGift(n, target)
	if target then
		local temp = {}
		if n ~= target and ROUND.chair[target].mode ~= "DELETED" and (ROUND.chair[target].owner ~= "Papaille" or ROUND.chair[n].owner == "Jingle") then
			if ROUND.chair[n].action then
				for i, v in pairs(ROUND.chair[n].action.img) do
					tfm.exec.removeImage(v)
				end
			end
			if BOT[ROUND.chair[target].owner] and BOT[ROUND.chair[target].owner].eventDonate then
				BOT[ROUND.chair[target].owner].eventDonate()
			end
			local find = ROUND.chair[n].action.card
			ROUND.chair[n].action = false
			missCard(target, ROUND.chair[n].hand[find], 2000)
			explosion(5, ROUND.chair[target].x, 100, 5, 10)
			discardEffect(n, find)
			donateByIndex(n, target, find)
			sortHand(ROUND.chair[target].hand)
			if #ROUND.chair[n].hand == 1 then
				ROUND.chair[n].uno = "uno"
			end
			showCardsGainned(n, -1)
			showCardsGainned(target, 1)
			updateScore(n)
			updateScore(target)
			drawTopCard()
			updateHand(n)
			updateHand(target)
			if isIlluminati(target) then
				unlockChair(ROUND.chair[target].owner, "illuminati")
			end
			if #ROUND.chair[target].hand > ROUND.chair[target].maxHand then
				ROUND.chair[target].maxHand = #ROUND.chair[target].hand
			end
			if #ROUND.chair[target].hand > 25 and not ROUND.chair[target].notTrash then
				unlockChair(ROUND.chair[target].owner, "trash")
			end
			if mustBeEliminated(target) then
				eliminate(target)
			end
			if #ROUND.chair[n].hand == 0 then
				local name = ROUND.chair[n].owner
				endGame(ROUND.chair[n].owner)
				unlockChair(name, "gift")
			else
				passTurn()
				ROUND.chair[n].confuse = false
				batataTimer(n)
				updateShadow(n)
			end
		end
	else
		if ROUND.chair[n].action then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
		end
		passTurn()
		batataTimer(n)
		updateShadow(n)
	end
end

function cloudFlag(n) -- metal
	local pool = {}
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			table.insert(pool, i)
		end
	end
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	TIMER.img[l] = os.time()+500
	local r = table.remove(pool, math.random(#pool))
	if r then
		local img = tfm.exec.addImage(IMG.misc.thunder, "!1000", ROUND.chair[r].x-50, 15)
		TIMER.img[img] = os.time()+500
		explosion(0, ROUND.chair[r].x, 115, 10, 30)
		tryDraw(r, math.random(2))
	end
	passTurn()
	batataTimer(n)
end

function starFlag(n) -- paper
	giveCard(n, {"black","wild",true,true}, true)
	missCard(n, {"black","wild",true,true}, 2000)
	if mustBeEliminated(n) then
		eliminate(n)
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end

function leafFlag(n) -- carpet
	local number = {}
	for i, v in pairs(ROUND.chair[n].hand) do
		if isNumeric(v) then
			table.insert(number, i)
		end
	end
	if #number > 0 then
		local discarted = table.remove(ROUND.chair[n].hand, number[math.random(#number)])
		discarted.lock = false
		if not discarted[3] then
			table.insert(ROUND.pile, discarted)
		end
		missCard(n, discarted, 2000)
		local img = tfm.exec.addImage(IMG.misc.burn, "!1000", ROUND.chair[n].x-25, 20)
		TIMER.img[img] = os.time()+2000
		tryDraw(n, 1)
		if ROUND.chair[n].mode ~= "DELETED" and #ROUND.chair[n].hand == 1 then
			ROUND.chair[n].uno = "uno"
			updateScore(n)
		end
		drawTopCard()
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/paradox.lua ]]--

function paradox(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local rand = math.random(#ROUND.chair[n].hand)
	local temp = table.remove(ROUND.chair[n].hand, rand)
	temp.lock = false
	discardEffect(n, rand)
	if not PARADOX[ROUND.chair[n].owner] then
		PARADOX[ROUND.chair[n].owner] = {}
	end
	table.insert(PARADOX[ROUND.chair[n].owner], {temp[1],temp[2],temp[2] ~= "batata",true})
	local img = tfm.exec.addImage(IMG.misc.portal, "!1000", ROUND.chair[ROUND.turn].x-50, 5)
	TIMER.img[img] = os.time()+2000
	missCard(n, temp, 2000)
	explosion(1, ROUND.chair[n].x, 80, 40, 40)
	ROUND.chair[n].uno = nil
	updateHand(n)
	if #ROUND.chair[n].hand == 1 then
		ROUND.chair[n].uno = "uno"
	end
	updateScore(n)
	showCardsGainned(n, -1)
	if #ROUND.chair[n].hand == 0 then
		endGame(ROUND.chair[n].owner)
	else
		passTurn()
		ROUND.chair[n].confuse = false
		batataTimer(n)
		updateShadow(n)
	end
end


--[[ src/cards/peace.lua ]]--

function peace(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local y = 210 - (#ROUND.pile/108 * 10)
	explosion(32, 455, y, 20, 30)
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			v.peace2 = 3
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/portal.lua ]]--

function portal(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local s = {blue="orange", orange="blue"}
	ROUND.portal.side = s[ROUND.portal.side]
	IMG.skin.classic = IMG.skin[ROUND.portal.side]
	for i, v in pairs(ROUND.portal.img) do
		tfm.exec.removeImage(v)
	end
	local color = {blue = 0x000835, orange= 0x351D00}
	--ui.addTextArea(90002, "", nil, 0, 0, 800, 400, color[ROUND.portal.side], color[ROUND.portal.side], 1, false)
	ROUND.deck, ROUND.deck2 = ROUND.deck2, ROUND.deck
	ROUND.pile, ROUND.pile2 = ROUND.pile2, ROUND.pile
	ROUND.gameMode, ROUND.gameMode2 = ROUND.gameMode2, ROUND.gameMode
	ROUND.subitDeath, ROUND.subitDeath2 = ROUND.subitDeath2, ROUND.subitDeath
	ROUND.limit, ROUND.limit2 = ROUND.limit2, ROUND.limit
	ROUND.limbo, ROUND.limbo2 = ROUND.limbo2, ROUND.limbo
	ROUND.curse, ROUND.curse2 = ROUND.curse2, ROUND.curse
	ROUND.curseTime, ROUND.curseTime2 = ROUND.curseTime2, ROUND.curseTime
	ROUND.simon, ROUND.simon2 = ROUND.simon2, ROUND.simon
	ROUND.traffic, ROUND.traffic2 = ROUND.traffic2, ROUND.traffic
	if ROUND.curseImage then
		tfm.exec.removeImage(ROUND.curseImage)
	end
	if ROUND.trafficImage then
		tfm.exec.removeImage(ROUND.trafficImage)
	end
	for i, v in pairs(ROUND.chair) do
		if v.mode ~= "DELETED" then
			v.hand, v.hand2 = v.hand2, v.hand
			v.luck, v.luck2 = v.luck2, v.luck
			v.peace, v.peace2 = v.peace2, v.peace
			v.confuse, v.confuse2 = v.confuse2, v.confuse
			v.compass, v.compass2 = v.compass2, v.compass
			v.batata, v.batata2 = v.batata2, v.batata
			v.curse, v.curse2 = v.curse2, v.curse
			v.notTrash, v.notTrash2 = v.notTrash2, v.notTrash
			v.meep, v.meep2 = v.meep2, v.meep
			v.mimic, v.mimic2 = v.mimic2, v.mimic
			--v.team, v.team2 = v.team2, v.team
			if v.action then
				for j, w in pairs(v.action.img or {}) do
					tfm.exec.removeImage(w)
				end
				v.action.img = {}
			end
			temp = v.action
			v.action = v.action2
			v.action2 = temp
			if v.action then
				if v.action.name == "SKIP" then
					v.action.img = {tfm.exec.addImage(IMG.misc.web, "!1000", v.x-50, 30)}
				end
			end
			if v.meep then
				tfm.exec.giveMeep(i)
			else
				tfm.exec.giveMeep(i, false)
			end
			explosion(3, v.x, 135, 3, 20)
			if #v.hand == 1 then
				v.uno = "uno"
				updateScore(i)
			end
			if mustBeEliminated(i) then
				eliminate(i)
			else
				updateScore(i)
				sortHand(v.hand)
				updateHand(i)
			end
		end
	end
	showDeck()
	local y = drawTopCard()
	explosion(3, 455, y+37, 5, 40)
	updateCurse()
	if ROUND.subitDeath and not ROUND.cloud.obj then
		ROUND.cloud.obj = tfm.exec.addShamanObject(63, 400, 500, 0, 2, 0, false)
		ROUND.cloud.delay = os.time()+5000
		tfm.exec.addImage(IMG.misc.cloud, "#"..ROUND.cloud.obj, -1200, -500)
	elseif not ROUND.subitDeath and ROUND.cloud.obj then
		tfm.exec.removeObject(ROUND.cloud.obj)
		ROUND.cloud.obj = false
	end
	for i, v in pairs(ROUND.imgRule) do
		tfm.exec.removeImage(v)
	end
	for i, v in pairs(tfm.get.room.playerList) do
		showRules(i)
	end
	if ROUND.traffic then
		ROUND.trafficImage = tfm.exec.addImage(IMG.misc[ROUND.traffic], "!1000", 265, 195)
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
	ui.removeTextArea(28)
	--table.insert(TIMER.txt, {time=os.time()+100, id=90002})
	
	
	ROUND.portal.img = {tfm.exec.addImage(IMG.misc[ROUND.portal.side], "!50000", 0, 0)}
	--if ROUND.portal.side == "blue" then
	--  tfm.exec.snow(999999)
	--else
	--  tfm.exec.snow(0)
	--end
end


--[[ src/cards/rain.lua ]]--

function rain(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	for i, v in pairs(ROUND.chair) do
		if n ~= i then
			tryDraw(i, 1)
		end
	end
	for i=1, 40 do
		tfm.exec.displayParticle(34, math.random(799), 15, 0, math.random()*5, 0, 0, nil)
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/recycle.lua ]]--

function steal(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" and i ~= n then
			local action = {}
			for i, v in pairs(v.hand) do
				if not isNumeric(v) then
					table.insert(action, i)
				end
			end
			if #action > 0 then
				local rand = action[math.random(#action)]
				discardEffect(i, rand)
				local discarted = table.remove(v.hand, rand)
				discarted.lock = false
				if not discarted[3] then
					table.insert(ROUND.pile, discarted)
				end
				missCard(i, discarted, 2000)
				local img = tfm.exec.addImage(IMG.misc.burn, "!1000", ROUND.chair[i].x-25, 20)
				TIMER.img[img] = os.time()+2000
				tryDraw(i, 1)
				if #v.hand == 1 then
					v.uno = "uno"
				end
				updateScore(i)
			end
		end
		drawTopCard()
	end
	if not isEndGame("BAN") then
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
	end
end


--[[ src/cards/reverse.lua ]]--

function reverse(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local cont = 0
	for i, v in pairs(ROUND.chair) do
		if v.mode == "BUSY" or v.mode == "FREE" then
			cont = cont + 1
		end
	end
	if cont == 2 then
		skip(n)
	else
		local arrow = {LEFT = "RIGHT", RIGHT = "LEFT"}
		ROUND.flow = arrow[ROUND.flow]
		updateFlow(nil, ROUND.flowLight)
		ROUND.love = ROUND.love or 0
		ROUND.love = ROUND.love + 1
		if PLAYER[ROUND.chair[n].owner] and PLAYER[ROUND.chair[n].owner].faustao then
			tfm.exec.chatMessage(ROUND.love .. " reverses in a row.", ROUND.chair[n].owner)
		end
		if ROUND.love >= 4 then
			unlockChair(ROUND.chair[n].owner, "truelove")
			unlockChair(ROUND.chair[nextChair(n)].owner, "truelove")
		end
		passTurn()
		batataTimer(n)
		ROUND.chair[n].confuse = false
		for i=0, 800, 20 do
			tfm.exec.displayParticle(3, i, 177, 0, 0, 0, 0)
		end
	end
end


--[[ src/cards/rule.lua ]]--

function rule(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local can = {}
	for i, v in pairs(RULE) do
		if v.rulecard then
			can[i] = true
		end
	end
	local pool = {}
	for i, v in pairs(ROUND.gameMode) do
		can[i] = nil
		for j, w in pairs(RULE[i].conflict or {}) do
			can[w] = nil
		end
	end
	for i, v in pairs(can) do
		table.insert(pool, i)
	end
	if #pool == 1 then
		addRule(pool[math.random(#pool)])
		passTurn()
		batataTimer(n)
	elseif #pool > 1 then
		local options = {}
		local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverRule, "!1000", ROUND.chair[n].x-50, 20)
		local images = {img, tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
		for i=1, 2 do
			local name = table.remove(pool, math.random(#pool))
			options[i] = name
			table.insert(images, tfm.exec.addImage(IMG.misc.tip, "!1000", i*160+75, 190, ROUND.chair[n].owner))
			table.insert(images, tfm.exec.addImage(RULE[name].imgDesc, "!1000", i*160+80, 275, ROUND.chair[n].owner))
			local text = string.format("<p align='center'><vp><b>%s</b></font>\n<font color='#ffffff' size='9px'>%s", translate(ROUND.chair[n].owner, RULE[name].name), translate(ROUND.chair[n].owner, RULE[name].desc))
			ui.addTextArea(50000+i, text, ROUND.chair[n].owner, i*160+80, 200, 150, 150, 0, 0, 0, false)
		end
		resetTimer()
		updateTurnTimer()
		showAccumulated()
		ROUND.chair[n].action = {
			name = "RULE",
			img = images,
			op = options,
		}
	else
		passTurn()
		batataTimer(n)
	end
end

function ruleBoss(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell then
		ROUND.accumulated = nil
	end
	local pool = {"red", "blue", "yellow", "green"}
	local options = {}
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverRule, "!1000", ROUND.chair[n].x-50, 20)
	local images = {img, tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	for i=1, 2 do
		local name = table.remove(pool, math.random(#pool))
		options[i] = name
		table.insert(images, tfm.exec.addImage(IMG.misc.tip, "!1000", i*160+75, 190, ROUND.chair[n].owner))
		table.insert(images, tfm.exec.addImage(RULE[name].imgDesc, "!1000", i*160+80, 275, ROUND.chair[n].owner))
		local text = string.format("<p align='center'><vp><b>%s</b></font>\n<font color='#ffffff' size='9px'>%s", translate(ROUND.chair[n].owner, RULE[name].name), translate(ROUND.chair[n].owner, RULE[name].desc))
		ui.addTextArea(50000+i, text, ROUND.chair[n].owner, i*160+80, 200, 150, 150, 0, 0, 0, false)
	end
	resetTimer()
	updateTurnTimer()
	showAccumulated()
	ROUND.chair[n].action = {
		name = "RULE",
		img = images,
		op = options,
	}
end

function selectRule(n, option)
	ui.removeTextArea(50001)
	ui.removeTextArea(50002)
	for i, v in pairs(ROUND.chair[n].action.img) do
		tfm.exec.removeImage(v)
	end
	addRule(ROUND.chair[n].action.op[option])
	local name = ROUND.chair[n].action.op[option]
	local y = 195 - (#ROUND.pile/108 * 10)
	for i, v in pairs(tfm.get.room.playerList) do
		ui.addTextArea(34, string.format("<p align='center'><font color='#ffffff'>%s", translate(i, RULE[name].name)), i, 350, y, 210, nil, 0, 0, 0, false)
	end
	table.insert(TIMER.txt, {time=os.time()+2000, id=34}) 
	ROUND.chair[n].action = false
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
	updateShadow(n)
end

function addRule(name)
	ROUND.gameMode[name] = true
	for i, v in pairs(ROUND.imgRule) do
		tfm.exec.removeImage(v)
	end
	for i, v in pairs(tfm.get.room.playerList) do
		showRules(i)
		if window.isOpened(i, "TIP") then
			window.update(i, "TIP", name)
		else
			window.open(i, "TIP", name)
		end
	end
	addFunctionTimer(function()
		for i, v in pairs(tfm.get.room.playerList) do
			window.close(i, "TIP")
		end
	end, 4000)
	if RULE[name].card then
		for i, v in pairs(DECK[name]) do
			table.insert(ROUND.deck, math.random(#ROUND.deck+1), v)
		end
		showDeck()
		if not ROUND.subitDeath then
			local randomColor = RULE[name].card.color
			local card = RULE[name].card.name or name
			show = {randomColor[math.random(#randomColor)],card}
			local y = 195 - (#ROUND.deck/108 * 10)
			local img = showCard(show, 320, y, nil, "!1000")
			for i, v in pairs(img) do
				TIMER.img[v] = os.time()+2000
			end
			ui.addTextArea(90000, string.format("<p align='center'><font size='20px' color='#%s'><b>+", "000000")..#DECK[name], nil, 320, y+76, 51, 60, 0, 0, 0, false)
			ui.addTextArea(90001, string.format("<p align='center'><font size='20px' color='#%s'><b>+", "FFFFFF")..#DECK[name], nil, 320, y+75, 50, 60, 0, 0, 0, false)
			table.insert(TIMER.txt, {time=os.time()+2000, id=90000})
			table.insert(TIMER.txt, {time=os.time()+2000, id=90001})
		end
	elseif name == "revelation" then
		showDeck()
	elseif name == "overload" then
		ROUND.limit = 10
		for i, v in pairs(ROUND.chair) do
			if mustBeEliminated(i) then
				eliminate(i)
			else
				updateScore(i)
			end
		end
	elseif name == "limbo" then
		ROUND.limit = 12
		for i, v in pairs(ROUND.chair) do
			if mustBeEliminated(i) then
				eliminate(i)
			else
				updateScore(i)
			end
		end
	elseif name == "camouflage" or name == "shiny" then
		for i, v in pairs(ROUND.chair) do
			if v.mode ~= "DELETED" then
				updateScore(i)
			end
		end
	end
end


--[[ src/cards/semaphore.lua ]]--

function oddeven(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	if ROUND.traffic == "even" then
		ROUND.traffic = "odd"
	elseif ROUND.traffic == "odd" then
		ROUND.traffic = "even"
	else
		ROUND.traffic = math.random() > 0.5 and "odd" or "even"
	end
	if ROUND.trafficImage then
		tfm.exec.removeImage(ROUND.trafficImage)
	end
	ROUND.trafficImage = tfm.exec.addImage(IMG.misc[ROUND.traffic], "!1000", 265, 195)
	ROUND.chair[n].action = {
		name = "ODDEVEN",
	}
	local text = {odd = "FORBIDEN_ODD", even = "FORBIDEN_EVEN"}
	for i, v in pairs(tfm.get.room.playerList) do
		ui.addTextArea(71, "<p align='center'><font color='#ffffff' size='20px'>"..translate(i, text[ROUND.traffic]), i, 150, 245, 500, nil, 1, 1, 0.7, false)
	end
	if ROUND.traffic == "odd" then
		explosion(13, 290, 220, 15, 15)
		explosion(9, 290, 270, 15, 15)
	else
		explosion(9, 290, 220, 15, 15)
		explosion(13, 290, 270, 15, 15)
	end
	addFunctionTimer(function()
		ROUND.chair[n].action = false
		ui.removeTextArea(71)
		passTurn()
		updateShadow(n)
	end, 4000)
end


--[[ src/cards/share.lua ]]--

function share(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	
	local pool = {}
	for i, v in pairs(ROUND.chair[n].hand) do
		table.insert(pool, {v[1], v[2], true, true})
	end
	if #ROUND.chair[n].hand > 10 then
		for i=1, #ROUND.chair[n].hand - 10 do
			table.remove(pool, math.random(#pool))
		end
	end
	local amount = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	local poolPlayer = {}
	for i, v in pairs(ROUND.chair) do
		if i~=n and v.mode ~= "DELETED" then
			table.insert(poolPlayer, i)
		end
	end
	for i, v in pairs(pool) do
		local target = poolPlayer[math.random(#poolPlayer)]
		table.insert(ROUND.chair[target].hand, v)
		amount[target] = amount[target] + 1
	end
	
	for i, v in pairs(ROUND.chair) do
		if amount[i] > 0 then
			missCard(i, nil, 2000)
			explosion(5, v.x, 100, 5, 10)
			sortHand(v.hand)
			v.uno = nil
			updateHand(i)
			updateScore(i)
			showCardsGainned(i, amount[i])
			if mustBeEliminated(i) then
				eliminate(i)
			end
		end
	end
	
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/shield.lua ]]--

function shield(n)
	if ROUND.accumulated then
		ROUND.accumulated.player[ROUND.chair[n].owner] = true
		addBlockPoint(ROUND.chair[n].owner)
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/simon.lua ]]--

function simon(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local player = ROUND.chair[n].owner
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	local images = {img, l}
	if ROUND.simon then
		table.insert(images, tfm.exec.addImage(IMG.simon.red[ROUND.portal.side], "!1000", 170, 225, player))
		table.insert(images, tfm.exec.addImage(IMG.simon.blue[ROUND.portal.side], "!1000", 290, 225, player))
		table.insert(images, tfm.exec.addImage(IMG.simon.yellow[ROUND.portal.side], "!1000", 410, 225, player))
		table.insert(images, tfm.exec.addImage(IMG.simon.green[ROUND.portal.side], "!1000", 530, 225, player))
		ROUND.chair[n].action = {
			name = "WILD",
			img = images,
			simon = 1
		}
	else
		local t1 = showCard({"red","simon"}, 170, 200, player, "!1000", "big")
		local t2 = showCard({"blue","simon"}, 290, 200, player, "!1000", "big")
		local t3 = showCard({"yellow","simon"}, 410, 200, player, "!1000", "big")
		local t4 = showCard({"green","simon"}, 530, 200, player, "!1000", "big")
		for i, v in pairs({t1,t2,t3,t4}) do
			for j, w in pairs(v) do
				table.insert(images, w)
			end
		end
		ROUND.chair[n].action = {
			name = "WILD",
			img = images,
			simon = "FINAL"
		}
	end
	resetTimer()
	updateTurnTimer()
	showAccumulated()
end


--[[ src/cards/skip.lua ]]--

function skip(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	ROUND.turn = nextChair(ROUND.turn)
	local img = tfm.exec.addImage(IMG.misc.skipped, "!1000", ROUND.chair[ROUND.turn].x-50, 30)
	TIMER.img[img] = os.time()+1000
	explosion(35, ROUND.chair[ROUND.turn].x, 80, 20, 20)
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/spy.lua ]]--

function spy(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	for i, v in pairs(ROUND.chair) do
		if (v.mode == "BUSY" or v.mode == "FREE") and n ~= i then
			missCard(i, v.hand[math.random(#v.hand)], 2000)
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/theft.lua ]]--

function theft(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	local option = {}
	for i, v in pairs(ROUND.chair) do
		if (v.mode ~= "DELETED") and i ~= n then
			table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
			option[i] = true
		end
	end
	ROUND.chair[n].action = {
		name = "THEFT",
		img = image,
		op = option,
		func = makeTheft
	}
	resetTimer()
	updateTurnTimer()
end

function makeTheft(n, target)
	if target then
		local temp = {}
		if n ~= target and ROUND.chair[target].mode ~= "DELETED" then
			if ROUND.chair[n].action then
				for i, v in pairs(ROUND.chair[n].action.img) do
					tfm.exec.removeImage(v)
				end
			end
			ROUND.chair[n].action = false
			--
			local found = {}
			for i, v in pairs(ROUND.chair[target].hand) do
				if v[1] == "black" then
					table.insert(found, i)
				end
			end
			
			if #found > 0 then
				local rand = found[math.random(#found)]
				temp = table.remove(ROUND.chair[target].hand, rand)
				discardEffect(target, rand)
				table.insert(ROUND.chair[n].hand, temp)
				
				missCard(n, temp, 2000)
				explosion(5, ROUND.chair[n].x, 100, 5, 10)
				sortHand(ROUND.chair[n].hand)
				ROUND.chair[n].uno = nil
				updateHand(n)
				updateHand(target)
				if #ROUND.chair[target].hand == 1 then
					ROUND.chair[target].uno = "uno"
				end
				if isIlluminati(n) then
					unlockChair(ROUND.chair[n].owner, "illuminati")
				end
				if temp[2] == "draw4" then
					if ROUND.chair[n].theft then
						unlockChair(ROUND.chair[n].owner, "gaga")
					else
						ROUND.chair[n].theft = true
					end
				end
				updateScore(n)
				updateScore(target)
				showCardsGainned(n, 1)
				showCardsGainned(target, -1)
			end
			--
			
			if #ROUND.chair[target].hand == 0 then
				local name = ROUND.chair[target].owner
				endGame(ROUND.chair[target].owner)
				unlockChair(target, "gift")
			else
				passTurn()
				ROUND.chair[n].confuse = false
				batataTimer(n)
				updateShadow(n)
			end
		end
	else
		if ROUND.chair[n].action then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
		end
		passTurn()
		batataTimer(n)
		updateShadow(n)
	end
end


--[[ src/cards/thunder.lua ]]--

function thunder(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local pool = {}
	for i, v in pairs(ROUND.chair) do
		if (v.mode == "BUSY" or v.mode == "FREE") and v.owner ~= "Drekkemaus" then
			table.insert(pool, i)
		end
	end
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	TIMER.img[l] = os.time()+500
	for i=1, 2 do
		local r = table.remove(pool, math.random(#pool))
		if r then
			local img = tfm.exec.addImage(IMG.misc.thunder, "!1000", ROUND.chair[r].x-50, 15)
			TIMER.img[img] = os.time()+500
			explosion(0, ROUND.chair[r].x, 115, 10, 30)
			tryDraw(r, math.random(5))
			if n == r and ROUND.chair[n].mode == "DELETED" then
				unlockChair(ROUND.chair[n].owner, "apple")
			end
		end
	end
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/tornado.lua ]]--

function tornado(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	
	local pool = {}
	local hands = {}
	
	for i, v in pairs(ROUND.chair) do
		if i ~= n and v.mode ~= "DELETED" then
			for j, w in pairs(v.hand) do
				table.insert(pool, w)
			end
			hands[i] = #v.hand
			explosion(3, v.x, 135, 3, 20)
			--tfm.exec.displayParticle(37, v.x, 90, 0, 0, 0, 0)
		end
		for i=1, 10 do
			tfm.exec.displayParticle(35, v.x+math.random(-50,50), math.random(70,120), 0, 0, 0, 0)
		end
	end
	addFunctionTimer(function()
		for i=1, 50 do
			tfm.exec.displayParticle(35, math.random(800), math.random(70,120), 0, 0, 0, 0)
		end
		addFunctionTimer(function()
			for i=1, 20 do
				tfm.exec.displayParticle(35, math.random(800), math.random(70,120), 0, 0, 0, 0)
			end
		end, 500)
	end, 500)
	
	for i, v in pairs(ROUND.chair) do
		if hands[i] then
			local hand = {}
			for i=1, hands[i] do
				table.insert(hand, table.remove(pool, math.random(#pool)))
			end
			v.hand = hand
			sortHand(v.hand)
			updateHand(i)
			updateScore(i)
		end
	end
	
	passTurn()
	batataTimer(n)
	ROUND.chair[n].confuse = false
end


--[[ src/cards/trade.lua ]]--

function trade(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	local option = {}
	for i, v in pairs(ROUND.chair) do
		if (v.mode == "BUSY" or v.mode == "FREE") and i ~= n then
			table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
			option[i] = true
		end
	end
	ROUND.chair[n].action = {
		name = "TRADE",
		img = image,
		op = option,
		func = makeTrade
	}
	resetTimer()
	updateTurnTimer()
end

function makeTrade(n, target)
	if target then
		if n ~= target and ROUND.chair[target].mode ~= "DELETED" then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
			local aux = ROUND.chair[n].hand
			ROUND.chair[n].hand = ROUND.chair[target].hand
			ROUND.chair[target].hand = aux
			updateHand(n)
			updateHand(target)
			if #ROUND.chair[target].hand == 1 then
				ROUND.chair[target].uno = "uno"
			else
				ROUND.chair[target].uno = nil
			end
			if #ROUND.chair[n].hand == 1 then
				ROUND.chair[n].uno = "uno"
			else
				ROUND.chair[n].uno = nil
			end
			if isIlluminati(n) then
				unlockChair(ROUND.chair[n].owner, "illuminati")
			end
			if isIlluminati(target) then
				unlockChair(ROUND.chair[target].owner, "illuminati")
			end
			if chestInHand(n) then
				unlockChair(ROUND.chair[n].owner, "chest")
			end
			if #ROUND.chair[n].hand > ROUND.chair[n].maxHand then
				ROUND.chair[n].maxHand = #ROUND.chair[n].hand
			end
			if #ROUND.chair[n].hand > 25 and not ROUND.chair[n].notTrash then
				unlockChair(ROUND.chair[n].owner, "trash")
			end
			if #ROUND.chair[target].hand > ROUND.chair[target].maxHand then
				ROUND.chair[target].maxHand = #ROUND.chair[target].hand
			end
			if #ROUND.chair[target].hand > 25 and not ROUND.chair[target].notTrash then
				unlockChair(ROUND.chair[target].owner, "trash")
			end
			updateScore(n)
			updateScore(target)
			explosion(3, ROUND.chair[n].x, 135, 5, 20)
			explosion(3, ROUND.chair[target].x, 135, 5, 20)
			tfm.exec.displayParticle(37, ROUND.chair[target].x, 90, 0, 0, 0, 0)
			tfm.exec.displayParticle(37, ROUND.chair[ROUND.turn].x, 90, 0, 0, 0, 0)
			passTurn()
			ROUND.chair[n].confuse = false
			batataTimer(n)
			updateShadow(n)
		end
	else
		passTurn()
		ROUND.chair[n].confuse = false
		batataTimer(n)
		updateShadow(n)
	end
end


--[[ src/cards/web.lua ]]--

function web(n)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local image = {tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, ROUND.chair[n].owner)}
	local option = {}
	for i, v in pairs(ROUND.chair) do
		if (v.mode == "BUSY" or v.mode == "FREE") and not v.action or i == n then
			table.insert(image, tfm.exec.addImage(IMG.misc.target, "!1000", v.x-50, 30))
			option[i] = true
		end
	end
	ROUND.chair[n].action = {
		name = "WEB",
		img = image,
		op = option,
		func = makeWeb
	}
	resetTimer()
	updateTurnTimer()
end

function makeWeb(n, target)
	if target then
		if not ROUND.chair[target].action or n == target then
			for i, v in pairs(ROUND.chair[n].action.img) do
				tfm.exec.removeImage(v)
			end
			ROUND.chair[n].action = false
			ROUND.chair[target].action = {
				name = "SKIP",
				img = {tfm.exec.addImage(IMG.misc.web, "!1000", ROUND.chair[target].x-50, 30)}
			}
			explosion(1, ROUND.chair[target].x, 80, 20, 30)
			if BOT[ROUND.chair[target].owner] and BOT[ROUND.chair[target].owner].eventWeb then
				BOT[ROUND.chair[target].owner].eventWeb()
			end
			if ROUND.chair[n].web and ROUND.chair[n].web[target] then
				unlockChair(ROUND.chair[n].owner, "spider")
			end
			ROUND.chair[n].web = ROUND.chair[n].web or {}
			ROUND.chair[n].web[target] = true
			passTurn()
			batataTimer(n)
			updateShadow(n)
		end
	else
		passTurn()
		ROUND.chair[n].confuse = false
		batataTimer(n)
		updateShadow(n)
	end
end


--[[ src/cards/wild.lua ]]--

function wild(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	local player = ROUND.chair[n].owner
	local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
	local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
	local t1 = showCard({"red","wild"}, 170, 200, player, "!1000", "big")
	local t2 = showCard({"blue","wild"}, 290, 200, player, "!1000", "big")
	local t3 = showCard({"yellow","wild"}, 410, 200, player, "!1000", "big")
	local t4 = showCard({"green","wild"}, 530, 200, player, "!1000", "big")
	local images = {img, l}
	for i, v in pairs({t1,t2,t3,t4}) do
		for j, w in pairs(v) do
			table.insert(images, w)
		end
	end
	if ROUND.topCard.card2 and (ROUND.topCard.card2[2] == "wild" or ROUND.topCard.card2[2] == "draw4") and validRoom() then
		PLAYER[player].pencil = PLAYER[player].pencil or 0
		PLAYER[player].pencil = PLAYER[player].pencil + 1
		if PLAYER[player].pencil >= 100 then
			unlockChair(player, "pencil")
		end
	end
	ROUND.chair[n].action = {
		name = "WILD",
		img = images
	}
	resetTimer()
	updateTurnTimer()
	showAccumulated()
end

function paintCard(color, n, auto)
	for i, v in pairs(ROUND.chair[n].action.img or {}) do
		tfm.exec.removeImage(v)
	end
	
	ROUND.topCard.card[1] = color
	local y = drawTopCard()
	local particle = {red=21, blue=23, yellow=24, green=22}
	local plus = ROUND.chair[n].action.plusfour
	for i=1, 10 do
		tfm.exec.displayParticle(particle[color], 455, y+37, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
	end
	if ROUND.topCard.card[2] == "king" or ROUND.topCard.card[2] == "queen" then
		ROUND.chair[n].action = false
		colorZeros(color, n)
		pawn(n)
	elseif ROUND.topCard.card[2] == "simon" then
		local action = ROUND.chair[n].action
		if action.simon == "FINAL" then
			ROUND.chair[n].action = false
			ROUND.simon = ROUND.simon or {}
			table.insert(ROUND.simon, color)
			local s = tfm.exec.addImage(IMG.simonMini[color][ROUND.portal.side], "!1000", 405, 190)
			TIMER.img[s] = os.time()+2000
			colorZeros(color, n)
			passTurn()
			batataTimer(n)
			updateShadow(n)
		else
			ROUND.chair[n].action = false
			if color == ROUND.simon[action.simon] then
				ROUND.chair[n].action = {name="PLAY"}
				ROUND.time = GLOBAL_TIME + 10000
				if action.simon == #ROUND.simon then
					local img = tfm.exec.addImage(IMG.misc.sucess, "!1000", ROUND.chair[n].x-50, 30)
					TIMER.img[img] = os.time()+1000
				end
				local s = tfm.exec.addImage(IMG.simonMini[color][ROUND.portal.side], "!1000", 405, 190)
				TIMER.img[s] = os.time()+1000
				addFunctionTimer(function()
					ROUND.chair[n].action = false
					local player = ROUND.chair[n].owner
					local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discoverWild, "!1000", ROUND.chair[n].x-50, 20)
					local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
					local images = {img, l}
					if action.simon < #ROUND.simon then
						table.insert(images, tfm.exec.addImage(IMG.simon.red[ROUND.portal.side], "!1000", 170, 225, player))
						table.insert(images, tfm.exec.addImage(IMG.simon.blue[ROUND.portal.side], "!1000", 290, 225, player))
						table.insert(images, tfm.exec.addImage(IMG.simon.yellow[ROUND.portal.side], "!1000", 410, 225, player))
						table.insert(images, tfm.exec.addImage(IMG.simon.green[ROUND.portal.side], "!1000", 530, 225, player))
						ROUND.chair[n].action = {
							name = "WILD",
							img = images,
							simon = action.simon + 1
						}
					else
						local t1 = showCard({"red","simon"}, 170, 200, player, "!1000", "big")
						local t2 = showCard({"blue","simon"}, 290, 200, player, "!1000", "big")
						local t3 = showCard({"yellow","simon"}, 410, 200, player, "!1000", "big")
						local t4 = showCard({"green","simon"}, 530, 200, player, "!1000", "big")
						for i, v in pairs({t1,t2,t3,t4}) do
							for j, w in pairs(v) do
								table.insert(images, w)
							end
						end
						ROUND.chair[n].action = {
							name = "WILD",
							img = images,
							simon = "FINAL"
						}
						if #ROUND.simon >= 6 then
							unlockChair(ROUND.chair[n].owner, "phone")
						end
					end
					resetTimer()
					updateTurnTimer()
					showAccumulated()
				end, 1000)
			else
				ROUND.chair[n].action = {name="PLAY"}
				ROUND.time = GLOBAL_TIME + 10000
				addFunctionTimer(function()
					ROUND.chair[n].action = false
					color = ROUND.simon[action.simon]
					ROUND.topCard.card[1] = color
					local y = drawTopCard()
					local particle = {red=21, blue=23, yellow=24, green=22}
					for i=1, 10 do
						tfm.exec.displayParticle(particle[color], 455, y+37, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
					end
					tryDraw(n, 1)
					local img = tfm.exec.addImage(IMG.misc.fail, "!1000", ROUND.chair[n].x-50, 30)
					TIMER.img[img] = os.time()+2000
					for i, v in pairs(PLAYER) do
						if v.faustao then
							local img2 = tfm.exec.addImage(IMG.misc.errou, "!1000", 480, 190, i)
							TIMER.img[img2] = os.time()+2000
						end
					end
					local s = tfm.exec.addImage(IMG.simonMini[color][ROUND.portal.side], "!1000", 405, 190)
					TIMER.img[s] = os.time()+2000
					colorZeros(color, n)
					passTurn()
					batataTimer(n)
					updateShadow(n)
				end, 1000)
			end
		end
	else
		ROUND.chair[n].action = false
		if ROUND.gameMode.nocombo and ROUND.gameMode.nochallenge and plus then
			ROUND.turn = nextChair(ROUND.turn)
			local target = ROUND.turn
			colorZeros(color, n)
			passTurn()
			batataTimer(n)
			tryDraw(target, 4)
			local img = tfm.exec.addImage(ROUND.flow == "RIGHT" and IMG.misc.right or IMG.misc.left, "!1000", ROUND.chair[target].x-50, 30)
			TIMER.img[img] = os.time()+1000
			explosion(35, ROUND.chair[target].x, 80, 50, 10)
			if ROUND.gameMode.overload and #ROUND.chair[target].hand > 10 or bombInHand(target) or #ROUND.chair[target].hand > 30 then
				eliminate(target)
			end
			updateShadow(n)
		else
			colorZeros(color, n)
			passTurn()
			batataTimer(n)
			updateShadow(n)
		end
	end
end

function colorZeros(color, n)
	for i, v in pairs(ROUND.chair) do
		if i ~= n and v.mode ~= "DELETED" and v.flag == "disco" and math.random() > 0.75 then
			local pool = {}
			for j, w in pairs(v.hand) do
				if w[2] == "n0" then
					table.insert(pool, j)
				end
			end
			if #pool > 0 then
				table.insert(ROUND.pile, 1, table.remove(v.hand, pool[math.random(#pool)]))
				table.insert(v.hand, {color, "n0", true})
				sortHand(v.hand)
				missCard(i, {color, "n0"}, 1000)
				updateHand(i)
				local fx = {red=13, blue=1, yellow=11, green=9, black=0}
				for i=1, 20 do
					tfm.exec.displayParticle(fx[color], math.random(-50,50)+v.x, 15, 0, math.random()*4, 0, 0, nil)
				end
			end
		end
	end
end


--[[ src/cards/wish.lua ]]--

function wish(n)
	ui.removeTextArea(70, ROUND.chair[n].owner)
	if ROUND.gameMode.hell and ROUND.accumulated then
		ROUND.accumulated = nil
		addBlockPoint(ROUND.chair[n].owner)
	end
	if #ROUND.pile > 1 then
		local o = {}
		for i=1, 3 do
			table.insert(o, math.random(#ROUND.pile-1))
		end
		local player = ROUND.chair[n].owner
		local y = drawTopCard()
		local top = tfm.exec.addImage(IMG.misc.wish, "!0", 405, y-25)
		local img = tfm.exec.addImage(IMG.skin[ROUND.portal.side].misc.discover, "!100", ROUND.chair[n].x-50, 20)
		local l = tfm.exec.addImage(IMG.misc.genericLayer, "!1000", 0, 0, player)
		local t1 = showCard(ROUND.pile[o[1]], 230, 200, player, "!1000", "big")
		local t2 = showCard(ROUND.pile[o[2]], 350, 200, player, "!1000", "big")
		local t3 = showCard(ROUND.pile[o[3]], 470, 200, player, "!1000", "big")
		local images = {top, img, l}
		for i, v in pairs({t1,t2,t3}) do
			for j, w in pairs(v) do
				table.insert(images, w)
			end
		end
		local card1 = ROUND.pile[o[1]]
		local card2 = ROUND.pile[o[2]]
		local card3 = ROUND.pile[o[3]]
		if card1[1] == card2[1] and card1[2] == card2[2] and card1[1] == card3[1] and card1[2] == card3[2] then
			unlockChair(ROUND.chair[n].owner, "shenlong")
		end
		ROUND.chair[n].action = {
			name = "WISH",
			img = images,
			card = o
		}
		resetTimer()
		updateTurnTimer()
	else
		passTurn()
		batataTimer(n)
	end
end

function makeWish(n, card)
	for i, v in pairs(ROUND.chair[n].action.img) do
		tfm.exec.removeImage(v)
	end
	ROUND.chair[n].action = false
	local choice = table.remove(ROUND.pile, card)
	local rand = math.random(#ROUND.chair[n].hand)
	discardEffect(n, rand)
	local discard = table.remove(ROUND.chair[n].hand, rand)
	if not discard[3] then
		table.insert(ROUND.pile, 1, discard)
	end
	table.insert(ROUND.chair[n].hand, choice)
	if discard[1] == "black" then
		unlockChair(ROUND.chair[n].owner, "font")
	end
	sortHand(ROUND.chair[n].hand)
	missCard(n, choice, 2000)
	explosion(5, ROUND.chair[n].x, 100, 5, 10)
	passTurn()
	batataTimer(n)
	updateHand(n)
end


--[[ src/events/eventChatCommand.lua ]]--

onEvent("ChatCommand", function(p, cmd)
	if not PLAYER[p] then
		return false
	end
	local arg = split(cmd, " ")
	if PLAYER[p] then
		PLAYER[p].notAfk = true
	end
	if p == "Ninguem#0095" then
		if arg[1] == "givechair" and arg[2] and arg[3] then
			local name = whichNick(arg[3]) or arg[3]
			if SKIN[arg[2]] and PLAYER[name] then
				unlockChair(name, arg[2], true)
			end
		elseif arg[1] == "givebadge" and arg[2] and arg[3] then
			local name = whichNick(arg[3]) or arg[3]
			if TROPHY[arg[2]] and PLAYER[name] then
				unlockTrophy(name, arg[2])
			end
		elseif arg[1] == "giverule" and arg[2] and arg[3] then
			local name = whichNick(arg[3]) or arg[3]
			if RULE[arg[2]] and PLAYER[name] then
				unlockRule(name, arg[2])
			end
		elseif arg[1] == "givescore" and arg[2] and arg[3] then
			local name = whichNick(arg[3]) or arg[3]
			if tonumber(arg[2]) and PLAYER[name] then
				tfm.exec.setPlayerScore(name, tonumber(arg[2]))
			end
		elseif arg[1] == "boss" and ROUND.state == "PLAY" and PLAYER[p].chair then
			ROUND.chair[PLAYER[p].chair].boss = true
		elseif arg[1] == "fake" and arg[2] and arg[3] then
			quoteFake(arg[2], table.concat(arg, " ", 3))
		elseif arg[1] == "test" and arg[2] then
			SKIN.test.img = arg[2]
			PLAYER[p].skinEquiped = "test"
		elseif arg[1] == "custom" then
			window.open(p, "CUSTOM")
		elseif arg[1] == "power" and ROUND.state == "PLAY" and PLAYER[p].chair and ROUND.turn == PLAYER[p].chair then
			power(ROUND.turn)
		elseif arg[1] == "rulenow" and arg[2] and RULE[arg[2]] then
			addRule(arg[2])
		elseif arg[1] == "flag" and arg[2] and FLAG[arg[2]] then
			PLAYER[p].flagEquipped = arg[2]
		elseif arg[1] == "panels" then
			window.open(p, "PANELS")
		elseif arg[1] == "light" and arg[2] and LIGHT[arg[2]] then
			PLAYER[p].lightEquiped = arg[2]
		end
	end
	if p == OWNER and not CONFIG.tribeHouse then
		if arg[1] == "adm" and arg[2] then
			local name = whichNick(arg[2]) or arg[2]
			if name == OWNER then
				tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_OWNER"), name), p)
			elseif isAdm(name) then
				ADM[name] = nil
				tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_ADM_REMOVE"), name), p)
				colorNick(name)
			elseif tfm.get.room.playerList[name] then
				ADM[name] = true
				tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_ADM"), name), p)
				if BANNED[name] then
					BANNED[name] = false
					tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_UNBANED"), name), p)
				end
				colorNick(name)
			end
		elseif arg[1] == "limit" and arg[2] and tonumber(arg[2]) then
			tfm.exec.setRoomMaxPlayers(tonumber(arg[2]))
			tfm.exec.chatMessage("<bv>Limit: "..arg[2], p)
		elseif arg[1] == "spectator" and ROUND and not ROUND.spectator and not PLAYER[p].chair then
			ROUND.spectator = true
			ui.removeTextArea(32, p)
			ui.removeTextArea(33, p)
			for i, v in pairs(ROUND.imgRule or {}) do
				tfm.exec.removeImage(v)
			end
			for i, v in pairs(tfm.get.room.playerList) do
				showRules(i)
			end
		end
	end
	if p == OWNER or isAdm(p) or CONFIG.tribeHouse then
		if not CONFIG.tribeHouse then
			if arg[1] == "kick" and arg[2] then
				local name = whichNick(arg[2]) or arg[2]
				if tfm.get.room.playerList[name] and PLAYER[name].chair then
					kickPlayer(name)
					tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_KICK"), name), p)
				end
			elseif arg[1] == "ban" and arg[2] then
				local name = whichNick(arg[2]) or arg[2]
				if name == OWNER then
					tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_OWNER"), name), p)
				elseif tfm.get.room.playerList[name] and not BANNED[name] then
					BANNED[name] = true
					kickPlayer(name)
					tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_BAN"), name), p)
					if isAdm(name) then
						ADM[name] = nil
						tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_ADM_REMOVE"), name), p)
					end
					colorNick(name)
				end
			elseif arg[1] == "unban" and arg[2] then
				local name = whichNick(arg[2]) or arg[2]
				if BANNED[name] then
					BANNED[name] = nil
					tfm.exec.chatMessage("<bv>"..string.format(translate(p, "MANAGE_UNBANED"), name), p)
					colorNick(name)
				end
			elseif arg[1] == "pw" then
				if arg[2] then
					tfm.exec.setRoomPassword(table.concat(arg, " ", 2))
					tfm.exec.chatMessage(translate(p, "PASSWORD").." : "..table.concat(arg, " ", 2), p)
				else
					tfm.exec.setRoomPassword("")
					tfm.exec.chatMessage(translate(p, "PASSWORD_REMOVED"), p)
				end
			elseif arg[1] == "clearrules" then
				for i, v in pairs(RULE) do
					CONFIG.rule[i] = false
				end
				for i, v in pairs(tfm.get.room.playerList) do
					window.update(i, "SETTINGS2")
				end
			end
		end
		if arg[1] == "np" or arg[1] == "map" or arg[1] == "new" then
			if arg[1] == "new" and CONFIG.again then
				tfm.exec.newGame(tfm.get.room.currentMap)
			elseif arg[2] then
				CONFIG.again = true
				tfm.exec.newGame(arg[2])
			else
				CONFIG.again = nil
				newMap()
			end
		elseif arg[1] == "start" and ROUND and ROUND.state == "START" then
			local cont = 0
			for i, v in pairs(ROUND.chair) do
				if v.mode == "BUSY" or v.mode == "FREE" then
					cont = cont + 1
				end
			end
			if cont > 1 then
				startGame()
			end
		elseif arg[1] == "random" then
			CONFIG.random = not CONFIG.random
			for i, v in pairs(tfm.get.room.playerList) do
				window.update(i, "SETTINGS2", "all")
			end
		elseif arg[1] == "fixedchair" then
			CONFIG.fixedChair = not CONFIG.fixedChair
			for i, v in pairs(tfm.get.room.playerList) do
				window.update(i, "SETTINGS3")
			end
		elseif arg[1] == "newplayers" then
			CONFIG.newPlayers = not CONFIG.newPlayers
			for i, v in pairs(tfm.get.room.playerList) do
				window.update(i, "SETTINGS3")
			end
		elseif arg[1] == "autostart" then
			CONFIG.autoStart = not CONFIG.autoStart
			for i, v in pairs(tfm.get.room.playerList) do
				window.update(i, "SETTINGS3")
			end
			if not CONFIG.autoStart then
				ui.addPopup(0, 0, "<p align='center'>"..translate(p, "WARN_AUTOSTART"), p, 250, 70, 300, true)
			end
		elseif arg[1] == "scoreby" then
			local change = {SCORE_1="SCORE_2", SCORE_2="SCORE_3", SCORE_3="SCORE_1"}
			CONFIG.scoreBy = change[CONFIG.scoreBy]
			for i, v in pairs(tfm.get.room.playerList) do
				window.update(i, "SETTINGS3")
			end
		elseif arg[1] == "reset" then
			for i, v in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(i, 0, false)
			end
			for i, v in pairs(SCORE) do
				SCORE[i] = 0
			end
		elseif arg[1] == "rule" and arg[2] then
			if RULE[arg[2]] and (PLAYER[p].rules[arg[2]] or p == "Ninguem#0095") then
				CONFIG.rule[arg[2]] = not CONFIG.rule[arg[2]]
				if CONFIG.rule[arg[2]] then
					for i, v in pairs(RULE[arg[2]].conflict or {}) do
						CONFIG.rule[v] = nil
					end
				end
			end
			for i, v in pairs(tfm.get.room.playerList) do
				window.update(i, "SETTINGS2", arg[3])
			end
		elseif arg[1] == "chair" and arg[2] and tonumber(arg[2]) and arg[3] then
			local n = tonumber(arg[2])
			local name = nickFormat(arg[3])
			if tfm.get.room.playerList[name] and PLAYER[name] and not BANNED[name] and not PLAYER[name].chair and not yetPlaying(name) and ROUND.chair[n] and (ROUND.chair[n].mode == "EMPTY" or ROUND.chair[n].mode == "FREE") then
				playerSit(name, ROUND.chair[n], n)
			end
		end
	end
	if arg[1] == "commands" then
		closeAll(p, "COMMAND")
		window.open(p, "COMMAND")
	elseif arg[1] == "p" or arg[1] == "profile" or arg[1] == "stats" then
		if arg[2] then
			local nick = nickFormat(arg[2])
			if PLAYER[nick] then
				if BOT[nick] and #nick >= 3 then
					if window.isOpened(p, "TIP") then
						window.update(p, "TIP", nick:lower())
					else
						window.open(p, "TIP", nick:lower())
					end
				else
					window.open(p, "PROFILE", nick)
				end
			end
		else
			window.open(p, "PROFILE", p)
		end
	elseif arg[1] == "color" then
		if PLAYER[p] then
			PLAYER[p].colorBlind = not PLAYER[p].colorBlind
			saveData(p)
		end
	elseif arg[1] == "bell" then
		if PLAYER[p] then
			PLAYER[p].bell = not PLAYER[p].bell
			saveData(p)
		end
	elseif arg[1] == "shadow" then
		if PLAYER[p] then
			PLAYER[p].shadow = not PLAYER[p].shadow
			saveData(p)
		end
	elseif arg[1] == "challengepopup" then
		if PLAYER[p] then
			PLAYER[p].challengePopup = not PLAYER[p].challengePopup
			saveData(p)
		end
	elseif arg[1] == "community" then
		if PLAYER[p] then
			local conv = {auto="ar",ar="bg",bg="br",br="cn",cn="cz",cz="de",de="e2",e2="ee",ee="en",en="es",es="fi",fi="fr",fr="he",he="hr",hr="hu",hu="id",id="it",it="jp",jp="lt",lt="lv",lv="nl",nl="ph",ph="pl",pl="pt",pt="ro",ro="ru",ru="tr",tr="vk",vk="auto"}
			PLAYER[p].community = conv[PLAYER[p].community]
			ui.addTextArea(4001, string.format("<b><a href='event:menu'>%s</a>", translate(p, "MENU")), p, 5, 380, nil, 20, 0x324650, nil, 1, true)
			saveData(p)
		end
	elseif arg[1] == "set2" then
		window.open(p, "SETTINGS2")
	elseif arg[1] == "isranked" then
		tfm.exec.chatMessage("ranked = "..((CONFIG.ranked or RANKED) and "true" or "false"), p)
	elseif arg[1] == "faustao" then
		if not PLAYER[p].faustao then
			tfm.exec.chatMessage("<v>[Faustão] <n>ERROU!", p)
			PLAYER[p].faustao = true
		end
	elseif arg[1] == "challenge" then
		window.open(p, "CHALLENGE", {"red", "n2"})
	elseif arg[1] == "rules" and arg[2] then
		for i=2, #arg do
			eventChatCommand(p, "rule " .. arg[i])
		end
	elseif arg[1] == "chairs3" then
		window.open(p, "INVENTORY")
	end
end)


--[[ src/events/eventChatMessage.lua ]]--

onEvent("ChatMessage", function(p, msg)
	if PLAYER[p] then
		PLAYER[p].notAfk = true
	end
	if ROUND.state == "PLAY" then
		for i, v in pairs(ROUND.chair) do
			if BOT[v.owner] and BOT[v.owner].eventChat then
				BOT[v.owner].eventChat(p, msg)
			end
		end
	end
end)


--[[ src/events/eventEmotePlayed.lua ]]--

onEvent("EmotePlayed", function(p, id, arg)
	if PLAYER[p] then
		PLAYER[p].notAfk = true
	else
		return false
	end
	if PLAYER[p].chair and ROUND.state == "PLAY" and ROUND.chair[ROUND.turn].action and ROUND.chair[ROUND.turn].action.name == "IMITATE" and ROUND.chair[ROUND.turn].action.action == id then
		if not ROUND.chair[ROUND.turn].action.player[PLAYER[p].chair] then
			ROUND.chair[ROUND.turn].action.player[PLAYER[p].chair] = true
			local img = tfm.exec.addImage(IMG.misc.sucess, "!1000", ROUND.chair[PLAYER[p].chair].x-50, 30)
			table.insert(ROUND.chair[ROUND.turn].action.img, img)
			emoteVerify()
		end
	end
end)


--[[ src/events/eventKeyboard.lua ]]--

onEvent("Keyboard", function(p, key, down, x, y)
	-- fazer jogador sentar em uma cadeira
	if not PLAYER[p] then
		return
	end
	PLAYER[p].antiDoubleClick = PLAYER[p].antiDoubleClick or (os.time() - 5)
	if PLAYER[p].antiDoubleClick < os.time() or not down then
		PLAYER[p].antiDoubleClick = os.time() + 200
	else
		return false
	end
	PLAYER[p].notAfk = true
	if (key == 32 or key == 3) and not BANNED[p] and PLAYER[p].spaceDelay < os.time() and ROUND.chair then
		if p:sub(1,1) == "*" then
			tfm.exec.chatMessage("<r>"..translate(p, "WARNING_SOURIS"), p)
		elseif not PLAYER[p].loaded then
			tfm.exec.chatMessage("<r>"..translate(p, "WARNING_DATA"), p)
		elseif CONFIG.newPlayers and not PLAYER[p].chair and not yetPlaying(p) then
			for i, v in pairs(ROUND.chair) do
				if x > v.x-30 and x < v.x+30 and (v.mode == "EMPTY" or v.mode == "FREE") then
					playerSit(p, v, i)
					break
				end
			end
		end
		PLAYER[p].spaceDelay = os.time() + 500
	elseif key == 72 then
		if not window.isOpened(p, "RULES") then
			closeAll(p, "RULES")
			window.open(p, "RULES", 1)
		else
			window.close(p, "RULES")
		end
	elseif key == 85 then
		if not window.isOpened(p, "SETTINGS2") then
			closeAll(p, "SETTINGS2")
			window.open(p, "SETTINGS2")
		else
			window.close(p, "SETTINGS2")
			window.close(p, "SETTINGS3")
		end
	elseif key == 79 then
		if not window.isOpened(p, "OPTIONS") then
			closeAll(p, "OPTIONS")
			window.open(p, "OPTIONS")
		else
			window.close(p, "OPTIONS")
		end
	elseif key == 80 then
		if not window.isOpened(p, "PROFILE") then
			closeAll(p, "PROFILE")
			window.open(p, "PROFILE", p)
		else
			window.close(p, "PROFILE")
			window.close(p, "TROPHY")
		end
	elseif key == 17 then
		PLAYER[p].ctrl = down and (os.time() + 30000) or false
	end
end)


--[[ src/events/eventLoop.lua ]]--

GLOBAL_TIME = 0
onEvent("Loop", function(current, remaining)
	-- controle de tempo e timers
	GLOBAL_TIME = GLOBAL_TIME + 500
	local tt = os.time()
	if validMap() then
		if ROUND.state == "START" then
			if ROUND.time < GLOBAL_TIME and CONFIG.autoStart or allChairs() then
				local cont = 0
				for i, v in pairs(ROUND.chair) do
					if v.mode == "BUSY" or v.mode == "FREE" then
						cont = cont + 1
					end
				end
				if cont > 1 then
					startGame()
				else
					ROUND.time = GLOBAL_TIME + 15000
				end
			else
				if CONFIG.autoStart then
					local time = math.ceil((ROUND.time - GLOBAL_TIME)/1000)
					ui.addTextArea(17, string.format("<p align='center'><font color='#%s' size='30px'>%i", ROUND.color[1], time), nil, 300, 200, 200, nil, 0, 0, 0, false)
				else
					ui.removeTextArea(17)
				end
				for i, v in pairs(PLAYER) do
					if v.chairDelayTimer and v.chairDelayTimer.time < GLOBAL_TIME then
						if v.chairDelayTimer.img then
							tfm.exec.removeImage(v.chairDelayTimer.img)
						end
						v.chairDelayTimer = nil
						v.spaceDelay = 0
					end
				end
			end
		elseif ROUND.state == "MULLIGAN" then
			if ROUND.time < GLOBAL_TIME then
				roundBegin()
			else
				local time = math.ceil((ROUND.time - GLOBAL_TIME)/1000)
				ui.addTextArea(17, string.format("<p align='center'><font color='#%s' size='30px'>%i", ROUND.color[1], time), nil, 300, 200, 200, nil, 0, 0, 0, false)
			end
		elseif ROUND.state == "PLAY" then
			if remaining < 0 then
				local name = ""
				local score = math.huge
				local cards = math.huge
				for i, v in pairs(ROUND.chair) do
					if v.mode == "BUSY" then
						local hand = scoreHand(i)
						if hand == score then
							if #v.hand == cards and math.random()>0.5 then
								name = v.owner
								score = hand
								cards = #v.hand
							elseif #v.hand < cards then
								name = v.owner
								score = hand
								cards = #v.hand
							end
						elseif hand < score then
							name = v.owner
							score = hand
							cards = #v.hand
						end
					end
				end
				endGame(name, nil, nil, "TIME")
			else
				if ROUND.time - GLOBAL_TIME < 9000 then
					if ROUND.chair[ROUND.turn].confuse or isCursed(ROUND.turn, "poison") then
						BOT.A.autoPlay()
					elseif BOT[ROUND.chair[ROUND.turn].owner] then
						BOT[ROUND.chair[ROUND.turn].owner].autoPlay()
					end
				end
				updateTurnTimer()
				if remaining < 60000  then
					blinkAllert()
					if not ROUND.chatWarning then
						for i, v in pairs(tfm.get.room.playerList) do
							tfm.exec.chatMessage("<rose>"..translate(i, "TIME_REMAINING"), i)
						end
						ROUND.chatWarning = true
						addRule("flash")
					end
				elseif ROUND.limbo and ROUND.limbo-GLOBAL_TIME < 5000 then
					blinkAllert()
				end
				if ROUND.time < GLOBAL_TIME then
					autoPlay()
				end
				if ROUND.turn and (ROUND.chair[ROUND.turn].peace or ROUND.chair[ROUND.turn].peace2) then
					for i=1, 3 do
						tfm.exec.displayParticle(32, math.random(430,470), math.random(210,230), 0, -math.random(), 0, 0)
						tfm.exec.displayParticle(31, math.random(430,470), math.random(210,230), 0, -math.random(), 0, 0)
					end
				end
				confusionEffect()
				for i, v in pairs(ROUND.chair) do
					if i ~= ROUND.turn and v.mode == "BUSY" and BOT[v.owner] and BOT[v.owner].eventLoop then
						BOT[v.owner].eventLoop(i)
					end
					if v.mode == "BUSY" and tfm.get.room.playerList[v.owner] then
						local x = tfm.get.room.playerList[v.owner].x
						if x < v.x-30 or x > v.x+30 then
							if not v.outChair then
								v.outChair = tfm.exec.addImage(IMG.misc.handLayer, "!2000", 0, 320, v.owner)
								local txt = string.format("<p align='center'><font size='30px'>%s", translate(v.owner, "CHAIR_ALLERT"))
								ui.addTextArea(15, "<font color='#000000'>"..txt, v.owner, 0, 350, 800, nil, 0, 0, 0, false)
								ui.addTextArea(16, "<font color='#ffffff'>"..txt, v.owner, 1, 351, 800, nil, 0, 0, 0, false)
							end
						elseif v.outChair then
							tfm.exec.removeImage(v.outChair)
							ui.removeTextArea(15, v.owner)
							ui.removeTextArea(16, v.owner)
							v.outChair = nil
						end
					end
				end
			end
		elseif ROUND.state == "FINISH" then
			if ROUND.time < GLOBAL_TIME then
				for i, v in pairs(ROUND.chair) do
					tfm.exec.giveCheese(v.owner)
					tfm.exec.playerVictory(v.owner)
				end
				if CONFIG.again then
					tfm.exec.newGame(tfm.get.room.currentMap)
				else
					newMap()
				end
			else
				local b = {0, 1, 2, 4, 9, 11, 13}
				local x, y, id = math.random(800), math.random(400), b[math.random(#b)]
				explosion(id, x, y, 20, 20)
			end
		end
	end
	for i, v in pairs(PLAYER) do
		if v.ctrl and v.ctrl < os.time() then
			v.ctrl = false
		end
		if isCoffee(i) then
			unlockChair(i, "coffee")
		end
	end
	for i, v in pairs({delImagesTimer, delObjectTimer, delTxtTimer, execFunctionTimer, teleportCloud}) do
		if os.time() > tt+10 then
			break
		else
			v(tt)
		end
	end
end)


--[[ src/events/eventMouse.lua ]]--

onEvent("Mouse", function(p, x, y, autoplay)
	-- cliques em cartas e em outras coisas do jogo
	if not PLAYER[p] then
		return false
	end
	PLAYER[p].antiDoubleClick = PLAYER[p].antiDoubleClick or (os.time() - 5)
	if PLAYER[p].antiDoubleClick < os.time() or autoplay then
		PLAYER[p].antiDoubleClick = os.time() + 200
	else
		return false
	end
	if ROUND and (ROUND.state == "PLAY" or ROUND.state == "MULLIGAN") then
		local chair = PLAYER[p] and PLAYER[p].chair or ROUND.turn
		local top = ROUND.topCard.card
		if ROUND.state == "MULLIGAN" and not ROUND.chair[chair].change then
			if x > 350 and x < 450 and y > 293 and y < 313 then
				changeHand(chair)
			end
		elseif ROUND.state == "PLAY" and ROUND.chair[chair] and (not ROUND.chair[chair].confuse and not isCursed(chair, "poison") or autoplay) then
			local player = tfm.get.room.playerList[p]
			if BOT[p] or (player and player.x > ROUND.chair[chair].x - 30 and player.x < ROUND.chair[chair].x + 30) or autoplay then
				if ROUND.chair[chair].action then
					if ROUND.chair[chair].action.func and y > 50 and y < 110 then
						local target = whichPlayer(chair, x)
						if target and ROUND.chair[chair].action.op[target] then
							tfm.exec.addShamanObject(0, ROUND.chair[target].x, 50)
							ROUND.chair[chair].action.func(chair, target)
							return false
						end
					elseif ROUND.chair[chair].action.name == "WILD" then
						if y > 200 and y < 350 then
							if x > 170 and x < 270 then
								clearImagesAction(chair)
								paintCard("red", chair)
								return false
							elseif x > 290 and x < 390 then
								clearImagesAction(chair)
								paintCard("blue", chair)
								return false
							elseif x > 410 and x < 510 then
								clearImagesAction(chair)
								paintCard("yellow", chair)
								return false
							elseif x > 530 and x < 630 then
								clearImagesAction(chair)
								paintCard("green", chair)
								return false
							end
						end
					elseif ROUND.chair[chair].action.name == "TRACKING" then
						if y > 200 and y < 350 then
							if x > 230 and x < 330 then
								clearImagesAction(chair)
								drawCardTracking(chair, ROUND.chair[chair].action.card[1])
								return false
							elseif x > 350 and x < 450 then
								clearImagesAction(chair)
								drawCardTracking(chair, ROUND.chair[chair].action.card[2])
								return false
							elseif x > 470 and x < 570 then
								clearImagesAction(chair)
								drawCardTracking(chair, ROUND.chair[chair].action.card[3])
								return false
							end
						end
					elseif ROUND.chair[chair].action.name == "WISH" then
						if y > 200 and y < 350 then
							if x > 230 and x < 330 then
								clearImagesAction(chair)
								makeWish(chair, ROUND.chair[chair].action.card[1])
								return false
							elseif x > 350 and x < 450 then
								clearImagesAction(chair)
								makeWish(chair, ROUND.chair[chair].action.card[2])
								return false
							elseif x > 470 and x < 570 then
								clearImagesAction(chair)
								makeWish(chair, ROUND.chair[chair].action.card[3])
								return false
							end
						end
					elseif ROUND.chair[chair].action.name == "BAN" then
						if y > 200 and y < 350 then
							if x > 230 and x < 330 then
								clearImagesAction(chair)
								makeBan(chair, ROUND.chair[chair].action.card[1])
								return false
							elseif x > 350 and x < 450 then
								clearImagesAction(chair)
								makeBan(chair, ROUND.chair[chair].action.card[2])
								return false
							elseif x > 470 and x < 570 then
								clearImagesAction(chair)
								makeBan(chair, ROUND.chair[chair].action.card[3])
								return false
							end
						end
					elseif ROUND.chair[chair].action.name == "RULE" then
						if y > 190 and y < 350 then
							if x > 235 and x < 395 then
								clearImagesAction(chair)
								selectRule(chair, 1)
								return false
							elseif x > 405 and x < 565 then
								clearImagesAction(chair)
								selectRule(chair, 2)
								return false
							end
						end
					end
				elseif y > 320 and y < 395 then
					local id, card = whichCard(chair, x)
					if id and card then
						if PLAYER[p].ctrl then
							if RULE[card[2]] or CARD[card[2]] then
								if window.isOpened(p, "CARD") then
									window.update(p, "CARD", card)
								else
									closeAll(p, "CARD")
									window.open(p, "CARD", card)
								end
							end
						else
							local play = false
							if chair == ROUND.turn then
								if canPlay(chair, id) then
									playCard(chair, id)
								elseif ROUND.chair[chair].clickDelay < os.time() then
									missCard(chair, card, 1000, true)
									if ROUND.gameMode.hard then
										ROUND.chair[chair].afk = autoplay
										autoPlay()
									end
								end
							else
								if canPlay(chair, id) then
									jumpIn(ROUND.turn, chair)
									missCard(chair, card, 1000)
									playCard(chair, id, false, true)
								elseif ROUND.chair[chair].clickDelay < os.time() then
									missCard(chair, card, 1000, true)
								end
							end
						end
					end
				elseif chair == ROUND.turn then
					if not ROUND.chair[chair].draw and not ROUND.chair[chair].played and x > 320 and x < 370 and y > 200 and y < 285 then
						ROUND.chair[chair].afk = autoplay
						if ROUND.accumulated then
							if not ROUND.accumulated.click then
								if not isCursed(chair, "ice") or ROUND.subitDeath then
									if (ROUND.subitDeath or isCursed(chair, "thorn")) and ROUND.chair[chair].owner ~= "Charlotte" then
										mimicDraw(chair, ROUND.accumulated.cards)
										ROUND.accumulated = nil
										ui.removeTextArea(2)
										eliminate(chair, true) 
									else
										--drawCard(chair, ROUND.accumulated.cards, "PENALTY")
										tryDraw(chair, ROUND.accumulated.cards)
										--mimicDraw(chair, ROUND.accumulated.cards)
										ROUND.accumulated = nil
										ui.removeTextArea(2)
										if mustBeEliminated(chair) then
											eliminate(chair, true) 
										elseif ROUND.turn == chair then
											passTurn()
											ROUND.chair[chair].confuse = false
											updateShadow(chair)
											batataTimer(chair)
										end
									end
								else
									local y = 210 - (#ROUND.deck/108 * 10)
									for i=1, 10 do
										tfm.exec.displayParticle(4, 345, y+37, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
									end
									ROUND.accumulated = nil
									ui.removeTextArea(2)
									ui.removeTextArea(18)
									passTurn()
									ROUND.chair[chair].confuse = false
									updateShadow(chair)
									batataTimer(chair)
								end
							end
						else
							if (ROUND.subitDeath or isCursed(chair, "thorn")) and ROUND.chair[chair].owner ~= "Charlotte" then
								eliminate(chair, true) 
							elseif not isCursed(chair, "ice") then
								if not ROUND.chair[chair].notTrash then
									ROUND.chair[chair].notTrash = canPlayHand(chair, top)
									if ROUND.chair[chair].notTrash and PLAYER[p].faustao then
										tfm.exec.chatMessage("[intentional draw detected]", p)
										tfm.exec.chatMessage("<v>[Faustão] <n>puxa vida meu", p)
									end
								end
								local boss = {Drekkemaus=1, Jingle=1, Charlotte=1}
								if ROUND.gameMode.tracking or ROUND.chair[chair].luck or boss[ROUND.chair[chair].owner] then
									ROUND.chair[chair].luck = nil
									tracking(chair)
								elseif ROUND.gameMode.fastdraw or ROUND.chair[chair].owner == "Papaille" then
									fastDraw(chair)
								else
									resetTimer()
									updateTurnTimer()
									--local new = drawCard(chair, isCursed(chair, "anvil") and 2 or 1, "PASS")
									tryDraw(chair, 1)
									if mustBeEliminated(chair) then
										eliminate(chair, true)
									elseif ROUND.gameMode.insatisfaction and ROUND.turn == chair then
										ROUND.chair[chair].confuse = false
										passTurn()
										updateShadow(chair)
										batataTimer(chair)
									elseif ROUND.gameMode.satisfaction and not canPlayHand(chair) then
										ROUND.chair[chair].draw = false
										showNeedDraw(chair)
									else
										showPass(chair)
									end
									--mimicDraw(chair, isCursed(chair, "anvil") and 2 or 1)
								end
							else
								local y = 210 - (#ROUND.deck/108 * 10)
								for i=1, 10 do
									tfm.exec.displayParticle(4, 345, y+37, math.random(-20,20)/10, math.random(-20,20)/10, 0, 0)
								end
								ui.removeTextArea(18)
								ROUND.chair[chair].draw = true
								showPass(chair)
							end
						end
					elseif (ROUND.chair[chair].draw or ROUND.chair[chair].played) and x > 675 and x < 775 and y > 275 and y < 295 then
						passTurn()
						ROUND.chair[chair].confuse = false
						updateShadow(chair)
						batataTimer(chair)
					end
				end
				if ROUND.chair[chair].clickDelay < os.time() and x > 430 and x < 480 and y > 200 and y < 285 and ROUND.topCard.card2 then
					if PLAYER[p].ctrl then
						local card = ROUND.topCard.card
						if RULE[card[2]] or CARD[card[2]] then
							if window.isOpened(p, "CARD") then
								window.update(p, "CARD", card)
							else
								closeAll(p, "CARD")
								window.open(p, "CARD", card)
							end
						end
					else
						showPreviousCard(p)
						ROUND.chair[chair].clickDelay = os.time() + 2000
					end
				elseif ROUND.chair[chair].clickDelay < os.time() and x > 675 and x < 775 and y > 240 and y < 260 and not ROUND.chair[ROUND.turn].action then
						ROUND.chair[chair].clickDelay = os.time() + 2000
						clickChallenge(chair)
				elseif (ROUND.chair[chair].uno == "one card" or #ROUND.chair[chair].hand == 1) and ROUND.chair[chair].uno ~= "uno" and x > 675 and x < 775 and y > 205 and y < 225 then
					sayUno(chair)
				end
			else
				tfm.exec.chatMessage("<r>"..translate(p, "CHAIR_ALLERT"), p)
			end
		end
	end
end)


--[[ src/events/eventNewGame.lua ]]--

onEvent("NewGame", function()
	addFunctionTimer(loadImages, 100)
	tfm.exec.snow(0)
	-- controle de início de partida
	for i=1000, 1020 do
		ui.removeTextArea(i)
	end
	ui.removeTextArea(27)
	for i=10000, 1005 do
		ui.removeTextArea(i)
	end
	ui.removeTextArea(70)
	for i, v in pairs(CONFIG.chair) do
		CONFIG.chair[i] = false
	end
	for i, v in pairs(ROUND.chair or {}) do
		ui.removeTextArea(1000+i)
		ui.removeTextArea(2000+i)
		ui.removeTextArea(3000+i)
		ui.removeTextArea(3010+i)
		system.bindMouse(v.owner, false)
		if v.owner ~= "" then
			CONFIG.chair[i] = v.owner
		end
	end
	for i=1, 30 do
		ui.removeTextArea(i)
	end
	for i, v in pairs(PLAYER) do
		v.ctrl = false
	end
	IMG.skin.classic = IMG.skin.orange
	-- AQUI
	if not validMap() then
		addFunctionTimer(function()
			newMap()
		end, 3500)
	else
		tfm.exec.addPhysicObject(3488, 400, 200, {type=14, width=3000, height=400, miceCollision=false})
		for i, v in pairs(PLAYER) do
			v.chair = nil
			v.notAfk = false
			colorNick(i)
			if v.chairDelay > 0 and tfm.get.room.uniquePlayers > 8 then
				v.spaceDelay = math.huge
				local t = v.chairDelay
				v.chairDelayTimer = {
					time = GLOBAL_TIME+3000+v.chairDelay
				}
				if v.chairDelay > 0 then
					v.chairDelayTimer.img = tfm.exec.addImage(IMG.misc.hourglass, "$"..i, -15, -45, i)
				end
			else
				v.spaceDelay = os.time()+3000
			end
			system.bindKeyboard(i, 32, true, true)
		end
		ROUND = {
			state = "START",
			time = GLOBAL_TIME+20000,
			deck = {},
			imgDeck = {},
			pile = {},
			history = {},
			gameMode = {},
			chair = {},
			team = {{},{},{},{},{}},
			topCard = {img={}, card=false},
			flow = "RIGHT",
			flowLight = 1,
			cloud = {},
			arrowImg = {},
			imgRule = {},
		}
		ROUND.chair = getChairs(tfm.get.room.xmlMapInfo.xml)
		ROUND.color = getColor(tfm.get.room.xmlMapInfo.xml)
		ROUND.cardSkin = getCardSkin(tfm.get.room.xmlMapInfo.xml)
		local bots = getBot(tfm.get.room.xmlMapInfo.xml)
		ROUND.bots = bots or {}
		local pool = {}
		for i, v in pairs(ROUND.chair) do
			drawChair(i)
			table.insert(pool, i)
		end
		randomGameMode()
		if ROUND.gameMode.overload then
			ROUND.limit = 10
			ROUND.limit2 = 10
		elseif ROUND.gameMode.limbo then
			ROUND.limit = 12
			ROUND.limit2 = 12
		else
			ROUND.limit = 30
			ROUND.limit2 = 30
		end
		
		ui.setMapName("UNO!"..(ROUND.gameMode.limit and "<r> -&gt;" or ""))
		for i, v in pairs(tfm.get.room.playerList) do
			showRules(i)
			startTip(i)
			giveTip(i)
		end
		if CONFIG.fixedChair then
			for i=1, 10 do
				if CONFIG.chair[i] and ROUND.chair[i] then
					playerSit(CONFIG.chair[i], ROUND.chair[i], i)
				end
			end
		end
		for i, v in pairs(ROUND.gameMode) do
			local name = nickFormat(i)
			if BOT[name] and not PLAYER[name].chair then
				local chair = table.remove(pool, math.random(#pool))
				if chair then
					explosion(3, ROUND.chair[chair].x, 80, 20, 20)
					playerSit(name, ROUND.chair[chair], chair)
					if BOT[name].eventWelcome then
						BOT[name].eventWelcome(chair)
					end
				else
					break
				end
			end
		end
		tfm.exec.setGameTime(5)
	end
end)


--[[ src/events/eventNewPlayer.lua ]]--

onEvent("NewPlayer", function(p)
	-- carregar dados e preparar o jogador para a sala
	if validMap() or true and p then
		ui.setMapName("UNO!"..(ROUND and ROUND.gameMode and ROUND.gameMode.limit and "<r> -&gt;" or ""))
		ui.addTextArea(4001, string.format("<p align='center'><b><a href='event:menu'>%s</a>", translate(p, "MENU")), p, 5, 380, 80, 20, 0x324650, nil, 1, true)
		ui.addTextArea(4002, string.format("<p align='center'><b><a href='event:openinventory'>%s</a>", translate(p, "INVENTORY")), p, 715, 380, 80, 20, 0x324650, nil, 1, true)
		translatedChatMessage("WELCOME_TEXT", p)
		translatedChatMessage("WELCOME_DISCORD", p, CONFIG.discord)
		if not PLAYER[p] then
			PLAYER[p] = instanceData()
		end
		system.loadPlayerData(p)
		system.bindKeyboard(p, 0, true, true) -- Esquerda
		system.bindKeyboard(p, 1, true, true) -- Cima
		system.bindKeyboard(p, 2, true, true) -- Direita
		system.bindKeyboard(p, 3, true, true) -- Baixo
		system.bindKeyboard(p, 72, true, true) -- H
		system.bindKeyboard(p, 67, true, true) -- C
		system.bindKeyboard(p, 85, true, true) -- U
		system.bindKeyboard(p, 80, true, true) -- P
		system.bindKeyboard(p, 76, true, true) -- L
		system.bindKeyboard(p, 79, true, true) -- O
		system.bindKeyboard(p, 78, true, true) -- N
		system.bindKeyboard(p, 32, true, true) -- espaço
		system.bindKeyboard(p, 17, true, true) -- ctrl
		system.bindKeyboard(p, 17, false, true) -- ctrl down
		if ROUND.chair then
			for i, v in pairs(ROUND.chair) do
				drawChair(i, p)
			end
		end
		if ROUND.gameMode then
			showRules(p)
		end
		if ROUND.state == "START" then
			startTip(p)
		elseif ROUND.state == "MULLIGAN" then
			showDeck(p)
		elseif ROUND.state == "PLAY" then
			updateArrow(p)
			updateFlow(p)
			showDeck(p)
			drawTopCard(p)
			showAccumulated(p)
			showRules(p)
			if ROUND.portal then
				table.insert(ROUND.portal.img, tfm.exec.addImage(IMG.misc[ROUND.portal.side], "!50000", 0, 0, p))
			end
		elseif ROUND.state == "FINISH" then
			showDeck(p)
			drawTopCard(p)
		end
		giveTip(p)
		tfm.exec.addPhysicObject(0, 400, 530, {height=10, width=3000})
		tfm.exec.respawnPlayer(p)
	end
	if SCORE[p] then
		tfm.exec.setPlayerScore(p, SCORE[p])
	elseif tfm.get.room.playerList[p] then
		SCORE[p] = tfm.get.room.playerList[p].score
	end
end)


--[[ src/events/eventPlayerDataLoaded.lua ]]--

onEvent("PlayerDataLoaded", function(p, data)
	if p:sub(1,1) ~= "*" and PLAYER[p] then
		playerData.unpack(p, data)
		local stats = playerData.load(p, "uno") or newData()
		playerData.save(p, "uno", stats)
		if stats then
			PLAYER[p].stats.spectator = tonumber(stats.spectator)
			PLAYER[p].stats.round = tonumber(stats.round)
			PLAYER[p].stats.victory.all = tonumber(stats.win)
			PLAYER[p].stats.victory.team = stats.team and tonumber(stats.team) or 0
			PLAYER[p].stats.victory.red = tonumber(stats.red)
			PLAYER[p].stats.victory.blue = tonumber(stats.blue)
			PLAYER[p].stats.victory.green = tonumber(stats.green)
			PLAYER[p].stats.victory.yellow = tonumber(stats.yellow)
			PLAYER[p].stats.victory.wild = tonumber(stats.wild)
			PLAYER[p].stats.victory.cian = tonumber(stats.cian or "0")
			PLAYER[p].stats.victory.orange = tonumber(stats.orange or "0")
			PLAYER[p].stats.victory.pink = tonumber(stats.pink or "0")
			PLAYER[p].stats.victory.purple = tonumber(stats.purple or "0")
			PLAYER[p].stats.victory.white = tonumber(stats.white or "0")
			PLAYER[p].stats.victory.mess = tonumber(stats.mess or "0")
			PLAYER[p].stats.victory.lightWin = tonumber(stats.lightWin or "0")
			PLAYER[p].stats.victory.darkWin = tonumber(stats.darkWin or "0")
			PLAYER[p].skin = unpackChair(stats.skin)
			PLAYER[p].rules = unpackRules(stats.rules)
			PLAYER[p].trophy = unpackTrophy(stats.trophy)
			PLAYER[p].flags = unpackFlag(stats.flags or "1")
			PLAYER[p].skinEquiped = stats.skinEquiped
			PLAYER[p].trophyEquiped = stats.trophyEquiped
			PLAYER[p].flagEquipped = stats.flagEquipped or "default"
			PLAYER[p].shadow = stats.shadow ~= "0"
			PLAYER[p].challengePopup = stats.challengePopup ~= "0"
			PLAYER[p].colorBlind = stats.colorblind == "1" or false
			PLAYER[p].bell = stats.bell == "1" or false
			PLAYER[p].community = stats.community or "auto"
			--PLAYER[p].match = stats.match or "x"
			PLAYER[p].challenge = stats.challenge and tonumber(stats.challenge) or 0
			PLAYER[p].pencil = stats.pencil and tonumber(stats.pencil) or 0
			PLAYER[p].chess = stats.chess and tonumber(stats.chess) or 0
			PLAYER[p].portal1 = stats.portal1 and tonumber(stats.portal1) or 0
			PLAYER[p].portal2 = stats.portal2 and tonumber(stats.portal2) or 0
			PLAYER[p].block = stats.block and tonumber(stats.block) or 0
			PLAYER[p].action = stats.action and tonumber(stats.action) or 0
			PLAYER[p].dayStreak = stats.dayStreak and tonumber(stats.dayStreak) or 0
			PLAYER[p].lastDayPlayed = stats.lastDayPlayed and tonumber(stats.lastDayPlayed) or 0
			--PLAYER[p].powerup.shiny = stats.shiny and tonumber(stats.shiny) or 0
			--PLAYER[p].powerup.uno = stats.uno and tonumber(stats.uno) or 0
			--PLAYER[p].powerup.bot = stats.bot and tonumber(stats.bot) or 0
			--PLAYER[p].powerup.mallet = stats.mallet and tonumber(stats.mallet) or 0
			--PLAYER[p].powerup.lamp = stats.lamp and tonumber(stats.lamp) or 0
			--PLAYER[p].powerup.rematch = stats.rematch and tonumber(stats.rematch) or 0
		end
		if PLAYER[p].stats.victory.red >= 300 then
			unlockFlag(p, "picnic", true)
		end
		if PLAYER[p].stats.victory.blue >= 300 then
			unlockFlag(p, "metal", true)
		end
		if PLAYER[p].stats.victory.yellow >= 300 then
			unlockFlag(p, "paper", true)
		end
		if PLAYER[p].stats.victory.green >= 300 then
			unlockFlag(p, "carpet", true)
		end
		if PLAYER[p].stats.victory.wild >= 300 then
			unlockFlag(p, "disco", true)
		end
		if PLAYER[p].stats.victory.team >= 10 then
			unlockRule(p, "team", true)
		end
		if PLAYER[p].stats.victory.team >= 100 then
			unlockChair(p, "breakfast", true)
		end
		if PLAYER[p].trophy.drekkemaus then
			unlockRule(p, "drekkemaus", true)
			unlockRule(p, "buffy", true)
		end
		if PLAYER[p].trophy.noel then
			unlockRule(p, "jingle", true)
			unlockRule(p, "papaille", true)
		end
		if PLAYER[p].trophy.charlotte then
			unlockRule(p, "charlotte", true)
		end
		if PLAYER[p].trophy.elisah then
			unlockRule(p, "elisah", true)
		end
		unlockRule(p, "elise", true)
		unlockChair(p, "random", true)
		PLAYER[p].loaded = true
		saveData(p)
	end
end)


--[[ src/events/eventPlayerDied.lua ]]--

onEvent("PlayerDied", function(p)
	tfm.exec.respawnPlayer(p)
end)


--[[ src/events/eventPlayerLeft.lua ]]--

onEvent("PlayerLeft", function(p)
	kickPlayer(p)
	PLAYER[p] = nil
end)


--[[ src/events/eventPlayerRespawn.lua ]]--

onEvent("PlayerRespawn", function(p)
	colorNick(p)
end)


--[[ src/events/eventPopupAnswer.lua ]]--

onEvent("PopupAnswer", function(id, p, msg)
	if p == OWNER then
		if id == 10 then
			ui.removeTextArea(99999, p)
			if #msg <= 140 and #msg ~= 0 then
				CONFIG.custom.desc = msg
				window.update(p, "CUSTOM")
			else
				tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
			end
		elseif id >= 1 and id <= 5 then
			ui.removeTextArea(99999, p)
			if #msg>0 and customValidAmount(id, msg) then
				customEditAction(p, id, "amount", msg)
				window.update(p, "CUSTOM")
			else
				tfm.exec.chatMessage("<r>"..translate(p, "CUSTOM_ERROR"), p)
			end
		end
	end
end)


--[[ src/events/eventTextAreaCallback.lua ]]--

onEvent("TextAreaCallback", function(id, p, callback, ever)
	-- controle de cliques em menus e janelas do jogo
	if not PLAYER[p] or p:sub(1,1) == "*" then
		return true
	end
	PLAYER[p].antiDoubleClick2 = PLAYER[p].antiDoubleClick2 or (os.time() - 5)
	if PLAYER[p].antiDoubleClick2 < os.time() or ever then
		PLAYER[p].antiDoubleClick2 = os.time() + 200
	else
		return false
	end
	local arg = split(callback, " ")
	if arg[1] == "menu" then
		if window.isOpened(p, "MENU") then
			window.close(p, "MENU")
		else
			closeAll(p, "MENU")
			window.open(p, "MENU")
		end
		window.close(p, "TROPHY")
	elseif arg[1] == "openinventory" then
		if window.isOpened(p, "INVENTORY") then
			window.close(p, "INVENTORY")
			window.close(p, "INFO_INVENTORY")
		else
			closeAll(p, "INVENTORY")
			window.open(p, "INVENTORY")
		end
	elseif arg[1] == "inventory" then
		if window.isOpened(p, "INVENTORY") then
			window.update(p, "INVENTORY", arg[2], arg[3] and tonumber(arg[3]))
		else
			closeAll(p, "INVENTORY")
			window.open(p, "INVENTORY", arg[2], arg[3] and tonumber(arg[3]))
		end
	elseif arg[1] == "rules" then
		closeAll(p, "RULES")
		if window.isOpened(p, "RULES") then
			window.update(p, "RULES", tonumber(arg[2]))
		else
			window.open(p, "RULES", 1)
		end
	elseif arg[1] == "settings2" then
		closeAll(p, "SETTINGS2")
		if window.isOpened(p, "SETTINGS2") then
			window.update(p, "SETTINGS2", tonumber(arg[2]))
		else
			window.open(p, "SETTINGS2", 1)
		end
	elseif arg[1] == "credits" then
		closeAll(p, "CREDITS")
		if window.isOpened(p, "CREDITS") then
			window.update(p, "CREDITS")
		else
			window.open(p, "CREDITS")
		end
	elseif arg[1] == "trophy" then
		if window.isOpened(p, "TROPHY") then
			window.update(p, "TROPHY", tonumber(arg[2]))
		else
			window.open(p, "TROPHY", 1)
		end
	elseif arg[1] == "roomoptions" then
		closeAll(p, "SETTINGS3")
		if window.isOpened(p, "SETTINGS3") then
			window.update(p, "SETTINGS3", tonumber(arg[2]))
		else
			window.open(p, "SETTINGS3", 1)
		end
	elseif arg[1] == "profile" then
		closeAll(p, "PROFILE")
		eventChatCommand(p, callback)
	elseif arg[1] == "close" then
		if arg[2] == "rules" then
			window.close(p, "RULES")
		elseif arg[2] == "chairs" then
			window.close(p, "CHAIRS")
			window.close(p, "INFOCHAIR")
		elseif arg[2] == "infochair" then
			window.close(p, "INFOCHAIR")
			window.open(p, "CHAIRS", tonumber(arg[3]))
		elseif arg[2] == "chess" then
			window.close(p, "CHESS")
		elseif arg[2] == "tip" then
			window.close(p, "TIP")
		elseif arg[2] == "house" then
			window.close(p, "HOUSE")
		elseif arg[2] == "settings" then
			window.close(p, "SETTINGS")
		elseif arg[2] == "profile" then
			window.close(p, "PROFILE")
			window.close(p, "TROPHY")
		elseif arg[2] == "leaderboard" then
			window.close(p, "LEADERBOARD")
		elseif arg[2] == "options" then
			window.close(p, "OPTIONS")
		elseif arg[2] == "custom" then
			window.close(p, "CUSTOM")
		elseif arg[2] == "settings2" then
			window.close(p, "SETTINGS2")
		elseif arg[2] == "chairs2" then
			window.close(p, "CHAIRS2")
		elseif arg[2] == "card" then
			window.close(p, "CARD")
			PLAYER[p].ctrl = false
		elseif arg[2] == "command" then
			window.close(p, "COMMAND")
		elseif arg[2] == "credits" then
			window.close(p, "CREDITS")
		elseif arg[2] == "challenge" then
			window.close(p, "CHALLENGE")
		elseif arg[2] == "inventory" then
			window.close(p, "INVENTORY")
			window.close(p, "INFO_INVENTORY")
		end
	elseif arg[1] == "tab" and arg[2] then
		local vars = window.getVars(p, "INVENTORY")
		if vars then
			vars.tab = arg[2]
			window.update(p, "INVENTORY")
		end
	elseif arg[1] == "favorites" then
		local vars = window.getVars(p, "INVENTORY")
		if vars then
			vars.fav = not vars.fav
			window.update(p, "INVENTORY")
		end
	elseif arg[1] == "equip" and arg[2] and arg[3] then
		if arg[2] == "chairs" and PLAYER[p].skin[arg[3]] then
			PLAYER[p].skinEquiped = arg[3]
			window.update(p, "INVENTORY")
			eventTextAreaCallback(id, p, "info".." "..arg[2].." "..arg[3], true)
			saveData(p)
		elseif arg[2] == "panels" and PLAYER[p].flags[arg[3]] then
			PLAYER[p].flagEquipped = arg[3]
			window.update(p, "INVENTORY")
			eventTextAreaCallback(id, p, "info".." "..arg[2].." "..arg[3], true)
			saveData(p)
		end
	elseif arg[1] == "info" and arg[2] and arg[3] then
		if window.isOpened(p, "INFO_INVENTORY") then
			window.update(p, "INFO_INVENTORY", arg[2], arg[3])
		else
			window.open(p, "INFO_INVENTORY", arg[2], arg[3])
		end
	elseif arg[1] == "addfavorite" and arg[2] and arg[3] then
		if arg[2] == "chairs" and PLAYER[p].skin[arg[3]] then
			PLAYER[p].skin[arg[3]] = PLAYER[p].skin[arg[3]] == 2 and 1 or 2
			window.update(p, "INFO_INVENTORY", arg[2], arg[3])
			window.update(p, "INVENTORY")
			saveData(p)
		elseif arg[2] == "panels" and PLAYER[p].flags[arg[3]] then
			PLAYER[p].flags[arg[3]] = PLAYER[p].flags[arg[3]] == 2 and 1 or 2
			window.update(p, "INFO_INVENTORY", arg[2], arg[3])
			window.update(p, "INVENTORY")
			saveData(p)
		end
	elseif arg[1] == "rule" then
		if window.isOpened(p, "TIP") then
			window.update(p, "TIP", arg[2])
		else
			window.open(p, "TIP", arg[2])
		end
	elseif arg[1] == "chess" then
		closeAll(p, "CHESS")
		window.open(p, "CHESS")
	elseif arg[1] == "house" then
		closeAll(p, "HOUSE")
		window.open(p, "HOUSE")
	elseif arg[1] == "settings" then
		closeAll(p, "SETTINGS2")
		window.open(p, "SETTINGS2")
	elseif arg[1] == "profile" then
		closeAll(p, "PROFILE")
		window.open(p, "PROFILE")
	elseif arg[1] == "options" then
		closeAll(p, "OPTIONS")
		window.open(p, "OPTIONS")
	elseif arg[1] == "equipt" then
		PLAYER[p].trophyEquiped = arg[2]
		saveData(p)
		window.close(p, "TROPHY")
		window.update(p, "PROFILE", p)
	elseif arg[1] == "setrule" then
		eventChatCommand(p, "rule "..arg[2].." "..arg[3])
	elseif arg[1] == "clearrules" then
		eventChatCommand(p, "clearrules")
	elseif arg[1] == "fixedrules" then
		eventChatCommand(p, "random")
	elseif arg[1] == "fixedchair" then
		eventChatCommand(p, "fixedchair")
	elseif arg[1] == "newplayers" then
		eventChatCommand(p, "newplayers")
	elseif arg[1] == "scoreby" then
		eventChatCommand(p, "scoreby")
	elseif arg[1] == "resetscore" then
		eventChatCommand(p, "resetscore")
	elseif arg[1] == "autostart" then
		eventChatCommand(p, "autostart")
	elseif arg[1] == "commands" then
		eventChatCommand(p, "commands")
	elseif arg[1] == "colorblind" then
		eventChatCommand(p, "color")
		window.update(p, "OPTIONS")
	elseif arg[1] == "bell" then
		eventChatCommand(p, "bell")
		window.update(p, "OPTIONS")
	elseif arg[1] == "shadow" then
		eventChatCommand(p, "shadow")
		window.update(p, "OPTIONS")
	elseif arg[1] == "challengepopup" then
		eventChatCommand(p, "challengepopup")
		window.update(p, "OPTIONS")
	elseif arg[1] == "community" then
		eventChatCommand(p, "community")
		window.update(p, "OPTIONS")
	elseif arg[1] == "party" then
		tfm.exec.chatMessage(string.format("<vp>/room #unotfm0<b>%s</b>", p), p)
		tfm.exec.chatMessage(string.format("<vp>/room #unotfm0<b>%s</b>#music", p), p)
	elseif arg[1] == "copy" then
		customEditCopies(arg[2])
		window.update(p, "CUSTOM")
	elseif arg[1] == "desc" then
		ui.addTextArea(99999, "", p, 55, 65, 690, 290, 0x142B2E, 0x142B2E, 0.8, true)
		ui.addPopup(10, 2, translate(p, "CUSTOM_DESC_INFO"), p, 200, 200, 400, true)
	elseif arg[1] == "remove" then
		customRemoveAction(p, tonumber(arg[2]))
		window.update(p, "CUSTOM")
	elseif arg[1] == "edit" then
		ui.addTextArea(99999, "", p, 55, 65, 690, 290, 0x142B2E, 0x142B2E, 0.8, true)
		if arg[3] == "amount" then
			local txt = "2 => "..string.format(translate(p, "AMOUNT_X"), 2)
			txt = txt .. "\n1-5 => "..string.format(translate(p, "AMOUNT_RANGE"), 1, 5)
			txt = txt .. "\n#3 => "..string.format(translate(p, "AMOUNT_UNTIL"), 3)
			txt = txt .. "\n&1 => "..string.format(translate(p, "AMOUNT_RETURN"), 1)
			ui.addPopup(tonumber(arg[2]), 2, txt, p, 300, 180, 200, true)
		else
			local txt = printOptions(p, tonumber(arg[2]), arg[3])
			ui.addTextArea(99998, txt, p, 300, 140, 200, nil, 0x324650, 0x090D0F, 1, true)
		end
	elseif arg[1] == "addrule" then
		ui.addTextArea(99999, "", p, 55, 65, 690, 290, 0x142B2E, 0x142B2E, 0.8, true)
		local txt = printAdd(p)
		ui.addTextArea(99998, txt, p, 300, 140, 200, nil, 0x324650, 0x090D0F, 1, true)
	elseif arg[1] == "exit" then
		ui.removeTextArea(99999, p)
		ui.removeTextArea(99998, p)
	elseif arg[1] == "add" then
		ui.removeTextArea(99999, p)
		ui.removeTextArea(99998, p)
		customAddAction(p, arg[2])
		window.update(p, "CUSTOM")
	elseif arg[1] == "edit2" then
		ui.removeTextArea(99999, p)
		ui.removeTextArea(99998, p)
		customEditAction(p, tonumber(arg[2]), arg[3], arg[4])
		window.update(p, "CUSTOM")
	elseif arg[1] == "custom" then
		closeAll(p, "CUSTOM")
		window.open(p, "CUSTOM")
	elseif arg[1] == "play" then
		addEntry(p)
	elseif arg[1] == "curse" then
		showCurse(p)
	elseif arg[1] == "tip" then
		if PLAYER[p].chair and ROUND.state == "PLAY" then
			ui.removeTextArea(33, p)
			ui.removeTextArea(32, p)
		else
			giveTip(p)
		end
	elseif arg[1] == "challenge" then
		window.close(p, "CHALLENGE")
		local chair = PLAYER[p].chair
		if chair and ROUND.turn == chair and ROUND.accumulated and ROUND.topCard.card[2] == "draw4" then
			challengeDrawFour(chair)
		end
	elseif arg[1] == "support" then
		tfm.exec.chatMessage("<vp>https://a801-luadev.github.io/?redirect=unotfm", p)
	end
end)


--[[ src/ui/active_rules.lua ]]--

window.create("HOUSE", function(player, var, name, page)

	local pool = {}
	local order = {"dos","neighbor","custom","red","blue","green","bluegreen","yellow","ninguem","flash","jumpin","stack","sequence","hard","limbo","overload","perfection","satisfaction","insatisfaction","tracking","fastdraw","clean","nocombo","supercombo","hell","black","nochallenge","simon","imitate","shiny","batata","bomb","draw99","compass","curse","confuse","justice","magnet","peace","steal","theft","death","portal","ink","dice","paradox","half","oddeven","mimic","ban","mix","gift","trade","web","tornado","carousel","luck","chair","spy","thunder","rain","equality","meep","wish","box","random","clone","key","share","rule","chess","team","camouflage","limit","noaction","mess","revelation","mini","maxi","mulligan","drekkemaus","jingle","papaille","charlotte","elisah","buffy","snowy","icemice","elise"}
	for i, v in pairs(order) do
		if ROUND.gameMode[v] then
			table.insert(pool, v)
		end
		--if #pool >= 18*3 then
		--  break
		--end
	end

	local x = 170
	local width = 530
	local height = 30+math.ceil(#pool/3)*16
	local y = 250-height/2
	y = y+height > 400 and 400 - height or y
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(506, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(507, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(508, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(509, string.format("<p align='center'><a href='event:close house'>", page)..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	-- título da janela
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	
	-- cartas e descrições
	local color = {
		CARD = "FFFFFF",
		PASSIVE = "B3E5FC",
		BOSS = "FFE0B2",
		EXTRA = "EF9A9A",
	}
	
	local text = {500,501,502,503,504,505,506,507,508,509,519}
	for i=1, 22 do
		for j=1, 3 do
			local name = table.remove(pool, 1)
			if name then
				local t = string.format("<font color='#%s'><b><a href='event:rule %s'>%s</b>", color[RULE[name].type], name, translate(player, RULE[name].name))
				ui.addTextArea(200+i*12+j, t, player, 170*j+20, i*16+y-15, 150, nil, 0, 0, 0, true)
				table.insert(text, 200+i*12+j)
				if RULE[name].img then
					table.insert(imageId, tfm.exec.addImage(RULE[name].img, "&10", 170*j, i*16+y-17, player))
				end
			end
		end
	end
	return text, imageId
end)


--[[ src/ui/card_tip.lua ]]--

window.create("CARD", function(player, var, card)
	local x = 250 -- 145 = +55
	local y = 210 -- 100 = +40
	local width = 300
	local height = 110
	if card[2] == "draw4" then
		x = 200
		width = 400
	end
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(506, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(507, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(508, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(509, string.format("<p align='center'><a href='event:close card'>", page)..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	-- título da janela
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	
	-- cartas e descrições
	local text = {500,501,502,503,504,505,506,507,508,509,519,520}
	local c = showCard(card, x+10, y+5, player, "&1000")
	for i, v in pairs(c) do
		table.insert(imageId, v)
	end
	local desc = RULE[card[2]] and RULE[card[2]].desc or CARD[card[2]]
	if desc then
		ui.addTextArea(520, string.format("<font size='%spx'>"..translate(player, desc), card[2] == "draw4" and 10 or 12), player, x+65, y+5, width-65, nil, 0, 0, 0, true)
	end
	return text, imageId
end)


--[[ src/ui/chair_info.lua ]]--

window.create("INFOCHAIR2", function(player, var, name, page)
	local x = 200
	local y = 100
	local width = 200
	local height = 220
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- título da janela
	ui.addTextArea(519, string.format("<p align='center'><j><font size='15px'><b>%s</b></font></j>\n<font size='10px'>%s %s", translate(player, SKIN[name].name) or "", translate(player, "CREATED_BY") or "", SKIN[name].author) or "", player, 200, y+5, 200, nil, 0, 0, 0, true)
	
	local desc = translate(player, SKIN[name].desc)
	local mission = translate(player, SKIN[name].mission)
	local strprogress = progress(player, name)
	local formated = string.format("<p align='center'><font size='10px'><i>'%s'</i>\n\n<b>%s</b>\n<bl>%s", desc or "", mission or "", strprogress or "")
	
	ui.addTextArea(520, formated, player, 200, y+110, 200, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	table.insert(imageId, tfm.exec.addImage(SKIN[name].img, "&1", 250, y+10, player))
	return {500,501,502,503,504,505,506,507,508,509,519,520}, imageId
end)


--[[ src/ui/chair_list.lua ]]--

window.create("CHAIRS2", function(player, var, page)
	local x = 410
	local y = 27
	local width = 385
	local height = 340
	-- janela
	ui.addTextArea(100, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(101, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(102, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(103, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(104, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(105, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	
	-- botão powerups
	--ui.addTextArea(106, "", player, x+8, y+height-22, width/3-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	--ui.addTextArea(107, "", player, x+9, y+height-21, width/3-16, 13, 0xe1619, 0xe1619, alpha, true)
	--ui.addTextArea(108, "", player, x+9, y+height-21, width/3-17, 12, 0x314e57, 0x314e57, alpha, true)
	--ui.addTextArea(109,  string.format("<p align='center'>%s (K)", translate(player, "POWERUPS")), player, x+9, y+height-24, width/3-17, nil, 0x314e57, 0x314e57, 0, true)
	--ui.addTextArea(120, "<p align='right'><a href='event:powerups'> ", player, x+9, y+height-24, width/3-17, nil, 0, 0, 0, true)
	ui.addTextArea(120, "", player, x+3, y+height-22, width/3-9, 16, 0x142B2E, 0x142B2E, 0.7, true)
	
	-- botão cadeiras
	ui.addTextArea(206, "", player, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(207, "", player, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(208, "", player, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(209, string.format("<p align='center'>%s (C)", translate(player, "CHAIRS")), player, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
	--ui.addTextArea(220, "<p align='right'><a href='event:chairs2'> ", player, x+width/3+3, y+height-24, width/2-17, nil, 0, 0, 0, true)
	ui.addTextArea(220, "", player, x+3, y+height-22, width/2-9, 16, 0x142B2E, 0x142B2E, 0.7, true)
	
	-- botão paineis
	ui.addTextArea(306, "", player, x+width/2+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(307, "", player, x+width/2+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(308, "", player, x+width/2+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(309, string.format("<p align='center'>%s (N)", translate(player, "PANELS")), player, x+width/2+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(320, "<p align='right'><a href='event:panels'> ", player, x+width/2+9, y+height-24, width/3-17, nil, 0, 0, 0, true)
	--ui.addTextArea(320, "", player, x+width/2+3, y+height-22, width/2-9, 16, 0x142B2E, 0x142B2E, 0.7, true)
	
	-- título da janela
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "CHAIRS"), player, x+10, y, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {100,101,102,103,104,105,106,107,108,109,119,120,206,207,208,209,219,220,306,307,308,309,319,320}, imageId
end,
function(p, var, page)
	page = page or PLAYER[p].chairPage or 1
	PLAYER[p].chairPage = page
	PLAYER[p].inventory = "chairs2"
	local x = 410
	local y = 27
	local width = 385
	local height = 340
	local pool = {"default", "red", "blue", "yellow", "green", "white", "cyan", "orange", "pink", "purple", "black", "fire", "water", "earth", "air", "rainbow", "toxic", "thunder", "crystal", "dark", "light", "wood", "stone", "cat", "garden", "friend", "anvil", "gold", "diamond", "unicorn", "cheese", "football", "king", "luck", "chocolate", "angel", "hell", "cards", "junky", "trash", "shaman", "beach", "cine", "newspaper", "radio", "television", "computer", "candy", "fraise", "illuminati", "loot", "elemental", "gift", "heart", "bog", "got", "breakfast", "hamburguer", "skull", "bones", "school", "time", "pencil", "chess", "show", "falls", "psycho", "potato", "rip", "apple", "marine", "guitar", "popcorn", "wonderland", "cuphead", "astral", "bootcamp", "gaga", "gothic", "mecatopus", "pumpkin", "ufo", "aquarium", "help", "font", "chimney", "circus", "cisne", "coffee", "croissant", "space", "mermaid", "phone", "quartz", "snowman", "totoro", "vangogh", "chest", "coca", "flamingo", "honey", "old", "pineapple", "sack", "smartphone", "vampire", "moon", "max", "bill", "horn", "toast", "pizza", "samson", "fashion", "undertale", "forest", "kiss", "mountain", "pikachu", "simpsons", "truelove", "eclipse", "toothless", "lightfury", "kratos", "shenlong", "spider", "random"}
	local pageMax = math.ceil(#pool / 8)
	local txt={110,111,112,113,114,115,116,117,121,122,123}
	local img={}
	if page > 1 then
		-- botão de voltar
		local y = y - 25
		ui.addTextArea(110, "", p, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(111, "", p, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(112, "", p, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(113, string.format("<p align='center'>%s", translate(p, "PREVIOUS")), p, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(121, string.format("<p align='right'><a href='event:chairs2 %s'> ", page-1), p, x+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	if page < pageMax then
		-- botão de avançar
		local y = y - 25
		ui.addTextArea(114, "", p, x+8+width/2, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(115, "", p, x+9+width/2, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(116, "", p, x+9+width/2, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(117, string.format("<p align='center'>%s", translate(p, "NEXT")), p, x+9+width/2, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(122, string.format("<p align='right'><a href='event:chairs2 %s'> ", page+1), p, x+9+width/2, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	-- cadeiras
	local unlocked = {}
	local locked = {}
	for i, v in pairs(pool) do
		table.insert(PLAYER[p].skin[v] and unlocked or locked, v)
	end
	pool = unlocked
	for i, v in pairs(locked) do
		table.insert(pool, v)
	end
	for z=1, 8 do
		local ini = (page-1)*8+z
		local w = pool[ini]
		local i = math.ceil(z/4)
		local j = (z-1)%4+1
		if w then
			ui.addTextArea(200+i*12+j, string.format("<p align='center'><a href='event:infochair2 %s %s'>", w, page)..translate(p, SKIN[w].name), p, 95*j+325, (i-1)*115+75, 80, 100, PLAYER[p].skin[w] and 0x6a7495 or -1, 1, 0.2, true)
			local text = "<p align='center'>"
			local color = 0x102224
			table.insert(img, tfm.exec.addImage(SKIN[w].imgMini, "&2", 95*j+325, i*115-20, p))
			if not PLAYER[p].skin[w] then
				text = text .. "<bl>" .. string.format("<bl><a href='event:infochair2 %s %s'>", w, page) .. translate(p, "LOCKED")
				--color = 0x102224
				table.insert(img, tfm.exec.addImage(IMG.misc.locked, "&10", 95*j+325, i*115-20, p))
			elseif PLAYER[p].skinEquiped == w then
				text = text .. "<j>" .. translate(p, "EQUIPPED")
				color = 0xBABD2F
			else
				text = text .. string.format("<a href='event:equip %s %s'>", w, page) .. translate(p, "EQUIP")
			end
			ui.addTextArea(300+i*12+j, text, p, 95*j+325, (i-1)*115+155, 80, 20, -1, color, 1, true)
			table.insert(txt, 200+i*12+j)
			table.insert(txt, 300+i*12+j)
		end
	end
	local pages = {}
	for i=1, pageMax do
		if i == page then
			table.insert(pages, string.format("<j>%s", i))
		else
			table.insert(pages, string.format("<n><a href='event:chairs2 %s'>%s</a>", i, i))
		end
	end
	ui.addTextArea(123, string.format("<p align='center'>%s", table.concat(pages, " - ")), p, x+10, y+268, width-20, p, 0, 0, 0, true)
	return txt, img
end)


--[[ src/ui/challenge.lua ]]--

window.create("CHALLENGE", function(player, var, card)
	local x = 240 -- 145 = +55
	local y = 200 -- 100 = +40
	local width = 300
	local height = 110
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	
	-- botão sim
	ui.addTextArea(506, "", player, x+8, y+height-22, width/2-16, 13, 0xFFE45E, 0xFFE45E, alpha, true)
	ui.addTextArea(507, "", player, x+9, y+height-21, width/2-16, 13, 0x635200, 0x635200, alpha, true)
	ui.addTextArea(508, "", player, x+9, y+height-21, width/2-17, 12, 0xC6A500, 0xC6A500, alpha, true)
	ui.addTextArea(509, string.format("<font color='#3D3100'><p align='center'>%s", translate(player, "YES")), player, x+9, y+height-24, width/2-17, nil, 0x314e57, 0xffff00, 0, true)
	ui.addTextArea(510, "<p align='right'><a href='event:challenge'> ", player, x+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	
	-- botão não
	ui.addTextArea(511, "", player, x+width/2+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(512, "", player, x+width/2+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(513, "", player, x+width/2+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(514, string.format("<p align='center'>%s", translate(player, "NO")), player, x+width/2+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(515, "<p align='right'><a href='event:close challenge'> ", player, x+width/2+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	
	-- cartas e descrições
	local text = {500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516}
	local c = showCard(card, x+10, y+5, player, "&1000")
	table.insert(imageId, c[1])
	table.insert(imageId, c[2])
	local previous = previousChair(ROUND.turn)
	previous = nickMinifier(nickHashtag(ROUND.chair[previous].owner))
	ui.addTextArea(516, string.format("<p align='center'><font size='14px'>"..translate(player, "CHALLENGE_COLOR"), previous), player, x+65, y+20, width-65, nil, 0, 0, 0, true)
	return text, imageId
end)


--[[ src/ui/command_list.lua ]]--

window.create("COMMAND", function(player, var)
	local x = 125 -- 145 = +55
	local y = 100 -- 100 = +40
	local width = 550
	local height = 180
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(506, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(507, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(508, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(509, string.format("<p align='center'><a href='event:close command'>", page)..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	-- título da janela
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	
	-- cartas e descrições
	local text = {500,501,502,503,504,505,506,507,508,509,519,520}
	
	local desc = "<j><b>!start</b><n> : "..translate(player, "COMMAND_START")
	desc = desc .. "\n<j><b>!new</b><n> : "..translate(player, "COMMAND_NEW")
	desc = desc .. "\n<j><b>!map code</b><n> : "..translate(player, "COMMAND_MAP")
	desc = desc .. "\n<j><b>!reset</b><n> : "..translate(player, "COMMAND_RESET")
	desc = desc .. "\n<j><b>!chair num name</b><n> : "..translate(player, "COMMAND_CHAIR")
	desc = desc .. "\n<j><b>!kick name</b><n> : "..translate(player, "COMMAND_KICK")
	desc = desc .. "\n<j><b>!ban name</b><n> : "..translate(player, "COMMAND_BAN")
	desc = desc .. "\n<j><b>!unban name</b><n> : "..translate(player, "COMMAND_UNBAN")
	desc = desc .. "\n<j><b>!adm name</b><n> : "..translate(player, "COMMAND_ADM")
	desc = desc .. "\n<j><b>!pw</b><n> : "..translate(player, "COMMAND_PW")
	desc = desc .. "\n<j><b>!spectator</b><n> : "..translate(player, "COMMAND_SPECTATOR")
	ui.addTextArea(520, desc, player, x+5, y+5, width-10, nil, 0, 0, 0, true)
	return text, imageId
end)


--[[ src/ui/credits.lua ]]--

window.create("CREDITS", function(player, var)
	local x = 125 -- 145 = +55
	local y = 40 -- 100 = +40
	local width = 550
	local height = 340
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(506, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(507, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(508, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(509, string.format("<p align='center'><a href='event:close credits'>", page)..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	-- título da janela
	ui.addTextArea(510, "<p align='center'><font size='25px'><j><b>"..translate(player, "CREDITS"), player, x+10, y+10, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	
	-- cartas e descrições
	local text = {500,501,502,503,504,505,506,507,508,509,510,519,520}
	
	local thanks = {
		{reason="THANKS_TRANSLATE", extra="EN", names={"Barberserk#0000"}},
		{reason="THANKS_TRANSLATE", extra="PL", names={"Rkubi#0000"}},
		{reason="THANKS_TRANSLATE", extra="RU", names={"Fran_bow#1314"}},
		{reason="THANKS_TRANSLATE", extra="ES", names={"Niopigaa#0000"}},
		{reason="THANKS_TRANSLATE", extra="FR", names={"Urook#1131"}},
		{reason="THANKS_TRANSLATE", extra="CN", names={"Wrfg#0000"}},
		{reason="THANKS_TRANSLATE", extra="HU", names={"Weth#9837","Martinkat#0000"}},
		{reason="THANKS_TRANSLATE", extra="TR", names={"Eralpciko#0000","Star#6725","Cileklidonut#8059"}},
		{reason="THANKS_CARDS", names={"Billysmille#0000"}},
		{reason="THANKS_POPUPS", names={"Esh#0095"}},
	}
	
	local t = translate(player, "CREDIT_TXT") .. "\n\n" .. translate(player, "CREDIT_TXT2") .."\n\n" .. translate(player, "THANKS") .. ":\n"
	
	for i, v in pairs(thanks) do
		t = t .. string.format("<v>%s <j>(%s) <n>| ", table.concat(v.names, ", "), translate(player, v.reason))
		if v.extra then
			t = string.format(t, v.extra)
		end
	end
	
	ui.addTextArea(520, t, player, x+5, y+50, width-10, nil, 0, 0, 0, true)
	return text, imageId
end)


--[[ src/ui/custom_card.lua ]]--

window.create("CUSTOM", function(player, var)
	local x = 50
	local y = 60
	local width = 700
	local height = 300
	-- janela
	ui.addTextArea(100, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(101, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(102, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(103, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(104, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(105, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(106, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(107, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(108, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(109, "<p align='center'>"..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(120, "<p align='right'><a href='event:close custom'> ", player, x+9, y+height-24, width-17, nil, 0, 0, 0, true)
	-- título da janela
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "CUSTOM"), player, x+10, y+10, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {100,101,102,103,104,105,106,107,108,109,119,120}, imageId
end,
function(p, var)
	local x = 50
	local y = 60
	local width = 700
	local height = 300
	for i, v in pairs(CONFIG.custom.action) do
		ui.addTextArea(109+i, printAction(p, i), p, x+10, 80+i*30, width-20, nil, 0, 0, 0, true)
	end
	if #CONFIG.custom.action < 5 then
		ui.addTextArea(115, string.format("<vp><a href='event:addrule'>[%s]</a>", translate(p, "ADD_ACTION")), p, x+10, 110+(#CONFIG.custom.action*30), width-20, nil, 0, 0, 0, true)
	end
	ui.addTextArea(116, string.format("%s: <r><a href='event:copy red'>[%s]</a> <bv><a href='event:copy blue'>[%s]</a> <a:active><a href='event:copy yellow'>[%s]</a> <vp><a href='event:copy green'>[%s]</a>", translate(p, "CUSTOM_COPIES"), CONFIG.custom.color.red, CONFIG.custom.color.blue, CONFIG.custom.color.yellow, CONFIG.custom.color.green), p, x+10, y+210, width-20, nil, 0, 0, 0, true)
	ui.addTextArea(117, string.format("%s: <bl><i>'%s'</i> <j><a href='event:desc'>[%s]", translate(p, "CUSTOM_DESC"), CONFIG.custom.desc or translate(p, "CUSTOM_DESC_INFO"), translate(p, "CUSTOM_EDIT")), p, x+10, y+230, width-20, nil, 0, 0, 0, true)
	return {110,111,112,113,114,115,116,117,99999,99998}
end)


--[[ src/ui/info_inventory.lua ]]--

window.create("INFO_INVENTORY", function(player, var, tab, name)
	local txt, img = {}, {}
	local x, y, width, height = 65, 47, 206, 300
	table.insert(img, tfm.exec.addImage("17286e18739.png", ":1", x, y, player))
	return txt, img
end,
function(player, var, tab, name)
	local txt, img = {150, 151, 152, 153, 154, 155}, {}
	local x, y, width, height = 65, 47, 206, 300
	local list = {chairs = CHAIRLIST, panels = PANELLIST}
	list = list[tab]
	local inventory = {chairs = "skin", panels = "flags"}
	inventory = inventory[tab]
	local tableref = {chairs = SKIN, panels = FLAG}
	tableref = tableref[tab]
	local equipref = {chairs = "skinEquiped", panels = "flagEquipped"}
	equipref = equipref[tab]
	local imgref = {chairs = "imgMini", panels = "imgDesc"}
	imgref = imgref[tab]
	ui.addTextArea(150, string.format("<p align='center'><j><font size='15px'><b>%s</b></font></j>\n<font size='10px'>%s %s", translate(player, tableref[name].name) or "", translate(player, "CREATED_BY") or "", tableref[name].author) or "", player, x+8, y+10, width-6, nil, 0, 0, 0, true)
	
	if tab == "chairs" or tab == "panels" then
		local chair = tab == "chairs" and name or PLAYER[player].skinEquiped
		local panel = tab == "panels" and name or PLAYER[player].flagEquipped
		local nickname = nickMinifier(nickHashtag(player))
		table.insert(img, tfm.exec.addImage(SKIN[chair].img, ":3", x+58, y+20, player))
		table.insert(img, tfm.exec.addImage("172876442e7.png", ":3", x+8, y+115, player))
		if FLAG[panel].img.big then
			table.insert(img, tfm.exec.addImage(FLAG[panel].img.big, ":3", x+58, y+115, player))
		end
		ui.addTextArea(151, string.format("<b><p align='center'><font color='#000000'>%s<b>\n<font size='18px'>UNO!", nickname), player, x+9, y+116, 200, 60, 0, 0, 0, true)
		ui.addTextArea(152, string.format("<b><p align='center'><font color='#ffffff'>%s</font><b>\n<font size='18px' color='#4CFF00'>UNO!", nickname), player, x+8, y+115, 200, 60, 0, 0, 0, true)
	end
	--ui.addTextArea(520, string.format("<p align='center'><font size='10px'>%s\n\n<b>%s</b>\n<bl>%s", translate(player, FLAG[name].desc), translate(player, FLAG[name].mission), progressFlag(player, name)), player, 200, y+110, 200, nil, 0, 0, 0, true)
	local mission = translate(player, tableref[name].mission, tableref[name].progress)
	local desc = tableref[name].desc and "<bl><font size='10px'><i>"..translate(player, tableref[name].desc).."</i></font>\n\n" or ""
	ui.addTextArea(153, "<p align='center'>"..desc.."<n><b>"..mission, player, x+8, y+160, width-6, nil, 0, 0, 0, true)
	if PLAYER[player][inventory][name] then
		if PLAYER[player][inventory][name] == 3 then
			PLAYER[player][inventory][name] = 1
			window.update(player, "INVENTORY")
			saveData(player)
		end
		table.insert(img, tfm.exec.addImage(PLAYER[player][inventory][name]==2 and "1726d406322.png" or "1726d4041dc.png", ":3", x+20, y+270, player))
		ui.addTextArea(154, "<vp>"..translate(player, "FAVORITES_ADD"), player, x+40, y+269, nil, nil, 0, 0, 0, true)
		addLink(155, "addfavorite "..tab.." "..name, player, x+15, y+270, 180, 20, true)
	else
		local actual, max = progress(player, tab, name)
		if actual then
			if actual > 0 then
				local w = 176 * (actual/max)
				ui.addTextArea(154, "", player, x+18, y+269, w, 18, 0x253942, 0x253942, 1, true)
			end
			ui.addTextArea(155, "<p align='center'><j>"..actual.." / "..max, player, x+16, y+269, 180, 18, -1, 0x102224, 1, true)
		end
	end
	return txt, img
end)


--[[ src/ui/inventory.lua ]]--

function addLink(id, command, player, x, y, width, height, fixed)
	ui.addTextArea(id, string.format("<a href='event:%s'><p align='right'>%s", command, string.rep("\n", math.floor(height/12))), player, x, y, width, height, 0, 0, 0, fixed)
end

CHAIRLIST = {"random", "default", "red", "blue", "yellow", "green", "white", "cyan", "orange", 
	"pink", "purple", "black", "fire", "water", "earth", "air", "rainbow", "toxic", "thunder", 
	"crystal", "dark", "light", "wood", "stone", "cat", "garden", "friend", "anvil", "gold", 
	"diamond", "unicorn", "cheese", "football", "king", "luck", "chocolate", "angel", "hell", 
	"cards", "junky", "trash", "shaman", "beach", "cine", "newspaper", "radio", "television", 
	"computer", "candy", "fraise", "illuminati", "loot", "elemental", "gift", "heart", "bog", 
	"got", "breakfast", "hamburguer", "skull", "bones", "school", "time", "pencil", "chess", 
	"show", "falls", "psycho", "potato", "rip", "apple", "marine", "guitar", "popcorn", 
	"wonderland", "cuphead", "astral", "bootcamp", "gaga", "gothic", "mecatopus", "pumpkin", 
	"ufo", "aquarium", "help", "font", "chimney", "circus", "cisne", "coffee", "croissant", 
	"space", "mermaid", "phone", "quartz", "snowman", "totoro", "vangogh", "chest", "coca", 
	"flamingo", "honey", "old", "pineapple", "sack", "smartphone", "vampire", "moon", "max", 
	"bill", "horn", "toast", "pizza", "samson", "fashion", "undertale", "forest", "kiss", 
	"mountain", "pikachu", "simpsons", "truelove", "eclipse", "toothless", "lightfury", 
	"kratos", "shenlong", "spider", }
PANELLIST = {"default", "picnic", "metal", "paper", "carpet", "disco", "cloud", "circuit"}

window.create("INVENTORY", function(player, var, tab, page)
	local txt, img = {119, 120, 121, 122, 123, 124, 125, 126, 127}, {}
	local x, y, width, height = 270, 20, 530, 340
	-- fundo
	table.insert(img, tfm.exec.addImage("17272d7f862.png", ":1", x, y, player))
	-- titulo
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "INVENTORY"), player, x+10, y+8, width-20, nil, 0, 0, 0, true)
	-- abas
	ui.addTextArea(120, translate(player, "CHAIRS"), player, x+39+15, y+52, 80, 18, 0, 0, 0, true)
	addLink(121, "tab chairs", player, x+34, y+52, 90, 18, true)
	ui.addTextArea(122, translate(player, "PANELS"), player, x+39+93+15, y+52, 80, 18, 0, 0, 0, true)
	addLink(123, "tab panels", player, x+34+93, y+52, 90, 18, true)
	ui.addTextArea(124, translate(player, "FAVORITES"), player, x+39+93+93+15, y+52, nil, nil, 0, 0, 0, true)
	addLink(125, "favorites", player, x+34+93+93, y+52, 90, 18, true)
	-- botão fechar
	ui.addTextArea(126, "<p align='center'>"..translate(player, "CLOSE"), player, x+9, y+height-17, width-17, nil, 0, 0, 0, true)
	addLink(127, "close inventory", player, x+9, y+height-17, width-17, 20, true)
	return txt, img
end,
function(player, var, tab, page)
	local txt, img = {128, 129, 130}, {}
	local x, y, width, height = 270, 20, 530, 340
	var.tab = tab or var.tab or "chairs"
	var.page = var.page or {}
	var.page[var.tab] = page or var.page[var.tab] or 1
	var.fav = var.fav or false
	table.insert(img, tfm.exec.addImage(var.tab == "chairs" and "17272e2e9bd.png" or "17272e306ca.png", ":1", x+37, y+53, player))
	table.insert(img, tfm.exec.addImage(var.tab == "panels" and "17272e2e9bd.png" or "17272e306ca.png", ":1", x+37+93, y+53, player))
	table.insert(img, tfm.exec.addImage(var.fav and "1726d406322.png" or "1726d4041dc.png", ":1", x+37+93+93, y+53, player))
	local list = {chairs = CHAIRLIST, panels = PANELLIST}
	list = list[var.tab]
	local inventory = {chairs = "skin", panels = "flags"}
	inventory = inventory[var.tab]
	local tableref = {chairs = SKIN, panels = FLAG}
	tableref = tableref[var.tab]
	local equipref = {chairs = "skinEquiped", panels = "flagEquipped"}
	equipref = equipref[var.tab]
	local imgref = {chairs = "imgMini", panels = "imgDesc"}
	imgref = imgref[var.tab]
	-- filtrar itens
	local unlocked, locked, show = {}, {}, {}
	for i, v in pairs(list) do
		table.insert(PLAYER[player][inventory][v] and unlocked or locked, v)
	end
	if var.fav then
		for i, v in pairs(unlocked) do
			if PLAYER[player][inventory][v] == 2 then
				table.insert(show, v)
			end
		end
	else
		show = unlocked
		for i, v in pairs(locked) do
			table.insert(show, v)
		end
	end
	-- avançar e voltar paginas
	local pageMax = math.ceil(#show/10)
	if var.page[var.tab] > pageMax and pageMax > 0 then
		var.page[var.tab] = pageMax
	end
	if var.page[var.tab] > 1 then
		addLink(128, "inventory "..var.tab.." "..var.page[var.tab]-1, player, x+7, y+174, 26, 26, true)
	else
		ui.addTextArea(128, "", player, x+12, y+179, 16, 16, 0x142B2E, 0x142B2E, 1, true)
	end
	if var.page[var.tab] < pageMax then
		addLink(129, "inventory "..var.tab.." "..var.page[var.tab]+1, player, x+497, y+174, 26, 26, true)
	else
		ui.addTextArea(129, "", player, x+502, y+179, 16, 16, 0x142B2E, 0x142B2E, 1, true)
	end
	-- numeros das paginas
	local pages = {}
	for i=1, pageMax do
		if i == var.page[var.tab] then
			table.insert(pages, string.format("<j><u>%s</u>", i))
		else
			table.insert(pages, string.format("<n><a href='event:inventory %s %s'>%s</a>", var.tab, i, i))
		end
	end
	ui.addTextArea(130, string.format("<p align='center'>%s", table.concat(pages, " - ")), player, x+10, y+298, width-20, player, 0, 0, 0, true)
	-- mostrar itens
	for z=1, 10 do
		local ini = (var.page[var.tab]-1)*10+z
		local w = show[ini]
		local i = math.ceil(z/5)
		local j = (z-1)%5+1
		if w then
			local colorTag = ""
			local text = "<p align='center'>"
			local color = 0x102224
			table.insert(img, tfm.exec.addImage(tableref[w][imgref], ":1", 93*(j-1)+x+39, 113*(i-1)+y+101, player))
			
			if not PLAYER[player][inventory][w] then
				text = text .. "<bl>" .. translate(player, "LOCKED")
				ui.addTextArea(600+i*12+j, "", player, 93*(j-1)+x+39, 113*(i-1)+y+80, 80, 100, 0x142B2E, 0x142B2E, 0.6, true)
				table.insert(txt, 600+i*12+j)
				colorTag = "<bl>"
				--color = 0x102224
				--table.insert(img, tfm.exec.addImage(IMG.misc.locked, "&10", 95*j+325, i*115-20, p))
			elseif PLAYER[player][equipref] == w then
				text = text .. "<j>" .. translate(player, "EQUIPPED")
				color = 0xBABD2F
			else
				text = text .. translate(player, "EQUIP")
				link = true
			end
			if PLAYER[player][inventory][w] == 2 then
				colorTag = "<vp>"
			elseif PLAYER[player][inventory][w] == 3 then
				table.insert(img, tfm.exec.addImage("15f0d921edd.png", ":1", 93*(j-1)+x+39+38, 113*(i-1)+y+75-6, player))
			end
			ui.addTextArea(200+i*12+j, "<p align='center'>"..colorTag..translate(player, tableref[w].name), player, 93*(j-1)+x+39, 113*(i-1)+y+75, 80, nil, 0, 0, 0, true)
			addLink(500+i*12+j, "info "..var.tab.." "..w, player, 93*(j-1)+x+39, 113*(i-1)+y+80, 80, 100, true)
			ui.addTextArea(300+i*12+j, text, player, 93*(j-1)+x+39, (i-1)*113+y+161, 80, 20, -1, color, 1, true)
			if link then
				addLink(400+i*12+j, "equip "..var.tab.." "..w, player, 93*(j-1)+x+39, (i-1)*113+y+161, 80, 20, true)
				table.insert(txt, 400+i*12+j)
			end
			table.insert(txt, 200+i*12+j)
			table.insert(txt, 300+i*12+j)
			table.insert(txt, 500+i*12+j)
		else
			ui.addTextArea(600+i*12+j, "", player, 93*(j-1)+x+39, 113*(i-1)+y+80, 80, 102, 0x142B2E, 0x142B2E, 1, true)
			table.insert(txt, 600+i*12+j)
		end
	end

	return txt, img
end)


--[[ src/ui/madchess_tip.lua ]]--

window.create("CHESS", function(player, var, name)
	local x = 200 -- 145 = +55
	local y = 100 -- 100 = +40
	local width = 590
	local height = 250
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(506, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(507, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(508, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(509, string.format("<p align='center'><a href='event:close chess'>", page)..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	-- título da janela
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	
	-- cartas e descrições
	local card = {
		{{{"red","pawn"},"CARD_PAWN"},{{"red","rook"},"CARD_ROOK"},{{"red","knight"},"CARD_KNIGHT"}},
		{{{"red","bishop"},"CARD_BISHOP"},{{"black","queen"},"CARD_QUEEN"},{{"black","king"},"CARD_KING"}},
	}
	local text = {500,501,502,503,504,505,506,507,508,509,519}
	for i, v in pairs(card) do
		for j, w in pairs(v) do
			local c = showCard(w[1], 190*(j-1)+x+10, (i-1)*110+y+10, player, "&1000")
			--table.insert(imageId, tfm.exec.addImage(SKIN[w].imgMini, "&2", 100*j+60, i*120, p))
			table.insert(imageId, c[1])
			table.insert(imageId, c[2])
			ui.addTextArea(200+i*12+j, "<font size='10px'>"..translate(player, w[2]), player, 190*(j-1)+x+60, (i-1)*110+y+10, 130, 110, 0, 0, 0, true)
			table.insert(text, 200+i*12+j)
		end
	end
	return text, imageId
end)


--[[ src/ui/medal_list.lua ]]--

window.create("TROPHY", function(player, var, page)
	local x = 5
	local y = 180
	local width = 190
	local height = 180
	-- janela
	ui.addTextArea(300, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(301, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(302, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(303, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(304, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(305, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {300,301,302,303,304,305}, imageId
end,
function(p, id, page)
	page = page or 1
	local x = 5
	local y = 180
	local width = 190
	local height = 180
	local key = {"none", "beta", "buffy", "drekkemaus", "noel", "snowy", "charlotte", "elisah"}
	local txt={310,311,312,313,314,315,316,317,321,322}
	local img={}
	local pool = {}
	for i, v in pairs(key) do
		if PLAYER[p].trophy[v] then
			table.insert(pool, v)
		end
	end
	key = {{}}
	do
		local i = 1
		repeat
			local temp = table.remove(pool, 1)
			if temp then
				if #key[i] >= 6 then
					i = i + 1
					key[i] = {}
				end
				table.insert(key[i], temp)
			end
		until #pool == 0
	end
	if page > 1 then
		-- botão de voltar
		ui.addTextArea(310, "", p, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(311, "", p, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(312, "", p, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(313, "<p align='center'>&lt;&lt;", p, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(321, string.format("<p align='right'><a href='event:trophy %s'> ", page-1), p, x+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	if page < #key then
		-- botão de avançar
		ui.addTextArea(314, "", p, x+8+width/2, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(315, "", p, x+9+width/2, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(316, "", p, x+9+width/2, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(317, "<p align='center'>&gt;&gt;", p, x+9+width/2, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(322, string.format("<p align='right'><a href='event:trophy %s'> ", page+1), p, x+9+width/2, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	-- cadeiras
	for i=1, 2 do
		for j=1, 3 do
			local name = table.remove(key[page],1)
			if name then
				table.insert(img, tfm.exec.addImage(TROPHY[name].img, "&10", j*60-50, i*70+120, p))
				ui.addTextArea(200+i*12+j, string.format("<p align='center'><font size='10px'><a href='event:equipt %s'>%s", name, translate(p, "EQUIP")), p, j*60-50, i*70+175, 60, nil, 0, 0, 0, true)
				table.insert(txt, 200+i*12+j)
			end
		end
	end
	return txt, img
end)


--[[ src/ui/menu.lua ]]--

window.create("MENU", function(player, var)
	local x = 5
	local y = 258
	local width = 140
	local height = 110
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- título da janela
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	
	-- cartas e descrições
	local text = {500,501,502,503,504,505,506,507,508,509,519,520}
	
	local menu = {
		{link="rules 1", text="RULES", hotkey="H"},
		{link="credits", text="CREDITS"},
		{link="settings", text="HOUSE_RULES", hotkey="U"},
		{link="options", text="SETTINGS", hotkey="O"},
		{link="profile", text="PROFILE", hotkey="P"},
	}
	
	for i, v in pairs(menu) do
		local t = string.format("<a href='event:%s'>%s", v.link, translate(player, v.text))
		if v.hotkey then
			t = t .. " (" .. v.hotkey .. ")"
		end
		ui.addTextArea(520+i, t, player, x+5, y+5+((i-1)*20), nil, nil, 0, 0, 0, true)
		table.insert(text, 520+i)
	end
	return text, imageId
end)


--[[ src/ui/options.lua ]]--

window.create("OPTIONS", function(player, var)
	local x = 200
	local y = 100
	local width = 400
	local height = 200
	-- janela
	ui.addTextArea(100, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(101, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(102, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(103, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(104, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(105, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(106, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(107, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(108, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(109, "<p align='center'>"..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(120, "<p align='right'><a href='event:close options'> ", player, x+9, y+height-24, width-17, nil, 0, 0, 0, true)
	-- título da janela
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "SETTINGS"), player, x+10, y+10, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {100,101,102,103,104,105,106,107,108,109,119,120}, imageId
end,
function(player, var, page)
	page = page or 1
	local x = 200
	local y = 100
	local width = 400
	local height = 200
	ui.addTextArea(110, string.format("%s %s<a href='event:colorblind'>[%s]", translate(player, "SET_COLORBLIND"), PLAYER[player].colorBlind and "<vp>" or "<r>", translate(player, PLAYER[player].colorBlind and "YES" or "NO")), player, x+5, y+60, width-10, nil, 0, 0, 0, true)
	ui.addTextArea(111, string.format("%s %s<a href='event:bell'>[%s]", translate(player, "SET_BELL"), PLAYER[player].bell and "<vp>" or "<r>", translate(player, PLAYER[player].bell and "YES" or "NO")), player, x+5, y+80, width-10, nil, 0, 0, 0, true)
	ui.addTextArea(112, string.format("%s %s<a href='event:shadow'>[%s]", translate(player, "SET_SHADOW"), PLAYER[player].shadow and "<vp>" or "<r>", translate(player, PLAYER[player].shadow and "YES" or "NO")), player, x+5, y+100, width-10, nil, 0, 0, 0, true)
	ui.addTextArea(113, string.format("%s %s<a href='event:challengepopup'>[%s]", translate(player, "SET_CHALLENGE"), PLAYER[player].challengePopup and "<vp>" or "<r>", translate(player, PLAYER[player].challengePopup and "YES" or "NO")), player, x+5, y+120, width-10, nil, 0, 0, 0, true)
	if PLAYER[player].community then
		ui.addTextArea(114, string.format("%s <j><a href='event:community'>[%s]", translate(player, "SET_COMMUNITY"), PLAYER[player].community:upper()), player, x+5, y+140, width-10, nil, 0, 0, 0, true)
	end
	return {110,111,112,113,114,115,116,117,118,121,122}
end)



--[[ src/ui/panel_info.lua ]]--

window.create("INFOPANEL", function(player, var, name)
	local x = 200
	local y = 100
	local width = 200
	local height = 210
	-- janela
	ui.addTextArea(500, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(501, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(502, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(503, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(504, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(505, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- título da janela
	ui.addTextArea(519, string.format("<p align='center'><j><font size='15px'><b>%s</b></font></j>\n<font size='10px'>%s %s", translate(player, FLAG[name].name), translate(player, "CREATED_BY"), FLAG[name].author), player, 200, y+5, 200, nil, 0, 0, 0, true)
	
	ui.addTextArea(520, string.format("<p align='center'><font size='10px'>%s\n\n<b>%s</b>\n<bl>%s", translate(player, FLAG[name].desc), translate(player, FLAG[name].mission), progressFlag(player, name)), player, 200, y+110, 200, nil, 0, 0, 0, true)
	
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	if FLAG[name].img.big then
		table.insert(imageId, tfm.exec.addImage(FLAG[name].img.big, "&1", 250, y+55, player))
	end
	return {500,501,502,503,504,505,506,507,508,509,519,520}, imageId
end)


--[[ src/ui/panel_list.lua ]]--

window.create("PANELS", function(player, var, page)
	local x = 410
	local y = 27
	local width = 385
	local height = 340
	-- janela
	ui.addTextArea(100, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(101, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(102, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(103, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(104, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(105, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	
	-- botão powerups
	--ui.addTextArea(106, "", player, x+8, y+height-22, width/3-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	--ui.addTextArea(107, "", player, x+9, y+height-21, width/3-16, 13, 0xe1619, 0xe1619, alpha, true)
	--ui.addTextArea(108, "", player, x+9, y+height-21, width/3-17, 12, 0x314e57, 0x314e57, alpha, true)
	--ui.addTextArea(109,  string.format("<p align='center'>%s (K)", translate(player, "POWERUPS")), player, x+9, y+height-24, width/3-17, nil, 0x314e57, 0x314e57, 0, true)
	--ui.addTextArea(120, "<p align='right'><a href='event:powerups'> ", player, x+9, y+height-24, width/3-17, nil, 0, 0, 0, true)
	--ui.addTextArea(120, "", player, x+3, y+height-22, width/3-9, 16, 0x142B2E, 0x142B2E, 0.7, true)
	
	-- botão cadeiras
	ui.addTextArea(206, "", player, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(207, "", player, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(208, "", player, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(209, string.format("<p align='center'>%s (C)", translate(player, "CHAIRS")), player, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(220, "<p align='right'><a href='event:chairs2'> ", player, x+3, y+height-24, width/2-17, nil, 0, 0, 0, true)
	--ui.addTextArea(220, "", player, x+3, y+height-22, width/3-9, 16, 0x142B2E, 0x142B2E, 0.7, true)
	
	-- botão paineis
	ui.addTextArea(306, "", player, x+width/2+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(307, "", player, x+width/2+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(308, "", player, x+width/2+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(309, string.format("<p align='center'>%s (N)", translate(player, "PANELS")), player, x+width/2+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
	--ui.addTextArea(320, "<p align='right'><a href='event:panels'> ", player, x+width/2+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	ui.addTextArea(320, "", player, x+width/2+3, y+height-22, width/2-9, 16, 0x142B2E, 0x142B2E, 0.7, true)
	
	

	-- título da janela
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "PANELS"), player, x+10, y, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {100,101,102,103,104,105,106,107,108,109,119,120,206,207,208,209,219,220,306,307,308,309,319,320}, imageId
end,
function(p, var, page)
	page = page or PLAYER[p].panelPage or 1
	PLAYER[p].panelPage = page
	PLAYER[p].inventory = "panels"
	local x = 410
	local y = 27
	local width = 385
	local height = 340
	local pool = {"default", "picnic", "metal", "paper", "carpet", "disco", "cloud", "circuit"}
	local pageMax = math.ceil(#pool / 8)
	local txt={110,111,112,113,114,115,116,117,121,122,123}
	local img={}
	if page > 1 then
		-- botão de voltar
		local y = y - 25
		ui.addTextArea(110, "", p, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(111, "", p, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(112, "", p, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(113, string.format("<p align='center'>%s", translate(p, "PREVIOUS")), p, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(121, string.format("<p align='right'><a href='event:panels %s'> ", page-1), p, x+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	if page < pageMax then
		-- botão de avançar
		local y = y - 25
		ui.addTextArea(114, "", p, x+8+width/2, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(115, "", p, x+9+width/2, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(116, "", p, x+9+width/2, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(117, string.format("<p align='center'>%s", translate(p, "NEXT")), p, x+9+width/2, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(122, string.format("<p align='right'><a href='event:panels %s'> ", page+1), p, x+9+width/2, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	-- cadeiras
	--local unlocked = {}
	--local locked = {}
	--for i, v in pairs(pool) do
	--  table.insert(PLAYER[p].skin[v] and unlocked or locked, v)
	--end
	--pool = unlocked
	--for i, v in pairs(locked) do
	--  table.insert(pool, v)
	--end
	for z=1, 8 do
		local ini = (page-1)*8+z
		local w = pool[ini]
		local i = math.ceil(z/4)
		local j = (z-1)%4+1
		if w then
			ui.addTextArea(200+i*12+j, string.format("<p align='center'><a href='event: infopanel %s'>%s", w, translate(p, FLAG[w].name)), p, 420+(j-1)*95, (i-1)*115+75, 80, 100, PLAYER[p].flags[w] and 0x6a7495 or -1, 1, 0.2, true)
			local text = "<p align='center'>"
			local color = 0x102224
			table.insert(img, tfm.exec.addImage(FLAG[w].imgDesc, "&2", 420+(j-1)*95, i*115-15, p))
			if not PLAYER[p].flags[w] then
				text = text .. "<bl>" .. string.format("<bl><a href='event:infopanel %s %s'>", w, page) .. translate(p, "LOCKED")
				color = 0x102224
				table.insert(img, tfm.exec.addImage(IMG.misc.lockedPanel, "&10", 420+(j-1)*95, i*115-15, p))
			elseif PLAYER[p].flagEquipped == w then
				text = text .. "<j>" .. translate(p, "EQUIPPED")
				color = 0xBABD2F
			else
				text = text .. string.format("<a href='event:equippanel %s %s'>", w, page) .. translate(p, "EQUIP")
			end
			ui.addTextArea(300+i*12+j, text, p, 420+(j-1)*95, (i-1)*115+155, 80, 20, -1, color, 1, true)
			table.insert(txt, 200+i*12+j)
			table.insert(txt, 300+i*12+j)
		end
	end
	ui.addTextArea(123, string.format("<p align='center'>%s / %s", page, pageMax), p, x+10, y+268, width-20, p, 0, 0, 0, true)
	return txt, img
end)


--[[ src/ui/profile.lua ]]--

window.create("PROFILE", function(player, var, name)
	local imageId = {}
	do
		local x = 210
		local y = 150
		local width = 380
		local height = 185
		-- janela
		ui.addTextArea(100, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
		ui.addTextArea(101, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
		ui.addTextArea(102, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
		ui.addTextArea(103, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
		ui.addTextArea(104, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
		ui.addTextArea(105, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
		-- botão fechar
		ui.addTextArea(106, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(107, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(108, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(109, "<p align='center'>"..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(120, "<p align='right'><a href='event:close profile'> ", player, x+9, y+height-24, width-17, nil, 0, 0, 0, true)
		-- bordas
		table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
		--table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
		table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
		--table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	end
	do
		local x = 210
		local y = 90
		local width = 390
		local height = 60
		ui.addTextArea(121, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
		ui.addTextArea(122, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
		ui.addTextArea(123, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
		ui.addTextArea(124, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
		ui.addTextArea(125, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
		ui.addTextArea(126, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
		-- bordas
		--table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
		--table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
		table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
		table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	end
	do
		local x = 200
		local y = 80
		local width = 80
		local height = 80
		ui.addTextArea(127, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
		ui.addTextArea(128, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
		ui.addTextArea(129, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
		ui.addTextArea(130, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
		ui.addTextArea(131, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
		ui.addTextArea(132, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
		-- bordas
		table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
		table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
		table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
		table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	end
	return {100,101,102,103,104,105,106,107,108,109,120,121,122,123,124,125,126,127,128,129,130,131,132}, imageId
end,
function(player, var, name)
	local nickname, hash = nickHashtag(name)
	imageId = {}
	do
		local x = 210
		local y = 90
		local width = 390
		local height = 80
		ui.addTextArea(119, string.format("<v><font size='25px'><b>%s<n><font size='18px'><bl>#%s", nickname, hash), player, x+85, y+12, nil, nil, 0, 0, 0, true)
	end
	do
		local x = 200
		local y = 80
		local width = 390
		local height = 80
		if player == name then
			ui.addTextArea(133, "<p align='center'><font size='10px'><a href='event:trophy 1'>"..translate(player, "CHANGE"), player, x, y+65, 80, nil, 0, 0, 0, true)
		end
		table.insert(imageId, tfm.exec.addImage(TROPHY[PLAYER[name].trophyEquiped].img, "&1", x+10, y+10, player))
		--ui.addTextArea(134, "<p align='center'><font size='10px'><a href='event:trophy'>"..translate(player, "CHANGE"), player, x, y+65, 80, nil, 0, 0, 0, true)
	end
	do
		local x = 210
		local y = 150
		local width = 390
		local height = 80
		--local week = PLAYER[name].stats.ranking.week and "<v>("..PLAYER[name].stats.ranking.week..")" or ""
		--local global = PLAYER[name].stats.ranking.global and "<v>("..PLAYER[name].stats.ranking.global..")" or ""
		--ui.addTextArea(134, string.format("<textformat tabstops='180px'><bl>%s : <j>%s\t<bl>%s : <j>%s\n\n<bl>%s : <j>%s\n\n<bl>%s : <j>%s\n<bl>%s : <j>%s\n<bl>%s : <j>%s\n\n<bl>%s : <j>%s %s\n<bl>%s : <j>%s %s", translate(player, "VICTORY"), PLAYER[name].stats.victory.all, translate(player, "TEAM_VICTORY"), PLAYER[name].stats.victory.team, translate(player, "FAVORITE"), translate(player, SKIN[PLAYER[name].skinEquiped].name), translate(player, "CHEESE_GOLD"), PLAYER[name].stats.ranking.gold, translate(player, "CHEESE_SILVER"), PLAYER[name].stats.ranking.silver, translate(player, "CHEESE_BRONZE"), PLAYER[name].stats.ranking.bronze, translate(player, "POS_LEADERBOARD_WEEK"), PLAYER[name].stats.ranking.scoreWeek, week, translate(player, "POS_LEADERBOARD_GLOBAL"), PLAYER[name].stats.ranking.scoreGlobal, global), player, x+10, y+20, nil, nil, 0, 0, 0, true)
		
		local chairs = 0
		for i, v in pairs(PLAYER[name].skin) do
			chairs = chairs + 1
		end
		
		local tabstops = "<textformat tabstops='175px'>"
		
		local victories = string.format("<bl>%s : <j>%s\t", translate(player, "VICTORY"), PLAYER[name].stats.victory.all)
		local teamVictories = string.format("<bl>%s : <j>%s\n\n", translate(player, "TEAM_VICTORY"), PLAYER[name].stats.victory.team)
		local roundsPlayed = string.format("<bl>%s : <j>%s\t", translate(player, "ROUND_PLAYED"), PLAYER[name].stats.round)
		local roundsWatched = string.format("<bl>%s : <j>%s\n\n", translate(player, "ROUND_WATCHED"), PLAYER[name].stats.spectator)
		local chairsUnlocked = string.format("<bl>%s : <j>%s\n", translate(player, "CHAIRS_UNLOCKED"), chairs)
		local favoriteChair = string.format("<bl>%s : <j>%s", translate(player, "FAVORITE"), translate(player, SKIN[PLAYER[name].skinEquiped].name))
		
		--ui.addTextArea(134, string.format("<bl>%s : <j>%s\n<bl>%s : <j>%s\n\n<bl>%s : <j>%s", translate(player, "VICTORY"), PLAYER[name].stats.victory.all, translate(player, "TEAM_VICTORY"), PLAYER[name].stats.victory.team, translate(player, "FAVORITE"), translate(player, SKIN[PLAYER[name].skinEquiped].name)), player, x+10, y+20, nil, nil, 0, 0, 0, true)
		ui.addTextArea(134, tabstops..victories..teamVictories..roundsPlayed..roundsWatched..chairsUnlocked..favoriteChair, player, x+10, y+20, nil, nil, 0, 0, 0, true)
		if PLAYER[name].flagEquipped ~= "default" then
			local flag = "picnic"
			table.insert(imageId, tfm.exec.addImage(FLAG[PLAYER[name].flagEquipped].img.big, "&1", x+10, y+110, player))
			ui.addTextArea(135, string.format("<p align='center'>%s", translate(player, FLAG[PLAYER[name].flagEquipped].desc)), player, x+110, y+115, 260, nil, 0, 0, 0, true)
		end
		
	end
	return {119,133,134, 135}, imageId
end)


--[[ src/ui/room_options.lua ]]--

window.create("SETTINGS3", function(player, var)
	local x = 200
	local y = 100
	local width = 400
	local height = 200
	-- janela
	ui.addTextArea(100, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(101, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(102, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(103, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(104, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(105, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(106, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(107, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(108, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(109, "<p align='center'>"..translate(player, "BACK"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(120, "<p align='right'><a href='event:settings'> ", player, x+9, y+height-24, width-17, nil, 0, 0, 0, true)
	-- título da janela
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "HOUSE_RULES"), player, x+10, y+10, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {100,101,102,103,104,105,106,107,108,109,119,120}, imageId
end,
function(player, var, page)
	page = page or 1
	local x = 200
	local y = 100
	local width = 400
	local height = 200
	local t2 = string.format("<font color='#ffffff'>%s %s<font size='9px'><a href='event:fixedchair'>[%s]", translate(player, "HOUSE_FIXED_CHAIRS"), CONFIG.fixedChair and "<vp>" or "<r>", CONFIG.fixedChair and translate(player, "YES") or translate(player, "NO"))
	local t3 = string.format("<font color='#ffffff'>%s %s<font size='9px'><a href='event:newplayers'>[%s]", translate(player, "HOUSE_NEW_PLAYER"), CONFIG.newPlayers and "<vp>" or "<r>", CONFIG.newPlayers and translate(player, "YES") or translate(player, "NO"))
	local t4 = string.format("<font color='#ffffff'>%s: <j><font size='9px'><a href='event:scoreby'>[%s]", translate(player, "SCORE_BY"), translate(player, CONFIG.scoreBy))
	local t5 = string.format("<a href='event:resetscore'><r>[%s]", translate(player, "RESET_SCORE"))
	local t1 = string.format("<font color='#ffffff'>%s %s<font size='9px'><a href='event:autostart'>[%s]", translate(player, "HOUSE_AUTOSTART"), CONFIG.autoStart and "<vp>" or "<r>", CONFIG.autoStart and translate(player, "YES") or translate(player, "NO"))
	ui.addTextArea(110, t1, player, x+5, y+60, width-10, nil, 0, 0, 0, true)
	ui.addTextArea(111, t2, player, x+5, y+80, width-10, nil, 0, 0, 0, true)
	ui.addTextArea(112, t3, player, x+5, y+100, width-10, nil, 0, 0, 0, true)
	ui.addTextArea(113, t4, player, x+5, y+120, width-10, nil, 0, 0, 0, true)
	ui.addTextArea(114, t5, player, x+5, y+140, width-10, nil, 0, 0, 0, true)
	return {110,111,112,113,114,115,116,117,118,121,122}
end)


--[[ src/ui/rule_list.lua ]]--

window.create("SETTINGS2", function(player, var, page)
	local x = 200
	local y = 30
	local width = 400
	local height = 360
	-- janela
	ui.addTextArea(100, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(101, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(102, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(103, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(104, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(105, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(106, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(107, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(108, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(109, "<p align='center'>"..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(120, "<p align='right'><a href='event:close settings2'> ", player, x+9, y+height-24, width-17, nil, 0, 0, 0, true)
	-- título da janela
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "HOUSE_RULES"), player, x+10, y+10, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {100,101,102,103,104,105,106,107,108,109,119,120}, imageId
end,
function(p, var, page)
	page = page and tonumber(page) or 1
	local x = 200
	local y = 30
	local width = 400
	local height = 360
	local pool = {"nochallenge","mini","maxi","noaction","clean","nocombo","supercombo","hell","satisfaction","insatisfaction","camouflage","flash","limit","jumpin","black","revelation","stack","sequence","perfection","tracking","mulligan","overload","limbo","fastdraw","hard","shiny","neighbor","team","mess","bluegreen","peace","death","gift","trade","carousel","chair","spy","rain","equality","imitate","meep","random","bomb","rule","chess","steal","web","thunder","clone","luck","box","wish","ink","confuse","batata","curse","magnet","portal","compass","tornado","theft","ban","simon","half","paradox","oddeven","mimic","mix","justice","key","share"}
	local hidden = {"custom", "elise", "charlotte", "elisah", "drekkemaus", "buffy", "jingle", "papaille", "snowy", "icemice"}
	for i, v in pairs(hidden) do
		if PLAYER[p].rules[v] or CONFIG.rule[v] then
			table.insert(pool, v)
		end
	end
	local maxPages = math.ceil(#pool/20)
	if page > 1 then
		-- botão de voltar
		local y = y - 25
		ui.addTextArea(110, "", p, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(111, "", p, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(112, "", p, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(113, string.format("<p align='center'>%s", translate(p, "PREVIOUS")), p, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(121, string.format("<p align='right'><a href='event:settings2 %s'> ", page-1), p, x+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	if page < maxPages then
		-- botão de avançar
		local y = y - 25
		ui.addTextArea(114, "", p, x+8+width/2, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(115, "", p, x+9+width/2, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(116, "", p, x+9+width/2, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(117, string.format("<p align='center'>%s", translate(p, "NEXT")), p, x+9+width/2, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(122, string.format("<p align='right'><a href='event:settings2 %s'> ", page+1), p, x+9+width/2, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	local text = {110,111,112,113,114,115,116,117,118,121,122}
	local imageId = {}
	
	local t3 = string.format("<font color='#ffffff'>%s %s<font size='9px'><a href='event:fixedrules'>[%s]", translate(p, "HOUSE_FIXED"), CONFIG.random and "<vp>" or "<r>", CONFIG.random and translate(p, "YES") or translate(p, "NO"))
	local t4 = string.format("<a href='event:clearrules'><r>[%s]", translate(p, "CLEAR_HOUSE"))
	local t2 = string.format("<a href='event:commands'><bv>[%s]", translate(p, "COMMANDS"))
	local t1 = (p == OWNER or isAdm(p)) and string.format("<a href='event:roomoptions'><bv>[%s]", translate(p, "ROOM_OPTIONS")) or string.format("<a href='event:party'><bv>[%s]", translate(p, "PARTY_ROOM"))
	ui.addTextArea(20000, t1, p, 200*1+18, -1*20+100, 200, nil, 0, 0, 0, true)
	if p == OWNER or isAdm(p) then
		ui.addTextArea(20003, t2, p, 200*2+18, -1*20+100, 200, nil, 0, 0, 0, true)
		ui.addTextArea(20002, t4, p, 200*2+18, 0*20+100, 200, nil, 0, 0, 0, true)
	end
	ui.addTextArea(20001, t3, p, 200*1+18, 0*20+100, 200, nil, 0, 0, 0, true)
	table.insert(text, 20000)
	table.insert(text, 20001)
	table.insert(text, 20002)
	table.insert(text, 20003)
	
	
	local ini = (page-1)*20+1
	local color = {
		CARD = "FFFFFF",
		PASSIVE = "B3E5FC",
		BOSS = "FFE0B2",
		EXTRA = "EF9A9A",
		PUZZLE = "DCEDC8"
	}
	for i=1, 10 do
		for j=1, 2 do
			local name = pool[ini]
			ini = ini + 1
			if name and (name ~= "custom" or PLAYER[p].rules[name]) then
				local t = string.format("<b><a href='event:rule %s'>%s</a></b>", name, translate(p, RULE[name].name))
				if PLAYER[p].rules[name] then
					t = string.format("<font color='#%s'>%s", color[RULE[name].type], t)
					table.insert(imageId, tfm.exec.addImage(RULE[name].img, "&10", 200*j, i*20+108, p))
					if CONFIG.random then
						t = t .. string.format(" %s<font size='9px'><a href='event:setrule %s %s'>[%s]", CONFIG.rule[name] and "<vp>" or "<r>", name, page, CONFIG.rule[name] and translate(p, "YES") or translate(p, "NO"))
					end
				end
				ui.addTextArea(200+i*12+j, t, p, 200*j+20, i*20+110, 180, nil, 0, 0, 0, true)
				table.insert(text, 200+i*12+j)
			end
		end
	end
	return text, imageId
end)


--[[ src/ui/rule_tip.lua ]]--

window.create("TIP", function(p, var, name)
	local text = string.format("<p align='center'><vp><b>%s</b></font>\n<font color='#ffffff' size='9px'>%s\n", translate(p, RULE[name].name), name == "custom" and RULE.custom.customDesc or translate(p, RULE[name].desc))
	ui.addTextArea(5000, text, p, 10, 190, 150, 150, 1, 0x30BA76, 0.9, true)
	if name == "custom" and p == OWNER and PLAYER[p].rules[name] then
		ui.addTextArea(5001, string.format("<p align='center'><vp><a href='event:custom'>%s</a> <n>| <r><a href='event:close tip'>%s",translate(p, "CUSTOM_EDIT"), translate(p, "CLOSE")), p, 10, 320, 150, nil, 0, 0, 0, true)
	else
		ui.addTextArea(5001, "<p align='center'><a href='event:close tip'><r>"..translate(p, "CLOSE"), p, 10, 320, 150, nil, 0, 0, 0, true)
	end
	local image = {}
	if RULE[name].imgDesc then
		table.insert(image, tfm.exec.addImage(RULE[name].imgDesc, "&0", 10, 270, p))
	end
	if PLAYER[p] and not PLAYER[p].rules[name] and RULE[name].lock ~= true then
		local mission = RULE[name].lock or "WIN"
		local accept = {WIN=0xffff00, TEAM=0x00ffff}
		if accept[mission] then
			local text = string.format("<p align='center'><font color='#%x'>%s", accept[mission], translate(p, RULE[name].mission))
			ui.addTextArea(5002, text, p, 10, 135, 150, 45, 1, accept[mission], 0.9, true)
		end
	end
	return {5000,5001,5002}, image
end)


--[[ src/ui/tutorial.lua ]]--

window.create("RULES", function(player, var, page)
	local x = 200
	local y = 60
	local width = 400
	local height = 300
	-- janela
	ui.addTextArea(100, "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
	ui.addTextArea(101, "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
	ui.addTextArea(102, "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
	ui.addTextArea(103, "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
	ui.addTextArea(104, "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
	ui.addTextArea(105, "", player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
	-- botão fechar
	ui.addTextArea(106, "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
	ui.addTextArea(107, "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
	ui.addTextArea(108, "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
	ui.addTextArea(109, "<p align='center'>"..translate(player, "CLOSE"), player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
	ui.addTextArea(120, "<p align='right'><a href='event:close rules'> ", player, x+9, y+height-24, width-17, nil, 0, 0, 0, true)
	-- título da janela
	ui.addTextArea(119, "<p align='center'><font size='25px'><j><b>"..translate(player, "RULES"), player, x+10, y+10, width-20, nil, 0, 0, 0, true)
	-- bordas
	local imageId = {}
	table.insert(imageId, tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
	table.insert(imageId, tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
	table.insert(imageId, tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
	return {100,101,102,103,104,105,106,107,108,109,119,120}, imageId
end,
function(p, var, page)
	page = page or 1
	local x = 200
	local y = 60
	local width = 400
	local height = 300
	local key = {"RULES_1", "RULES_2", "RULES_3", "RULES_4"}
	if page > 1 then
		-- botão de voltar
		local y = y - 25
		ui.addTextArea(110, "", p, x+8, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(111, "", p, x+9, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(112, "", p, x+9, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(113, string.format("<p align='center'>%s", translate(p, "PREVIOUS")), p, x+9, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(121, string.format("<p align='right'><a href='event:rules %s'> ", page-1), p, x+9, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	if page < #key then
		-- botão de avançar
		local y = y - 25
		ui.addTextArea(114, "", p, x+8+width/2, y+height-22, width/2-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
		ui.addTextArea(115, "", p, x+9+width/2, y+height-21, width/2-16, 13, 0xe1619, 0xe1619, alpha, true)
		ui.addTextArea(116, "", p, x+9+width/2, y+height-21, width/2-17, 12, 0x314e57, 0x314e57, alpha, true)
		ui.addTextArea(117, string.format("<p align='center'>%s", translate(p, "NEXT")), p, x+9+width/2, y+height-24, width/2-17, nil, 0x314e57, 0x314e57, 0, true)
		ui.addTextArea(122, string.format("<p align='right'><a href='event:rules %s'> ", page+1), p, x+9+width/2, y+height-24, width/2-17, nil, 0, 0, 0, true)
	end
	ui.addTextArea(118, translate(p, key[page]), p, x+10, y+60, width-20, nil, 0, 0, 0, true)
	return {110,111,112,113,114,115,116,117,118,121,122}
end)


--[[ src/main.lua ]]--

for i, v in pairs(tfm.get.room.playerList) do
	eventNewPlayer(i)
end
for i, v in pairs(BOT) do
	PLAYER[i] = instanceData()
	PLAYER[i].skinEquiped = v.chair
end

local temp = roomOwner()
addFunctionTimer(function()
	for i, v in pairs(tfm.get.room.playerList) do
		if nickHashtag(i) == temp then
			OWNER = i
			colorNick(i)
			break
		end
	end
end, 500)
if not temp then
	tfm.exec.setRoomMaxPlayers(15)
else
	CONFIG.ranked = false
end
if CONFIG.tribeHouse then
	CONFIG.ranked = false
end
if not (string.match(tfm.get.room.name,"^%w%w%-#unotfm[1-9]+$") or string.match(tfm.get.room.name,"^*#unotfm[1-9]+$")) then
	CONFIG.ranked = false
end
if string.match(tfm.get.room.name,"music") then
	CONFIG.music = true
end
system.disableChatCommandDisplay(nil, true)
tfm.exec.disableAutoShaman()
--tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableAfkDeath()
tfm.exec.disableAutoNewGame()
tfm.exec.disableAutoScore()
tfm.exec.disableAutoTimeLeft()
tfm.exec.disableMinimalistMode()
tfm.exec.disableMortCommand()
newMap()
