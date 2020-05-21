function click(x, y,t)--点击函数
	touchDown(0, x, y)
	mSleep(100)
	touchUp(0, x, y)
	mSleep(t)
end

function beforeUserExit()
    --setScreenResolution("default")
	--closeLog("test");
	mSleep(1000)
	lua_exit()
end

function mysleep(t)
	local current_time1 = os.time();
	local current_time2 = os.time();
	while current_time2 - current_time1 < t do
		current_time2 = os.time();
		mSleep(100)
	end
--	dialog(current_time1.."   "..current_time2, 0)
end


function hd(d,x,y,i,b)     --d是标记 xy是坐标 i是距离 b是步长
	touchDown(d,x,y)  --按下动作
	mSleep(50)
	for a=b,i,b do                          
		touchMove(d,x+a,y)       --滑动过程
		mSleep(50)
	end
	mSleep(50)
	touchUp(d,x+i,y)                  --弹起动作
	mSleep(100)
end

function hd1(d,x,y,i,b)     --d是标记 xy是坐标 i是距离 b是步长
	touchDown(d,x,y)  --按下动作
	mSleep(50)
	for a=b,i,b do                          
		touchMove(d,x,y+a)       --滑动过程
		mSleep(50)
	end
	mSleep(50)
	touchUp(d,x,y+i)                  --弹起动作
	mSleep(100)
end

function zs(color, X1, Y1, X2, Y2)--区域找色找色判断函数
	local rtn = 0
	keepScreen(true);
	for deg = 100, 90, -1 do           --使用 for 循环不断降低精确度
			local x, y = findColorInRegionFuzzy(color, deg, X1, Y1, X2, Y2); 
			if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
				rtn = 1
				keepScreen(false);
				break;                    --并跳出循环
			end
	end
	keepScreen(false);
	return rtn

end

function pdjm()--判断当前界面
	 local rtn = 0
	 local jm = 0
	 local x,y 
	-- 优先找进入战斗界面
	resetIDLETimer();
	--keepScreen(true);
	
	--购买体力界面
	x,y = findMultiColorInRegionFuzzy( 0xcecfe7, "-1|11|0x9c9ea5,4|10|0x525963,8|10|0xbdbece,12|8|0x5a5963,18|8|0xc6cfde", 90, 609, 211, 643, 234)
	if x~= -1 and y ~= -1 then
		x,y = findMultiColorInRegionFuzzy( 0xfffb73, "-63|51|0xffdb4a,-68|57|0x9cd3ff,-56|71|0xad6108,-10|48|0xc66d08,-27|49|0xffdf4a,-17|102|0xffaa18,-25|130|0x8c4900,-25|144|0xceebff", 90, 249, 545, 385, 735)
		if x ~= -1 and y ~= -1 then
			click(220, 1900, 200)
			mSleep(200)
			dialog("what are you 弄啥类？", 5)
			return 999
		end
	end
	
	x,y = findMultiColorInRegionFuzzy( 0xffffff, "4|9|0x0886de,6|17|0x399ade,10|18|0xffffff", 90, 931, 537, 955, 567)
	if x ~= -1 and y ~=-1 then
		jm = 29 
		keepScreen(false);
		return jm
	end	
	
	if gi_swjl == 0 then  --死亡接力
		x,y = findMultiColorInRegionFuzzy( 0xffffff, "-47|48|0xff7da5,44|49|0xff7dad,-45|116|0xffe308,46|119|0xffef18,-4|147|0xffeb18,-64|102|0x18baef,-65|37|0x10c3f7,69|101|0x10baef,62|27|0x21cbff",90, 667, 546, 889, 761)
		if x ~= -1 and y ~=-1 then
			wLog("test", "pdjm找到死亡接力"..gi_swjl)
			jm = 30 
			keepScreen(false);
			return jm
		end		
	end	
	
	--1、主界面
	--x,y = findMultiColorInRegionFuzzy(0x63c7f7, "-44|64|0x5ab6e7,43|64|0xeff3f7", 90, 150, 1850, 270, 2000)
	x,y = findMultiColorInRegionFuzzy( 0x00aaef, "1|9|0xe7f7ff,-47|71|0x0092e7,50|72|0x009aef,-40|68|0xeffbff,42|68|0xffffff,2|45|0xeff7ff,-24|61|0xd6efff,22|60|0xdef7ff",90, 145, 1860, 291, 1976)
	if x ~= -1 and y ~=-1 then
		jm = 1 
		keepScreen(false);
		return jm
	end
	
	--2、模式选择界面(选择经典，远征还是pk)
	x,y = findMultiColorInRegionFuzzy( 0xe782ce, "0|9|0xefc3ef,5|2|0xde69ce,6|10|0xe771ce", 90, 361, 192, 388, 213)
	if x ~= -1 and y ~=-1 then
		jm = 2 
		keepScreen(false);
		return jm
	end	

	--3、判断pk界面(选择世界，个人，还是积分)
	x,y = findMultiColorInRegionFuzzy(0xc65900, "6|0|0xefdfce,0|5|0xfff7ef,10|5|0xce5900", 90, 900, 600, 1000, 700)
	if x ~= -1 and y ~=-1 then
		jm = 3 
		keepScreen(false);
		return jm
	end	
	--4, pk选择界面（世界对战，好友对战，积分兑换）
 	rtn = zs(0xde9208,1317, 589, 1319, 591)
	if rtn ~= 0 then
		rtn = zs(0xc641c6,1317, 1100, 1319, 1102)
		if rtn ~= 0 then
			rtn = zs(0x319ede,1317, 1612, 1319, 1614)	
			if rtn ~= 0 then
				rtn = zs(0xefe3bd,1367, 2004, 1369, 2006)
				if rtn ~= 0 then 
					jm = 4
					keepScreen(false);
					return jm
				end		
			end
		end
	end
	
--5,合体界面
	x,y = findMultiColorInRegionFuzzy( 0xb5b2bd, "-13|12|0xbdbed6,13|12|0xb5b2c6,-22|34|0x5a595a,21|33|0x5a555a,61|-7|0x6b6973,43|28|0x63656b,47|28|0xbdbece,79|37|0xc6c3d6,89|45|0x635d63",90, 844, 183, 1005, 276)
	if x ~= -1 and y ~=-1 then
		jm = 5
		keepScreen(false);
		return jm
	end
	
 	x,y = findMultiColorInRegionFuzzy( 0xdedbe7, "2|5|0x5a5d63,5|15|0x5a5d63,10|18|0xd6d3e7,19|17|0x525963,23|3|0x525963,27|7|0xc6c3d6,24|16|0xcecbde", 90, 545, 191, 580, 218)
	if x ~= -1 and y ~=-1 then
		jm = 5
		keepScreen(false);
		return jm
	end
	
	--6,买天神祝福界面
	x,y = findMultiColorInRegionFuzzy( 0x5ad3f7, "3|0|0x52cfef,1|3|0xf7ffff", 90, 460, 1840, 480, 1860)
	if x ~= -1 and y ~=-1 then
		jm = 6
		keepScreen(false);
		return jm
	end
	
	--7，恭喜你界面
	--x,y = findMultiColorInRegionFuzzy( 0xffe75a, "7|5|0xb54100,7|11|0xb54100,3|11|0xb54100,-2|10|0xffe752", 90, 516, 151, 547, 178)
	x,y = findMultiColorInRegionFuzzy( 0xfff363, "184|154|0xbd4100,211|140|0xffbe08,398|-9|0xfff773,447|-14|0xffff7b,633|135|0xffba10,33|206|0xd65d18,582|206|0xd66118,251|51|0xb54100,356|51|0xbd3c00", 90, 413, 104, 1165, 377)
	if x ~= -1 and y ~=-1 then
		--dialog("7777777", 0)
		jm = 7
		keepScreen(false);
		return jm
	end
	x,y = findMultiColorInRegionFuzzy( 0xffd352, "42|57|0xffffff,77|5|0xffffff,129|-4|0xffffff,96|65|0xf7ffff,162|67|0xf7ffff,183|0|0xffffff,214|67|0xf7ffff,230|18|0xceb263,260|47|0xff9e08",90, 567, 1655, 997, 1776)
	if x ~= -1 and y ~=-1 then
		--dialog("7777777", 0)
		jm = 7
		keepScreen(false);
		return jm
	end
	
	--8，加油哦界面
	--x,y = findMultiColorInRegionFuzzy( 0xffb610, "5|5|0x943010,9|13|0x5a1c21,16|20|0x635184", 90, 1028, 760, 1100, 797)
	x,y = findMultiColorInRegionFuzzy( 0xffffff, "31|-5|0xffffff,-13|43|0xd6efff,77|46|0xf7fbff,31|25|0xffffff,3|82|0xeff3f7,59|81|0xeffbff,21|65|0x0075bd,39|76|0x008ee7,32|18|0x0086c6",90, 151, 1841, 288, 1967)
	if x ~= -1 and y ~=-1 then
		jm = 8
		keepScreen(false);
		return jm
	end
	x,y = findMultiColorInRegionFuzzy( 0xffffff, "-18|42|0xd6ebff,28|-5|0xffffff,75|46|0xf7ffff,28|26|0xffffff,0|82|0xeff3f7,55|83|0xf7fbff,18|65|0x0075bd,38|76|0x088ed6,29|15|0x1082b5",90, 143, 1833, 295, 1973)
	if x ~= -1 and y ~=-1 then
		jm = 8
		keepScreen(false);
		return jm
	end
--	if gi_choice == 1 or gi_choice == 3 then
		--9，PK胜利界面
		x,y = findMultiColorInRegionFuzzy( 0x6b1410, "-1|53|0x296db5,22|34|0xfffb73,46|29|0xb54100,47|38|0x6b1818,68|23|0xfff773,68|-10|0xffffad,69|-20|0x6b1818", 90, 120, 157, 261, 264)
		--x,y = findMultiColorInRegionFuzzy( 0x8cd7ff, "7|52|0x21aaff,51|4|0x007db5,98|54|0x007db5,200|53|0x0079b5,400|32|0xf7df4a,452|4|0xd67900,558|1|0xd67500,552|55|0xd67500,635|31|0xf7eb5a",90, 414, 1491, 1116, 1591)
		if x ~= -1 and y ~=-1 then
			jm = 9
			keepScreen(false);
			return jm
		end		
		--10，PK失败界面
		x,y = findMultiColorInRegionFuzzy( 0x6b9ace, "-1|6|0x423c39,2|11|0x737173,8|6|0x393839,7|-1|0xbdebf7,13|3|0xc6fbff", 90, 624, 211, 665, 243)
		if x ~= -1 and y ~=-1 then
			jm = 10
			keepScreen(false);
			return jm
		end		
		--11，PK等待结算界面
		x,y = findMultiColorInRegionFuzzy( 0x5a497b, "5|4|0xffdb00,9|9|0xffdf00,12|12|0x524173,-1|12|0x5a4173", 90, 917, 735, 938, 753)
		if x ~= -1 and y ~=-1 then
			jm = 11
			keepScreen(false);
			return jm
		end		
				
		--12，PK选择界面(金币，钻石场选择)，对战列表
		x,y = findMultiColorInRegionFuzzy(0xc6bac6, "8|0|0xcec7d6,0|8|0x635d5a,5|8|0x84868c", 90, 850, 200, 950, 300)
		if x ~= -1 and y ~=-1 then
			x,y = findMultiColorInRegionFuzzy( 0xffc36b, "-9|9|0x21345a,-22|49|0x21bef7,36|64|0x52d7ff,30|19|0x189ee7,89|42|0x29aaef,-21|94|0xffd384,83|102|0xffd78c", 90, 289, 376, 480, 510)
			if x ~= -1 and y ~= -1 then
				jm = 12
				keepScreen(false);
				return jm
			end
		end
