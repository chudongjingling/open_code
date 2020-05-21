init(0, 0)
require("TSLib")
w,h = getScreenSize()

-- 不同分辨率手机的时间系数
a1080 = 1.33 
a720  = 1.9
i5	  = 2.21
i6	  = 1.825
i6p	  = 1.15

function i5_abu(edt_coef)
	while true do
		local x,y = findMultiColorInRegionFuzzy( 0x2b2b49, "0|1|0x2b2b49,0|2|0x2b2b49,0|3|0x2b2b49", 95,1, 297, 307, 1004)
		if x ~= -1 then
			local he = x + (1135-y)
			tap(x,y,695 + (670-he)*3.2)
		end
		local x,y = findMultiColorInRegionFuzzy( 0x2b2b49, "0|1|0x2b2b49,0|2|0x2b2b49,0|3|0x2b2b49", 95,309, 297, 636, 956)
		if x ~= -1 then
			local he = (639-(x+44)) + (1135-y)
			tap(x,y,610 + (670-he)*3.2)
		end
		mSleep(edt_coef)
	end
end

os_type = getOSType();     --获取设备系统版本
if ( w == 1080 and h == 1920 ) or ( h == 1080 and w == 1920 ) then			--	安卓	1080p
	edt_coef = a1080
	findColors = {0x38365e, "-16|-6|0x35335a,13|-5|0x39375f", 98, 0, 0, w, h}
elseif ( w == 720 and h == 1280 ) or ( h == 720 and w == 1280 ) then		--	安卓	720P
	edt_coef = a720
	findColors = {0x37355d, "-24|0|0x2b2b49,23|0|0x383550,-2|-122|0x35363e", 98, 2, 536, 714, 1024}
elseif ( w == 1242 and h == 2208 ) or ( h == 1242 and w == 2208 ) then		--	iOS		6p,6sp
	edt_coef = i6p
	findColors = {0x373860, "-2|-214|0x34353d,-42|-2|0x2b2b49,40|-4|0x393550", 98, 20, 796, 1212, 1832}
elseif ( w == 640 and h == 1136 ) or ( h == 640 and w == 1136 ) then		--	iOS		5,5c,5s,touch5,touch6
	edt_coef = "固定"
--	findColors = {0x373861, "19|1|0x393758,-15|1|0x2e2e51", 98, 5, 514, 628, 922}
elseif ( w == 750 and h == 1334 ) or ( h == 750 and w == 1334 ) then		--	iOS		6,6s
	edt_coef = i6
	findColors = {0x37355d, "-22|-1|0x2d2c4d,7|-124|0x413955", 98, 14, 564, 722, 1026}
else
	dialog("暂不支持此分辨率")
	lua_exit()
end

UINew("跳一跳高分辅助","开始","取消","tytb.txt",0,120,w,h)
UILabel("关闭所有遮挡游戏的图标\r\n例如360加速球、小白点",20,"center","255,69,0")
UILabel("问题反馈QQ群:432476989",18,"center","255,69,0")
UILabel("")
UILabel("设置停顿时间(单位:秒)：")
UIRadio("rdo","2,3,4,5","1")
UILabel("5秒有概率可以成功上传成绩",14,"left","255,69,0")
UILabel("设备信息",20,"left","0,136,0")
UILabel("设备名称 : "..getDeviceName(),16,"left","120,120,120")
if os_type == "android" then --返回值为纯小写字母
UILabel("设备品牌 : "..getDeviceBrand(),16,"left","120,120,120")
UILabel("设备型号 : "..getDeviceModel(),16,"left","120,120,120")
end
UILabel("引擎版本 : "..getTSVer(),16,"left","120,120,120")
UILabel("系统版本 : "..getOSVer(),16,"left","120,120,120")
UILabel("分辨率 : "..w..":"..h,16,"left","120,120,120")
UILabel("系数 : "..edt_coef,16,"left","120,120,120")
if os_type ~= "ios" and (( w ~= 640 and h ~= 1136 ) or ( h ~= 640 and w ~= 1136 )) then --返回值为纯小写字母
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("")
UILabel("默认不用修改系数.")
UILabel("如果多次启动均无法准确跳跃,可以手动进行微调.")
UILabel("如需微调,推荐每次加减0.01")
UILabel("输入时间系数：")
UIEdit("edt_coef","输入时间系数",edt_coef.."",15,"left","255,0,0")
end
UIShow()
mSleep(1000)


