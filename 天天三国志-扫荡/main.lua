
local sz = require("sz")
nLog("5")
require "TsLib" --加载函数库


width, height = getScreenSize();
if width == 640 and height == 1136 then
    dialog("暂不支持此设备", 0)
	lua_exit()
elseif width == 640 and height == 960 then
    dialog("暂不支持此设备", 0)
	lua_exit()
elseif width == 320 and height == 480 then
    dialog("暂不支持此设备", 0)
	lua_exit()
elseif width == 768 and height == 1024 then
    dialog("暂不支持此设备", 0)
	lua_exit()
elseif width == 1536 and height == 2048 then
    require "mini2" --加载函数库
elseif width == 1242 and height == 2208 then
	dialog("暂不支持此设备", 0)
	lua_exit()
end

user = userPath()

sysInit = {
	gameBid_1 = "com.sjyt.threek", --设置游戏BID，用于启动关闭游戏调用
	gameBid_2 = "com.gamesworker.threekingdoms",
	gameBid = "",
	gameLoop = 0,
}

isTS = whoAmI()
if isTS == 0 then
	sysInit.gameAcc = user.."/lua/sg_ac.txt"
else
	sysInit.gameAcc = user.."/script/sg_ac.txt"
end

function isApp()
	local appPath = appBundlePath(sysInit.gameBid_1)
	if appPath ~= "" then
		sysInit.gameBid = "com.sjyt.threek"
	else
		sysInit.gameBid = "com.gamesworker.threekingdoms"
	end
end



Hero = {
	{0x3f405f, "-66|-40|0x6d1e21,62|128|0x353045,64|114|0xf9cc87,-60|102|0x315d7e","高顺"}, --高顺
	{0xd76048, "36|-34|0x872929,-40|70|0x4e0e10,100|62|0x510d10,6|46|0x52130f","孙策"},
	{0x3e1011, "-50|8|0x330b0c,-48|130|0xeea733,-8|76|0x24ddda,58|92|0xd1ae90","孙权"},
	{0xf3e446, "-40|18|0x892b18,10|70|0xe6e1e4,-58|100|0xa69da5,-12|112|0x4b1e11","太史慈"},
	{0x15937f, "-116|42|0x0a5b56,-22|26|0xf8e472,-52|58|0xfffff9,36|88|0xd8b250","黄忠"},
	{0xda371a, "68|18|0x7f4531,56|-20|0xc16f10,52|104|0x870b07,102|134|0x811414","吕布"},
	{0xf7d03f, "-28|-8|0xac59cd,-92|88|0x423076,-12|80|0x8b3b24,26|2|0x550400","周瑜"},
	{0x4093f1, "18|-48|0x144d6a,54|-6|0x39789c,-20|64|0x1f6983,44|66|0x3b778c","夏侯惇"},
	{0xed4722, "-60|10|0xecc556,-84|94|0xfddf61,4|118|0x9e130e,-4|76|0xe43d37","关羽"},
	{0x297614, "-68|8|0xdfad1d,-96|106|0xa04b22,28|36|0x4384c4,-2|80|0x4267b1","诸葛亮"},
	{0xb5b9d6, "-44|44|0xccd2da,36|46|0xd6d4e0,68|10|0xfb7439,-2|106|0xffffff","于吉"},
	{0xf7d532, "-70|28|0x171f38,-42|28|0xa73317,44|38|0x2b3f70,-32|92|0x324989","颜良"},
}

gameGo = {
	{0xf4ce77, "28|-22|0xfbda88,42|-42|0xfbdf95,76|-36|0xfade94,44|14|0x805650,60|0|0x623f3d", 696, 616, 1074, 970},
	{0xfade8c, "-8|44|0xf4ce78,20|26|0xfad986,50|-2|0xfbe29e,52|42|0x624043,40|64|0x6a4342", 902, 672, 1256, 962},
	{0xfbe199, "14|2|0xfbde8e,52|16|0xfbdd8f,34|50|0xedca7d,70|50|0x5f3833",372, 438, 898, 750},
	{0xfbe090, "14|4|0xfbde8c,32|10|0xfbde8d,72|4|0xfbe4a3,26|42|0xefce7b,70|46|0x664441",1198, 634, 1700, 944},
	{0xfbe5a0, "13|6|0xfae091,37|8|0xfcde8c,65|31|0xfadd8c,101|19|0xfbe299,106|63|0x664441",17, 1261, 366, 1522},
	{0xfbe5a0, "16|8|0xfade8e,40|12|0xfbde8d,64|44|0xf7d784,84|28|0xfadd8f,104|62|0x6b4a46",1550, 1296, 1836, 1518},
}