--	end

    --13，战斗中
	--x,y = findMultiColorInRegionFuzzy( 0xffffff, "-7|37|0xfff3c6,11|24|0xf7f7e7,28|24|0xfff3e7,29|2|0xf7ffff,11|7|0xde4d00,19|7|0xde4d00,8|17|0xde5100,18|17|0xde5910,5|23|0xffdfb5", 90, 154, 34, 208, 96)
	x,y = findMultiColorInRegionFuzzy( 0xde5100, "10|2|0xfff7ef,-9|47|0xbd3c00,25|42|0xfff3c6,42|3|0xffffff,42|21|0xce4108,51|2|0xf7f7f7,84|29|0xfff7d6,67|17|0xce3800,49|47|0xbd3c00",90, 102, 35, 205, 96)
	if x ~= -1 and y ~=-1 then
		--dialog("战斗中", 1)
		jm = 13
		keepScreen(false);
		return jm
	end
	x,y = findMultiColorInRegionFuzzy( 0xde5108, "5|4|0xffffff,-12|42|0xfff3c6,-2|48|0xbd3c00,38|2|0xfff7ef,47|3|0xffffff,66|4|0xffffff,75|26|0xf7f7e7,45|38|0xfff3c6,63|34|0xce3800",90, 102, 36, 205, 96)
	if x ~= -1 and y ~=-1 then
		--dialog("战斗中", 1)
		jm = 13
		keepScreen(false);
		return jm
	end


	--14, 领任务界面,,进行界面判断时候，先判断任务界面
	if g_auto_lrw == 0 then
		x,y = findMultiColorInRegionFuzzy( 0x63656b, "-16|34|0x63656b,20|13|0xcec7d6,21|39|0xb5b6c6,21|36|0x635d5a,45|64|0x5a595a,64|66|0x5a5d63,81|49|0xbdc3d6,84|13|0xb5b2bd,103|15|0x5a6163",90, 686, 180, 852, 261)
		if x ~= -1 and y ~=-1 then
			jm = 14
			keepScreen(false);
			return jm
		end	
		x,y = findMultiColorInRegionFuzzy(0x5a5963, "-6|63|0x5a595a,46|60|0x525963,108|63|0x5a595a,115|3|0x8c8e9c", 90, 690, 180, 845, 255)					
		if x ~= -1 and y ~=-1 then
			jm = 14
			keepScreen(false);
			return jm
		end	
	end
	
	--15，领取任务确定
	x,y = findMultiColorInRegionFuzzy( 0x63656b, "11|10|0xc6c3ce,-3|27|0x73717b,22|34|0xcecbde,28|33|0x5a555a,60|59|0x5a5963,75|54|0x5a595a,80|54|0xced3e7,86|51|0x5a555a,109|60|0x5a595a",90, 612, 409, 770, 491)
	if x ~= -1 and y ~=-1 then
		jm = 15
		keepScreen(false);
		return jm
	end
	x,y = findMultiColorInRegionFuzzy(0x84828c, "15|-1|0x5a595a,0|21|0x5a595a,12|19|0xadaebd", 90, 610, 410, 647, 455)
	if x ~= -1 and y ~=-1 then
		jm = 15
		keepScreen(false);
		return jm
	end
	
	--16, 弹出网络故障，直接点击重新连接，返回0
	x,y = findMultiColorInRegionFuzzy(0xfff77b, "12|0|0xde8e10,0|10|0xc6a239,12|10|0xbdaa4a", 90, 1000, 1200, 1050, 1250)
	if x ~= -1 and y ~=-1 then
		click(1080, 1250, 200)
		keepScreen(false);
		return 91
	end
	--17-1,任意界面弹出PK失败提醒(PVP结果)，直接点击确定，返回0
	x,y = findMultiColorInRegionFuzzy( 0x8cd7ff, "7|52|0x21aaff,51|4|0x007db5,98|54|0x007db5,200|53|0x0079b5,400|32|0xf7df4a,452|4|0xd67900,558|1|0xd67500,552|55|0xd67500,635|31|0xf7eb5a",90, 414, 1491, 1116, 1591)
	if x ~= -1 and y ~=-1 then
		click(590, 1550, 200)
		keepScreen(false);
		mSleep(200)
		return 92
	end
	--17-2,任意界面弹出PK胜利提醒(PVP结果)，直接点解确定，返回0
	x,y = findMultiColorInRegionFuzzy( 0x9cdbff, "20|55|0x21b2ff,78|53|0x007db5,180|2|0x0079b5,206|54|0x0079b5,402|38|0xf7d739,458|3|0xde9e21,558|55|0xd68208,564|1|0xde9221,638|41|0xf7eb52",90, 424, 1499, 1112, 1586)
	if x ~= -1 and y ~=-1 then
		click(590, 1550, 200)
		mSleep(200)
		keepScreen(false);
		return 93
	end	
	
	--18,战斗暂停提示继续界面，直接点击继续游戏，返回0
	--if g_fighting == 1 then
		x,y = findMultiColorInRegionFuzzy(0xff9e00, "0|7|0xffefd6,19|7|0xffe7bd,19|2|0xffffff", 90, 650, 880, 950, 720)
		--x,y = findImageInRegionFuzzy("jxyx.png", 100, 400, 780, 1111, 1060, 0);
		if x ~= -1 and y ~=-1 then
			click(770, 910, 200)
			keepScreen(false);
			return 94
		end
		--19,战斗暂停提示继续界面，俩按钮的，直接点击继续游戏，返回0
		x,y = findMultiColorInRegionFuzzy( 0xf7ffff, "-17|7|0xffffff,20|6|0xfffbf7,-4|14|0xffa610,5|14|0xffb639,-17|19|0xffffff,19|17|0xffcf73", 90, 714, 688, 765, 722)
		if x ~= -1 and y ~=-1 then
			click(760, 720, 200)
			keepScreen(false);
			return 95
		end
	--end
	
	--31  排名上升了
	x,y = findMultiColorInRegionFuzzy( 0xffef42, "0|7|0xbd3c00,8|0|0xffeb42,19|7|0x6b1418", 90, 1092, 137, 1131, 176)
	if x ~= -1 and y ~=-1 then
		jm = 0
		click(220, 1910, 200)
		keepScreen(false);
		return 96
	end
	
	--32 本周最高
--	x,y = findMultiColorInRegionFuzzy( 0xffbe18, "0|6|0xffbe18,8|6|0x943010,8|0|0xffbe18,5|18|0xffb610,7|10|0x9c2c10", 90, 909, 721, 976, 749)
	x,y = findMultiColorInRegionFuzzy( 0xffc718, "4|7|0x943010,10|17|0x943010,16|25|0xffbe18", 90, 1141, 692, 1200, 730)
	if x ~= -1 and y ~=-1 then
		jm = 0
		click(200, 1910, 200)
		keepScreen(false);
		return 97
	end
	
	--33 宠物背包已满
	x,y = findMultiColorInRegionFuzzy( 0x080808, "11|0|0x080808,1|5|0x42596b,6|5|0x84c7ef,12|5|0x31495a", 90, 1058, 885, 1100, 914)
	if x ~= -1 and y ~=-1 then
		dialog("宠物背包已满，请先清理，脚本停止。", 3)
		keepScreen(false);
		lua_exit()
		return 98
	end
	
	--34 领任务时候，物品堆叠已满
	x,y = findMultiColorInRegionFuzzy( 0x081018, "-23|10|0x42556b,-13|10|0x73a2bd,-1|21|0x000000", 90, 1265, 892, 1301, 926)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		g_auto_lrw = 1
		click(777,1250,100)
--		lua_exit()
		return 99
	end	
	
	--35 获取机友信息失败
	x,y = findMultiColorInRegionFuzzy( 0xffeb6b, "12|63|0xf7df4a,91|11|0xde8a10,107|59|0xd67900,135|59|0xd67908,177|6|0xd68208,152|59|0xce8210,201|59|0xd67d08,290|7|0xf7f77b,302|71|0xf7e352",90, 582, 1189, 964, 1307)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		click(770,1240,100)
		return 100
	end	

	--36 pk时候有未结算的pk
	x,y = findMultiColorInRegionFuzzy( 0x081421, "10|2|0x080c18,20|0|0x081421,24|6|0x8cd3ff", 100, 1043, 902, 1074, 918)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		g_fighting = 1
		mSleep(500)
		click(770,1240,100)
		mSleep(500)
		return 101
	end				
	
	--37 体力不足
	x,y = findMultiColorInRegionFuzzy( 0x94d3ff, "7|1|0x080808,15|1|0x94d3f7,8|9|0x395d6b,3|12|0x7bb6d6", 90, 613, 914, 642, 938)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		dialog("体力不足，脚本自动退出。", 3)
		lockDevice();
		lua_exit()
		return 102
	end		
	
	--38 亲，网络连接超时...
	x,y = findMultiColorInRegionFuzzy( 0x000000, "8|-14|0x000000,16|1|0x080c10,9|2|0x8cd3ff", 95, 982, 916, 1014, 949)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		click(770, 1250, 200)
		return 103
	end		
	--39 升级啦
	x,y = findMultiColorInRegionFuzzy( 0xfff342, "6|-1|0xf7be08,9|4|0xffc710,6|6|0xf7e339,0|5|0xffd729,4|3|0xffdb29", 90, 765, 581, 788, 603)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		click(770, 1770, 200)
		return 104
	end		
	--40， 亲，系统繁忙
	x,y = findMultiColorInRegionFuzzy( 0x94d3f7, "7|2|0x000408,8|7|0x102029,13|8|0x8cd3ff,3|9|0x94d3f7,6|13|0x6ba6c6", 90, 718, 915, 741, 938)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		click(770, 1250, 200)
		return 105
	end		
	
	--41 宝箱奖励
	x,y = findMultiColorInRegionFuzzy( 0x6b717b, "2|2|0x525963,4|5|0x5a595a,-2|6|0xc6c7de", 100, 690, 381, 710, 396)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		click(770, 1670, 200)
		return 141
	end		
	
	--42 本周最高
	x,y = findMultiColorInRegionFuzzy( 0x631c18, "3|3|0x5a1c18,6|6|0x844d29,6|9|0xfffb63", 100, 946, 579, 984, 602)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		click(220, 1900, 200)
		return 142
	end			
	
	--出现：游戏开始错误，单个一个确定按钮的
	x,y = findMultiColorInRegionFuzzy( 0xfff3b5, "51|35|0xffef5a,54|86|0xffe34a,114|23|0xce7900,159|73|0xd67900,201|18|0xd68a10,176|70|0xd67900,228|72|0xd67900,326|12|0xfff773,328|86|0xffe352",90, 578, 1186, 960, 1307)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		click(770, 1250, 200)
		return 143
	end				
	--不小心点开了系统设置
	x,y = findMultiColorInRegionFuzzy( 0xeffbff, "67|2|0xeffbff,-6|90|0xfffbff,52|97|0xffffff,74|73|0xceebff,29|52|0xdef3ff,31|78|0x008ade", 90, 252, 1476, 390, 1606)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		click(200, 1900, 200)
		return 144
	end				
