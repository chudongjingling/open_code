
local sz = require("sz")
require "TsLib" --加载函数库

sysInit = {
	gameBid_1 = "com.sjyt.threek", --设置游戏BID，用于启动关闭游戏调用
	gameBid_2 = "com.gamesworker.threekingdoms",
	gameBid = "",
	gameLoop = 0,
}

function isApp()
	local appPath = appBundlePath(sysInit.gameBid_1)
	if appPath ~= "" then
		sysInit.gameBid = "com.sjyt.threek"
	else
		sysInit.gameBid = "com.gamesworker.threekingdoms"
	end
end
		

--启动游戏
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

--解锁屏幕
function unLock()
	local flag = deviceIsLock(); --判断屏幕是否锁定
	if flag ~= 0 then
		unlockDevice();          --解锁屏幕
		mSleep(2000);
		return true
	else
		return true
	end
	return false
end

--登录
function login()
	if multiColor(t_Login,90) then
		t_Login.action_1()
		mSleep(500)
	elseif multiColor(t_gg,90) then
		t_gg.action_1()
		mSleep(500)
	elseif multiColor(t_Start,90) then
		t_Start.action_1()
		mSleep(500)
	elseif multiColor(t_Master,90) then
		nLog("master")
		return true
	end
end

function findArrow()
	x,y = findMultiColorInRegionFuzzy( 0xfee84b, "-8|-7|0xff9f1b,7|-7|0xffc512,-6|-21|0xec9f26,4|-22|0xeb9b21", 90, 292, 142, 1064, 560)
	if x ~= -1 and y ~= -1 then
		return true
	else
		return false
	end
end

function mine()
	local loop = 0
	local lastTime = os.time()
	local mine_count = 1
	local zy_count = 1
	local pos = sz.pos
	local p0 = pos(972,380)
	local p1 = pos(384,376)
	while true do
		if loop == 0 then
			if multiColor(t_Master,90) then
				nLog("master")
				mSleep(1000)
				for var = 1,3 do
					p0:touchMoveTo(p1, 10, 50, 1)
				end
				mSleep(1000)
				t_Master.action_1()
				mSleep(1000)
				loop = 1
			end
		elseif loop == 1 then
			if multiColor(t_zy,90) then
				nLog("zy")
				if zy_count == 1 then
					for var = 1,20 do
						nLog("zy1")
						t_zy.action_1()
						mSleep(1000)
						if findArrow() then
							find_last_t = os.time()
							loop = 2
							break
						end
					end
				else
					for var = 1,20 do
						nLog("zy2")
						t_zy.action_2()
						mSleep(1000)
						if findArrow() then
							find_last_t = os.time()
							loop = 2
							break
						end
					end
				end
			elseif multiColor(t_mine,90) then
				nLog("mine")
				if mine_count == 1 then
					t_mine.action_1()
					nLog("mine_1")
					mSleep(1000)
				else
					t_mine.action_2()
					nLog("mine_2")
					mSleep(1000)
				end
			end
		elseif loop == 2 then
			x,y = findMultiColorInRegionFuzzy( 0xfee84b, "-8|-7|0xff9f1b,7|-7|0xffc512,-6|-21|0xec9f26,4|-22|0xeb9b21", 90, 292, 142, 1064, 560)
			if x ~= -1 and y ~= -1 then
				if zy_count == 1 then
					arrow_p = {}
					arrow_p.x = x
					arrow_p.y = y
					arrow_c = {
						{637,579,0},
						{657,580,0},
						{677,577,0},
					}
					for var = 1,#arrow_c do
						arrow_c[var][3] = string.format("0x%x",getColor(arrow_c[var][1], arrow_c[var][2]))
					end
					for var = 1,10 do
						click(x,y+100)
						mSleep(1000)
						if multiColor(t_lost,90) then
							loop = 3
							break
						end
					end
				else
					if multiColor(arrow_c,90) then
						if math.abs(arrow_p.x - x) > 50 or math.abs(arrow_p.y - y) > 50 then
							for var = 1,10 do
								click(x,y+100)
								mSleep(1000)
								if multiColor(t_lost,90) then
									loop = 3
									break
								end
							end
						else
							loop = 1
						end
					else
						for var = 1,10 do
							click(x,y+100)
							mSleep(1000)
							if multiColor(t_lost,90) then
								loop = 3
								break
							end
						end
					end
				end
			else
				if os.difftime(os.time(),find_last_t) > 12 then
					loop = 1
				end
			end
		elseif loop == 3 then
			if multiColor(t_lost,90) then
				for var = 1,5 do
					t_lost.action_1()
					mSleep(1000)
					if multiColor(t_Buy,90) then
						break
					end
				end
			elseif multiColor(t_Buy,90) then
				t_Buy.action_1()
				mSleep(1000)
			elseif multiColor(t_Team,90) then
				t_Team.action_1()
				mSleep(1000)
			elseif multiColor(t_Fight1,90) then
				loop = 4
			end
		elseif loop == 4 then
			if multiColor(t_Win,90) then
				t_Win.action_1()
				mSleep(1000)
			elseif multiColor(t_zy,90) then
				if mine_count >= 2 and zy_count >= 2 then
					return true
				else
					if zy_count == 1 and mine_count == 1 then
						zy_count = 2
						loop = 1
					elseif zy_count == 1 and mine_count == 2 then
						zy_count = 2
						loop = 1
					elseif zy_count == 2 and mine_count == 1 then
						for var = 1,10 do
							t_zy.action_3()
							mSleep(1000)
							if not multiColor(t_zy,90) then
								mine_count = 2
								zy_count = 1
								loop = 1
								break
							end
						end
					end
				end
			end
		end
	end
