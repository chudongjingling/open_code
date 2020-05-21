--自定义位置连点器付费版
require("TSLib")
function movefile(path,to)--帮你玩平台禁用此函数
	os.execute("mv "..path.." "..to);
end

ret1,ret2 = whoAmI()
if  ret1 ==0  then
	if ret2 == 1 then--标准版
		tscd = "标准版"
		dialog("您正在使用触动精灵 iOS 标准版，可能会遇到函数库版本过低的错误")
		local file = userPath().."/plugin/TSLib.lua"
		local bool,kind = isFileExist(file) 
		if bool then
			movefile(file,userPath().."/lua/TSLib.lua")
			mSleep(100)
			dialog("在插件目录下检测到 TSLib 函数库，需重启脚本进行加载")
			luaExit()
		end
	else
		tscd = "专业版"
	end
elseif ret1 == 3  then
	tscd = "小精灵"
end

local m = TSVersions()

if m <= "1.3.0" then
	dialog("本地 TSLib 版本过低，请到【更多-文件管理-插件】界面下载最新版")
	luaExit()
end

--移动文件

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

w,h = getScreenSize();
if w <= 0 then
	w = 720
	h = 1080
end

if getOSType() == "ios" then
	auth = deviceIsAuth();          
	if auth ~= 0 then
		authtext = "已授权"
	else
		authtext = "未授权"
	end
else
	authtext = "未知"
end

UINew("丸子放置游戏连点器","立即运行","立即退出","自定义点击.dat",0,30)
UILabel("触动"..tscd.."授权状态",20,"center","230,50,92")
UILabel(authtext,16,"center","230,50,92")
UILabel("☆☆☆☆☆☆☆☆☆",18,"center","230,219,116")
UILabel("选择点击位置",20,"center","230,50,92")
UIRadio("model","屏幕中心点,自定义位置","0")
UILabel("是否显示准星",20,"center","230,50,92")
UIRadio("wztouch","显示,不显示","0")
UILabel("点击速度设置",20,"center","230,50,92")
UIRadio("speed","50次,40次,30次,10次,5次,自定义每秒点击次数,自定义点击间隔秒数","3")
UILabel("自定义每秒点击次数",20,"center","230,50,92")
UIEdit("speedset","每秒点击次数","30",15,"left","255,0,0","number")
UILabel("自定义点击间隔秒数",20,"center","230,50,92")
UIEdit("timeset","每次点击间隔秒数","1",15,"left","255,0,0","number")
UILabel("使用须知",20,"left","230,50,92")
UILabel("问题反馈请加群:414534539,备注：连点器",16,"left","230,50,92")
UILabel("苹果手机请使用安装专业版最新版本，否则可能会出现函数库版本过低报错",16,"left","230,50,92")
UIShow()

init(0)

if speed == "50次" then
	ms = 20
elseif speed == "40次" then
	ms = 25
elseif speed == "30次" then
	ms = 30
elseif speed == "10次" then
	ms = 100
elseif speed == "5次" then
	ms = 200
elseif speed == "自定义每秒点击次数" then
	ms = hyStrNum(speedset)
	ms = 1000/ms-10
	if ms < 1 then
		ms = 30
	end
elseif speed == "自定义点击间隔秒数" then
	ms = hyStrNum(timeset*1000)
	if ms < 1 then
		ms = 1
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
	mLog("脚本尚未完全适配您的手机分辨率，不保证运行效果")
	mSleep(3000)
end
glSettings({switch = "1001", x1 = lx0, y1 = ly0, x2 = rx0, y2 = ry0,tsp_switch = true})
if wztouch == "显示" then
	tapimg = "wzpoint.png"
	mLog("显示准星")
else
	tapimg = "不显示准星.png"
	mLog("不显示准星")
end

function auto()--自动模式
	while true do
		tap(w/2,h/2,ms,tapimg)
		unlock()
	end
end

function set()--自定义模式
	toast("现在请戳需要重复点击的地方\n 部分手机需要双击", 3);--提示
	mSleep(1000);
	x,y = catchTouchPoint(); --获取点击坐标
	if  x ~= -1 and y ~= -1 then
		--toast("坐标获取成功~X: "..x..",Y: "..y.."开始疯狂点击咯~",3)
		mLog("坐标获取成功~X: "..x..",Y: "..y)
		while true do
			--tap(x,y,ms)
			tap(x,y,ms,tapimg)
			unlock()
		end
	else
		dialog("坐标获取失败,脚本即将退出", 2)
		mSleep(2000)
		lua_restart()
	end
end

function main()
	if model == "屏幕中心点" then
		mLog("开始点击屏幕中间咯~")
		auto()
	elseif model == "自定义位置" then
		mLog("请跟随引导进行设置~")
		set()
	end
end

main()