--	if gi_choice == 2 then 
		--如果是刷剧情模式，则做如下判断，否则不做，提高效率
		--20, 剧情模式界面
		--x, y = findImageInRegionFuzzy("phb.png", 80, 1100, 200, 1390, 400, 0);
		
		--x,y = findMultiColorInRegionFuzzy(0xfff7ef, "29|3|0xffffff,1|9|0xc67d08,27|9|0xce8e31", 90, 1200, 1850, 1350, 1980)
		x,y = findMultiColorInRegionFuzzy( 0xe7f7ff, "1|69|0xf7ffff,56|32|0xdef3ff,338|3|0xffffff,441|74|0xffffff,525|4|0xffffff,524|74|0xffffff,605|4|0xffffff,562|70|0xf7f3e7,614|73|0xffffff",90, 136, 1835, 893, 1992)
		if x ~= -1 and y ~=-1 then
			jm = 20
			keepScreen(false);
			--wLog("test","pdjm, 20");
			return jm
		end
		x,y = findMultiColorInRegionFuzzy( 0xfff76b, "-28|24|0xffdf4a,7|49|0xffae18,-25|77|0xff9a10,-11|138|0xfff300,-48|165|0xfff339,-37|197|0xf7d710,3|201|0xf7d308,18|166|0xffcb18",90, 137, 161, 237, 408)
		if x ~= -1 and y ~=-1 then
			jm = 20
			keepScreen(false);
			--wLog("test","pdjm, 20-1");
			return jm
		end
		
		--21, 45关山羊胡选择普通还是英雄开始界面
		x,y = findMultiColorInRegionFuzzy( 0xfff784, "3|3|0xde9221,8|6|0xde7d00,12|-2|0xefb242,13|12|0xe7be4a,2|10|0xfff384,15|4|0xfff78c", 90, 785, 1705, 807, 1722)
		if x ~= -1 and y ~=-1 then
	--		dialog("45关x："..x.." y: "..y, 3)
			--wLog("test","pdjm,  21-1");
			jm = 21
			keepScreen(false);
			return jm
		else
			x,y = findMultiColorInRegionFuzzy( 0xf7f784, "5|4|0xde9218,8|7|0xd67900,4|11|0xfff384,14|14|0xe7ae39,13|0|0xefc34a,16|7|0xfff384", 90, 784, 1505, 807, 1527)
	--		dialog("45关x："..x.." y: "..y, 3)
			if x ~= -1 and y ~=-1 then
				--wLog("test","pdjm,  21-2");
				jm = 21
				keepScreen(false);
				return jm
			end
		end
		--21界面针对ios9，进行优化
		x,y = findMultiColorInRegionFuzzy( 0x31baff, "-7|43|0x21b2ff,300|-13|0x10a6ff,310|44|0x08aaff,418|-5|0xf7e352,401|44|0xf7c329,728|-15|0xffef63,725|42|0xffdf4a,836|30|0xf7d339,1167|9|0xf7e34a",90, 142, 1649, 1393, 1774)
		if x ~= -1 and y ~=-1 then
			--wLog("test","pdjm,  21-3");
			jm = 21
			keepScreen(false);
			return jm
		else
			x,y = findMultiColorInRegionFuzzy( 0x39baff, "141|62|0x63cfff,170|-6|0x007db5,287|13|0x18aaff,431|39|0xf7df42,496|-9|0xce7900,728|20|0xffeb52,594|9|0xce7900,589|18|0xd67900,590|41|0xce7900",90, 144, 1453, 968, 1574)
			if x ~= -1 then
				--wLog("test","pdjm,  21-4");
				jm = 21
				keepScreen(false);
				return jm	
			end
		end
		
		-- 22，剧情战斗胜利出来之后第一帧
		x,y = findMultiColorInRegionFuzzy( 0x104173, "7|0|0xf7fbff,0|5|0xf7fbff,7|5|0x424542", 100, 710, 205, 725, 220)
		if x ~= -1 and y ~=-1 then
			g_jq_fail = 0
			jm = 22
			keepScreen(false);
			return jm
		end	
		--ios9
		x,y = findMultiColorInRegionFuzzy( 0xf7c763, "111|62|0xefcf42,97|87|0x29baef,200|163|0x2996de,341|109|0x52cbef,369|161|0x2182ce,439|81|0x21aee7,483|53|0xefc339,160|185|0x5a6584,341|182|0x5a6573",90, 442, 16, 1112, 261)
		if x ~= -1 and y ~=-1 then
			x,y = findMultiColorInRegionFuzzy( 0xeff7ff, "-32|28|0xe7f3ff,3|61|0xdeefff,57|14|0xeffbff,57|43|0xdeefff,10|4|0x009ade,10|56|0x007dc6",90, 128, 1837, 290, 1990)
			if x ~= -1 and y ~=-1 then
				g_jq_fail = 0
				jm = 22
				keepScreen(false);
				return jm
			end
		end			

		--23, 剧情战斗胜利出来第二帧
		x,y = findMultiColorInRegionFuzzy( 0xf7d310, "9|0|0x6b1418,19|0|0xefbe10,0|7|0xb53c00,9|7|0x9c7942", 90, 900, 240, 945, 260)
		if x ~= -1 and y ~=-1 then
			jm = 23
			keepScreen(false);
			return jm
		end	
		
		--进入pk选择界面，弹出上次的PK结果
		x,y = findMultiColorInRegionFuzzy( 0x7b829c, "10|9|0xc6c3ce,26|15|0xc6c3d6,10|21|0xcec7d6,9|26|0x848294,49|0|0x848294,59|19|0xbdbece,66|30|0xc6cbde,57|32|0x848294,92|51|0x848694",90, 643, 558, 746, 628)
		if x ~= -1 and y ~=-1 then
			click(580, 1540, 100)
			return 106
		end		
		x,y = findMultiColorInRegionFuzzy( 0x7b829c, "6|51|0x848294,10|21|0xcec7d6,10|9|0xc6c3ce,25|15|0xd6d3e7,24|22|0x949aad,59|19|0xbdbece,91|51|0x7b8294,89|0|0x848294,58|36|0x9ca2b5",90, 639, 561, 747, 624)
		if x ~= -1 and y ~=-1 then
			click(580, 1540, 100)
			return 106
		end			
		x,y = findMultiColorInRegionFuzzy( 0xbdc3d6, "0|9|0x9c96a5,6|14|0xa5aec6,11|11|0xc6c7de,18|9|0xcec7d6,19|17|0x848694,22|11|0x8c8a9c", 90, 828, 559, 860, 583)
		if x ~= -1 and y ~=-1 then
			click(580, 1540, 100)
			return 106
		end	
		
		--24, 剧情战斗失败
		x,y = findMultiColorInRegionFuzzy( 0x42454a, "10|3|0x4a494a,-2|8|0x4a4d52,7|8|0x6b6563", 95, 800, 400, 825, 430)
		if x ~= -1 and y ~=-1 then
			--dialog("剧情战斗失败", 1)
			if g_jq_fail < 2 then  --如果同一关，连续失败两次，则跳过，否则重刷一次
				g_jq_fail = g_jq_fail + 1
			else
				if gi_jq_boss == 1 then
					jq_point[gi_jq_x + 1] = 4
				else
					g_juqing = g_juqing + 1  --当前要刷的剧情关卡+1，跳过当前关
					--wLog("test", "pdjm-24-1:g_juqing = "..g_juqing)
					g_jq_fail = 0
				end
			end
			jm = 24
			keepScreen(false);
			return jm
		end	
		--24, 剧情战斗失败 ios9
		x,y = findMultiColorInRegionFuzzy( 0xbdbab5, "145|179|0x6b656b,274|177|0x63696b,377|8|0xadb2b5,465|7|0xb5b2b5,614|172|0x949294,663|7|0xb5b2b5,837|172|0x5a5d5a,174|103|0x8c9294,402|101|0x8c8e8c",90, 301, 221, 1221, 462)
		if x ~= -1 and y ~=-1 then
			x,y = findMultiColorInRegionFuzzy( 0xeff7ff, "-32|28|0xe7f3ff,3|61|0xdeefff,57|14|0xeffbff,57|43|0xdeefff,10|4|0x009ade,10|56|0x007dc6",90, 128, 1837, 290, 1990)
			if x ~= -1 and y ~=-1 then			
				--dialog("剧情战斗失败", 1)
				if g_jq_fail < 2 then  --如果同一关，连续失败两次，则跳过，否则重刷一次
					g_jq_fail = g_jq_fail + 1
				else
					if gi_jq_boss == 1 then
						jq_point[gi_jq_x + 1] = 4
					else
						g_juqing = g_juqing + 1  --当前要刷的剧情关卡+1，跳过当前关
						--wLog("test", "pdjm-24-1=2:g_juqing = "..g_juqing)
						g_jq_fail = 0
					end
				end
				jm = 24
				keepScreen(false);
				return jm
			end
		end			
		
		--25, 刷剧情时候，提示次数用完了的界面
		x,y = findMultiColorInRegionFuzzy( 0xd67900, "-8|0|0xfff384,-7|8|0xde9e29,0|8|0xdec36b", 90, 765, 1255, 790, 1280)
		if x ~= -1 and y ~=-1 then
			jm = 25
			keepScreen(false);
			return jm
		end
--	end	
	
	--if g_fighting == 1 then  --如果是战斗中，才做如下判断，否则不做，提高函数效率
		--26，战斗中，出现暂停，俩按钮的
		x,y = findMultiColorInRegionFuzzy( 0x00a2ef, "7|0|0x00a6ef,1|6|0xf7ffff,7|3|0x6bcbef", 90, 640, 1060, 670, 1090)
		if x~= -1 and y ~= -1 then
			jm = 26
			keepScreen(false)
			return jm
		end
		--27，战斗中，出现暂停，提示网络出问题，和授权过期
		x,y = findMultiColorInRegionFuzzy( 0xf7e37b, "0|5|0xd67900,4|5|0xd68a18,4|9|0xdec363", 90, 1127, 1262, 1140, 1278)
		if x~= -1 and y ~= -1 then
			jm = 27
			keepScreen(false)
			return jm
		end	
		--28，战斗中，出现暂停，一个按钮的
		--x,y = findMultiColorInRegionFuzzy( 0xf7ffff, "-17|7|0xffffff,20|6|0xfffbf7,-4|14|0xffa610,5|14|0xffb639,-17|19|0xffffff,19|17|0xffcf73", 90, 714, 688, 765, 722)
		x,y = findMultiColorInRegionFuzzy( 0xffffff, "7|17|0xffffff,5|57|0xffffff,22|60|0xff9a10,18|63|0xffffff,25|50|0xffffff,53|4|0xf7ffff,46|18|0xff9e00,32|20|0xffa200,59|63|0xffebd6", 100, 585, 873, 687, 972)
		--x,y = findImageInRegionFuzzy("jxyx.png", 90, 400, 780, 1111, 1060, 0);
		if x~= -1 and y ~= -1 then
			jm = 28
			keepScreen(false)
			return jm
		end	
		--程序刚启动--公告标题内容，最下面一个“知道了”按钮
		x,y = findMultiColorInRegionFuzzy( 0xffcf4a, "17|57|0xff9608,351|1|0xffcb4a,345|56|0xff9600,62|0|0xffffff,115|63|0xf7fbff,141|12|0xffffff,201|69|0xffffff,226|8|0xffffff,247|71|0xffffff",90, 542, 1841, 1005, 1981)
		if x~= -1 and y ~= -1 then
			click(770, 1920, 200)
			keepScreen(false)
			return 150
		end	
		--程序刚启动--精彩活动列表-最下面一个返回键头
		x,y = findMultiColorInRegionFuzzy( 0xf7f7f7, "26|8|0xdee7ef,73|57|0x08c3f7,131|64|0x00aeef,74|77|0xe7f7ff,38|112|0xe7f3ff,75|146|0xeffbff,81|88|0x009ade,82|136|0x0071b5,130|113|0xdef3ff",90, 113, 1762, 324, 2027)
		if x~= -1 and y ~= -1 then
			click(220, 1900, 200)
			keepScreen(false)
			return 151
		end	
		--程序刚启动--公告标题内容，最下面一个“知道了”按钮
		x,y = findMultiColorInRegionFuzzy( 0x008ee7, "181|12|0xe7e7e7,361|19|0x73ae10,389|8|0xded3c6,684|9|0xded7ce,821|-4|0xef2400,834|13|0xffffff,848|23|0xffc710,1113|11|0xd6dbd6,1140|-9|0x0086de",90, 164, 1620, 1379, 1708)
		if x~= -1 and y ~= -1 then
			keepScreen(false)
			return 1000
		end	
		
		--远征
		x,y = findMultiColorInRegionFuzzy( 0x009aef, "99|-47|0xeffbff,282|-14|0xff9a00,601|-36|0xfffff7,571|-26|0xff9600,510|20|0xfffbef,651|-16|0xff9600,865|-4|0xff9600,1117|-33|0xf7fbf7,1069|20|0xfff3de",90, 127, 1827, 1391, 1984)
		if x~= -1 and y ~= -1 then
			keepScreen(false)
			return 37
		end
		x,y = findMultiColorInRegionFuzzy( 0x739e00, "24|104|0x739e00,16|141|0x73b210,1091|-60|0x94cf21,892|-19|0x73a208,889|144|0x8ccb29,1072|151|0x6b9a00,-16|447|0x009ef7,-17|408|0xbde3f7,78|394|0xeff7ff",90, 90, 1359, 1323, 2038)
		if x~= -1 and y ~= -1 then
			keepScreen(false)
			return 38
		end
		x,y = findMultiColorInRegionFuzzy( 0x10aeef, "2|60|0x0096ef,37|4|0xffffff,86|69|0xffffff,326|5|0xffffff,342|71|0xffffff,719|55|0xff9a08,760|12|0xffffff,921|8|0xfffbf7,955|73|0xffffff",90, 196, 1731, 1345, 1885)
		if x~= -1 and y ~= -1 then
			keepScreen(false)
			return 39
		end	
		--远征点开盒子之后，领奖励
		x,y = findMultiColorInRegionFuzzy( 0xeff7ff, "-38|35|0xadd7ef,3|69|0xe7f3f7,57|35|0xdef3ff,66|35|0x008ade,758|46|0xff9a00,785|30|0xf7ffff,894|59|0xf7fbef,998|26|0xff9e00,1100|45|0xffffff",90, 132, 1824, 1328, 1975)
		if x~= -1 and y ~= -1 then
			keepScreen(false)
			return 40
		end		
		--远征领盒子
		x,y = findMultiColorInRegionFuzzy( 0x8c75ad, "7|-81|0x3196ef,-22|-80|0x73f3ff,-78|40|0x9c7d9c,75|71|0x948a84,1|58|0x4a49bd,-19|51|0x7bb6ff,-4|79|0xffffff,-29|83|0xffffff,7|83|0xfffff7",90, 132, 1824, 1328, 1975)
		if x~= -1 and y ~= -1 then
			keepScreen(false)
			return 41
		end					
	--end
	keepScreen(false);
	--dialog("找不到", 1)
	return 999
