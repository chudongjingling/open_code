--自定义位置连点器免费版
local t0 = os.time()
function sClick(...) --封装自定义间隔时间的点击函数
	touchDown(...)
	mSleep(ms)
	touchUp(...)
end
init(0)
w,h = getScreenSize();
if w <= 0 then
	w = 720
	h = 1080
end

function auto()--自动模式
	while true do
		sClick(w/2,h/2)
		flag = deviceIsLock(); --判断屏幕是否锁定
		if flag ~= 0 then
			unlockDevice();    --解锁屏幕
		end
		local t1 = os.time()
		if t1 - t0 >= 120 then
			dialog("免费版每次只能试用 8 小时，请购买付费版")
			lua_exit()
				mSleep(0)
				mSleep(0)
		end
	end
end

function set()--自定义模式
	dialog("现在请戳需要重复点击的地方", 0);--提示
	mSleep(1000);
	x,y = catchTouchPoint(); --获取点击坐标
	if  x ~= -1 and y ~= -1 then
		toast("坐标获取成功~开始连续点击咯~")
		while true do
			sClick(x,y)
			flag = deviceIsLock(); --判断屏幕是否锁定
			if flag ~= 0 then
				unlockDevice();    --解锁屏幕
			end
			local t2 = os.time()
			if t2 - t0 >= 120 then
				dialog("免费版每次只能试用 8 小时，请购买付费版")
				lua_exit()
				mSleep(0)
				mSleep(0)
			end
		end
	else
		dialog("坐标获取失败,脚本即将退出", 2)
		mSleep(2000)
		lua_restart()
	end
end


local sz = require("sz")
local json = sz.json
w,h = getScreenSize();
MyTable = {
	["style"] = "default",
	["width"] = w*0.9,
	["height"] = h*0.9,
	["config"] = "wzclickfree.dat",
	["timer"] = 15,
	views = {
		{
			["type"] = "Label",
			["text"] = "丸子放置游戏连点器免费版",
			["size"] = 25,
			["align"] = "center",
			["color"] = "25,176,118",
		},
		{
			["type"] = "Label",
			["text"] = "此脚本为限时免费版，无限制请购买付费版",
			["size"] = 18,
			["align"] = "center",
			["color"] = "78,136,88",
		},
		{
			["type"] = "Label",
			["text"] = "请选择点击位置",
			["size"] = 25,
			["align"] = "center",
			["color"] = "118,198,38",
		},
		{
			["type"] = "RadioGroup",--input1
			["list"] = "屏幕中心点,自定义位置",
			["select"] = "0",
		},
		{
			["type"] = "Label",
			["text"] = "请选择点击速度",
			["size"] = 25,
			["align"] = "center",
			["color"] = "255,207,92",
		},
		{
			["type"] = "RadioGroup",--input2
			["list"] = "50次,40次,30次,10次,5次",
			["select"] = "1",
		},
		{
			["type"] = "Label",
			["text"] = "此脚本为限时免费版，无限制请购买付费版",
			["size"] = 18,
			["align"] = "left",
			["color"] = "233,60,7",
		}
	}	
}
local MyJsonString = json.encode(MyTable);
ret, input1, input2 = showUI(MyJsonString);
if ret == 0 then lua_exit() 
	mSleep(0) 
	mSleep(0)
end
init(0)

if input2 == "0" then
	ms = 20
elseif input2 == "1" then
	ms = 25
elseif input2 == "2" then
	ms = 30
elseif input2 == "3" then
	ms = 100
elseif input2 == "4" then
	ms = 200
else
	ms = 40
end
function main(...)
	if input1 == "0" then
		toast("开始疯狂点击咯~")
		auto()
	elseif input1 == "1" then
		toast("请跟随引导进行设置~")
		set()
	end
end

main()