end
					

--活动BOSS
function boss()
	local loop = 0
	local count = 0
	local today = os.date("*t")
	local lastTime = os.time()
	while true do
		if loop == 0 then
			if multiColor(t_Master,90) then
				t_Master.action_1()
				mSleep(500)
			elseif multiColor(t_Boss,90) then
				if today.hour >= 12 and today.hour < 13 then --检测是否是在活动时间内
					if not multiColor(t_Xl,90) then
						t_Xl.action_1()
						mSleep(500)
					else
						loop = 1
					end
				elseif today.hour >= 21 and today.hour < 22 then --检测是否是在活动时间内
					if not multiColor(t_Ws,90) then
						t_Ws.action_1()
						mSleep(500)
					else
						loop = 1
					end
				else
					nLog("不是活动时间")
					closeApp(sysInit.gameBid)
					lockDevice()
					lua_exit()
				end
			end
		elseif loop == 1 then
			if multiColor(t_Boss,90) then
				if not multiColor(t_Dead,90) then
					if not colorFlag(t_Time,90) then
						t_Boss.action_1()
						mSleep(1000)
					else
						if count >= 1 then
							if not colorFlag(t_Blood,90) then
								repeat
									t_Boss.action_1()
									mSleep(1000)
								until multiColor(t_Buy,90)
								t_Buy.action_1()
								mSleep(1000)
							else
								mSleep(100)
							end
						end
					end
				else
					return true
				end
			elseif multiColor(t_Team,90) then
				t_Team.action_1()
				mSleep(1000)
			elseif multiColor(t_Fight,90) then
				loop = 2
			end
		elseif loop == 2 then
			if multiColor(t_Win,90) or multiColor(t_End,90) then
				t_Win.action_1()
				mSleep(500)
			elseif multiColor(t_Boss,90) then
				count = count + 1
				loop = 1
			end
		end
		if os.difftime(os.time(), lastTime) > 5 then  --每五秒检测一次目标应用是否还在运行
			local flag = appIsRunning(sysInit.gameBid); 
			if flag == 0 then
				nLog("闪退")
				sysInit.gameLoop = 1
				return false
			else
				lastTime = os.time()
			end
		end
	end
end

function main()
	if sysInit.gameLoop == 0 then
		if unLock() then
			sysInit.gameLoop = 1
		end
	elseif sysInit.gameLoop == 1 then
		if starGame() then
			sysInit.gameLoop = 2
		end
	elseif sysInit.gameLoop == 2 then
		if login() then
			sysInit.gameLoop = 3
		end
	elseif sysInit.gameLoop == 3 then
		if mine() then
			nLog("结束")
			closeApp(sysInit.gameBid)
			mSleep(1000)
			lockDevice()
			lua_exit()
			mSleep(1)
		end
	end
end

--=====================--主入口--=====================--

init(1) --初始化屏幕方向为HOME键在右
isApp();
closeApp(sysInit.gameBid)
mSleep(1000)
--if not isVer(220) then
--	dialog("您的触动精灵版本过低,请升级至最新版本", 0)
--	lua_exit()
--end

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
elseif width == 750 and height == 1334 then
	require "6s"
elseif width == 1536 and height == 2048 then
    require "mini2"
elseif width == 1242 and height == 2208 then
	require "6p"
end

while true do
	main()
end