end

function switch0()  --为了控制流程，无意义的空函数
	
end

function switch1()--主界面处理动作
	local li_for = 0;
	local x,y
	if g_auto_lrw == 0 then
		for i = 1, 5 do
			--x,y = findMultiColorInRegionFuzzy( 0x2171bd, "23|0|0x2175c6,47|1|0x2171bd,64|2|0x2171bd,83|2|0x1875c6,-8|13|0x1875c6,17|14|0x2175c6,34|13|0x1875c6,53|13|0x2171c6,79|13|0x2171c6",90, 939, 219, 1074, 279)
			x,y = findMultiColorInRegionFuzzy( 0xef3839, "3|0|0xef3839,6|0|0xef3831,1|2|0xef3839,3|2|0xef3839,6|2|0xef3839,2|5|0xef3839,3|5|0xef3839,5|5|0xef3839",90, 959, 85, 1083, 283)
			if x ~= -1 then
				return click(1000, 190, 200)
			end
			mSleep(200)
		end
	end
	click(1221, 1919, 200)  
	mSleep(200);
end

function switch2()--2、模式选择界面
	if g_fighting == 0 then
		--wLog("switch2","gi_choice="..gi_choice.."  ");
		if gi_choice == 0 then  --经典
			click(750, 700, 200)
		elseif gi_choice == 1 or gi_choice == 3 or gi_choice == 4 then  --pk
			mSleep(500)
			touchDown(4,1440, 1430)  --按下动作
			mSleep(50)
			for i=0,1110,185 do                          
				touchMove(4, 1440, 1430 - i)       --滑动过程
				mSleep(50)
			end
			mSleep(50)
			touchUp(4,1440, 320)                  --弹起动作
			mSleep(500)
			if gi_choice == 4 then
				click(760, 1520, 200)
			else
				click(777, 1187, 200)
			end
		elseif gi_choice == 2 then  -- 剧情
			if g_juqing_cs == 0 then
				click(770, 360, 200)
			else
				click(220, 1900, 200)
				g_juqing_cs =  0
			end
		end
	else
		click( 200, 1920, 200)
		g_fighting = 0;
	end
	mSleep(500)
end

function switch3()--3、判断pk界面
	if g_fighting == 0 then
		click(780, 480, 200)  
	else                     --如果刚从战斗画面退出来，点击返回
		click( 200, 1920, 200) 
		g_fighting = 0;
	end
	mSleep(500)
end

function switch4()--4, pk选择界面（世界对战，好友对战，积分兑换）
	if g_fighting == 0 then
		click(790, 450, 200) 
		mSleep(2000)    
	else                     --如果刚从战斗画面退出来，点击返回
		click( 200, 1920, 200) 
	end
	mSleep(500)
end

function switch5()--5,合体界面
	x,y = findMultiColorInRegionFuzzy( 0xef9e10, "27|-35|0xffef31,75|-14|0x6b9e00,223|-17|0x6bae00,117|-41|0xeff7e7,106|-30|0xe7efd6,142|-8|0xf7fbf7,176|-41|0xfffbf7,156|-3|0xfffbf7,186|-3|0xeff3d6",90, 1136, 464, 1390, 525)
	if x ~= -1 then
		click(900, 420, 200)  --有免费合体，就选上
--		wLog("test", "有免费合体可选"..x..", "..y)
		mSleep(100)
	end
	if gi_choice == 2 then
		if g_juqing_cs == 0 then
			click(1119, 1913, 200)  
		else
			click(220, 1900, 200)
		end
	else
		click(1119, 1913, 200)
	end
	mSleep(500)
end

function switch6()  --6,买天神祝福界面
	if g_fighting == 0 then
		if gi_choice == 2 then  --如果是刷剧情模式，能进入这里，说明前面判断剩余次数出问题了，这里仅仅是容错处理。
			if g_juqing_cs == 0 then
				click(1119, 1913, 200) --次数还有，点开始
			else
				click(220, 1900, 200)  --次数没了，点返回
			end
		else
			click(1119, 1913, 500) 
		end  
	else
		g_fighting = 0
		click(470, 1920, 200)  --这里应该是在这个界面弹出了还有未结算的pk的提示，那么直接回主界面
	end

	mSleep(500)
end
function switch7()--7，恭喜你界面
    click(780, 1722, 200)  
	mSleep(500)   
end
function switch8()--8，加油哦界面
    click(210, 1900, 200)  
	mSleep(500) 
end
function switch9()--9，PK胜利界面

	g_fighting = 0
    click(190, 1900, 200) 
	mSleep(500) 

end
function switch10()--10，PK失败界面
	g_fighting = 0
    click(190, 1900, 200)  
	mSleep(500)   

end
function switch11()--11，PK等待结算界面
	g_fighting = 0
    click(770, 1910, 200)  
	mSleep(500)   

end
function switch12() ----12，PK选择界面(金币，钻石场选择)
	if g_fighting == 0 then  --如果还未进入过战斗，点击金币，准备进入战斗界面
		if gi_choice == 1 then --1W金币场
			click(900, 1320, 200)
		elseif gi_choice == 3 then  --2888金币场
			click(600, 1350, 200)
		end
	else                     --如果刚从战斗画面退出来，点击返回
		click( 200, 1920, 200) 
	end
	mSleep(500)
end

function switch13() ----13，战斗中
	--dialog(g_fun_running_13, 0)
--[[	
	if g_fun_running_13 == 1 then   --阻止函数重入
		return
	end
	]]
--	wLog("test","switch13,开始".."   ");
	g_fun_running_13  = 1
	g_fighting = 1
	
	local x,y,li_krqd, li_swjl,li_for = 0,0,0,0,0
	local li_lei, li_jineng, li_jineng1, li_jineng2=0,0,0,0

	wLog("test", "开始找死亡接力"..gi_swjl..", "..li_swjl)
	if gi_swjl == 0 and li_swjl == 0 then  --死亡接力
		x,y = findMultiColorInRegionFuzzy( 0xffffff, "-47|48|0xff7da5,44|49|0xff7dad,-45|116|0xffe308,46|119|0xffef18,-4|147|0xffeb18,-64|102|0x18baef,-65|37|0x10c3f7,69|101|0x10baef,62|27|0x21cbff",90, 667, 546, 889, 761)
		if x ~= -1 and y ~=-1 then
			wLog("test", "找到死亡接力"..gi_swjl..", "..li_swjl)
			click(770, 670, 200)
			g_fun_running_13 = 1
			mSleep(1500)  --死亡接力之后，休眠2秒，直接放技能，因为没机会再判断掉血放技能了
			click(190, 1880, 200)
			li_swjl = 1
		end		
	end		


	
	if gi_killme == 1 then
		hd1(1,555,1900, -1500, -500)
		return
	end
	
	while g_fun_running_13 == 1 do
--[[		
		touchDown(4,1000, 1380)  --按下动作
		mSleep(50)
		touchMove(4, 1000, 2040)       --滑动过程
		mSleep(50)
		touchUp(4, 1000, 2040)  
	]]
--		keepScreen(true)
		if li_lei == 0 then
			if gi_choice == 2 then
				x,y = findMultiColorInRegionFuzzy( 0xffffff, "-8|-1|0xfffbf7,9|1|0xffffff,0|-9|0xfffbf7,0|9|0xffefef,-4|-5|0xce4510,5|-3|0xde8e6b,-4|3|0xd6714a,4|3|0xde967b", 90, 193, 1383, 265, 1419)				
			else
				x,y = findMultiColorInRegionFuzzy( 0xe7aa94, "5|0|0xe78e73,-6|9|0xfff7f7,-6|11|0xfffbf7,0|21|0xc66139,3|19|0xf7ebe7,12|9|0xf7cfbd,11|12|0xe7baa5,-2|14|0xbd5521,5|7|0xefcbbd",90, 201, 1383, 263, 1416)
			end 
			if x ~= -1 then
				--dialog("有雷：x="..x.." y="..y , 1)
				li_lei = 1
			else
				li_lei = 0
			end
		end
		
			--装备技能
			--x,y = findMultiColorInRegionFuzzy( 0x393c42, "0|4|0x424142,0|7|0x101821,1|9|0x635d5a,2|13|0xeff7f7,3|8|0x8c96a5,4|7|0x29385a,3|3|0xa5a2a5", 90, 177, 1803, 195, 1827)		
		if li_jineng == 0 then
			x,y = findMultiColorInRegionFuzzy( 0x393439, "2|0|0x393439,4|0|0x393439,6|0|0x848a94,2|2|0x423c42,3|4|0x42454a,5|4|0xadaeb5,6|2|0xa59ea5,4|6|0x181821,5|6|0x31415a",90, 179, 1806, 193, 1820)
			if x ~= -1 and y ~= -1 then
				li_jineng = 0
			else
				li_jineng = 1
			end
		end
		
			--宠物技能
			--x,y = findMultiColorInRegionFuzzy( 0x94b6ce, "1|2|0xadbace,-2|6|0x6b869c,8|8|0xeff3f7,26|1|0x8c929c,28|0|0x738a9c,25|9|0xf7fbf7", 90, 1286, 1801, 1350, 1827)
		if li_jineng1 == 0 then
			x,y = findMultiColorInRegionFuzzy( 0xb55d84, "58|-2|0xffb273,119|-1|0xc65d8c,19|54|0xfffb4a,66|31|0xf7f773,107|51|0xf7ef4a,45|66|0xde5918,118|108|0x8c2410,8|103|0xe75918,63|111|0xffef31",90, 1253, 1819, 1442, 1998)
			if x ~= -1 and y ~=-1 then
				li_jineng1 = 1	
			else
				li_jineng1 = 0
			end
		end
			
			--主动技能
			--x,y = findMultiColorInRegionFuzzy( 0xefdb63, "-33|9|0xf7d3ce,46|8|0xf7dbd6,-8|70|0x210400,23|70|0x180400,8|92|0xdef3f7,-39|91|0xad8200,45|98|0xa5bace,-45|113|0xde00ef,63|109|0xe700ef",90, 97, 1515, 279, 1714)
		if li_jineng2 == 0 then
			x,y = findMultiColorInRegionFuzzy( 0x9496a5, "4|1|0x848e9c,5|1|0x8c8e9c,3|4|0xadb2ad,7|4|0xadb2ad,7|7|0x4a5563,4|7|0x4a556b,2|9|0xf7fbff,6|9|0xf7fbff,5|6|0x636973",90, 176, 1513, 193, 1530)
			if x ~= -1 and y ~=-1 then
				li_jineng2 = 1	
			else
				li_jineng2 = 0
			end
		end
		--dialog(li_jineng2, 2)