gamePart = {
	{0xfbde8c, "-8|46|0xf2ce77,14|30|0xf6d481,52|6|0xfade94,42|54|0x67403e,60|40|0x6e4c45", 920, 838, 1258, 1140},
	{0xfbdd8b, "-12|50|0xeecc79,14|28|0xf6d582,46|-2|0xfbe298,32|54|0x633c3f,52|36|0x704d45", 934, 848, 1248, 1134},
	{0xfade8c, "-1|51|0xf2cd78,24|26|0xfad987,54|3|0xfbe29b,44|69|0x6b4642,64|47|0x6a4944", 2, 374, 288, 642},
	{0xfbde8c, "-2|44|0xf2ce79,24|18|0xfadb89,52|0|0xfbe298,44|60|0x694441,62|36|0x6d4a42", 1388, 656, 1746, 968},
	{0xfade8c, "4|50|0xefce7c,22|26|0xfad987,48|0|0xfbe29c,42|62|0x694242,64|40|0x714c46", 342, 1184, 656, 1452},
	{0xfcde8c, "6|46|0xf2ce79,28|22|0xfad987,56|6|0xfadf93,48|64|0x6b433c,68|44|0x64433f", 1198, 392, 1530, 674},
	{0xfde7a3, "12|14|0xfce08c,34|28|0xfcde8e,28|54|0xf4cf7c,54|28|0xfce49e,68|52|0x704b44",910, 1010, 1212, 1242},
	{0xfbe19a, "16|6|0xfade8c,36|10|0xfbde8d,40|38|0xf3cf7c,58|12|0xfbdf95,66|48|0x694342", 878, 994, 1208, 1262},
	{0xfae29a, "14|4|0xfbde8d,30|10|0xfade8c,44|26|0xfad986,66|12|0xfbe299,68|48|0x6c463f", 222, 634, 574, 934},
	{0xfbe4a0, "14|10|0xfbde8a,34|12|0xfbde8c,48|28|0xfbda88,66|18|0xfadf93,76|46|0x6a4744", 1066, 652, 1404, 918},
	{0xfce39c, "28|8|0xfbde8c,56|16|0xfbde8d,100|16|0xfbe29b,68|48|0xf5d382,100|72|0x69443f", 1788, 1252, 2036, 1532},
	{0xfce39c, "14|6|0xfade8d,34|10|0xfade8c,50|26|0xf9da88,72|14|0xfae196,80|40|0x724f47", 936, 698, 1206, 918},
	{0xfbe39c, "18|2|0xfbde8f,30|10|0xfade8c,46|26|0xfad986,62|10|0xfbdf98,74|46|0x5f3935", 1230, 646, 1562, 920},
	{0xfbe29b, "18|8|0xfade8a,38|10|0xfade8d,46|24|0xfbd986,78|12|0xfbe298,78|44|0x673f3d", 472, 1000, 770, 1252},
	{0xfbe29a, "14|4|0xfcde8f,32|10|0xfade8c,44|28|0xf7d685,70|10|0xfbe29c,76|42|0x644340", 884, 992, 1222, 1262},
}

--函数:启动游戏
function starGame()
	local gameCheck = isFrontApp(sysInit.gameBid); --检测是否在前台运行
	if gameCheck ~= 1 then
		local game = runApp(sysInit.gameBid); -- 开始运行
		if game == 0 then
			nLog("游戏已经启动")
			return true
		end
	else
		nLog("游戏已经启动")
		return true
	end
	return false
end

--函数:注册账号
function regAcc()
	local loop = 0
	local reg_last_t = os.time()
	while true do
		if loop == 0 then
			if multiColor(t_Login,90) then
				nLog("login")
				t_Login.action_1()
				mSleep(1000)
			elseif multiColor(t_Reg,90) then
				nLog("reg")
				acc = randomStr("123456789abcefghijklmnopqrstuvwxyz", 8)
				nLog(acc)
				reg_last_t = os.time()
				loop = 1
			else
				if os.difftime(os.time(),reg_last_t) > 30 then
					closeApp(sysInit.gameBid)
					mSleep(1200)
					sysInit.gameLoop = 0
					return false
				end
			end
		elseif loop == 1 then
			if multiColor(t_Reg,90) then
				nLog("t_reg")
				t_Reg.action_1()
				mSleep(1000)
				inputText("k_"..acc.."#ENTER#")
				mSleep(1000)
				t_Reg.action_2()
				mSleep(1000)
				inputText("123456a#ENTER#")
				mSleep(1000)
				t_Reg.action_3()
				mSleep(1000)
				inputText("123456a#ENTER#")
				mSleep(1000)
				for var = 1,10 do
					t_Reg.action_4()
					mSleep(1000)
					if not multiColor(t_Reg,90) then
						break
					end
				end
				loop = 2
			end
			if os.difftime(os.time(),reg_last_t) > 30 then
				closeApp(sysInit.gameBid)
				mSleep(1200)
				sysInit.gameLoop = 0
				return false
			end
		elseif loop == 2 then
			if multiColor(t_Gg,90) then
				nLog("gg")
				t_Gg.action_1()
				mSleep(1000)
			elseif multiColor(t_Go,90) then
				t_Go.action_1()
				mSleep(1000)
			elseif multiColor(t_Talk,90) then
				return true
			end
		end
	end
