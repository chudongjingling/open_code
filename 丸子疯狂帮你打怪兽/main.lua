--2017-07-12 自定义速度增加对安卓系统的支持
--支持更多安卓分辨率
local sz = require("sz")
local json = sz.json
local UIinfo = {}
require "TSLib"

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


function upgrade( ... ) --英雄升级
	if multiColTap( ... ) then
		sign_upgrade = 1
	end
end

function boss( ... ) --挑战魔王
	if sign_upgrade == 1 then
		if multiColTap( ... ) then
			sign_upgrade = 0
			bossTime = os.time()
			sign_boss = 1
		end
	end
end

function bosssign( ... )
	if multiColor( ... ) then
		bossTime = os.time()
		sign_boss = 1
	end
end

local w,h = getScreenSize()
function hrmove( ... )
	if w==640 and h==1136 then
		if multiColor({{  204, 1092, 0xffffff},{  234, 1098, 0xffffff}}) and multiColor({{ 78,1020,0xc46212}}) ==false then--蓝色按钮打开状态，武器按钮
			moveTo( ... )
			mSleep(50)
		end
	elseif w==750 and h==1334 then
		if multiColor({{  239, 1280, 0xffffff},{  239, 1271, 0xffffff}}) and multiColor({{ 90, 1184, 0xc46212}}) ==false then
			moveTo( ... )
			mSleep(50)
		end
	elseif w==1536 and h==2048 then
		if multiColor({{  545, 1980, 0xffffff},{  614, 1969, 0xffffff}}) and multiColor({{ 304, 1826, 0xc46212}}) ==false then
			moveTo( ... )
			mSleep(50)
		end
	elseif w==1242 and h==2208 then
		if multiColor({{  396, 2105, 0xffffff},{  456, 2083, 0xffffff}}) and multiColor({{ 150, 1950, 0xc46212}}) ==false then
			moveTo( ... )
			mSleep(50)
		end
	elseif w==1080 and h==1920 then
		if multiColor({{ 312, 910,0x6bdafe},{ 317, 910,0x000000}}) and multiColor({{ 399,1738,0xeeaa17}}) ==false then
			moveTo( ... )
			mSleep(50)
		end
	elseif w==720 and h==1280 then
		if multiColor({{  230, 1206, 0xffffff},{  262, 1197, 0xffffff}}) and multiColor({{ 130, 1716, 0xc46212}}) ==false then
			moveTo( ... )
			mSleep(50)
		end
	elseif w==480 and h==800 then
		if multiColor({{  156,  774, 0xffffff},{  182,  774, 0xffffff}}) and multiColor({{65,  715, 0xc46212}}) ==false then
			moveTo( ... )
			mSleep(50)
		end
	else
		setScreenScale(true, 480, 800)
		if multiColor({{  156,  774, 0xffffff},{  182,  774, 0xffffff}}) and multiColor({{65,  715, 0xc46212}}) ==false then
			moveTo( ... )
			mSleep(50)
		end
		setScreenScale(false)
	end
end

UINew("丸子疯狂帮你打怪兽","运行脚本","立即退出","crazymonster.dat",0,30)
UILabel("有问题请加群:123456",20)
UIImage("monster.png")
UILabel("脚本功能",18,"center")
UICheck("func1,func2,func3","自动打怪,解锁升级最新英雄,使用主角技能","0@1@2")
UILabel("选择打怪速度",18,"center")
UIRadio("step","每秒40下,每秒30下,每秒20下,24小时挂机无上限(每秒5下),自定义速度","3")
UILabel("自定义速度设置",20,"center","230,50,92")
UIEdit("speedset","每秒点击次数","30",15,"left","255,0,0","number")
UILabel("主角技能冷却时间",18,"center")
UIRadio("skillcd","10分钟,5分钟,3分钟,1分钟")
UILabel("脚本使用说明",18,"center")
UILabel("1. 安卓仅支持 480*800和720*1280 分辨率，猩猩模拟器请选择最低画质\n2. 主角技能需要手动解锁升级\n3. 此脚本不会自动升级主角，请配合游戏内置自动升级功能使用\n4. 主角技能只会在Boss 打不过去的时候使用")
UILabel("打怪速度",18,"center")
UILabel("游戏有每天点击上限，请斟酌选择点击速度\n每秒点击次数最好不要超过40次，否则游戏会卡死")
UIShow()