--		keepScreen(false)
		wLog("test", "开始找死亡接力"..gi_swjl..", "..li_swjl)
		if gi_swjl == 0 and li_swjl == 0 then  --死亡接力
			x,y = findMultiColorInRegionFuzzy( 0xffffff, "-47|48|0xff7da5,44|49|0xff7dad,-45|116|0xffe308,46|119|0xffef18,-4|147|0xffeb18,-64|102|0x18baef,-65|37|0x10c3f7,69|101|0x10baef,62|27|0x21cbff",90, 667, 546, 889, 761)
			if x ~= -1 and y ~=-1 then
				wLog("test", "找到死亡接力"..gi_swjl..", "..li_swjl)
				click(770, 670, 200)
				g_fun_running_13 = 1
				mSleep(1500)  --死亡接力之后，休眠2秒，直接放技能，因为没机会再判断掉血放技能了
				click(190, 1880, 200)
				li_swjl = 1
			end		
		end				
		--wLog("test","switch13,炸弹，装备技能，宠物技能，主动技能="..li_lei..li_jineng..li_jineng1..li_jineng2);
		for li_for = 1,3,1 do
			x, y = findImageInRegionFuzzy("daodan.png", 90, 570, 50, 940, 150, 0);
			--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 85, 606, 10, 926, 260)
			if x ~= -1 then 
				--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 90, 606, 10, 926, 260)
				x,y = findMultiColorInRegionFuzzy( 0x290800, "2|0|0x290800,0|2|0x290800,2|2|0x290800",90, 606, 10, 926, 260)  --黑点
				if x ~= -1 then	
					--wLog("test","switch13,导弹来袭");
					li_for = 0
					break; 
				end
				x,y = findMultiColorInRegionFuzzy( 0x634139, "0|2|0x634139,0|4|0x634139,0|6|0x634139,1|4|0x633c31,1|2|0x633c31",90, 606, 10, 926, 260)  --黑点
				if x ~= -1 then	
					--wLog("test","switch13,导弹来袭");
					li_for = 0
					break; 
				end				
			end
		end
		--wLog("test","switch13  找导弹 "..x.."   "..y);
		--dialog(li_lei.." "..li_jineng.." "..li_jineng1.." "..li_jineng2, 1)
		
		if x ~= -1 and y ~=-1 then   ---有导弹来了
			--dialog(li_lei.." "..li_jineng.." "..li_jineng1.." "..li_jineng2, 2)
			--wLog("test","switch13,找到导弹  "..li_lei.." "..li_jineng.." "..li_jineng1.." "..li_jineng2.."  ");
			if li_jineng == 1 then   --有装备技能
				click(190, 1880, 200) 
				li_jineng  = 0
--					wLog("test","switch13,放装备技能");
			else
				if li_jineng1 == 1 then  --有宠物技能
					click(1350, 1900, 200)
					li_jineng1 = 0
					--wLog("test","switch13,放宠物技能");
				else
					if li_jineng2 == 1 then  --飞机主动技能
						click(185, 1600, 200)
						li_jineng2 = 0
						--wLog("test","switch13,放主动技能");
					else	
						if li_lei == 1 then  --有雷，放
							click(190, 1320, 200)  --放多余的雷
							li_lei = 0
							mSleep(5000)	
							--wLog("test","switch13,放雷");
							--mysleep(5)
						else
							--导弹来了，没雷没技能，跑吧
							--wLog("test","switch13,没技能，准备跑路");
							x, y = findImageInRegionFuzzy("daodan.png", 90, 1166,50,1526, 150, 0);
							--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 85, 1186,10,1506, 260)
							if x ~= -1 and y ~=-1 then  --最右边位置也找到导弹了
								--随便挪个地方碰运气吧
								hd(1,766,1830, -1000,-200)     --d是标记 xy是坐标 i是距离 b是步长 移到最左边碰运气吧
								mSleep(2500)
								--mysleep(3)
								x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 85, 166, 1, 926, 260) --找最左边到中间位置的路程中间有没有导弹导弹
								while x ~= -1 and y ~= -1 do  --如果找到导弹了，继续等待找导弹，知道找不到导弹了，再向下执行
									--路程中间有导弹
									--当前头顶导弹有没有
									x, y = findImageInRegionFuzzy("daodan.png", 90, 6, 50, 376, 150, 0);
									--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 85, 6, 1, 326, 260)
									if x ~= -1 and y ~=-1 then --如果找到疑似导弹的外围黑点，找导弹的中心白点，如果外围黑点都没找到，也不用找内部白点了
										x,y = -1,-1  --退出循环，赶快跑吧
									else
										mSleep(100)
										--看当前位置到中间的路上有没有导弹
										x, y = findImageInRegionFuzzy("daodan.png", 90, 6, 50, 946, 150, 0);
										--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 85, 166, 1, 926, 260)
									end
									mSleep(50)	
									--wLog("test","switch13,没技能，跑路完了，准备回去");
								end
								--hd(1,166,1830, 600,200)     --d是标记 xy是坐标 i是距离 b是步长
								hd(1,0,1830, 600,300)     --d是标记 xy是坐标 i是距离 b是步长
								--wLog("test","switch13,跑路完成，归位。");
							else  --最右边没有雷，移过去吧
								--wLog("test","switch13,最右边没有雷，移过去吧");
								hd(1,750,1830, 1200,400)     --d是标记 xy是坐标 i是距离 b是步长
								--休眠两秒之后，再移回来
								mSleep(2500)
								--mysleep(3)
								x, y = findImageInRegionFuzzy("daodan.png", 90, 570, 50, 1830, 150, 0);
								--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 85, 606, 10, 1830, 260)
								while x ~= -1 and y ~= -1 do  --如果找到导弹了，继续等待找导弹，知道找不到导弹了，再向下执行
									--看看当前位置头顶有没有导弹
									x, y = findImageInRegionFuzzy("daodan.png", 90, 1156, 50, 1536, 150, 0);
									--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 90, 1186,10,1506, 260)
									if x ~= -1 and y ~=-1 then 
										x,y = -1,-1
									else
										mSleep(200)
										x, y = findImageInRegionFuzzy("daodan.png", 90, 570, 50, 1536, 150, 0);
										--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 90, 606, 10, 1830, 260)
									end
									mSleep(50)		
									--wLog("test","switch13,最右边等待归位");
								end		
								--wLog("test","switch13,最右边没有雷，跑完归位");
								hd(1,1530,1830, -600, -300)     --d是标记 xy是坐标 i是距离 b是步长
							end
						end
					end
				end
			end
		end
		
		----wLog("test","switch13  导弹判断结束");
		--处理完导弹之后，处理一下别的
		--开局冲刺
		if gi_krqd == 0 and li_krqd == 0 then
			x,y = findMultiColorInRegionFuzzy( 0x5aa6c6, "0|5|0x8cbace,3|7|0x318ebd,3|10|0x9cc7d6", 95, 487, 730, 500, 746)
			if x ~= -1 and y ~=-1 then
				click(520, 520, 100)
				--wLog("test", "狂热冲刺")
				li_krqd = 1
			end		
		end
		
		--找卖血技能
--		keepScreen(true)
		--嫦娥卖血
		x,y = findMultiColorInRegionFuzzy( 0x215594, "8|-6|0x2969ad,32|-11|0x216db5,51|-8|0x185594,64|-1|0x185594,15|7|0xffffff,32|3|0xffffff,49|7|0xffffff,35|17|0xffffff,24|16|0x2969ad",90, 1234, 502, 1440, 999)
		if x == -1 then
			-- H18的卖血
			x,y = findMultiColorInRegionFuzzy( 0x0851a5, "13|-11|0x0851a5,44|-12|0x0851a5,60|6|0x0851a5,29|-9|0xeff3f7,25|3|0xffffff,32|4|0xe7efef,29|8|0x084d8c,13|10|0x087dd6,44|9|0x087dd6",90, 1234, 502, 1440, 999)
		end
		if x ~= -1 then 
			hd(1,0,1830, 1000,200) --回中间
			mSleep(100)
			hd(7,1530,1000, -600, -200)
			mSleep(100)
			hd1(6, 766, 1830, -1600, -400) --向上
			--dialog("3x = "..x.."  y = "..y, 0)
			mSleep(4500)
			hd1(7, 766, 50, 2000, 400) --回来
		else
			hd1(1,750,500, 2000, 400) --回最下		
		end

		--宠物技能
		x,y = findMultiColorInRegionFuzzy( 0xbd4173, "14|-3|0xc6416b,24|-6|0xc64173,42|-1|0xa53452,56|9|0xc6416b,3|18|0xfffbf7,24|4|0xffffff,45|18|0xfff7ef,24|21|0x8c3c29,24|24|0xa52439",90, 1234, 502, 1440, 999)
		if x ~= -1 then 
			hd(1,0,1830, 1000,200) --回中间
			mSleep(500)
			hd(7,1530,1000, -600, -200)
			mSleep(500)
			hd1(6, 766, 1830, -1600, -400) --向上
			--dialog("3x = "..x.."  y = "..y, 0)
			mSleep(6000)
			hd1(7, 766, 50, 2000, 400) --回来	
		else
			hd1(1,750,500, 2000, 400) --回最下					
		end		
	

		--圆月之舞
		x,y = findMultiColorInRegionFuzzy( 0xdee3e7, "-26|12|0xadaa21,0|3|0xada621,27|11|0xadaa21,-18|27|0xffffff,0|22|0xffffff,19|26|0xffffff,-8|25|0xada621,8|25|0xada621,0|31|0xada621",90, 1234, 502, 1440, 999)
		if x ~= -1 then 
			mSleep(2000)
			hd(1,10,1830, 2000,500) --回中间
			mSleep(500)
			hd(1,10,1830, 2000,500)
			mSleep(500)
			hd(7,1530,1000, -600, -200)
			mSleep(500)
			hd1(6, 766, 1830, -1600, -400) --向上
			mSleep(4500)
			hd1(1,750,500, 2000, 400) --回最下
		else
			hd1(1,750,500, 2000, 400) --回最下					
		end				
--		keepScreen(false)
		
		--看看掉血没有
		--x,y = findMultiColorInRegionFuzzy( 0xe75108, "0|4|0xe75508,0|9|0xf75908,0|13|0xf75908,10|13|0xf75908,9|8|0xef5508,8|4|0xe75508", 100, 394, 54, 424, 81)
		x,y = findMultiColorInRegionFuzzy( 0xe74d00, "3|0|0xde5100,7|0|0xde5100,10|0|0xe74d00,0|3|0xef5510,4|3|0xef5510,7|3|0xf75108,11|3|0xef5108",90, 266, 49, 316, 68)
		--这里因为血槽掉血后背景色为透明，所以找红色血，找不到了就放技能
		if x ~= -1 and y ~=-1 then  --找到红色血块，说明没掉血
			if gi_choice ==2 and (g_juqing == 2 or g_juqing == 1 or g_juqing == 3) then  --如果是剧情45,54，42直接放技能
				--mSleep(5000)
				click(1350, 1900, 200)  --宠物
				mysleep(10)
				click(185, 1600, 200)   --主动
				mysleep(10)
				click(190, 1880, 200)   --装备
				mysleep(10)		
				click(1350, 1900, 200)  --炸弹
				mysleep(5)
			end
		else   --掉血了
			--wLog("test","switch13,掉血了：   "..li_lei.." "..li_jineng.." "..li_jineng1.." "..li_jineng2);
			if li_jineng == 1 then
				click(190, 1880, 200) 
				li_jineng = 0
				--mysleep(10)
			else
				if li_jineng1 == 1 then
					click(1350, 1900, 200)
					li_jineng1 = 0
				else
					if li_jineng2 == 1 then  --飞机主动技能
						click(185, 1600, 200)
						li_jineng2 = 0
					else	
						if li_lei == 1 then
							--mysleep(3)
							click(190, 1320, 200)  --放多余的雷
							li_lei = 0
							mSleep(5000)
							--mSleep(3000)
						end
					end
				end	
			end
		end	
		--以下代码，继续判断是否还在战斗界面，如果在战斗界面，就继续while循环，
		--如果不在战斗界面了，那么退出while循环，交给主界面去判断pdjm()
		--13，战斗中
		resetIDLETimer()
		for li_for = 1,3,1 do
			--看看是不是弹出死亡接力了
			--wLog("test", "查找死亡接力"..gi_swjl..", "..li_swjl)
			if gi_swjl == 0 and li_swjl == 0 then  --死亡接力
				x,y = findMultiColorInRegionFuzzy( 0xffffff, "-47|48|0xff7da5,44|49|0xff7dad,-45|116|0xffe308,46|119|0xffef18,-4|147|0xffeb18,-64|102|0x18baef,-65|37|0x10c3f7,69|101|0x10baef,62|27|0x21cbff",90, 667, 546, 889, 761)
				if x ~= -1 and y ~=-1 then
					--wLog("test", "找到死亡接力"..gi_swjl..", "..li_swjl)
					click(770, 670, 200)
					g_fun_running_13 = 1
					mSleep(1500)  --死亡接力之后，休眠2秒，直接放技能，因为没机会再判断掉血放技能了
					click(190, 1880, 200)
					li_swjl = 1
				end		
			end		
			x,y = findMultiColorInRegionFuzzy( 0xde5100, "10|2|0xfff7ef,-9|47|0xbd3c00,25|42|0xfff3c6,42|3|0xffffff,42|21|0xce4108,51|2|0xf7f7f7,84|29|0xfff7d6,67|17|0xce3800,49|47|0xbd3c00",90, 102, 35, 205, 96)
			if x ~= -1 then 
				g_fun_running_13 = 1
				break;
			else
				g_fun_running_13 = 0
			end
			x,y = findMultiColorInRegionFuzzy( 0xde5108, "5|4|0xffffff,-12|42|0xfff3c6,-2|48|0xbd3c00,38|2|0xfff7ef,47|3|0xffffff,66|4|0xffffff,75|26|0xf7f7e7,45|38|0xfff3c6,63|34|0xce3800",90, 102, 36, 205, 96)
			if x ~= -1 then 
				g_fun_running_13 = 1
				break;
			else
				g_fun_running_13 = 0
			end			
		end
		--wLog("test","switch13战斗中检测,x="..x.."  g_fun_running_13= "..g_fun_running_13.."  ");
	end  --while
	g_fun_running_13  = 0
	--wLog("test","switch13,结束".."   ".."  g_fun_running_13= "..g_fun_running_13.."  ");
	--dialog("退出战斗函数", 0)
	
