-- Create By TouchSpriteStudio on 11:14:10
-- Copyright © TouchSpriteStudio . All rights reserved.

--local ts = require"ts"
require"TSLib"
w,h = getScreenSize()
fms = 1000
--1080P 15 号字高 70，宽 40
--iPhone 6 15 号字高 40，宽 30
--iPhone 6P 15 号字高 60，宽 50
if w == 1080 and h == 1920 then
	lx0,ly0,rx0,ry0 = 10,220,1070,300
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
	toast("脚本尚未完全适配您的手机分辨率，不保证运行效果")
	mSleep(3000)
end
fwShowWnd("banner",lx0,ly0,rx0,ry0,1);
fwShowTextView("banner","text1","开启浮动窗口","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.5);
--显示一个文字视图
mSleep(500);

UINew("开喵店","立即运行","立即退出","shszg.dat",0,30)
UILabel("使用须知",20,"center","230,50,92")
UILabel("1. 需要手动进入喵店页面脚本才生效",16,"left","0,0,0")
UILabel("2. 任务按照从上到下依次排序，可屏蔽部分任务，如花呗提额、红包省钱卡",16,"left","0,0,0")
UILabel("3. 不支持任务一分享好友",16,"left","0,0,0")
UILabel("4. 目前已完美兼容分辨率：",16,"left","0,0,0")
UILabel(" 安卓 1920x1080/1280x720",16,"left","0,0,0")
UILabel(" iOS iPhone 6(P)/6S(P)/7(P)/8(P)",16,"left","0,0,0")
UILabel("选择任务",20,"center","230,50,92")
UICheck("task2,task3,task4,task5,task6","任务二,任务三,任务四,任务五,任务六","1@2@3@4")
UIShow()

function window()
	ss = 30
	for i = 1,30 do
		ss = ss-1
		fwShowTextView("banner","text1","倒计时 "..ss,"center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.5);
		mSleep(fms)
	end
end

t0 = os.time()
fwShowTextView("banner","text1",t0,"center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.5);

function finish()
	t1 = os.time()
	log(t1)
	if t1-t0 >= 30 then
		fwShowTextView("banner","text1","倒计时完成，已获得喵币","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
		mSleep(fms)
		log("叉叉")
		if w == 640 and h == 1136 then
			multiColTap({
					{   44,   70, 0xffffff},
					{   35,   79, 0xffffff},
					{   42,   95, 0xffffff},
					{   38,   89, 0xff6483},
					{   31,   83, 0xffffff},
				})
			multiColTap({
					{  591,   74, 0xf9eff2},
					{  585,   72, 0xfaf0f3},
					{  587,   71, 0xf5eef0},
					{  587,   69, 0xfdfbfc},
					{  586,   69, 0xfdf9fa},
				})--关闭
			multiColTap({
					{   31,   64, 0xf9f9f9},
					{   42,   78, 0xf9f9f9},
					{   38,   83, 0xf9f9f9},
					{   38,   91, 0x444444},
					{   38,   76, 0x444444},
					{   31,   83, 0x444444},
				})--白底左上角<
			multiColTap({
					{   37,   67, 0xff4151},
					{   43,   83, 0xff384e},
					{   39,  100, 0xff304a},
					{   43,   95, 0xffffff},
					{   41,   74, 0xffffff},
					{   32,   83, 0xffffff},
				})--红底左上角<
			multiColTap({
					{   44,   77, 0xda1b39},
					{   27,   74, 0xda1b39},
					{   30,   91, 0xd71a3a},
					{   39,   92, 0xffffff},
					{   39,   75, 0xffffff},
					{   31,   83, 0xffffff},
				})--红底左上角<
		elseif w == 1242 and h == 2208 then
			multiColTap({{   69,  103, 0xffffff},{   62,  109, 0xffffff},{   64,  144, 0xffffff},{   55,  135, 0xffffff},{   46,  126, 0xffffff},})
		elseif w == 1080 and h == 1920 then
			os.execute("input keyevent KEYCODE_BACK")
		elseif w == 720 and h == 1280 then
			os.execute("input keyevent KEYCODE_BACK")
		else
			toast("暂不支持您的手机分辨率")
			mSleep(3000)
		end
		t0 = os.time()
	end
end

if w == 1080 and h == 1920 then
	fwShowTextView("banner","text1","分辨率：1920x1080","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.5);
	mSleep(fms)
	while true do
		multiColTap({
				{  394,  787, 0xff8c26},
				{  418,  798, 0xffffff},
				{  455,  805, 0xfee1d5},
				{  503,  794, 0xffffff},
				{  519,  794, 0xffffff},
				{  554,  802, 0xff8c26},
			})--首页
		x,y = findMultiColorInRegionFuzzy( 0xf82509, "88|-6|0xfffd68,115|6|0xfffd68,153|3|0xfffd68,314|-9|0xffffff,331|5|0xff7746", 90, 581, 590, 1032, 710)--瓜分 20 亿
		if x~= -1 then
			tap(x,y)
		end
		multiColTap({
				{  455,  659, 0xfffd68},
				{  551,  673, 0xfffd68},
				{  689,  649, 0xffffff},
				{  676,  690, 0xeb0000},
				{  550,  692, 0xeb1818},
				{  451,  635, 0xfe6f70},
			})--全民开喵
		multiColTap({
				{  987, 1786, 0xfff9f7},
				{  977, 1787, 0xfe3b52},
				{  947, 1792, 0xfefbff},
				{  932, 1792, 0xfff9fb},
				{  925, 1669, 0xf6e272},
			})--右下角领金币
		if task2 == "任务二" then
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "-2|61|0xee2e44,-79|30|0xee2e44,66|32|0xee2e44,-96|-4|0xffffff,85|67|0xffffff", 90, 790, 1010, 987, 1101)--2
			if x ~= -1 then
				fwShowTextView("banner","text1","点击第二个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击第二个任务")
				finish()
			end
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "-75|32|0xee2e44,15|66|0xee2e44,-91|-3|0xffffff", 90, 789, 926, 983, 1013)--倒数第四
			if x ~= -1 then
				fwShowTextView("banner","text1","点击倒数第四任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击第二个任务")
				finish()
			end
		end
		if task3 == "任务三" then
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "-21|-17|0xFFFFFF,87|44|0xee2e44,144|5|0xee2e44,159|54|0xFFFFFF", 90, 791, 1202, 989, 1290)--3
			if x ~= -1 then
				fwShowTextView("banner","text1","点击第三个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击第三个任务")
				finish()
			end
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "-75|32|0xee2e44,15|66|0xee2e44,-91|-3|0xffffff", 90, 789, 1111, 983, 1198)--倒数第三
			if x ~= -1 then
				fwShowTextView("banner","text1","点击倒数第三个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击第三个任务")
				finish()
			end
		end
		if task3 == "任务四" then
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "-67|26|0xee2e44,78|52|0xee2e44,-81|0|0xFFFFFF,92|71|0xFFFFFF", 90, 784, 1383, 993, 1479)--4
			if x ~= -1 then
				fwShowTextView("banner","text1","点击第四个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击第四个任务")
				finish()
			end
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "-34|60|0xee2e44,36|60|0xee2e44,-69|-1|0xffffff", 90, 794, 1301, 987, 1384)--倒数第二
			if x ~= -1 then
				fwShowTextView("banner","text1","点击倒数第二个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击第四个任务")
				finish()
			end
		end
		if task5 == "任务五" then
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "61|-12|0xee2e44,143|13|0xee2e44,-29|-17|0xFFFFFF,154|-20|0xFFFFFF", 90, 784, 1570, 992, 1647)--5
			if x ~= -1 then
				fwShowTextView("banner","text1","点击第五个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击第五个任务")
				finish()
			end
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "75|-5|0xee2e44,115|58|0xee2e44,-21|-14|0xffffff", 90, 793, 1491, 985, 1574)--倒数第一
			if x ~= -1 then
				fwShowTextView("banner","text1","点击倒数第一个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击第五个任务")
				finish()
			end
		end
	end