if func3 == "使用主角技能" then
	if skillcd == "10分钟" then
		cd = 600
	elseif skillcd == "5分钟" then
		cd = 300
	elseif skillcd == "3分钟" then
		cd = 180
	elseif skillcd == "1分钟" then
		cd = 60
	else
		cd = 60
	end	
end

if func1 == "自动打怪" then
	if step == "每秒40下" then
		tapms = 15
		toast("自动打怪：每秒40下")
	elseif step == "每秒30下" then
		tapms = 23
		toast("自动打怪：每秒30下")
	elseif step =="每秒20下" then
		tapms = 40
		toast("自动打怪：每秒20下")
	elseif step == "24小时挂机无上限(每秒5下)" then
		tapms = 190
		toast("24小时挂机无上限(每秒5下)")
	elseif step == "自定义速度(安卓无效)" then
		if getOSType() =="ios" then
			tapms = hyStrNum(speedset)
			tapms = 1000/tapms-10
			if tapms < 1 then
				tapms = 30
			end
			mSleep(2000)
		else
			tapms = 30
		end
	end
end

local bossTime = os.time()
local multime = os.time()
local yfstime = 200--影分身
while (true) do
	flag = deviceIsLock()
	if flag ~= 0 then
		unlockDevice()
	end
	if func1 == "自动打怪" then
		local t1 = os.time()
		while (true) do
			tap(w/2,h/2,10)
			mSleep(tapms)
			if os.time() - t1 >= 30 then
				break
			end
		end
	end
	if sign_boss ~= 1 then--非boss 战斗状态
		bossTime = os.time()
		if func2 == "解锁升级最新英雄" then
			if w==640 and h==1136 then
				multiColTap({{ 389, 637,0x2c2930},{ 383, 670,0x4f4856},{ 383, 722,0x06688d},{ 452, 721,0x06688d}}) --无法击败(窗口未适配)
				multiColTap({{ 323,  181, 0x4f4856},{ 426,  188, 0x4f4856},{ 555,  211, 0x2c2931},{ 564,  202, 0x2c2931}}) --关闭武器界面
				multiColTap({{ 119,  171, 0x4f4856},{ 136,  393, 0x4f4856},{ 555,  219, 0x2c2931},{ 565,  209, 0x2c2931}}) --关闭英雄详情界面
				if multiColor({{  204, 1092, 0xffffff},{  234, 1098, 0xffffff},{  535,  707, 0xeeaa17}}) then
					upgrade({{ 78,1020,0xc46212},{260, 1031, 0xeeaa17},{ 566,900,0x218db0},{ 566, 900,0x218db0}}) --武器左边剑一蓝
					upgrade({{ 78,1020,0xc46212},{260, 1031, 0xeeaa17},{ 585, 900,0xeeaa17},{ 585, 900,0xeeaa17}}) --武器左边剑武器一黄
					upgrade({{ 77, 1008, 0xc46212},{589, 908,0x787686},{585,791,0x218db0},{566,795,0x218db0}}) --武器一灰二蓝
					upgrade({{ 77, 1008, 0xc46212},{585,791,0xeeaa17},{585,791,0xeeaa17}}) --武器二黄	
				else
					multiColTap({{  204, 1092, 0x16628a},{  234, 1098, 0x115a80},{  184, 1113, 0x42b1eb}})
				end
				boss({{ 548, 326,0xffffff},{ 554, 345,0xffffff},{ 540, 269,0xdd5e0a},{ 540, 269,0xdd5e0a}}) --挑战魔王，白色小手两点、重新挑战橙色按钮
				bosssign({{ 502, 265,0xdd3a15},{ 588, 267,0xdd3a15}}) --是否打boss，红色退出按钮
			elseif w==750 and h==1334 then
				multiColTap({{ 389, 637,0x2c2930},{ 383, 670,0x4f4856},{ 383, 722,0x06688d},{ 452, 721,0x06688d}}) --无法击败(窗口未适配)
				multiColTap({{  134,  201, 0x4f4856},{  382,  357, 0x4f4856},{  652,  246, 0x2c2931},{  663,  236, 0x2c2931}}) --关闭武器界面
				multiColTap({{   76,  200, 0x4f4856},{   79,  328, 0x4f4856},{  651,  256, 0x2c2931},{  659,  244, 0x2c2931}})--关闭英雄详情界面
				if multiColor({{  239, 1280, 0xffffff},{  239, 1271, 0xffffff},{  628,  830, 0xeeaa17}}) then
					upgrade({{ 89, 1182,0xc46212},{289, 1204, 0xeeaa17},{ 692, 1054,0x218db0},{ 692, 1054,0x218db0}}) --武器左边剑一蓝
					upgrade({{ 89, 1182,0xc46212},{289, 1204, 0xeeaa17},{ 692, 1054,0xeeaa17},{ 585, 692, 1054,0xeeaa17}})--武器左边剑武器一黄
					upgrade({{ 89, 1182, 0xc46212},{687,  923,0x787686},{687,  923,0x218db0},{687,  923,0x218db0}})--武器一灰二蓝
					upgrade({{ 89, 1182, 0xc46212},{687,  923,0xeeaa17},{687,  923,0xeeaa17}}) --武器二黄	
				else
					multiColTap({{  239, 1280, 0x115a80},{  239, 1271, 0x115a80},{  217, 1295, 0x42b1eb}})
				end
				boss({{  633,  377, 0xffffff},{  645,  395, 0xffffff},{  587,  299, 0xdd5e0a},{  694,  300, 0xdd5e0a}}) 
				bosssign({{ 585,  300,0xdd3a15},{ 695,  300,0xdd3a15}}) 
			elseif w==1242 and h==2208 then
				multiColTap({{  520,  941, 0x4f4856},{  524, 1059, 0x2c2930},{ 1002, 1371, 0x06688d},{ 1004, 1396, 0x06688d}}) --无法击败
				multiColTap({{  195,  320, 0x4f4856},{  596,  530, 0x4f4856},{ 1076,  397, 0x2c2931},{ 1098,  378, 0x2c2931}}) --关闭武器界面
				multiColTap({{  197,  323, 0x4f4856},{  195,  534, 0x4f4856},{ 1078,  411, 0x2c2931},{ 1096,  393, 0x2c2931}}) --关闭英雄详情界面
				if multiColor({{  396, 2105, 0xffffff},{  456, 2083, 0xffffff},{ 1036, 1362, 0xeeaa17}}) then
					upgrade({{ 150, 1933,0xc46212},{496, 1948, 0xeeaa17},{ 1144, 1701,0x218db0},{ 1144, 1701,0x218db0}}) --武器左边剑一蓝
					upgrade({{ 150, 1933,0xc46212},{496, 1948, 0xeeaa17},{ 1144, 1701,0xeeaa17},{ 1144, 1701,0xeeaa17}}) --武器左边剑武器一黄
					upgrade({{ 150, 1933, 0xc46212},{1144, 1701,0x787686},{1148, 1479,0x218db0},{1148, 1479,0x218db0}}) --武器一灰二蓝
					upgrade({{ 150, 1933, 0xc46212},{1148, 1479,0xeeaa17},{1148, 1479,0xeeaa17}}) --武器二黄
				else
					multiColTap({{  481, 2092, 0x125b81},{  434, 2102, 0x43b3ed},{  481, 2115, 0x40afea}})
				end
				boss({{ 1046,  610, 0xffffff},{ 1089,  599, 0xffffff},{ 1130,  448, 0xdd5e0a},{ 1145,  494, 0xdd5e0a}}) 
				bosssign({{ 1140,  455,0xdd3a15},{ 963,  460,0xdd3a15}}) 
			elseif w==1536 and h==2048 then
				multiColTap({{  284,  426, 0x4f4856},{  634,  442, 0xf74e53},{  908,  438, 0xf74e53},{ 1232,  462, 0x2c2931}})--关闭公告窗口
				multiColTap({{  230,  665, 0xc23c00},{  259,  664, 0xb61e00},{  249,  671, 0xffe129},{  263,  728, 0xd44302}})--离线奖励
				multiColTap({{  206,  168, 0x4f4856},{  272, 1858, 0x5c4c6b},{  892, 1918, 0xb63924},{ 1288,  210, 0x2c2931}})--好友列表
				multiColTap({{  192,  163, 0x605967},{  166,  606, 0x605967},{ 1198,  222, 0x605967},{ 1276,  186, 0x2c2931}})--世界排行
				multiColTap({{ 389, 637,0x2c2930},{ 383, 670,0x4f4856},{ 383, 722,0x06688d},{ 452, 721,0x06688d}}) --无法击败(窗口未适配)
				multiColTap({{  316,  228, 0x4f4856},{  753,  313, 0x4f4856},{ 1215,  301, 0x2c2931},{ 1234,  285, 0x2c2931}}) --关闭武器界面
				multiColTap({{  305,  227, 0x4f4856},{  287,  442, 0x4f4856},{ 1214,  319, 0x2c2931},{ 1234,  300, 0x2c2931}})--关闭英雄详情界面
				if multiColor({{  545, 1980, 0xffffff},{  614, 1969, 0xffffff},{ 1186, 1250, 0xeeaa17}}) then
					upgrade({{  304, 1805, 0xc46212},{  572, 1862, 0xeeaa17},{ 1274, 1607,0x218db0},{ 1274, 1607,0x218db0}}) --武器左边剑一蓝
					upgrade({{ 304, 1805, 0xc46212},{  572, 1862, 0xeeaa17},{ 1274, 1607,0xeeaa17},{ 1274, 1607,0xeeaa17}})--武器左边剑武器一黄
					upgrade({{  454, 1866, 0xeeaa17},{ 1280, 1613, 0x787686},{ 1277, 1399, 0x218db0},{ 1249, 1394, 0x218db0}}) --武器一灰二蓝
					upgrade({{  454, 1866, 0xeeaa17},{ 1277, 1399,0xeeaa17},{ 1277, 1399,0xeeaa17}}) --武器二黄
				else
					multiColTap({{  545, 1980, 0x115a80},{  614, 1969, 0x1e709b},{  509, 2003, 0x43b1eb}})
				end
				boss({{ 1220,  437, 0xffffff},{ 1180,  500, 0xffffff},{ 1228,  507, 0xffffff},{ 1263,  390, 0xdd5e0a}}) 
				bosssign({{ 1277,  393, 0xdd3a15},{ 1117,  384, 0xdd3a15}}) 
			elseif w==1080 and h==1920 then
				x,y = findMultiColorInRegionFuzzy( 0xd44302, "18|-5|0xd44302,-43|-47|0xc23c00", 90, 19, 691, 126, 780)
				if x ~= -1 then
					tap(x,y)
				end
				multiColTap({{  878,  280, 0x857c8f},{  936,  333, 0x2c2931},{  953,  347, 0x2c2931}}) --关闭武器界面
				multiColTap({{ 940,  386, 0x2c2931},{ 967,  359, 0x2c2931},{ 951,  374, 0x2c2931}}) --关闭英雄详情界面
				upgrade({{ 132, 1719, 0xc46212},{745, 1718, 0xeeaa17},{ 988, 1527,0xeeaa17},{ 988, 1527,0xeeaa17}}) --武器左边剑武器一黄
				upgrade({{ 132, 1719, 0xc46212},{745, 1718, 0xeeaa17},{992, 1335,0xeeaa17},{992, 1335,0xeeaa17}}) --武器二黄
				upgrade({{ 132, 1719, 0xc46212},{745, 1718, 0xeeaa17},{ 988, 1527,0x218db0},{ 988, 1527,0x218db0}}) --武器左边剑一蓝
				upgrade({{ 132, 1719, 0xc46212},{745, 1718, 0xeeaa17},{988, 1527,0x787686},{566,795,0x218db0},{566,795,0x218db0}}) --武器一灰二蓝	
				boss({{ 911,  549,0xffffff},{ 933,  567,0xffffff},{ 860,  458, 0xdd5e0a},{ 989,  466, 0xdd5e0a}}) --挑战魔王，白色小手两点、重新挑战橙色按钮
				bosssign({{ 839,  459,0xdd3a15},{ 995,461,0xdd3a15}}) --是否打boss，红色退出按钮
			elseif w==720 and h==1080 then--猩猩模拟器720x1280低画质
				multiColTap({{  314,  530, 0x4f4856},{  319,  599, 0x2c2930},{  578,  771, 0x06688d},{  579,  794, 0x06688d}})--无法击败
				multiColTap({{  122,  177, 0x4f4856},{  349,  228, 0x4f4856},{  624,  217, 0x2c2931},{  636,  204, 0x2c2931}})--关闭武器界面
				multiColTap({{   97,  176, 0x4f4856},{   92,  290, 0x4f4856},{  624,  226, 0x2c2931},{  636,  214, 0x2c2931}})--关闭英雄详情界面
				if multiColor({{  230, 1206, 0xffffff},{  262, 1197, 0xffffff},{  600,  775, 0xeeaa17}}) then
					upgrade({{ 186,1134,0xeeaa17},{ 651, 864,0x218db0},{ 590, 1070,0xd2d2d7}}) --武器左边剑一蓝
					upgrade({{ 186,1134,0xeeaa17},{ 651, 864,0xeeaa17},{ 590, 1070,0xd2d2d7}})--武器左边剑武器一黄
					upgrade({{ 186,1134,0xeeaa17},{ 590, 1070,0x787686},{ 651, 864,0x218db0},{ 590, 864,0x218db0}}) --武器一灰二蓝
					upgrade({{ 186,1134,0xeeaa17},{ 651, 864,0xeeaa17},{ 590, 864,0xd2d2d7}})--武器二黄
				else
					multiColTap({{  231, 1211, 0x115a80},{  196, 1200, 0x0e6a99},{  246, 1188, 0x4dbefa}})
				end
				boss({{ 613, 329,0xffffff},{ 622, 334,0xffffff},{ 610, 267,0xdd5e0a},{ 610, 267,0xdd5e0a}}) 
				bosssign({{ 662, 271,0xdd3a15},{ 562, 268,0xdd3a15}})
			elseif w==480 and h==800 then--猩猩模拟器480x800低画质
				multiColTap({{ 232, 516, 0x605967},{ 421, 488, 0x605967},{ 431,173,0xdd5e0a},{ 446,  496, 0xf45f30}}) --无法击败
				multiColTap({{ 180,  116, 0x4f4856},{ 278,  104, 0x857c8f},{ 410,  139, 0x2c2931},{ 416,  132, 0x2c2931}}) --关闭武器界面
				multiColTap({{   64,  112, 0x4f4856},{   60,  189, 0x4f4856},{  411,  143, 0x2c2931},{  416,  139, 0x2c2931}})--关闭英雄详情界面 
				if multiColor({{  156,  774, 0xffffff},{  182,  774, 0xffffff},{  397,  496, 0xeeaa17}}) then
					upgrade({{ 324,719,0xeeaa17},{ 435,  633,0x218db0},{ 435,  633, 0x218db0}}) --武器一蓝
					upgrade({{ 324,719,0xeeaa17},{ 435,  633,0xeeaa17},{ 435,  633, 0xeeaa17}})--武器一黄
					upgrade({{ 324,719,0xeeaa17},{ 432,  636, 0x787686},{ 434,  552, 0x218db0},{ 425,  556, 0x218db0}}) --武器、一灰二蓝
					upgrade({{ 324,719,0xeeaa17},{ 434,  552,0xeeaa17},{ 425,  556, 0xeeaa17}})--武器二黄
				else
					multiColTap({{  156,  774, 0x115a80},{  182,  774, 0x115b81},{  142,  782, 0x42b1eb}})
				end
				boss({{ 613, 329,0xffffff},{ 622, 334,0xffffff},{ 610, 267,0xdd5e0a}}) 
				bosssign({{ 438,  165,0xdd3a15},{ 373,  181,0xdd3a15}})
			else 
				setScreenScale(true, 480, 800)  --进行缩放
				multiColTap({{ 232, 516, 0x605967},{ 421, 488, 0x605967},{ 431,173,0xdd5e0a},{ 446,  496, 0xf45f30}}) 
				multiColTap({{ 180,  116, 0x4f4856},{ 278,  104, 0x857c8f},{ 410,  139, 0x2c2931},{ 416,  132, 0x2c2931}}) 
				multiColTap({{   64,  112, 0x4f4856},{   60,  189, 0x4f4856},{  411,  143, 0x2c2931},{  416,  139, 0x2c2931}}) 
				if multiColor({{  156,  774, 0xffffff},{  182,  774, 0xffffff},{  397,  496, 0xeeaa17}}) then
					upgrade({{ 324,719,0xeeaa17},{ 435,  633,0x218db0},{ 435,  633, 0x218db0}}) --武器一蓝
					upgrade({{ 324,719,0xeeaa17},{ 435,  633,0xeeaa17},{ 435,  633, 0xeeaa17}})--武器一黄
					upgrade({{ 324,719,0xeeaa17},{ 432,  636, 0x787686},{ 434,  552, 0x218db0},{ 425,  556, 0x218db0}}) --武器、一灰二蓝
					upgrade({{ 324,719,0xeeaa17},{ 434,  552,0xeeaa17},{ 425,  556, 0xeeaa17}})--武器二黄
				else
					multiColTap({{  156,  774, 0x115a80},{  182,  774, 0x115b81},{  142,  782, 0x42b1eb}})
				end
				boss({{ 613, 329,0xffffff},{ 622, 334,0xffffff},{ 610, 267,0xdd5e0a}}) 
				bosssign({{ 438,  165,0xdd3a15},{ 373,  181,0xdd3a15}})
				setScreenScale(false) --关闭缩放
			end
			hrmove(w/2,h-200,w/2,h-400,10) --两点滑动
		end
	end
	if os.time()- multime > 2 then
		if func3 == "使用主角技能" then
			if sign_boss == 1 then
				if os.time() - yfstime > cd then
					if w==640 and h==1136 then
						local t1 = os.time()
						while (true) do
							multiColTap({{ 150,1031,0xeeaa17},{  78,1024,0xc46212},{ 607, 716,0x2c2436}}) --关闭英雄
							multiColTap({{ 185, 980,0xe4b288},{ 148, 997,0x3d2511},{ 165, 991,0x452f1b}}) --点击影分身
							multiColTap({{ 293, 980,0x269ed9},{ 268, 997,0x497db6},{ 253, 975,0x1e92cc}}) --点击重击
							multiColTap({{ 390, 980,0x903203},{ 372, 997,0x943608},{ 353, 991,0x823007}}) --点击战嚎
							multiColTap({{ 494, 980,0xb8e983},{ 469, 997,0x418400},{ 452, 991,0xc7eea7}}) --点击狂战士愤怒
							multiColTap({{ 596, 980,0xebc228},{ 573, 997,0xfeffa7},{ 551, 991,0xe8b823}}) --点击点金手
							multiColTap({{ 84,  980,0xbe49ef},{ 62, 997, 0x5d24a5},{ 37, 991, 0xcb5af3}}) --点击天堂圣击
							local t2 =os.time()
							if t2-t1 >=2 then
								break
							end
						end
					elseif w==750 and h==1334 then
						local t1 = os.time()
						while (true) do
							setScreenScale(true, 640, 1136)  --进行缩放
							multiColTap({{ 150,1031,0xeeaa17},{  78,1024,0xc46212},{ 607, 716,0x2c2436}}) --关闭英雄
							multiColTap({{ 185, 980,0xe4b288},{ 148, 997,0x3d2511},{ 165, 991,0x452f1b}}) --点击影分身
							multiColTap({{ 293, 980,0x269ed9},{ 268, 997,0x497db6},{ 253, 975,0x1e92cc}}) --点击重击
							multiColTap({{ 390, 980,0x903203},{ 372, 997,0x943608},{ 353, 991,0x823007}}) --点击战嚎
							multiColTap({{ 494, 980,0xb8e983},{ 469, 997,0x418400},{ 452, 991,0xc7eea7}}) --点击狂战士愤怒
							multiColTap({{ 596, 980,0xebc228},{ 573, 997,0xfeffa7},{ 551, 991,0xe8b823}}) --点击点金手
							multiColTap({{ 84,  980,0xbe49ef},{ 62, 997, 0x5d24a5},{ 37, 991, 0xcb5af3}}) --点击天堂圣击
							setScreenScale(false) --关闭缩放
							local t2 =os.time()
							if t2-t1 >=2 then
								break
							end
						end
					elseif w==1242 and h==2208 then
						local t1 = os.time()
						while (true) do
							multiColTap({{  150, 1921, 0xc46212},{  558, 1924, 0xeeaa17},{ 1176, 1330, 0xf45f30}}) --关闭英雄
							multiColTap({{  291, 1892, 0x553c24},{  369, 1887, 0x7d5a4c},{  324, 1874, 0x553c24}}) --点击影分身
							multiColTap({{  492, 1889, 0x477cb6},{  535, 1868, 0x497db6},{  520, 1875, 0x497db6}}) --点击重击
							multiColTap({{  688, 1867, 0x823007},{  752, 1868, 0x8f3002},{  723, 1842, 0x943608}}) --点击战嚎
							multiColTap({{  904, 1872, 0x71ab0f},{  918, 1858, 0x6fa90e},{  933, 1874, 0x448109}}) --点击狂战士愤怒
							multiColTap({{ 1095, 1869, 0xfeffa7},{ 1154, 1862, 0xe9b923},{ 1117, 1860, 0xf4e129}}) --点击点金手
							multiColTap({{   82, 1861, 0xcb58f3},{  164, 1876, 0xd565f6},{  118, 1870, 0x5c24a5}}) --点击天堂圣击
							local t2 =os.time()
							if t2-t1 >=2 then
								break
							end
						end
					elseif w==1536 and h==2048 then
						local t1 = os.time()
						while (true) do
							multiColTap({{ 305,1800,0xc46212},{695,1836,0xeeaa17},{1311,1250,0xf45f30}}) --关闭英雄
							multiColTap({{  465, 1764, 0x46301c},{  490, 1764, 0x46301c},{  477, 1748, 0x46301c}}) --点击影分身
							multiColTap({{  655, 1794, 0x497db6},{  692, 1792, 0x205085},{  680, 1779, 0x497db6}}) --点击重击
							multiColTap({{  859, 1770, 0xc05616},{  868, 1769, 0x943608},{  868, 1741, 0x943608}}) --点击战嚎
							multiColTap({{ 1037, 1749, 0x448109},{ 1082, 1754, 0x418400},{ 1069, 1750, 0x73ac10}}) --点击狂战士愤怒
							multiColTap({{ 1206, 1788, 0xe6b11e},{ 1267, 1770, 0xf3de29},{ 1237, 1792, 0xfeffa7}}) --点击点金手
							multiColTap({{  230, 1773, 0xcc5bf3},{  324, 1778, 0xd05ff4},{  275, 1783, 0x5c24a5}}) --点击天堂圣击
							local t2 =os.time()
							if t2-t1 >=2 then
								break
							end
						end
					elseif w==1080 and h==1920 then
						local t1 = os.time()
						while (true) do
							multiColTap({{ 907, 1214, 0xeeaa17},{  1016, 1203, 0xf45f30},{ 1037, 1222, 0xf45f30}}) --关闭面板
							multiColTap({{  281, 1660, 0x46301c},{  269, 1693, 0x553c24},{  286, 1692, 0x47301c}}) --点击影分身
							multiColTap({{  462, 1678, 0x497db6},{  437, 1691, 0x497db6},{  466, 1691, 0x205085}}) --点击重击
							multiColTap({{  594, 1675, 0x823007},{  619, 1650, 0xc05616},{  654, 1666, 0x8f3002}}) --点击战嚎
							multiColTap({{  780, 1658, 0x448109},{  807, 1681, 0x448109},{  779, 1689, 0x418400}}) --点击狂战士愤怒
							multiColTap({{ 596, 980,0xebc228},{ 573, 997,0xfeffa7},{ 551, 991,0xe8b823}}) --点击点金手C
							multiColTap({{  101, 1689, 0x5c24a5},{  110, 1680, 0x7715a4},{  103, 1664, 0x5c24a5}}) --点击天堂圣击
							local t2 =os.time()
							if t2-t1 >=2 then
								break
							end
						end
					elseif w==720 and h==1280 then
						local t1 = os.time()
						while (true) do
							multiColTap({{ 180,1127,0xeeaa17},{  87,1120,0xc46212},{ 681, 775,0xf45f30}}) --关闭英雄
							multiColTap({{ 166,1090,0x3d2511},{ 208,1072,0xe4b288},{ 208,1072,0xe4b288}}) --点击影分身
							multiColTap({{ 284,1090,0x7db8e2},{ 324,1072,0xe2f2fb},{ 324,1072,0xe2f2fb}}) --点击重击
							multiColTap({{ 399,1090,0x823007},{ 439,1072,0x8f3002},{ 439,1072,0x8f3002}}) --点击战嚎
							multiColTap({{ 510,1090,0xd2f1bc},{ 548,1072,0x418400},{ 548,1072,0x418400}}) --点击狂战士愤怒
							multiColTap({{ 621,1090,0xe6b21f},{ 666,1072,0xf0d429},{ 666,1072,0xf0d429}}) --点击点金手
							multiColTap({{ 45, 1090,0xd262f5},{ 92, 1072,0xbf4bef},{ 92, 1072,0xbf4bef}}) --点击天堂圣击
							local t2 =os.time()
							if t2-t1 >=2 then
								break
							end
						end
					elseif w==480 and h==800 then
						local t1 = os.time()
						while (true) do
							multiColTap({{ 179,720,0xeeaa17},{ 65,706,0xc46212},{ 446,496,0xf45f30}}) --关闭英雄
							multiColTap({{ 110,687,0xa37053},{ 147,693, 0x956851},{ 147,693, 0x956851}}) --点击影分身
							multiColTap({{ 37, 693,0xc755f1},{ 69,700, 0xd465f5},{ 69,700, 0xd465f5}}) --点击重击
							multiColTap({{ 192,707,0x497cb5},{ 195,678, 0x1d98cf},{ 195,678, 0x1d98cf}}) --点击战嚎
							multiColTap({{ 340,700,0x418400},{ 359,702, 0x448109},{ 359,702, 0x448109}}) --点击狂战士愤怒
							multiColTap({{ 405,696,0xe8b722},{ 432,708, 0xfdff5c},{ 432,708, 0xfdff5c}}) --点击点金手
							multiColTap({{ 37,694,0xc957f2},{ 70,697, 0xce5df3},{ 70,697, 0xce5df3}}) --点击天堂圣击
							local t2 =os.time()
							if t2-t1 >=2 then
								break
							end
						end
					else
						local t1 = os.time()
						while (true) do
							setScreenScale(true, 480, 800)  --进行缩放
							multiColTap({{ 179,  720,0xeeaa17},{  65,  706,0xc46212},{ 446,  496,0xf45f30}}) --关闭英雄
							multiColTap({{ 110,  687, 0xa37053},{ 147,  693, 0x956851},{ 129,  689, 0x46301c}}) --点击影分身
							multiColTap({{ 37,  693, 0xc755f1},{ 69,  700, 0xd465f5},{ 53,  697, 0x5c24a5}}) --点击重击
							multiColTap({{  192,  707, 0x497cb5},{  195,  678, 0x1d98cf},{  204,  700, 0x497db6}}) --点击战嚎
							multiColTap({{  340,  700, 0x418400},{  359,  702, 0x448109},{  346,  691, 0x448109}}) --点击狂战士愤怒
							multiColTap({{  405,  696, 0xe8b722},{  432,  708, 0xfdff5c},{  420,  705, 0xfeffa7}}) --点击点金手
							multiColTap({{   37,  694, 0xc957f2},{   70,  697, 0xce5df3},{   54,  698, 0x5d23a5}}) --点击天堂圣击
							setScreenScale(false) --关闭缩放
							local t2 =os.time()
							if t2-t1 >=2 then
								break
							end
						end
					end
					if mun == nil then
						mun = 1
					else
						mun = mun + 1
					end
					if mun > 3 then
						yfstime = os.time()
						mun = 0
					end
				end
			end
		end
		if w==640 and h==1136 then
			if multiColor({{ 588, 269,0xdd3a15}}) == false then--非离开战争
				multime = os.time()
				sign_boss = 0
				sign_upgrade = 0
			end
		elseif w==750 and h==1334 then
			if multiColor({{ 578,  304,0xdd3a15}}) == false then
				multime = os.time()
				sign_boss = 0
				sign_upgrade = 0
			end
		elseif w == 1242 and h == 2208 then
			if multiColor({{ 964,  449,0xdd3a15}}) == false then
				multime = os.time()
				sign_boss = 0
				sign_upgrade = 0
			end
		elseif w == 768 and h == 1024 then
			if multiColor({{ 5562,  186,0xdd3a15}}) == false then
				multime = os.time()
				sign_boss = 0
				sign_upgrade = 0
			end	
		elseif w == 1536 and h == 2048 then
			if multiColor({{ 1093,  379,0xdd3a15}}) == false then
				multime = os.time()
				sign_boss = 0
				sign_upgrade = 0
			end
		elseif w==480 and h==800 then
			if multiColor({{ 439,  169,0xdd3a15}})==false then
				multime = os.time()
				sign_boss = 0
				sign_upgrade = 0
			end
		elseif w == 720 and h == 1280 then
			if multiColor({{ 553,  257,0xdd3a15}})==false then
				multime = os.time()
				sign_boss = 0
				sign_upgrade = 0
			end
		else
			setScreenScale(true, 480, 800)  --进行缩放
			if multiColor({{ 439,  169,0xdd3a15}})==false then
				multime = os.time()
				sign_boss = 0
				sign_upgrade = 0
			end
			setScreenScale(false) --关闭缩放
		end
		if os.time() - bossTime >= 30 then
			sign_boss = 0
		end
	end
end