edt_time = tonumber(rdo)*1000

if os_type == "ios" and (( w == 640 and h == 1136 ) or ( h == 640 and w == 1136 )) then 
	i5_abu(edt_time)
end

local screenWidth, screenHeight= getScreenSize();
edt_coef = tonumber(edt_coef)
local distanceTimeRate = edt_coef
local targetPositionOffset = screenHeight * 0.012

function Touch(x, y, millsSecond)
	touchDown(x, y)
	mSleep(millsSecond)
	touchUp(x, y)
end

function DoLoop()
	while true do 
		keepScreen(true);  
		if DoJump() == false then
			keepScreen(false); 
			break
		end
		keepScreen(false); 
	end
end

function DoJump() 
	local x, y = GetCalcSelfPosition()--找小人底部中心点
	if x == -1 or x == 0 then
		return false
	end
	
	local startX = 0					-- 找色起始X值是0点
	local startY = screenHeight * 0.2	-- 找色起始Y值是屏幕高度*0.2,因为再往上没有需要找的色.
	local endX = screenWidth - 3		-- 找色结束X值是屏幕宽度-3,防止循环越界.
	local endY = screenHeight * 0.7		-- 找色结束Y值是屏幕高度*0.7,因为再往下没有需要找的色.

	if x < screenWidth / 2 then			-- 如果找到黑色人偶的坐标在屏幕左半部(X < 屏幕宽度/2)
		startX =  screenWidth / 2		-- 那么目标点肯定在屏幕右半部,找色起始X值等于屏幕宽度的一半.
	else								-- 如果找到黑色人偶的坐标在屏幕右半部(X > 屏幕宽度/2)
		endX = screenWidth / 2			-- 那么目标点肯定在屏幕左半部,找色结束X值等于屏幕宽度的一半.
	end
	
	local targetX, targetY = GetTargetPosition(startX, startY, endX, endY)
	-- 通过三角函数,使用人偶底部中心坐标和目标坐标计算距离,x,y是人偶底部中心坐标,targetX,targetY 是盒子的中心坐标,
	local distance = math.sqrt( (x - targetX) * (x - targetX) + (y - targetY) * (y - targetY) )
	local pressTime = CalcHoldTime(distance) -- 通过距离*时间系数得到按压的延时时长
	
	Touch(targetX,targetY, pressTime)
	math.randomseed(getRndNum()) -- 随机种子初始化真随机数
	num = math.random(edt_time-500, edt_time+1000) -- 随机获取一个延时-500到延时+1000之间的数字,通过随机时间间隔跳跃,增加成功上传成绩几率
	mSleep(num)
	return true
end

function GetCalcSelfPosition()
	x,y = findMultiColorInRegionFuzzy( findColors[1], findColors[2], findColors[3], findColors[4], findColors[5], findColors[6], findColors[7])
	return x, y
end

function GetTargetPosition(startX, startY, endX, endY)
	local step = 3
	local r, g, b, rr, gg, bb 
	for y = startY , endY, step do--上往下开始每三个像素取一下颜色值
		r, g, b = getColorRGB(1, y)--X 坐标点为 1，Y 坐标点在起始点与终点之间
		for x = startX, endX , step do
			rr, gg, bb  = getColorRGB(x, y)
			if isColor(r, g, b, rr, gg, bb, 98)  then--将取到的颜色值进行对比
				r = rr
				g = gg
				b = bb
			else--找到一个和刚才的点颜色不一样的点
				return x, y + targetPositionOffset
			end
		end
	end
	return -1, -1
end

function isColor(rr, gg, bb, r, g, b ,s) 
	local fl,abs = math.floor,math.abs
	s = fl(0xff*(100-s)*0.01)
	if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
		return true
	end
	return false
end

function CalcHoldTime(distance)
	return distance * distanceTimeRate
end

mSleep(1000)
DoLoop()