elseif w == 720 and h == 1280 then
	fwShowTextView("banner","text1","分辨率：720x1280","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.5);
	toast("分辨率：720x1280")
	mSleep(3000)
	mSleep(fms)
	while true do
		multiColTap({
				{577,1139,0xdd4957},
				{604,1147,0xe4384e},
				{621,1149,0xfffafc},
				{650,1143,0xfc364f},
				{624,1092,0xe4a641},
			})--右下角领金币
		x7 = 526
		x8 = 656--Y+125
		if task2 == "任务二" then
			if multiColor({{539,568,0xee2e45},{529,594,0xffffff},{578,550,0xee2e45},{588,590,0xee2e45},}) then
				fwShowTextView("banner","text1","点击第二个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击第二个任务")
				finish()
			end
		end
		if task3 == "任务三" then
			if multiColor({{590,715,0xee2e45},{531,720,0xffffff},{540,694,0xee2e45},{572,675,0xee2e45},}) then
				fwShowTextView("banner","text1","点击第三个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击第三个任务")
				finish()
			end
		end
		if task3 == "任务四" then
			if multiColor({{543,819,0xef2d45},{533,795,0xfffffd},{585,839,0xee2e45},{639,821,0xee2e45},}) then
				fwShowTextView("banner","text1","点击第四个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击第四个任务")
				finish()
			end
		end
		if task5 == "任务五" then
			if multiColor({{581,925,0xee2e45},{537,945,0xec2f45},{591,965,0xee2e45},{642,943,0xee2e45},}) then
				fwShowTextView("banner","text1","点击第五个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击第五个任务")
				finish()
			end
		end
		if task5 == "任务六" then
			if multiColor({{580,1049,0xee2e45},{539,1069,0xee2e45},{569,1090,0xee2e45},{611,1093,0xee2e45},}) then
				fwShowTextView("banner","text1","点击第六个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(580,1049)
				t0 = os.time()
				window()
				log("点击第六个任务")
				finish()
			else
				toast("找不到 6")
				mSleep(3000)
			end
		end
	end
elseif w == 640 and h == 1136 then
	fwShowTextView("banner","text1","分辨率：640x1136","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.5);
	mSleep(fms)
	while true do
		multiColTap({
				{  511, 1046, 0xe14753},
				{  536, 1053, 0xf4344b},
				{  578, 1050, 0xff3750},
				{  554, 1006, 0xe3a640},
				{  544,  979, 0xf6e172},
			})--右下角领金币
		if task2 == "任务二" then
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "-40|-32|0xee2e44,-53|-35|0xffffff,50|8|0xffffff,-48|7|0xffffff", 90, 467, 480, 584, 532)--2逛店
			if x ~= -1 then
				fwShowTextView("banner","text1","点击任务 2：逛店","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				log("X2 坐标"..x..",Y2 坐标： "..y)
				t0 = os.time()
				window()
				log("点击任务 2：逛店")
				finish()
			end
		end
		if task3 == "任务三" then
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "-26|6|0xee2e44,23|33|0xee2e44,-35|-1|0xffffff,71|39|0xffffff", 90, 466, 590, 583, 639)--3浏览
			if x ~= -1 then
				fwShowTextView("banner","text1","点击任务 3：浏览","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击任务 3：浏览")
				finish()
			end
		end
		if task4 == "任务四" then
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "0|36|0xee2e44,47|36|0xee2e44,-38|0|0xffffff,71|39|0xffffff", 90, 465, 699, 585, 750)--4浏览
			if x ~= -1 then
				fwShowTextView("banner","text1","点击任务 4：浏览","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击任务 4：浏览")
				finish()
			end
		end
		if task5 == "任务五" then
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "14|36|0xee2e44,37|36|0xee2e44,-34|-3|0xffffff,73|39|0xffffff", 90, 469, 809, 586, 862)--5浏览
			if x ~= -1 then
				fwShowTextView("banner","text1","点击任务 5：浏览","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击任务 5：浏览")
				finish()
			end
		end
		if task6 == "任务六" then
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "36|32|0xee2e44,-30|20|0xee2e44,-37|-4|0xffffff", 90, 467, 922, 583, 974)--6 浏览
			if x ~= -1 then
				fwShowTextView("banner","text1","点击任务 6：浏览","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				log("点击任务 6：浏览")
				finish()
			end
		end
	end
elseif w == 1242 and h == 2208 then
	fwShowTextView("banner","text1","分辨率：1242x2208","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.5);
	mSleep(fms)
	while true do
		multiColTap({
				{ 1023, 2041, 0xe33e51},
				{ 1040, 2043, 0xf5364f},
				{ 1079, 2034, 0xf93952},
				{ 1073, 2045, 0xfffcfd},
				{ 1074, 1950, 0xe4a741},
			})--右下角领金币
		if task2 == "任务二" then
			if multiColor({
					{ 1010,  952, 0xee2e44},
					{ 1014, 1020, 0xee2e44},
					{  936,  987, 0xee2e44},
					{ 1102,  990, 0xee2e44},
					{  914,  941, 0xffffff},
					}) then
				fwShowTextView("banner","text1","点击任务 2：逛店","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(1010,  952)
				log("X2 坐标"..x..",Y2 坐标： "..y)
				t0 = os.time()
				window()
				log("点击任务 2：逛店")
				finish()
			end
		end
		if task3 == "任务三" then
			if multiColor({{ 1013, 1381, 0xee2e44},{  939, 1415, 0xee2e44},{ 1015, 1448, 0xee2e44},{  913, 1376, 0xffffff},}) then--3浏览
				fwShowTextView("banner","text1","点击任务 3：浏览","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(1013, 1381)
				t0 = os.time()
				window()
				log("点击任务 3：浏览")
				finish()
			end
		end
		if task4 == "任务四" then
			if multiColor({
					{ 1023, 1380, 0xee2e44},
					{  941, 1411, 0xee2e44},
					{ 1101, 1416, 0xee2e44},
					{ 1014, 1448, 0xee2e44},
					{  915, 1375, 0xffffff},
					}) then--4浏览
				fwShowTextView("banner","text1","点击任务 4：浏览","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(1023, 1380)
				t0 = os.time()
				window()
				log("点击任务 4：浏览")
				finish()
			end
		end
		if task5 == "任务五" then
			if multiColor({
					{ 1016, 1595, 0xee2e44},
					{  938, 1627, 0xee2e44},
					{ 1112, 1630, 0xee2e44},
					{ 1025, 1664, 0xee2e44},
					{  915, 1590, 0xffffff},
					}) then--5浏览
				fwShowTextView("banner","text1","点击任务 5：浏览","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(1016, 1595)
				t0 = os.time()
				window()
				log("点击任务 5：浏览")
				finish()
			end
		end
		if task6 == "任务六" then
			if multiColor({
					{ 1014, 1815, 0xee2e44},
					{  930, 1840, 0xee2e44},
					{ 1106, 1842, 0xee2e44},
					{ 1029, 1874, 0xee2e44},
					{  914, 1803, 0xffffff},
					}) then--6 浏览
				fwShowTextView("banner","text1","点击任务 6：浏览","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(1014, 1815)
				t0 = os.time()
				window()
				log("点击任务 6：浏览")
				finish()
			end
		end
	end
else
	toast("脚本尚未完全适配您的手机分辨率，不保证运行效果")
	mSleep(3000)
	setScreenScale(true, 1080, 1920)
	while true do
		multiColTap({
				{  987, 1786, 0xfff9f7},
				{  977, 1787, 0xfe3b52},
				{  947, 1792, 0xfefbff},
				{  932, 1792, 0xfff9fb},
				{  925, 1669, 0xf6e272},
			})--右下角领金币
		if task2 == "任务2" then
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "-2|61|0xee2e44,-79|30|0xee2e44,66|32|0xee2e44,-96|-4|0xffffff,85|67|0xffffff", 90, 790, 1010, 987, 1101)--2
			if x ~= -1 then
				fwShowTextView("banner","text1","点击第二个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				nLog("点击第二个任务")
				finish()
			end
		end
		if task4 == "任务四" then
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "-67|26|0xee2e44,78|52|0xee2e44,-81|0|0xFFFFFF,92|71|0xFFFFFF", 90, 784, 1383, 993, 1479)--4
			if x ~= -1 then
				fwShowTextView("banner","text1","点击第四个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				nLog("点击第四个任务")
				finish()
			end
		end
		if task3 == "任务三" then
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "-21|-17|0xFFFFFF,87|44|0xee2e44,144|5|0xee2e44,159|54|0xFFFFFF", 90, 791, 1202, 989, 1290)--3
			if x ~= -1 then
				fwShowTextView("banner","text1","点击第三个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				nLog("点击第三个任务")
				finish()
			end
		end
		if task5 == "任务五" then
			x,y = findMultiColorInRegionFuzzy( 0xee2e44, "61|-12|0xee2e44,143|13|0xee2e44,-29|-17|0xFFFFFF,154|-20|0xFFFFFF", 90, 784, 1570, 992, 1647)--5
			if x ~= -1 then
				fwShowTextView("banner","text1","点击第五个任务","center","FFFFFF","000000",15,0,lx,ly,rx,ry,0.6);
				mSleep(fms)
				tap(x,y)
				t0 = os.time()
				window()
				nLog("点击第五个任务")
				finish()
			end
		end
	end
	setScreenScale(false)
end
