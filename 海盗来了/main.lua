init(0)--竖屏
require("TSLib")
w,h = getScreenSize()
if w == 640 and h == 1136 then
	require "5c"
elseif w == 768 and h == 1024 then
	--require "ipad"
	toast("暂不支持您的手机分辨率",1)
elseif w == 1536 and h == 2048 then
	--require "ipadhd"
	toast("暂不支持您的手机分辨率",1)
elseif w == 750 and h == 1334 then
	--require "6s"
	toast("暂不支持您的手机分辨率",1)
elseif w == 1242 and h == 2208 then
	--require "6P"
	toast("暂不支持您的手机分辨率",1)
elseif w == 720 and h == 1280 then
	--require "720p"
	toast("暂不支持您的手机分辨率",1)
elseif w == 1080 and h == 1920 then
	require "1080p"
else
	setScreenScale(true, 720, 1280)
	--require "720p"
	toast("暂不支持",1)
	setScreenScale(false)
end

UINew("丸子海盗来了自动挂机辅助","运行脚本","立即退出","piratego.dat",0,10)
UILabel("辅助功能",20,"center","230,50,92")
UICheck("check1,check2,check3","自动转盘,每日登陆,自动升级建筑","0@1")
UILabel("转盘能量设置",20,"center","230,50,92")
UICombo("gem","剩余2/3,剩一半,全用完","0")
UILabel("猜土豪设置",20,"left","230,50,92")
UICombo("gold","选1号,选2号,选3号","0")
UILabel("有问题请加群: 123456",18,"left","230,50,92")
UIShow()

while (true) do
	flag = deviceIsLock()--防锁屏
	if flag ~= 0 then
		unlockDevice()
	end
	daily()
	if check1 == "自动转盘" then
		go()
	end
	if check2 == "每日登陆" then
		reward()
	end
	if check3 == "自动升级建筑" then
		building()
	end
end