end

function switch14() ----14，领任务界面
	keepScreen(false)
	local x,y = 0,0
	for i = 1, 10 do
		x,y = findMultiColorInRegionFuzzy(0xbd4d18, "8|0|0xbd4d18,2|6|0xf76510,8|6|0xf76510", 90, 1170, 340, 1390, 485)
		if x ~= -1 and y ~=-1 then
			click(770, 420, 200);--点击进入领任务最后确认界面
			break;
		end
		mSleep(200);
	end
	click(220, 1920, 200)
	mSleep(500);
end
function switch15() ----15，领任务确定界面
	mSleep(200);
--	dialog("领任务了222", 1)
	if g_auto_lrw == 0 then
		click(770, 1170, 100);--点击进入领任务最后确认界面
	else
		click(220, 1900, 100)
	end
	mSleep(500)
end

function switch20() ----20，剧情模式界面
	
	if gi_jq_boss == 1 then
		return switch20_boss()
	end
		
	local i_boom,x,y,rtn,i = 0,0,0,0,0

	mSleep(200);
--	dialog("gi_guqing: "..g_juqing, 2)
	if g_juqing_cs == 1 then   --每刷完一关，回到主界面，看看有没有日常任务可以领取
		return click(220,1900,200)
	end 
	keepScreen(true)
	x,y = findMultiColorInRegionFuzzy( 0xe7ae10, "-1|3|0x842418,18|0|0xffc310,19|3|0x942810", 90, 520, 1510, 550, 1520)
	keepScreen(false)
	if x ~= -1 and y ~=-1 then  --找到第一关的图标了
--		dialog("到底了", 2)
		i_boom = 1
		g_juqing_cs = 0  --重置当前关卡次数，0代表还有次数可刷，直接影响合体界面点击位置
	else
		i_boom = 0
	end
	
	while i_boom == 0 do
		--判断当前画面有没有指定关卡可以进入
		if g_juqing > 7  then
			if gi_tili == 0 then
				dialog("剧情关已经刷完, 自动转入刷积分模式。", 3)
				click(220, 1900, 200)
				rtn= pdjm();
				while rtn ~= 1 do  --回到主界面
					click(210, 1900, 200)
					mSleep(1000)
					rtn = pdjm();
					i = i + 1
					if i > 30 then
						dialog("剧情关已经刷完, 转到刷积分失败。。", 3)
						lockDevice();
						lua_exit()
					end
				end					
				gi_choice = gi_choice_temp
				break;
			else
				dialog("剧情关已经刷完, 脚本自动停止。", 3)
				lockDevice();
				lua_exit()
			end
		end
		mSleep(200)
		--先判断一下当前画面有没有需要进入的关卡，没有了再从底部找起
		if g_juqing == 1 then
			if g_jq_45 == 1 then
				x,y = findMultiColorInRegionFuzzy( 0xc68239, "6|-116|0x422c18,12|-108|0x5a3c21,-29|-150|0x423429,32|-72|0xffd74a,-38|-65|0xd67d39,-10|-45|0xde6d29", 85, 880, 140, 1050, 1800)
				if x == -1 then  --针对ios9
					--wLog("test","fd45,ios8没找到，找ios9的图...");
					x,y = findMultiColorInRegionFuzzy( 0xd69631, "-59|-65|0xffcf4a,47|-69|0xffd74a,-1|-113|0x422010,17|-130|0xdecba5,-9|-61|0xd66d21,-49|-148|0xb56129,41|-147|0xb55d29",85, 885, 240, 1044, 1600)
				end
				if x ~= -1 and y ~=-1 then
					return click(x , y , 200)
				end
			end
		elseif g_juqing == 2 then
			if g_jq_54 == 1 then
				x,y = findMultiColorInRegionFuzzy( 0xad6d39, "-4|-37|0xf7799c,-17|-77|0xa5f7ef,9|-90|0xde5d84,36|-93|0xa5c7d6,34|-119|0x31344a,0|-128|0x293431,-36|-103|0xc65d6b", 90, 495, 140, 705, 1800)		
				if x ~= -1 and y ~=-1 then
					return click(x , y , 200)
				end	
			end
		elseif g_juqing == 3 then
			if g_jq_42 == 1 then
				x,y = findMultiColorInRegionFuzzy( 0xb57139, "-59|92|0x52a2c6,-42|92|0x529abd,-34|103|0x4a9ac6,31|100|0x529ac6,55|90|0x428eb5", 95, 767, 140, 927, 1800)
				if x ~= -1 and y ~=-1 then
					return click(x, y, 200)
				end	
			end
		elseif g_juqing == 4 then
			if g_jq_39 == 1 then
				x,y = findMultiColorInRegionFuzzy( 0xbd8239, "-3|-23|0xa5bec6,-13|89|0x4a9ec6,-73|-26|0x398ab5,52|-34|0x429ece,-17|-78|0x18416b,-2|-58|0x08416b,45|-112|0x4aa2ce,-53|-108|0x4aa2ce", 90, 770, 140, 980, 1800)
				if x ~= -1 and y ~=-1 then
					return click(x , y  , 200)
				end		
			end
		elseif g_juqing == 5 then
			if g_jq_36 == 1 then
				x,y = findMultiColorInRegionFuzzy( 0xad7142, "0|-25|0xe7f3ff,-40|-81|0xad3429,-14|-81|0xefdbce,20|-89|0xa5aaad,8|-123|0xff8294,55|-107|0xb5aa29,54|-133|0xada621", 90, 495, 140, 705, 1800)
				if x ~= -1 and y ~=-1 then
					return click(x , y , 200)
				end	
			end
		elseif g_juqing == 6 then
			if g_jq_33 == 1 then
				x,y = findMultiColorInRegionFuzzy( 0xbd8239, "-47|-34|0x5aaece,43|-32|0x428ab5,-3|-58|0x103863,-54|-105|0x52a2c6,48|-107|0x18517b,-3|-58|0x103863", 90, 485, 140, 670, 1800)
				if x ~= -1 and y ~=-1 then
					return click(x, y, 200)
				end		
			end
		elseif g_juqing == 7 then
			if g_jq_63 == 1 then
				x,y = findMultiColorInRegionFuzzy( 0xb57542, "42|-46|0x735121,14|-51|0x8c8239,-16|-49|0x5affd6,-36|-74|0x39fbbd,-20|-96|0xced3a5,21|-140|0xe7e7c6,47|-120|0x185d63,36|-80|0x6bcfad", 90, 310, 140, 470, 1800)
				if x ~= -1 and y ~=-1 then
					return click(x , y , 200)
				end		
			end			
		end	

--		keepScreen(true)
		x,y = findMultiColorInRegionFuzzy( 0xe7ae10, "-1|3|0x842418,18|0|0xffc310,19|3|0x942810", 90, 520, 1510, 550, 1520)
--		keepScreen(false)
		if x ~= -1 and y ~=-1 then  --找到第一关的图标了
			--wLog("test","switch20,到底部了".."   ");
--			dialog("到底了", 2)
			i_boom = 1
			g_juqing_cs = 0  --重置当前关卡次数，0代表还有次数可刷，直接影响合体界面点击位置
		else
			touchDown(4,1350, 930)  --按下动作
			mSleep(50)
			for i=0, 500, 125 do                          
				touchMove(4, 1350, 930 - i)       --滑动过程
				mSleep(30)
			end
			touchMove(4, 1350, 930 - 500 -1)
			mSleep(30)
			touchUp(4,1350, 930 - 500 - 1)                  --弹起动作
			mSleep(100)
			--wLog("test","switch20,向下滑动找底部".."   ");
		end
	end  --while
	mSleep(500)
	--
--	dialog(g_juqing.."  "..g_juqing_cs.." "..g_jq_45, 2)
	--wLog("test","switch20,到底部了".."  开始找关卡 g_juqing="..g_juqing);
	if g_juqing == 1 then
		if g_jq_45 == 1 then
			return hd45();  --调用事先录制好的滑动过程，去点击45关
		else
			g_juqing = g_juqing + 1
			g_juqing_cs = 0	
			g_jq_fail = 0
		end
	elseif g_juqing == 2 then
		if g_jq_54 == 1 then
			return hd54move()
		else
			g_juqing = g_juqing + 1
			g_juqing_cs = 0	
			g_jq_fail = 0
		end
	elseif g_juqing == 3 then
		if g_jq_42 == 1 then
			return hd42()
		else
			g_juqing = g_juqing + 1
			g_juqing_cs = 0	
			g_jq_fail = 0
		end
	elseif g_juqing == 4 then
		if g_jq_39 == 1 then
			return hd30()
		else
			g_juqing = g_juqing + 1
			g_juqing_cs = 0	
			g_jq_fail = 0
		end
	elseif g_juqing == 5 then
		if g_jq_36 == 1 then
			return hd36()
		else
			g_juqing = g_juqing + 1
			g_juqing_cs = 0	
			g_jq_fail = 0
		end
	elseif g_juqing == 6 then
		if g_jq_33 == 1 then
			return hd33()
		else
			g_juqing = g_juqing + 1
			g_juqing_cs = 0		
			g_jq_fail = 0
		end
	elseif g_juqing == 7 then
		if g_jq_63 == 1 then
			return hd63()
		else
			g_juqing = g_juqing + 1
			g_juqing_cs = 0		
			g_jq_fail = 0
		end
	elseif g_juqing > 7 then
		if gi_tili == 0 then
			click(220, 1900, 200)
			local rtn,i = pdjm(), 0;
			while rtn ~= 1 do
				if rtn == 7 then
					click(780, 1722, 200)
				else
					click(210, 1900, 200)
				end
				
				mSleep(1000)
				rtn = pdjm();
				i = i + 1
				if i > 30 then
					dialog("剧情关刷完，转到刷积分失败。", 3)
					lockDevice();
					lua_exit()
				end
			end					
			gi_choice = gi_choice_temp
		else
			dialog("剧情关已经刷完, 脚本自动停止。", 3)
			lockDevice();
			lua_exit()
		end
	end
end


function switch20_boss() ----20，剧情模式界面
	local i_boom,x,y,rtn,i = 0,0,0,0,0
	local x,y
