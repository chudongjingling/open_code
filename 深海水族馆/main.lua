--2018-04-01 面板左上角红心白手套位置左移
require "TSLib"
local gamebid = "com.idleif.abyssrium"
init(0)
w,h = getScreenSize()

if w > h then
	dialog("请将模拟器设置为竖屏，建议分辨率：720x1280")
	lua_exit()
end
if w == 1080 and h == 1920 then
	lx0,ly0,rx0,ry0 = 300,220,1070,300
	lx,ly,rx,ry = 0,0,1050,70
elseif w == 720 and h == 1280 then
	lx0,ly0,rx0,ry0 = 10,120,710,200
	lx,ly,rx,ry = 0,0,700,80
elseif w == 640 and h == 1136 then
	lx0,ly0,rx0,ry0 = 10,130,630,180
	lx,ly,rx,ry = 0,0,620,40
elseif w == 1242 and h == 2208 then
	lx0,ly0,rx0,ry0 = 10,200,1232,260
	lx,ly,rx,ry = 0,0,1222,60
else
	dialog("脚本尚未完全适配您的手机分辨率，不保证运行效果")
	mSleep(3000)
end
glSettings({switch = "1001", x1 = lx0, y1 = ly0, x2 = rx0, y2 = ry0,tsp_switch = false})

function hyStrNum(str)
	if str==nil then return 40 end
	local strn = nil
	for i=1,string.len(str) do
		local num=string.sub(str,i,i)
		if tonumber(num) then
			if strn==nil then
				strn=num
			else
				strn=strn..num
			end
		end
	end
	return tonumber(strn)
end

function upgrade(... ) --升级
	if multiColTap( ... ) then
		sign_upgrade = 1
	end
end

function unlock()--防锁屏
	flag = deviceIsLock()
	if flag ~= 0 then
		sysver = getOSVer()
		sysint = tonumber(string.sub(sysver, 1, 1)..string.sub(sysver, 2, 2))--转化为数字版本号
		if sysint == 10 then
			toast("解锁！",1)
			pressHomeKey(0)
			pressHomeKey(1)
			mSleep(500)
			unlockDevice()
			mSleep(50)
			pressHomeKey(0)
			pressHomeKey(1)
			mSleep(500)
		else
			unlockDevice()
		end
	end
end

function gamestart()
	runApp(gamebid)
	mSleep(3000)
end

UINew("深海水族馆挂机辅助","立即运行","立即退出","shszg.dat",0,30)
UILabel("活动期间请勿使用和糖果颜色接近主题，以便提高收集效率!!!",24,"center","255,100,100")
UILabel("收集设置",20,"center","230,50,92")
UIRadio("bubble","日常红心,活动物品","0")
UILabel("基础功能",20,"center","230,50,92")
UICheck("basic1,basic2","自动点击,自动收集","0@1")
UILabel("点击速度设置",20,"center","230,50,92")
UIRadio("step","iPhone 6+,iPhone 5 或安卓旗舰,低配千元安卓机,选这个保证不卡,自定义速度","3")
UILabel("自定义速度设置",20,"center","230,50,92")
UIEdit("speedset","每秒点击次数","30",15,"left","255,0,0","number")
UILabel("是否显示准星",20,"center","230,50,92")
UIRadio("wztouch","显示,不显示","0")
UILabel("珊瑚设置",20,"center","230,50,92")
UIRadio("shanhu","孤独的珊瑚石,小珊瑚石","0")
UILabel("显示设置",20,"center","230,50,92")
UIRadio("case","全屏不显示菜单,石头界面,扩张界面","0")
UILabel("功能设置",20,"center","230,50,92")
UICheck("func1,func2,func3","升级石头,使用技能,收割农场","0@1")
UILabel("使用须知",20,"left","230,50,92")
UILabel("★ 加速为技能冷却、广告冷却、农场产出时间加速",16,"left","230,50,92")
UILabel("★ 请将体积较大的鱼收起以便更容易找到红心。",16,"left","230,50,92")
UILabel("★ 每秒点击次数最好不要超过40次，否则游戏会卡死",16,"left","230,50,92")
UILabel("★ 活动期间建议使用全屏模式，半屏会导致有些鱼飘到上面去找不到",16,"left","230,50,92")
UILabel("★ 活动期间建议使用活动范围在珊瑚石周围的鱼比如小丑鱼",16,"left","230,50,92")
UILabel("★ 活动期间建议使用与活动物品色差较大的主题皮肤，否则会严重影响找色",16,"left","230,50,92")
UILabel("★游戏攻略、问题反馈请加群:414534539",16,"left","230,50,92")
UIShow()

if shanhu == "孤独的珊瑚石" then
	nLog("孤独的珊瑚石")
	shanhushi = 0
elseif shanhu == "小珊瑚石" then
	nLog("小珊瑚石")
	shanhushi = 1
end


if step == "iPhone 6+" then
	tapms = 15
elseif step == "iPhone 5 或安卓旗舰" then
	tapms = 23
elseif step == "低配千元安卓机" then
	tapms = 40
elseif step == "选这个保证不卡" then
	tapms = 190
elseif step == "自定义速度" then
	tapms = hyStrNum(speedset)
	tapms = 1000/tapms-10
	if tapms < 1 then
		tapms = 30
	end
	mSleep(2000)
else
	tapms = 30
end

if basic2 == "自动收集" then
	if bubble == "日常红心" then
		seconds = 5
	elseif bubble == "活动物品" then
		seconds = 2
	end
else
	seconds = 2
end

if case == "石头界面" or "扩张界面" then
	fh = h*0.38
elseif case == "全屏不显示菜单" then
	fh = h*0.8
end

if wztouch == "显示" then
	tapimg = "wzpoint.png"
	mLog("显示准星")
else
	tapimg = "不显示准星.png"
	mLog("不显示准星")
end

if w == 640 and h == 1136 then
	require "5c"
elseif w == 1536 and h == 2048 then
	require "ipadhd"
elseif w == 750 and h == 1334 then
	require "6s"
elseif w == 1242 and h == 2208 then
	require "6P"
elseif w == 720 and h == 1280 then
	require "720p"
elseif w == 1080 and h == 1920 then
	require "1080p"
else
	setScreenScale(true, 720, 1280)
	require "720p"
	setScreenScale(false)
end

while (true) do
	unlock()
	if frontAppBid() == gamebid then	
		if basic1 == "自动点击" then
			local t1 = os.time()
			if adtime ~= 1 then
				while (true) do
					tap(w/3,h/3,tapms,tapimg)
					mSleep(tapms)
					if os.time() - t1 >= seconds then
						break
					end
				end
			end
		end
		daily()--日常弹窗检测
		if basic2 == "自动收集" then
			if bubble == "日常红心" then
				collect()
			elseif bubble == "活动物品" then
				festival()
			end
		end
		if case == "石头界面" then
			menu()
		elseif case == "扩张界面" then
			expand()
		elseif case == "全屏不显示菜单" then
			shutmenu()
		end
		if func1 == "升级石头" then
			stoneup()
		end
		if func2 == "使用技能" then
			stoneskill()
		end
		if func3 == "收割农场" then
			farm()
		end
	else
		gamestart()
	end
end