end

function scanGame(t)
	keepScreen(true)
	for var = 1,#t do
		x,y = findMultiColorInRegionFuzzy( t[var][1], t[var][2], 85, t[var][3], t[var][4], t[var][5], t[var][6])
		if x ~= -1 and y ~= -1 then
			click(x,y)
			mSleep(500)
			keepScreen(false)
			break
		end
	end
	keepScreen(false)
end

function gameRun()
	if multiColor(t_Talk,90) then
		t_Talk.action_1()
		mSleep(500)
	elseif multiColor(t_End,90) then
		return true
	else
		scanGame(gameGo)
	end
end	

function gameMain()
	local loop = 0
	while true do
		if loop == 0 then
			if multiColor(t_Talk,90) then
				t_Talk.action_1()
				mSleep(500)
			elseif multiColor(t_End,90) then
				t_End.action_1()
				mSleep(500)
			elseif multiColor(t_Name,90) then
				mSleep(500)
				t_Name.action_1()
				mSleep(2500)
				loop = 1
			end
		elseif loop == 1 then
			if multiColor(t_JiuGo,90) then
				t_JiuGo.action_1()
				mSleep(500)
				j_last_t = os.time()
				loop = 2
			end
		elseif loop == 2 then
			if os.difftime(os.time(),j_last_t) > 10 then
				closeApp(sysInit.gameBid)
				mSleep(1200)
				sysInit.gameLoop = 0
				return false
			else
				if multiColor(t_JiuGuan,90) then
					loop = 3
				end
			end
		elseif loop == 3 then
			if multiColor(t_JiuGuan,90) then
				t_JiuGuan.action_1()
				mSleep(500)
			elseif multiColor(t_Chou,90) then
				t_Chou.action_1()
				mSleep(500)
			elseif multiColor(t_End,90) then
				t_End.action_1()
				mSleep(500)
			elseif multiColor(t_ChouOK,90) then
				t_ChouOK.action_1()
				mSleep(500)
			elseif multiColor(t_Master,90) then
				return true
			end
		end
	end
end

function fight()
	local loop = 0
	while true do
		if loop == 0 then
			if multiColor(t_Master,90) then
				t_Master.action_1()
				mSleep(500)
			elseif multiColor(t_Map,90) then
				t_Map.action_1()
				mSleep(500)
			elseif multiColor(t_FightGo,90) then
				t_FightGo.action_1()
				mSleep(500)
			elseif multiColor(t_Xuan,90) then
				if not multiColor(t_Start,90) then
					t_Xuan.action_1()
					mSleep(200)
					t_Xuan.action_2()
					mSleep(300)
				else
					t_Start.action_1()
					mSleep(500)
				end
			elseif multiColor(t_FightIn,90) then
				loop = 1
			end
		elseif loop == 1 then
			if multiColor(t_Win,90) then
				loop = 2
			else
				scanGame(gamePart)
			end
		elseif loop == 2 then
			if multiColor(t_Win,90) then
				t_Win.action_1()
				mSleep(500)
			elseif multiColor(t_Talk,90) then
				t_Talk.action_1()
				mSleep(500)
			elseif multiColor(t_CloseMap,90) then
				t_CloseMap.action_1()
				mSleep(500)
			elseif multiColor(t_Master,90) then
				return true
			end
		end
	end
end