--	wLog("test","sw20-boss: 开始。g_juqing = "..g_juqing);
--	dialog("gi_guqing: "..g_juqing, 2)
	if g_juqing_cs == 1 then   --每刷完一关，回到主界面，看看有没有日常任务可以领取
		return click(220,1900,200)
	end 
	
	if g_juqing > 8  then
		if gi_tili == 0 then
			dialog("剧情关已经刷完, 自动转入刷积分模式。", 3)
			click(220, 1900, 200)
			rtn= pdjm();
			while rtn ~= 1 do  --回到主界面
				click(210, 1900, 200)
				mSleep(1000)
				rtn = pdjm();
				i = i + 1
				if i > 30 then
					dialog("剧情关已经刷完, 转到刷积分失败。。", 3)
					lockDevice();
					lua_exit()
				end
			end					
			gi_choice = gi_choice_temp
			--wLog("test","sw20-boss: 结束。");
			return
		else
			--wLog("test","sw20-boss: g_juqing = : "..g_juqing);
			dialog("剧情关已经刷完, 脚本自动停止。", 3)
			lockDevice();
			lua_exit()
		end
	end
		
	keepScreen(true)
	x,y = findMultiColorInRegionFuzzy( 0xe7ae10, "-1|3|0x842418,18|0|0xffc310,19|3|0x942810", 90, 520, 1510, 550, 1520)
	keepScreen(false)
	if x ~= -1 and y ~=-1 then  --找到第一关的图标了
		i_boom = 1
	else
		i_boom = 0
	end
	
--[[	--找找当前画面有没有可以进入的
	rtn,x,y = jqgk_find()
	if rtn == 1 then
		return click(x,y,200)
	end
]]
	while i_boom == 0 do
		keepScreen(true)
		x,y = findMultiColorInRegionFuzzy( 0xe7ae10, "-1|3|0x842418,18|0|0xffc310,19|3|0x942810", 90, 520, 1510, 550, 1520)
		keepScreen(false)
		if x ~= -1 and y ~=-1 then  --找到第一关的图标了
			----wLog("test","switch20,到底部了".."   ");
--			dialog("到底了", 2)
			i_boom = 1
			g_juqing_cs = 0  --重置当前关卡次数，0代表还有次数可刷，直接影响合体界面点击位置
		else
			touchDown(4,1350, 930)  --按下动作
			mSleep(50)
			for i=0, 600, 300 do                          
				touchMove(4, 1350, 930 - i)       --滑动过程
				mSleep(50)
			end
			touchMove(4, 1350, 930 - 600 -1)
			mSleep(50)
			touchUp(4,1350, 930 - 600 - 1)                  --弹起动作
			mSleep(100)
			--wLog("test","switch20,向下滑动找底部".."   ");
		end
		mSleep(200)
	end  --while
	mSleep(500)
	
	--
--	dialog(g_juqing.."  "..g_juqing_cs.." "..g_jq_45, 2)
	----wLog("test","switch20,到底部了".."  开始找关卡 g_juqing="..g_juqing);
	jq_move()
	--wLog("test","sw20-boss: 自然结束。");
end

function switch21()  -- 21, 剧情模式45关弹出选择普通还是英雄主界面
	
	if gi_jq_boss == 1 then
		return switch21_boss()
	end
	
	local x,y = 0,0
	--先判断普通模式

	if g_juqing > 7 then
			dialog("剧情关已经刷完, 脚本自动停止。", 3)
			lockDevice();
			lua_exit()
	end
--	dialog("g_juqing= "..g_juqing, 3)
	keepScreen(false)

	if g_juqing == 1 or g_juqing == 2 or g_juqing == 5 or g_juqing == 7 then
		x,y = findMultiColorInRegionFuzzy( 0xb5e3ff, "6|3|0xad3808,13|4|0xb53800,1|24|0xb54110,16|25|0xad3400,9|32|0xb53400,9|12|0xbde3f7,9|27|0xb5d3e7", 90, 1111, 1028, 1140, 1066) 
	elseif g_juqing == 3 or g_juqing == 4 or g_juqing == 6 then 
		x,y = findMultiColorInRegionFuzzy( 0xad4118, "7|0|0xad4521,-5|11|0xb53400,12|14|0xad4110,-2|28|0xad3808,6|30|0xad3c08,3|4|0x8cd3ff,5|26|0x8ccff7", 90, 1112, 776, 1143, 815)
	end
	
	if x ~= -1 and y ~=-1 then
		if g_juqing == 1 or g_juqing == 2 or g_juqing == 5 or g_juqing == 7 then
--			dialog("点击英雄模式，g_juqing="..g_juqing,2)
			click(1140, 850, 500)  --转到英雄模式，等待下一次界面判断之后调用本过程
			mSleep(1000)			
			x,y = findMultiColorInRegionFuzzy( 0xb5e3ff, "6|3|0xad3808,13|4|0xb53800,1|24|0xb54110,16|25|0xad3400,9|32|0xb53400,9|12|0xbde3f7,9|27|0xb5d3e7", 90, 1111, 1028, 1140, 1066) 
		elseif g_juqing == 3 or g_juqing == 4 or g_juqing == 6 then
			click(1120, 540, 500)  --转到英雄模式，等待下一次界面判断之后调用本过程
			mSleep(1000)		
			x,y = findMultiColorInRegionFuzzy( 0xad4118, "7|0|0xad4521,-5|11|0xb53400,12|14|0xad4110,-2|28|0xad3808,6|30|0xad3c08,3|4|0x8cd3ff,5|26|0x8ccff7", 90, 1112, 776, 1143, 815)
			
		end
		if x ~= -1 and y ~=-1 then
			--到这里说明本关次数全用完了
			if g_juqing == 1 or g_juqing == 2 or g_juqing == 5 or g_juqing == 7 then  --点击关闭
				mSleep(500)
				click(440, 1700, 200)
			elseif g_juqing == 3 or g_juqing == 4 or g_juqing == 6 then
				mSleep(500)
				click(440, 1500, 200)
			end
			g_juqing_cs = 1   --当前关卡次数全部用完
			g_juqing = g_juqing + 1
			g_jq_fail = 0
		end
	else
--		dialog("g_juqing= ".. g_juqing.." x= "..x.." y="..y, 3)
		keepScreen(false)
		if g_juqing == 1 or g_juqing == 2  or g_juqing == 5 or g_juqing == 7 then  --点击开始战斗
			click(1200, 1700, 200)
		elseif g_juqing == 3 or g_juqing == 4 or g_juqing == 6 then
			click(1200, 1520, 200)
		end
		mSleep(1000)
	end
	g_fun_running_21 = 0
	mSleep(500)
end

function switch21_boss()  -- 21, 剧情模式45关弹出选择普通还是英雄主界面
	local x,y = 0,0
	--先判断普通模式
	local jq_k, jq_k1 = IsInTable(gi_jq_x,jq_point)
	
	--找次数的红色数字0
	x,y = findMultiColorInRegionFuzzy( 0xb5e3ff, "6|3|0xad3808,13|4|0xb53800,1|24|0xb54110,16|25|0xad3400,9|32|0xb53400,9|12|0xbde3f7,9|27|0xb5d3e7", 90, 1111, 1028, 1140, 1066) 
	if x ~= -1 and y ~=-1 then
		click(1140, 850, 500)  --转英雄模式
		mSleep(1000)
		x,y = findMultiColorInRegionFuzzy( 0xb5e3ff, "6|3|0xad3808,13|4|0xb53800,1|24|0xb54110,16|25|0xad3400,9|32|0xb53400,9|12|0xbde3f7,9|27|0xb5d3e7", 90, 1111, 1028, 1140, 1066) 
	end
	if x ~= -1 and y ~=-1 then
		--到这里说明本关次数全用完了
		--wLog("test","sw21-boss: gi_jq_x, jq_k, jq_k1 ="..gi_jq_x..", "..jq_k..", "..jq_k1);   
		if jq_k ~= nil and jq_k > 0 then
			jq_point[jq_k+1] = 4
			g_juqing = g_juqing + 1
			--wLog("test","sw21-boss当前关卡次数用完,g_juqing +1 : jq_point[jq_k], jq_k, jq_k1, g_juqing ="..jq_point[jq_k]..", "..jq_k..", "..jq_k1..", "..g_juqing);
		end
		mSleep(500)
		click(440, 1700, 200)
	else
		if jq_k ~= nil and jq_k > 0 then
			jq_point[jq_k+1] = jq_point[jq_k+1] + 1
		end
		click(1200, 1700, 200)
		--click(440, 1700, 200)   --测试用，直接返回，不点开始
		mSleep(1000)
	end

end

function switch25()  --刷剧情提示次数用完，直接点确定
	g_juqing_cs = 1  --正常情况下，不会到这里，能到这里说明前面取色判断次数没有成功，这里只是容错处理：当前关卡用完了而已，这个好像不用要啊
	click(770, 1250, 200)
end

function switch22()  --剧情战斗胜利第一帧，直接点击返回
	
	click( 200, 1920, 200) 
	g_fighting = 0;
	g_jq_fail = 0
	mSleep(500)
end

function switch26()  --俩按钮
--	if g_fighting == 1 then
		click(780, 730, 200)
--	end
end

function switch27()
	if g_fighting == 1 then
		click(1080, 1250, 200)
	else
		click(470, 1250, 200)
	end
	
end

function switch28()
--	if g_fighting == 1 then
		--click(777, 930, 200)
		--click(760,720,200) 
		click(770, 920, 200)
--	end
	
end

function switch30()
	if gi_swjl == 0 then
		click(770,670,200)
		g_fun_running_13 = 0
		mysleep(2)  --死亡接力之后，休眠2秒，直接放技能，因为没机会再判断掉血放技能了
		click(190, 1880, 200)
	end
end

function switch36()
	click(770,1250,200) --点掉提示PK未结算的提示
	mSleep(30000)
	click(470, 1910, 100)  --休眠30秒之后，直接点回到主界面
end

function switch37()
	mSleep(1000)
	keepScreen(true)
	x,y = findMultiColorInRegionFuzzy( 0xffffff, "-35|-1|0xfffff7,32|1|0xffffff,-68|-6|0xffffff,-64|32|0xffffff,61|33|0xffffff,74|-3|0xffffff,-37|32|0xffffff,36|31|0xffffff,0|52|0xffffff",90, 90, 170, 1500, 1760)
	keepScreen(false)
	if x~= -1 then
		return click(x,y,200)
	end
	--远征领盒子
	local i = 0
	for i = 1,3,1 do
		keepScreen(true)
		x,y = findMultiColorInRegionFuzzy( 0x8c75ad, "7|-81|0x3196ef,-22|-80|0x73f3ff,-78|40|0x9c7d9c,75|71|0x948a84,1|58|0x4a49bd,-19|51|0x7bb6ff",50, 90, 170, 1500, 1760)
		keepScreen(false)
		if x~= -1 and y ~= -1 then
			return click(x,y,200)
		end	
	end	
end

function switch38()
	click(1170, 1920, 200)
end

function switch39()
	click(420, 1800, 200)
end
function switch40()
	click(220, 1900, 200)
end
function switch41()
	click(220, 1900, 200)
end
function hd45()
	local i_find,loop = 0,0
	local x,y
	--wLog("test","fd45,开始");
	while i_find == 0 do
		touchDown(4,1350, 430)  --按下动作
		mSleep(200)
		for i=0,500,125 do  
			touchMove(4, 1350, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,1350, 430 + 500 +1)
		mSleep(20)
		touchUp(4,1350, 430+500+1)                  --弹起动作
		mSleep(200)
		x,y = findMultiColorInRegionFuzzy( 0xc68239, "6|-116|0x422c18,12|-108|0x5a3c21,-29|-150|0x423429,32|-72|0xffd74a,-38|-65|0xd67d39,-10|-45|0xde6d29", 85, 880, 140, 1050, 1800)
		if x == -1 then  --针对ios9
--			wLog("test","fd45,ios8没找到，找ios9的图...");
			x,y = findMultiColorInRegionFuzzy( 0xd69631, "-59|-65|0xffcf4a,47|-69|0xffd74a,-1|-113|0x422010,17|-130|0xdecba5,-9|-61|0xd66d21,-49|-148|0xb56129,41|-147|0xb55d29",85, 885, 240, 1044, 1600)
		end