function card()
	local loop = 0
	while true do
		if loop == 0 then
			if multiColor(t_Master,90) then
				t_Master.action_3()
				mSleep(500)
			elseif multiColor(t_Gift,90) then
				if not multiColor(t_GiftEnd,90) then
					t_Gift.action_1()
					mSleep(1000)
				else
					for var = 1,10 do
						t_Gift.action_2()
						mSleep(500)
						if not multiColor(t_GiftEnd,90) then
							break
						end
					end
					loop = 1
				end
			end
		elseif loop == 1 then
			if multiColor(t_Master,90) then
				t_Master.action_5()
				mSleep(500)
			elseif multiColor(t_RenWu,90) then
				if multiColor(t_LinQu,90) then
					t_LinQu.action_1()
					mSleep(500)
				elseif multiColor(t_lqOK,90) then
					t_lqOK.action_1()
					mSleep(1000)
				else
					t_RenWu.action_1()
					mSleep(1000)
					loop = 2
				end
			end
		elseif loop == 2 then
			if multiColor(t_Set,90) then
				nLog("set")
				mSleep(500)
				t_Set.action_1()
				mSleep(1000)
				inputText("10076F7_9#ENTER#")
				mSleep(1000)
				t_Set.action_2()
				mSleep(1000)
				for var = 1,15 do
					t_Set.action_3()
					mSleep(1000)
					if not multiColor(t_Panl,90) and not multiColor(t_Set,90) then
						loop = 3
						break
					end
				end
			elseif multiColor(t_Panl,90) then
				t_Panl.action_1()
				mSleep(500)
			elseif multiColor(t_Master,90) then
				t_Master.action_4()
				mSleep(500)
			end
		elseif loop == 3 then
			if multiColor(t_Master,90) then
				t_Master.action_6()
				mSleep(1000)
			elseif multiColor(t_Mail,90) then
				nLog("mail")
				if multiColor(t_Mails,90) then
					nLog("yes")
					t_Mails.action_1()
					mSleep(1000)
				else
					nLog("no")
					t_Mail.action_1()
					mSleep(1000)
					loop = 4
				end
			elseif multiColor(t_NoMail,90) then
				if multiColor(t_GetMail,90) then
					nLog("get")
					t_GetMail.action_1()
					mSleep(1000)
				else
					t_NoMail.action_1()
					mSleep(1200)
					t_Mail.action_1()
					mSleep(1000)
					loop = 4
				end
			end
		elseif loop == 4 then
			if multiColor(t_Master,90) then
				index = addDmOcrDict("game.txt")
				gold = dmOcrText(index, 1268, 43, 1404, 109, "efe1b5,100d0a#e3d7ae,1c1711", 90)
				if tonumber(gold) == 300 then
					t_Master.action_2()
					mSleep(1000)
				else
					loop = 1
				end
			elseif multiColor(t_JiuGuan,90) then
				t_JiuGuan.action_1()
				mSleep(500)
			elseif multiColor(t_Chou,90) then
				t_Chou.action_1()
				mSleep(500)
			elseif multiColor(t_End,90) then
				t_End.action_1()
				mSleep(500)
				return true
			end
		end
	end
end
				
function scanHero()
	keepScreen(true)
	for var = 1,#Hero do
		local x,y = findMultiColorInRegionFuzzy(Hero[var][1], Hero[var][2], 90, 860, 622, 1166, 898)
		if x ~= -1 and y ~= -1 then
			keepScreen(false)
			return Hero[var][3]
		end
	end
	keepScreen(false)
	return 0
end

function saveCard()
	if multiColor(t_Card,90) then
		local name = scanHero()
		nLog(name)
		if name ~= 0 then
			file = io.open(sysInit.gameAcc, "a");
			file:write("k_"..acc.."|"..name.."\n");
			file:close();
			return true
		else
			mSleep(500)
			return true
		end
	end
end

function main()
	if sysInit.gameLoop == 0 then
		if starGame() then
			nLog(sysInit.gameLoop)
			sysInit.gameLoop = 1
		end
	elseif sysInit.gameLoop == 1 then
		if regAcc() then
			nLog(sysInit.gameLoop)
			sysInit.gameLoop = 2
		end
	elseif sysInit.gameLoop == 2 then
		if gameRun() then
			sysInit.gameLoop = 3
		end
	elseif sysInit.gameLoop == 3 then
		if gameMain() then
			sysInit.gameLoop = 4
		end
	elseif sysInit.gameLoop == 4 then
		if fight() then
			sysInit.gameLoop = 5
		end
	elseif sysInit.gameLoop == 5 then
		if card() then
			sysInit.gameLoop = 6
		end
	elseif sysInit.gameLoop == 6 then
		if saveCard() then
			closeApp(sysInit.gameBid)
			mSleep(1200)
			sysInit.gameLoop = 0
		end
	end
end

init(1) --初始化屏幕方向为HOME键在右
isApp()
nLog("1")
closeApp(sysInit.gameBid)
nLog("2")
mSleep(1200)

while true do
	main()
end