--		dialog(x.."  "..y, 3)
		--wLog("test","fd45,".."  x,y="..x.." , "..y);
		if x ~= -1 and y ~=-1 then
--			dialog("找到了 "..x.."  "..y, 3)
			i_find = 1
			click(x , y , 200)
			mSleep(500)
		end	
		loop = loop + 1
		if loop > 40 then 
			i_find = 1
			g_juqing = g_juqing + 1
			g_juqing_cs = 0
		end
	end	
	--wLog("test","fd45,结束 g_juqing= "..g_juqing);
end

function hd54move()
	local i_find,loop = 0,0
	local x,y
	while i_find == 0 do
		touchDown(4,1350, 430)  --按下动作
		mSleep(200)
		for i=0,500,125 do  
			touchMove(4, 1350, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,1350, 430 + 500 +1)
		mSleep(20)
		touchUp(4,1350, 430+500+1)                  --弹起动作
		mSleep(200)
		--x,y = findMultiColorInRegionFuzzy( 0x080810, "42|37|0x394142,53|23|0xadb2b5,39|50|0xff6994,49|80|0xef827b,20|97|0xf77d94,-23|72|0x7b2c52", 90, 495, 140, 705, 1800)
		x,y = findMultiColorInRegionFuzzy( 0xad6d39, "-4|-37|0xf7799c,-17|-77|0xa5f7ef,9|-90|0xde5d84,36|-93|0xa5c7d6,34|-119|0x31344a,0|-128|0x293431,-36|-103|0xc65d6b", 90, 495, 140, 705, 1800)		
--		dialog(x.."  "..y, 3)
		if x ~= -1 and y ~=-1 then
--			dialog("找到了 "..x.."  "..y, 3)
			i_find = 1
			click(x , y , 200)
			mSleep(500)
		end	
		loop = loop + 1
		if loop > 40 then 
			i_find = 1
			g_juqing = g_juqing + 1
			g_juqing_cs = 0
		end
	end
end

function hd42()
	local i_find,loop = 0,0
	local x,y
	while i_find == 0 do
		touchDown(4,1350, 430)  --按下动作
		mSleep(200)
		for i=0,500,125 do  
			touchMove(4, 1350, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,1350, 430 + 500 +1)
		mSleep(20)
		touchUp(4,1350, 430+500+1)                  --弹起动作
		mSleep(200)
		keepScreen(true)
		--42关
		x,y = findMultiColorInRegionFuzzy( 0xb57139, "-59|92|0x52a2c6,-42|92|0x529abd,-34|103|0x4a9ac6,31|100|0x529ac6,55|90|0x428eb5", 90, 767, 140, 927, 1800)
		keepScreen(false)
--		dialog(x.."  "..y, 3)
		if x ~= -1 and y ~=-1 then
--			dialog("找到了 "..x.."  "..y, 3)
			i_find = 1
			click(x, y, 200)
			mSleep(500)
		end	
		loop = loop + 1
		if loop > 45 then 
			i_find = 1
			g_juqing = g_juqing + 1
			g_juqing_cs = 0
		end
	end	
end

function hd30()  --刷30关
	local i_find,loop = 0,0
	local x,y
	while i_find == 0 do
		touchDown(4,1350, 430)  --按下动作
		mSleep(200)
		for i=0,500,125 do  
			touchMove(4, 1350, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,1350, 430 + 500 +1)
		mSleep(20)
		touchUp(4,1350, 430+500+1)                  --弹起动作
		mSleep(200)
		keepScreen(true)
		--31关
		x,y = findMultiColorInRegionFuzzy( 0xbd8239, "-3|-23|0xa5bec6,-13|89|0x4a9ec6,-73|-26|0x398ab5,52|-34|0x429ece,-17|-78|0x18416b,-2|-58|0x08416b,45|-112|0x4aa2ce,-53|-108|0x4aa2ce", 90, 770, 140, 980, 1800)
		keepScreen(false)
--		dialog(x.."  "..y, 3)
		if x ~= -1 and y ~=-1 then
--			dialog("找到了 "..x.."  "..y, 3)
			i_find = 1
			click(x, y, 200)
			mSleep(500)
		end	
		loop = loop + 1
		if loop > 50 then 
			i_find = 1
			g_juqing = g_juqing + 1
			g_juqing_cs = 0
		end
	end
end


function hd36()
	local i_find,loop = 0,0
	local x,y
	while i_find == 0 do
		touchDown(4,1350, 430)  --按下动作
		mSleep(200)
		for i=0,500,125 do  
			touchMove(4, 1350, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,1350, 430 + 500 +1)
		mSleep(20)
		touchUp(4,1350, 430+500+1)                  --弹起动作
		mSleep(200)
		keepScreen(true)
		--36关
		x,y = findMultiColorInRegionFuzzy( 0xad7142, "0|-25|0xe7f3ff,-40|-81|0xad3429,-14|-81|0xefdbce,20|-89|0xa5aaad,8|-123|0xff8294,55|-107|0xb5aa29,54|-133|0xada621", 85, 495, 140, 705, 1800)
		keepScreen(false)
--		dialog(x.."  "..y, 3)
		if x ~= -1 and y ~=-1 then
--			dialog("找到了 "..x.."  "..y, 3)
			i_find = 1
			click(x , y , 200)
			mSleep(500)
		end	
		loop = loop + 1
		if loop > 50 then 
			i_find = 1
			g_juqing = g_juqing + 1
			g_juqing_cs = 0
		end
	end
end

function hd33()
	local i_find,loop = 0,0
	local x,y
	while i_find == 0 do
		touchDown(4,1350, 430)  --按下动作
		mSleep(200)
		for i=0,500,125 do  
			touchMove(4, 1350, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,1350, 430 + 500 +1)
		mSleep(20)
		touchUp(4,1350, 430+500+1)                  --弹起动作
		mSleep(200)
		keepScreen(true)
		--找34关图标，点击第33关图标
		x,y = findMultiColorInRegionFuzzy( 0xbd8239, "-47|-34|0x5aaece,43|-32|0x428ab5,-3|-58|0x103863,-54|-105|0x52a2c6,48|-107|0x18517b,-3|-58|0x103863", 90, 485, 140, 670, 1800)
		keepScreen(false)
--		dialog(x.."  "..y, 3)
		if x ~= -1 and y ~=-1 then
--			dialog("找到了 "..x.."  "..y, 3)
			i_find = 1
			click(x, y, 200)
			mSleep(500)
		end	
		loop = loop + 1
		if loop > 50 then 
			i_find = 1
			g_juqing = g_juqing + 1
			g_juqing_cs = 0
		end
	end	
end

function hd63()
		local i_find,loop = 0,0
	local x,y
	while i_find == 0 do
		touchDown(4,1350, 430)  --按下动作
		mSleep(200)
		for i=0,500,125 do  
			touchMove(4, 1350, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,1350, 430 + 500 +1)
		mSleep(20)
		touchUp(4,1350, 430+500+1)                  --弹起动作
		mSleep(200)
		keepScreen(true)
		--找34关图标，点击第33关图标
		x,y = findMultiColorInRegionFuzzy( 0xb57542, "42|-46|0x735121,14|-51|0x8c8239,-16|-49|0x5affd6,-36|-74|0x39fbbd,-20|-96|0xced3a5,21|-140|0xe7e7c6,47|-120|0x185d63,36|-80|0x6bcfad", 90, 310, 140, 470, 1800)
--		x,y = findMultiColorInRegionFuzzy( 0xbd7d39, "-68|-60|0x5a1c18,-67|-56|0xf7b610,-60|-91|0xdeba5a,48|-31|0xefb610,63|-60|0xf7b610,53|-40|0x9c2c10", 85, 600, 140, 790, 1800)
		keepScreen(false)
--		dialog(x.."  "..y, 3)
		if x ~= -1 and y ~=-1 then
--			dialog("找到了 "..x.."  "..y, 3)
			i_find = 1
			click(x , y , 200)
			mSleep(500)
		end	
		loop = loop + 1
		if loop > 50 then 
			i_find = 1
			g_juqing = g_juqing + 1
			g_juqing_cs = 0
		end
	end	
end

function jq_move()
	local i_find,loop = 0,0
--	local x,y,x72,y72,jq_k,jq_k1
	local rtn,x,y
	
	while i_find == 0 do
		touchDown(4,1350, 430)  --按下动作
		mSleep(50)
		for i=0,600,300 do  
			touchMove(4, 1350, 430 + i)       --滑动过程
			mSleep(50)
		end
        touchMove(4,1350, 430 + 600 +1)
		mSleep(50)
		touchUp(4,1350, 430+600+1)                  --弹起动作
		mSleep(100)
		
		rtn,x,y = jqgk_find()
		if rtn == 1 then
			return click(x,y,200)
		end

		loop = loop + 1
		if loop > 80 then return end
	end	
end


function IsInTable(value, tbl)
	local k,v ;
	--wLog("test","IsInTable: 开始查找  "..value..","..#tbl); 
	for k,v in ipairs(tbl) do 
		--wLog("test","IsInTable: v,balue,k="..v.."  "..value.."  "..k); 
		if v == value then
			--wLog("test","IsInTable: 找到相同记录 k = "..k);   
			return k,0;
		end
	end
	
	return 0,#tbl;
end

function jqgk_find()
	local x,y, x72,y72,jq_k,jq_k1
	keepScreen(true)
	--先判断72关
	x72,y72 = findMultiColorInRegionFuzzy( 0xb57139, "-41|-157|0xffffff,65|-75|0xc6d7de,-74|-71|0xbddbe7,-8|-25|0xe7f7ff,-46|-186|0x103c63,-78|-168|0x083863,120|62|0x214973,89|79|0x214973,-46|-68|0xffef73",90, 160, 150, 1370, 1470)
	x,y = findMultiColorInRegionFuzzy( 0xb57139, "-82|3|0xe7f7ff,83|4|0xe7f7ff,3|-23|0xe7f7f7,-70|-66|0xc6dbe7,-69|-124|0xeffbff,69|-69|0xc6dbde,69|-119|0xeffbff,-32|-159|0xffffff,36|-159|0xffffff",90, 160, 150, 1370, 1470)
	keepScreen(false)
	if x ~= -1 and y ~=-1 then
		--wLog("test","find开始查找: x = "..x);
		jq_k, jq_k1 = IsInTable(x,jq_point)
		--wLog("test","查找函数结果: x,y,jq_k,jq_k1="..x..", "..y..", "..jq_k..", "..jq_k1);
		if jq_k == 0 then  --  0 不在表里面, > 0在表里面
			jq_point[jq_k1+1] = x
			jq_point[jq_k1+2] = 0   --在sw21-boss函数中，如果点了开始游侠， + 1
			--wLog("test","查找结果未找到，表不为空: jq_point.y = "..jq_point[jq_k1+ 2]);
			gi_jq_x = x
			g_juqing_cs = 0  --当前关卡可刷次数还有 , 用来做没刷完一个关卡，回主界面手任务的控制判断
			return 1,x,y;
		else
			--wLog("test","查找函数结果: 当jq_k > 0的时候  jq_point[jq_k + 1]="..jq_point[jq_k + 1]);
			if jq_point[jq_k +1] < 4 then
				--jq_point[jq_k+1] = jq_point[jq_k +1] + 1   --这个放在点开始之后+1，sw21-boss函数中
				--wLog("test","k>0 点击: "..jq_point[jq_k]..", "..jq_point[jq_k+1]);
				gi_jq_x = x
				return 1,x,y;
			else
				--wLog("test","k1=1, jq_k,jq_k1 x72 = : "..jq_k..", "..jq_point[jq_k]..", "..jq_point[jq_k +1]..", "..x72);
				g_juqing_cs = 1  --当前关卡可刷次数没有了 , 用来做没刷完一个关卡，回主界面手任务的控制判断
				if x72 ~= -1 then
					g_juqing = 9  -- 大于7就可以，在switch20-boss里面判断这个，以退出剧情模式
					--wLog("test","jq_move: g_juqing = 8  x72 = : "..x72);
				else
					--g_juqing = g_juqing + 1
					--wLog("test", "jqgk_find:g_juqing = "..g_juqing)
				end
				--wLog("test","jq_move: g_juqing, x72 = : "..g_juqing..", "..x72);
			end	
		end
	end	
	return 0,x,y;
end



