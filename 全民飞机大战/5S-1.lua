function click(x1, y1,t)--点击函数
	touchDown(0, x1, y1)
	mSleep(100)
	touchUp(0, x1, y1)
	mSleep(t)
end

function beforeUserExit()
    --setScreenResolution("default")
	closeLog("test");
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
	 local jm = 0
	 local x,y 
	-- 优先找进入战斗界面
	resetIDLETimer();
--	os.execute("su mobile -c uicache");
	--keepScreen(true);
	

	--1、主界面
	--wLog("test","5s-pdjm：开始找主界面");
	x,y = findMultiColorInRegionFuzzy( 0x00a6ef, "39|0|0x00a2ef,-5|39|0x00aaf7,45|39|0x00a6f7,16|1|0xeff7ff,-3|29|0xf7fbff,36|29|0xffffff,12|4|0x73cbf7,37|28|0x8cc7ef,-2|31|0x84bede",90, 27, 955, 96, 1019)
	--wLog("test","5s-pdjm：开始找主界面  "..x.."  "..y);
	
	if x ~= -1 and y ~=-1 then
		jm = 1 
		keepScreen(false);
		return jm
	end
	
	--2、模式选择界面(选择经典，远征还是pk)
	x,y = findMultiColorInRegionFuzzy( 0xce4dce, "6|-13|0x6300c6,3|14|0x6300c6,18|-16|0xa555ff,12|11|0xa555ff,25|-16|0x8c34e7,19|12|0x8430e7",90, 111, 290, 176, 337)
	if x ~= -1 and y ~=-1 then
		x,y = findMultiColorInRegionFuzzy( 0xf7c321, "8|-12|0xc65900,5|14|0xce5900,23|-14|0xef8e42,16|11|0xff964a,37|-14|0xce5900,34|7|0xce5900,45|-2|0xce5900,56|-2|0xc65900",90, 114, 462, 195, 510)
		if x ~= -1 and y ~=-1 then
			jm = 2 
			keepScreen(false);
			return jm
		end
	end	

	--3、判断pk界面(选择世界，个人，还是积分)
	x,y = findMultiColorInRegionFuzzy( 0xf7e76b, "10|-9|0xce5900,5|15|0xc65900,22|-9|0xff9a4a,18|8|0xf79a52,36|-11|0xce5900,32|6|0xc65d08,43|-2|0xce5900,49|-2|0xc65900",90, 188, 362, 263, 406)
	if x ~= -1 and y ~=-1 then
		x,y = findMultiColorInRegionFuzzy( 0xe775ce, "13|-6|0x5a00c6,8|15|0x5a00ce,23|-9|0xa551ff,19|11|0xa54dff,31|-9|0x7b28de,28|10|0x7b20d6,33|0|0x6b10ce,36|0|0x6304c6",90, 186, 603, 243, 646)
		if x ~= -1 and y ~=-1 then
			jm = 3 
			keepScreen(false);
			return jm
		end
	end	
	
	--4, pk选择界面（世界对战，好友对战，积分兑换）
--[[	
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
]]	
	--5,合体界面
--[[	
	local recognize = ocrText(519, 180, 1027, 279, 1);
	mSleep(100);
	--dialog("识别出的字符  1："..recognize, 1)
	if string.find(recognize, "选择好友合体") ~= nil then
		--dialog("识别出的字符  1："..recognize, 1)
		jm = 5
		keepScreen(false);
		return jm
	end
]]

--5,合体界面
	x,y = findMultiColorInRegionFuzzy( 0x5a595a, "53|28|0x5a5963,85|0|0x5a5963,133|27|0x5a555a,142|10|0x5a595a,170|9|0x525963,177|12|0x5a5963,196|28|0x5a595a,16|12|0xcec7d6,192|18|0xcecbde",90, 208, 175, 438, 215)
	if x ~= -1 and y ~=-1 then
		jm = 5
		keepScreen(false);
		return jm
	end
	
	--6,买天神祝福界面  --取点位置为最先面三个按钮
	x,y = findMultiColorInRegionFuzzy( 0xe7f7ff, "-17|14|0xe7f7ff,4|29|0x008ede,6|28|0x0092e7,112|-4|0xffffff,123|27|0x008ee7,145|12|0xd6efff,321|18|0xff9e00,498|4|0xf7efde,525|25|0xff9a08",90, 25, 946, 616, 1028)
	if x ~= -1 and y ~=-1 then
		jm = 6
		keepScreen(false);
		return jm
	end
	
	--7，恭喜你界面
	--x,y = findMultiColorInRegionFuzzy( 0xffe75a, "7|5|0xb54100,7|11|0xb54100,3|11|0xb54100,-2|10|0xffe752", 90, 516, 151, 547, 178)
	x,y = findMultiColorInRegionFuzzy( 0xffcb4a, "2|20|0xff9600,14|-8|0xffffff,40|24|0xffffff,52|-5|0xffffff,65|-6|0xf7ffff,70|-7|0xffcf4a,93|-4|0xffffff,101|26|0xf7ffff,121|13|0xff9e00",90, 228, 862, 421, 923)
	if x ~= -1 and y ~=-1 then
		jm = 7
		keepScreen(false);
		return jm
	end
	x,y = findMultiColorInRegionFuzzy( 0xffd352, "42|57|0xffffff,77|5|0xffffff,129|-4|0xffffff,96|65|0xf7ffff,162|67|0xf7ffff,183|0|0xffffff,214|67|0xf7ffff,230|18|0xceb263,260|47|0xff9e08",90, 567, 1655, 997, 1776)
	if x ~= -1 and y ~=-1 then
		jm = 7
		keepScreen(false);
		return jm
	end
	x,y = findMultiColorInRegionFuzzy( 0xffcf52, "8|22|0xff9608,22|-1|0xfffbf7,41|23|0xfffbf7,49|24|0xfffbf7,69|0|0xfff7ef,83|1|0xffffff,90|24|0xffffff,130|3|0xffcb42,125|19|0xff9a00",90, 237, 870, 409, 920)
	if x ~= -1 and y ~=-1 then
		jm = 7
		keepScreen(false);
		return jm
	end	
	
	--8，加油哦界面
	--x,y = findMultiColorInRegionFuzzy( 0xffb610, "5|5|0x943010,9|13|0x5a1c21,16|20|0x635184", 90, 1028, 760, 1100, 797)
	x,y = findMultiColorInRegionFuzzy( 0xffffff, "14|-2|0xffffff,-7|20|0xd6ebff,37|20|0xdeefff,14|8|0x0086bd,14|12|0xffffff,-1|39|0x0892d6,2|39|0xfffbff,14|34|0x0092ef,31|35|0x008ad6",90, 27, 950, 99, 1014)
	if x ~= -1 and y ~=-1 then
		jm = 8
		keepScreen(false);
		return jm
	end
	
	
--	if gi_choice == 1 or gi_choice == 3 then
		--9，PK胜利界面
		x,y = findMultiColorInRegionFuzzy( 0x2169b5, "43|99|0xffb608,200|57|0xffb610,304|48|0x63d3ff,397|22|0xf79a39,449|36|0x52305a,509|28|0xf76da5,412|62|0xfffbf7,466|72|0x393852,354|16|0x63baff",90, 13, 116, 579, 281)
		if x ~= -1 and y ~=-1 then
			jm = 9
			keepScreen(false);
			return jm
		end		
		--10，PK失败界面
		x,y = findMultiColorInRegionFuzzy( 0xadaead, "104|-2|0x949694,4|109|0x737173,238|67|0x63615a,252|43|0x8cb2d6,312|25|0x292842,352|-19|0xff82bd,371|11|0xe75994,441|-3|0x73cfff,446|55|0xff86bd",90, 2, 113, 601, 267)
		if x ~= -1 and y ~=-1 then
			jm = 10
			keepScreen(false);
			return jm
		end		
		--11，PK等待结算界面
		x,y = findMultiColorInRegionFuzzy( 0x21baf7, "2|44|0x00a6f7,51|29|0x0092ef,64|14|0xffffff,87|40|0xffffff,99|15|0xffffff,122|37|0xffffff,110|26|0x0092e7,163|11|0x00a6f7,174|32|0x0096ef",90, 203, 949, 444, 1016)
		if x ~= -1 and y ~=-1 then
			jm = 11
			keepScreen(false);
			return jm
		end		
				
		--12，PK选择界面(金币，钻石场选择)，对战列表
		x,y = findMultiColorInRegionFuzzy( 0x00dbff, "-6|20|0x4ad3ff,-22|45|0xffdf94,20|45|0xffdf94,80|19|0x298ad6,135|3|0x29a6e7,176|-1|0x009eff,137|33|0x4ac3ff,192|25|0x4acfff,209|9|0xffcf7b",90, 94, 260, 384, 353)
		if x ~= -1 and y ~=-1 then
			x,y = findMultiColorInRegionFuzzy( 0xdeebf7, "50|28|0xf7c310,94|48|0xbde3f7,155|14|0xfff329,170|33|0xefa210,218|39|0xffcb10,280|50|0xffdf29,317|27|0xefae21,360|25|0xffdf31,370|7|0xcee3f7",90, 38, 550, 455, 636)
			if x ~= -1 and y ~= -1 then
				jm = 12
				keepScreen(false);
				return jm
			end
		end
--	end

	--购买体力界面
	x,y = findMultiColorInRegionFuzzy( 0x94cbff, "34|-2|0xfffb73,7|21|0xffdf42,36|40|0xffae18,9|64|0xff9e10,9|70|0x844100,37|47|0x9c5100,13|43|0xb5dbff,30|26|0xa5d3ff,26|63|0xcee7ff",90, 79, 343, 136, 432)
	if x~= -1 and y ~= -1 then
		x,y = findMultiColorInRegionFuzzy( 0x189ee7, "-1|16|0x106dce,4|16|0x1055de,-6|19|0xffdb39,9|20|0xffdf4a,-10|117|0x29b6ef,2|121|0x4ad3ff,11|120|0x2959e7,-4|131|0xffdb42,6|131|0xffdf42",90, 469, 368, 534, 532)
		if x ~= -1 and y ~= -1 then
			click(60, 980, 200)
			mSleep(200)
			dialog("what are you 弄啥类？", 5)
			return 999
		end
	end
	--购买金币界面
	x,y = findMultiColorInRegionFuzzy( 0x9ccbff, "94|12|0xa5cfff,25|17|0xffeb29,49|29|0xd67118,-4|49|0xefb629,19|52|0xf7cf18,84|28|0xffd310,68|53|0xf7c718,97|48|0xf7ae21,36|58|0xc6dfef",90, 36, 238, 175, 326)
	if x~= -1 and y ~= -1 then
		x,y = findMultiColorInRegionFuzzy( 0x219ade, "1|8|0x4adbff,5|15|0x1851d6,-7|20|0xffdf42,10|20|0xffdf4a,0|111|0x219ee7,1|122|0x42d3ff,-2|127|0x0871d6,-9|130|0xffdf39,12|130|0xffdf42",90, 477, 273, 524, 427)
		if x ~= -1 and y ~= -1 then
			click(60, 980, 200)
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
	
	-- 死亡接力
	x,y = findMultiColorInRegionFuzzy( 0xff75a5, "-20|31|0xff82ad,21|37|0xff7da5,0|8|0xffffff,-20|63|0xffef08,21|67|0xfff318,-31|27|0x18bef7,-29|58|0x18baef,31|57|0x18b6ef,35|28|0x18bef7",90, 279, 343, 368, 439)
	if x ~= -1 and y ~=-1 then
		jm = 30 
		keepScreen(false);
		return jm
	end		
	

    --13，战斗中
	--x,y = findMultiColorInRegionFuzzy( 0xffffff, "-7|37|0xfff3c6,11|24|0xf7f7e7,28|24|0xfff3e7,29|2|0xf7ffff,11|7|0xde4d00,19|7|0xde4d00,8|17|0xde5100,18|17|0xde5910,5|23|0xffdfb5", 90, 154, 34, 208, 96)
	x,y = findMultiColorInRegionFuzzy( 0xffffff, "2|19|0xfff3bd,8|10|0xf7f7e7,20|0|0xffffff,17|19|0xfff3c6,26|19|0xfff3bd,39|0|0xffffff,41|6|0xf7f7f7,29|9|0xde5100,35|4|0xde4d00",90, 7, 104, 58, 134)
	if x ~= -1 and y ~=-1 then
		--dialog("战斗中", 1)
		jm = 13
		keepScreen(false);
		return jm
	end	


	--14, 领任务界面,,进行界面判断时候，先判断任务界面  
	
	if g_auto_lrw == 0 then
		x,y = findMultiColorInRegionFuzzy( 0xefe3c6, "16|6|0xff6910,0|52|0xefe3c6,19|45|0xff8618,2|23|0xfffbf7,41|33|0xffffff,49|34|0xf7ffff,62|19|0xffffff,82|17|0xfff7ef,75|5|0xde4d00",90, 520, 256, 614, 315)
		if x ~= -1 and y ~=-1 then
			jm = 14
			keepScreen(false);
			return jm
		end	
		x,y = findMultiColorInRegionFuzzy( 0xcecbde, "47|34|0xc6c3d6,57|1|0x525963,106|29|0x5a555a,54|29|0x5a555a,76|2|0x5a595a,95|1|0x525963,90|9|0x5a555a,158|5|0xc6c3d6,153|28|0xcec7d6", 100, 205, 167, 438, 217)
		if x ~= -1 and y ~=-1 then
			jm = 14
			keepScreen(false);
			return jm
		end	
		x,y = findMultiColorInRegionFuzzy( 0xf2e5c3, "39|-4|0xf2e5c3,67|-6|0xffebbc,68|9|0xfdebb9,69|31|0x3f8ec6,69|47|0x3a86d1,68|54|0xf4edb9,3|54|0xf2e5c3,39|51|0xf2e5c3,32|23|0xf2e5c3",90, 521, 235, 621, 331)
		if x ~= -1 and y ~=-1 then
			jm = 14
			keepScreen(false);
			return jm
		end			
	end

	--15，领取任务确定，，单领取一个按钮
	x,y = findMultiColorInRegionFuzzy( 0xfff39c, "3|22|0xf7cb31,118|-6|0xfff7c6,108|22|0xffdf4a,26|0|0xd67900,27|23|0xd67500,46|23|0xd67908,60|20|0xd67900,73|23|0xd67500,83|22|0xd67900",90, 253, 622, 392, 661)
	if x ~= -1 and y ~=-1 then
		jm = 15
		keepScreen(false);
		return jm
	end
	x,y = findMultiColorInRegionFuzzy( 0xf7e76b, "-8|16|0xefb629,20|1|0xd67900,30|-2|0xd68e18,44|16|0xd67908,58|-6|0xd67908,69|11|0xd67d08,71|16|0xd67500,81|15|0xd67900,101|3|0xf7f36b",90, 250, 623, 394, 661)
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
	
--[[	
	--17-1,任意界面弹出PK失败提醒(PVP结果)，直接点击确定，返回0
	x,y = findMultiColorInRegionFuzzy( 0xbdc3d6, "0|9|0x9c96a5,6|14|0xa5aec6,11|11|0xc6c7de,18|9|0xcec7d6,19|17|0x848694,22|11|0x8c8a9c", 90, 828, 559, 860, 583)
	if x ~= -1 and y ~=-1 then
		click(590, 1550, 200)
		keepScreen(false);
		return 92
	end
	--17-2,任意界面弹出PK胜利提醒(PVP结果)，直接点解确定，返回0
	x,y = findMultiColorInRegionFuzzy( 0x525963, "9|2|0x8c868c,15|4|0x5a555a,0|17|0xd6cfde,8|16|0x525963,17|16|0xcec7d6", 95, 682, 430, 718, 455)
	if x ~= -1 and y ~=-1 then
		click(590, 1550, 200)
		mSleep(200)
		keepScreen(false);
		mSleep(200)
		return 93
	end	
]]	
	
	--18,战斗暂停提示继续界面，直接点击继续游戏，返回0
	--if g_fighting == 1 then
		x,y = findMultiColorInRegionFuzzy( 0xffcf4a, "5|35|0xff9608,30|4|0xffffff,57|34|0xffffff,84|18|0xfff7ef,129|2|0xffffff,145|33|0xfff7e7,171|5|0xffffff,177|34|0xffffff,205|19|0xff9e00",90, 185, 483, 456, 553)
		--x,y = findImageInRegionFuzzy("jxyx.png", 100, 400, 780, 1111, 1060, 0);
		if x ~= -1 and y ~=-1 then
			click(320, 520, 200)
			keepScreen(false);
			return 94
		end
		--19,战斗暂停提示继续界面，俩按钮的，直接点击继续游戏，返回0
		x,y = findMultiColorInRegionFuzzy( 0xffcb42, "206|24|0xff9600,-7|173|0x08a6ef,209|193|0x008ee7,48|23|0xf7ffff,175|27|0xffffff,117|-3|0xfffbf7,8|175|0xf7ffff,113|204|0xffffff,187|174|0xffffff",90, 186, 393, 452, 639)
		if x ~= -1 and y ~=-1 then
			click(320, 430, 200)
			keepScreen(false);
			return 95
		end
	--end
	
	--31  排名上升了，最下面一个确定按钮，只要找到这个按钮，直接点
	x,y = findMultiColorInRegionFuzzy( 0xb5e342, "6|55|0x73aa10,59|54|0x6ba608,-2|18|0xffffff,15|14|0xffffff,7|45|0xf7fbf7,22|45|0xf7ffff,46|15|0xffffff,33|25|0xffffff,60|44|0xffffff",90, 24, 949, 99, 1017)
	if x ~= -1 and y ~=-1 then
		jm = 0
		click(60, 980, 200)
		keepScreen(false);
		return 96
	end
	
	--32 本周最高
--	x,y = findMultiColorInRegionFuzzy( 0xffbe18, "0|6|0xffbe18,8|6|0x943010,8|0|0xffbe18,5|18|0xffb610,7|10|0x9c2c10", 90, 909, 721, 976, 749)
	x,y = findMultiColorInRegionFuzzy( 0xffd729, "-48|72|0xffb610,127|2|0xffe742,215|73|0xffba10,236|75|0xffb608,427|2|0xffeb4a,327|44|0x73598c,134|40|0x73598c,37|42|0x6b5184,134|59|0x6b5184",90, 75, 357, 570, 465)
	if x ~= -1 and y ~=-1 then
		jm = 0
		click(160, 980, 200)
		keepScreen(false);
		return 97
	end
	
--[[	--33 宠物背包已满，各种弹出框，只有一个确定的
	x,y = findMultiColorInRegionFuzzy( 0xf7f36b, "2|38|0xf7d742,136|-3|0xfff773,139|40|0xffdb4a,37|6|0xde8e18,58|29|0xd67900,79|4|0xd67900,67|28|0xd67500,90|28|0xce7900,65|19|0xfff784",90, 245, 647, 402, 700)
	if x ~= -1 and y ~=-1 then
		dialog("宠物背包已满，请先清理，脚本停止。", 3)
		keepScreen(false);
		lua_exit()
		return 98
	end
]]
	--34 各种弹出框，只有一个确定的
	x,y = findMultiColorInRegionFuzzy( 0xf7f36b, "2|38|0xf7d742,136|-3|0xfff773,139|40|0xffdb4a,37|6|0xde8e18,58|29|0xd67900,79|4|0xd67900,67|28|0xd67500,90|28|0xce7900,65|19|0xfff784",90, 245, 647, 402, 700)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		g_auto_lrw = 1
		click(320, 670,100)
--		lua_exit()
		return 99
	end	
	--各种弹出框，（左边取消，右边确定的）
	x,y = findMultiColorInRegionFuzzy( 0x42baff, "46|19|0x007db5,89|1|0x0079ad,59|22|0x007db5,141|11|0x10a6ff,289|5|0xffeb52,335|25|0xd67d08,344|24|0xd67500,379|24|0xce7900,419|14|0xf7f36b",90, 86, 642, 552, 698)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		click(460, 670,100)
		return 99
	end	
	--各种弹出框，（左边确定，右边分享）主要是PK结果，成功和失败都这个弹窗
	x,y = findMultiColorInRegionFuzzy( 0x4ac3ff, "6|22|0x31baff,29|-3|0x007db5,72|-2|0x007dbd,81|22|0x007dbd,280|12|0xf7ef63,180|13|0xffdf42,202|-2|0xd67900,217|9|0xd67d00,263|16|0xd67500",90, 164, 792, 476, 831)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		click(230, 810,100)
		return 99
	end	
	
	--35 获取机友信息失败
	x,y = findMultiColorInRegionFuzzy( 0x000008, "13|0|0x000000,12|18|0x081018,1|19|0x8cd3ff", 90, 1052, 898, 1089, 930)
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
	
	--出现：游戏开始错误，难道没油了的提示
	x,y = findMultiColorInRegionFuzzy( 0x080400, "10|-4|0x94d3f7,19|-6|0x182831,19|-1|0x4a6d84,18|2|0x8ccfef,18|5|0x081018,18|14|0x94d3f7,25|1|0x94d3f7", 90, 562, 881, 602, 910)
	if x ~= -1 and y ~=-1 then
		keepScreen(false);
		click(777, 1250, 200)
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
		x,y = findMultiColorInRegionFuzzy( 0xffdb18, "15|5|0xffae21,32|19|0xffffff,28|52|0xfff36b,15|63|0xffdb42,30|74|0xffae18,23|119|0xffeb00,10|143|0xf7db10,29|145|0xf7d308,20|130|0xffdb29",90, 20, 93, 73, 281)
		if x ~= -1 and y ~=-1 then
			jm = 20
			keepScreen(false);
			--wLog("test","pdjm, 20");
			return jm
		end
		x,y = findMultiColorInRegionFuzzy( 0xeff7ff, "-16|16|0xe7f7ff,27|33|0x009aef,218|-4|0xffcf42,146|34|0xffffff,288|34|0xffffff,385|6|0xffffff,449|34|0xffffff,525|34|0xffffff,538|24|0xff9a00",90, 25, 949, 612, 1020)
		if x ~= -1 and y ~=-1 then
			jm = 20
			keepScreen(false);
			--wLog("test","pdjm, 20-1");
			return jm
		end
		
		--21, 45关山羊胡选择普通还是英雄开始界面
		x,y = findMultiColorInRegionFuzzy( 0x31b6ff, "46|-4|0x007db5,96|19|0x007dbd,204|11|0xf7e752,232|19|0xd67900,286|19|0xd68210,340|10|0xffe752,410|18|0xd67900,487|-3|0xd67900,543|13|0xffe34a",90, 31, 864, 607, 915)
		if x ~= -1 and y ~=-1 then
	--		dialog("45关x："..x.." y: "..y, 3)
			--wLog("test","pdjm,  21-1");
			jm = 21
			keepScreen(false);
			return jm
		end
		x,y = findMultiColorInRegionFuzzy( 0x31b6ff, "93|6|0x007db5,142|-2|0x08a6ff,234|-5|0xce7900,284|1|0xd69221,336|-5|0xf7eb63,384|3|0xefc731,455|-12|0xd67d00,502|-6|0xd67900,530|0|0xffef63",90, 38, 774, 605, 823)
--		dialog("45关x："..x.." y: "..y, 3)
		if x ~= -1 and y ~=-1 then
			--wLog("test","pdjm,  21-2");
			jm = 21
			keepScreen(false);
			return jm
		end

		--21界面针对ios9，进行优化
		x,y = findMultiColorInRegionFuzzy( 0x31baff, "-7|43|0x21b2ff,300|-13|0x10a6ff,310|44|0x08aaff,418|-5|0xf7e352,401|44|0xf7c329,728|-15|0xffef63,725|42|0xffdf4a,836|30|0xf7d339,1167|9|0xf7e34a",90, 142, 1649, 1393, 1774)
		if x ~= -1 and y ~=-1 then
			--wLog("test","pdjm,  21-3");
			jm = 21
			keepScreen(false);
			return jm
		end
		x,y = findMultiColorInRegionFuzzy( 0x39baff, "141|62|0x63cfff,170|-6|0x007db5,287|13|0x18aaff,431|39|0xf7df42,496|-9|0xce7900,728|20|0xffeb52,594|9|0xce7900,589|18|0xd67900,590|41|0xce7900",90, 144, 1453, 968, 1574)
		if x ~= -1 then
			--wLog("test","pdjm,  21-4");
			jm = 21
			keepScreen(false);
			return jm	
		end
		
		-- 22，剧情战斗胜利出来之后第一帧
		x,y = findMultiColorInRegionFuzzy( 0xffffad, "26|9|0xffff9c,57|19|0xffcb5a,-68|23|0x21b2e7,-37|47|0x10558c,13|63|0x104173,54|33|0x6be3f7,47|61|0x319ade,70|23|0x42cff7,86|60|0x187dce",90, 227, 116, 409, 200)
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
		x,y = findMultiColorInRegionFuzzy( 0xf7cb73, "77|70|0xdec384,-36|100|0xffba08,48|12|0xfffb8c,65|99|0xffb608,87|95|0xffba08,134|14|0xfffb7b,144|94|0xffba08,151|15|0xfff773,163|99|0xffb608",90, 190, 93, 454, 244)
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
				g_juqing = g_juqing + 1  --当前要刷的剧情关卡+1，跳过当前关
				g_jq_fail = 0
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
					g_juqing = g_juqing + 1  --当前要刷的剧情关卡+1，跳过当前关
					g_jq_fail = 0
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
		x,y = findMultiColorInRegionFuzzy( 0xffcf4a, "186|29|0xff9600,-17|202|0x0092e7,200|177|0x00a6e7,17|6|0xffffff,165|32|0xffffff,159|6|0xfffbef,-4|183|0xffffff,69|199|0x0092e7,169|213|0xdef3ff",90, 179, 380, 462, 652)
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
			x,y = findMultiColorInRegionFuzzy( 0x2171bd, "5|0|0x1871c6,13|0|0x1871c6,20|0|0x2171bd,28|0|0x2171bd,27|5|0x2171bd,19|5|0x2171bd,13|5|0x2171bd,6|5|0x1875c6,-3|6|0x1871c6",90, 407, 198, 458, 215)
			if x ~= -1 then
				return click(420, 180, 200)
			end
			mSleep(200)
		end
	end	
	click(530, 980, 200) 
	mSleep(200);
end

function switch2()--2、模式选择界面
	if g_fighting == 0 then
		--wLog("switch2","gi_choice="..gi_choice.."  ");
		if gi_choice == 0 then  --经典
			click(320, 420, 200)
		elseif gi_choice == 1 or gi_choice == 3 then  --pk
			mSleep(500)
			touchDown(4,600, 780)  --按下动作
			mSleep(50)
			for i=0, 480, 60 do                          
				touchMove(4, 600, 780 - i)       --滑动过程
				mSleep(50)
			end
			mSleep(50)
			touchUp(4, 780, 300)                  --弹起动作
			mSleep(500)
			click(320, 620, 200)
		elseif gi_choice == 2 then  -- 剧情
			if g_juqing_cs == 0 then
				click(320, 240, 200)
			else
				click(60, 980, 200)
				g_juqing_cs =  0
			end
		end
	else
		click(60, 980, 200)
		g_fighting = 0;
	end
	mSleep(500)
end

function switch3()--3、判断pk界面
	if g_fighting == 0 then
		click(320, 300, 200)  
	else                     --如果刚从战斗画面退出来，点击返回
		click(60, 980, 200)
		g_fighting = 0;
	end
	mSleep(500)
end

function switch4()--4, pk选择界面（世界对战，好友对战，积分兑换）
	if g_fighting == 0 then
		click(790, 450, 200) 
		mSleep(2000)    
	else                     --如果刚从战斗画面退出来，点击返回
		click(60, 980, 200) 
	end
	mSleep(500)
end
function switch5()--5,合体界面
	if gi_choice == 2 then
		if g_juqing_cs == 0 then
			click(480, 980, 200)  
		else
			click(60, 980, 200)
		end
	else
		click(480, 980, 200)  
	end
	mSleep(500)
end

function switch6()  --6,买天神祝福界面
	if g_fighting == 0 then
		if gi_choice == 2 then  --如果是刷剧情模式，能进入这里，说明前面判断剩余次数出问题了，这里仅仅是容错处理。
			if g_juqing_cs == 0 then
				click(480, 980, 200)   --次数还有，点开始
			else
				click(60, 980, 200)  --次数没了，点返回
			end
		else
			click(480, 980, 200)  
		end  
	else
		g_fighting = 0
		click(180, 980, 200)
	end
	mSleep(500)
end
function switch7()--7，恭喜你界面
    click(320, 890, 200)  
	mSleep(500)   
end
function switch8()--8，加油哦界面
    click(60, 980, 200)  
	mSleep(500) 
end
function switch9()--9，PK胜利界面

	g_fighting = 0
    click(60, 980, 200) 
	mSleep(500) 

end
function switch10()--10，PK失败界面
	g_fighting = 0
    click(60, 980, 200)  
	mSleep(500)   

end
function switch11()--11，PK等待结算界面
	g_fighting = 0
    click(320, 980, 200)  
	mSleep(500)   

end
function switch12() ----12，PK选择界面(金币，钻石场选择)
	if g_fighting == 0 then  --如果还未进入过战斗，点击金币，准备进入战斗界面
		if gi_choice == 1 then --1W金币场
			click(380, 680, 200)
		elseif gi_choice == 3 then  --2888金币场
			click(240, 680, 200)
		end
	else                     --如果刚从战斗画面退出来，点击返回
		click( 60, 980, 200) 
	end
	mSleep(500)
end

function switch13() ----13，战斗中
	--dialog(g_fun_running_13, 0)
	if g_fun_running_13 == 1 then   --阻止函数重入
		return
	end
	--wLog("test","switch13,开始".."   ");
	g_fun_running_13  = 1
	g_fighting = 1
	
	local x,y,li_krqd, li_swjl,li_for = 0,0,0,0,0
	local li_lei, li_jineng, li_jineng1, li_jineng2=0,0,0,0
	
	if gi_killme == 1 then
		hd1(1,319,760, -1000, -200)
		return
	end
	
	if gi_krqd == 0 and li_krqd == 0 then
		x,y = findMultiColorInRegionFuzzy( 0xf7fbff, "-5|40|0x108e7b,28|42|0x109284,-10|-11|0xe7dfe7,28|-11|0xa59aa5,42|52|0x109284,24|2|0x21bab5,-16|59|0x188e7b,22|60|0x109284,12|68|0x109284",90, 157, 305, 253, 411)
		if x ~= -1 and y ~=-1 then
			click(200, 350, 100)
			li_krqd = 1
		end		
	end
		
	while g_fun_running_13 == 1 do	
--		hd1(1,319,760, 400, 200) --回最下
		hd1(7, 319, 150, 1000, 200)
		keepScreen(true)
		if li_lei == 0 then
			if gi_choice == 2 then
				x,y = findMultiColorInRegionFuzzy( 0xd64100, "1|1|0xfff7f7,3|0|0xce4108,1|9|0xfff7f7,1|11|0xb53800,-2|6|0xffffff,-4|5|0xce795a,5|6|0xffffff,6|4|0xd66539,-1|8|0xb53c00",100, 40, 734, 86, 753)
			else
				x,y = findMultiColorInRegionFuzzy( 0xd64100, "1|1|0xfff7f7,3|0|0xce4108,1|9|0xfff7f7,1|11|0xb53800,-2|6|0xffffff,-4|5|0xce795a,5|6|0xffffff,6|4|0xd66539,-1|8|0xb53c00",100, 40, 734, 86, 753)
			end 
			if x ~= -1 then  --找到白色＋号了
				--wLog("test","5s-switch13, 找到雷了：x,y="..x..", "..y);
				li_lei = 1
			else
				li_lei = 0
			end
		end
		
		--装备技能
		if li_jineng == 0 then
			x,y = findMultiColorInRegionFuzzy( 0xefefef, "0|4|0x4a6173,3|7|0xeff7f7,7|3|0xadaaad,7|1|0xadb6c6,13|0|0xefefef,14|2|0x8c969c,16|4|0x4a6173,14|5|0x949aa5,13|6|0xf7f3ef",90, 36, 932, 58, 944)
			if x ~= -1 and y ~= -1 then
				li_jineng = 1
			else
				li_jineng = 0
			end
		end
		
		--宠物技能
		--x,y = findMultiColorInRegionFuzzy( 0x94b6ce, "1|2|0xadbace,-2|6|0x6b869c,8|8|0xeff3f7,26|1|0x8c929c,28|0|0x738a9c,25|9|0xf7fbf7", 90, 1286, 1801, 1350, 1827)
		if li_jineng1 == 0 then
			x,y = findMultiColorInRegionFuzzy( 0xeff7f7, "0|28|0xf7fb73,-18|39|0xfff74a,17|39|0xfffb4a,4|66|0xf7f352,-26|63|0xef5510,26|66|0x8c2418,-31|47|0x9c184a,35|47|0xe708ad,-43|31|0xe7f7ff",90, 542, 926, 638, 1037)
			if x ~= -1 and y ~=-1 then
				li_jineng1 = 1	
			else
				li_jineng1 = 0
			end
		end
		
		--主动技能
		--x,y = findMultiColorInRegionFuzzy( 0xefdb63, "-33|9|0xf7d3ce,46|8|0xf7dbd6,-8|70|0x210400,23|70|0x180400,8|92|0xdef3f7,-39|91|0xad8200,45|98|0xa5bace,-45|113|0xde00ef,63|109|0xe700ef",90, 97, 1515, 279, 1714)
		if li_jineng2 == 0 then
			x,y = findMultiColorInRegionFuzzy( 0xefefef, "-1|4|0x4a6173,3|2|0x94929c,6|3|0xadaaa5,10|5|0x9c9aa5,15|5|0x849aa5,14|2|0x7b8a94,1|6|0xf7f3f7,14|0|0xefefef,13|6|0xf7f3f7",90, 36, 795, 57, 806)
			if x ~= -1 and y ~=-1 then
				li_jineng2 = 1	
			else
				li_jineng2 = 0
			end
		end
		--dialog(li_jineng2, 2)
		keepScreen(false)
		--wLog("test","5s-switch13,炸弹，装备技能，宠物技能，主动技能="..li_lei..li_jineng..li_jineng1..li_jineng2);
	
		for li_for = 1,3,1 do
			x, y = findImageInRegionFuzzy("daodan.png", 100, 250, 90, 385, 210, 0);
			if x ~= -1 then 
				x,y = findMultiColorInRegionFuzzy( 0x290800, "2|0|0x290800,0|2|0x290800,2|2|0x290800",95, 250, 90, 385, 210)   --黑点
				if x ~= -1 then	
					--wLog("test","switch13,导弹来袭--1");
					li_for = 0
					break; 
				end
				x,y = findMultiColorInRegionFuzzy( 0x634131, "0|2|0x634131,0|4|0x634131,0|6|0x634131,1|3|0x633831,1|4|0x633c31",95, 250, 90, 385, 210)
				if x ~= -1 then	
					--wLog("test","switch13,导弹来袭--2");
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
				click(45, 980, 200) 
				--mysleep(10)
				li_jineng  = 0
--					wLog("test","switch13,放装备技能");
			else
				if li_jineng1 == 1 then  --有宠物技能
					click(590, 980, 200)
					li_jineng1 = 0
					--wLog("test","switch13,放宠物技能");
				else
					if li_jineng2 == 1 then  --飞机主动技能
						click(45, 840, 200)
						li_jineng2 = 0

						--wLog("test","switch13,放主动技能");
					else	
						if li_lei == 1 then  --有雷，放
							click(45, 700, 200)  --放多余的雷
							li_lei = 0
							mSleep(5000)	
							--wLog("test","switch13,导弹来袭--放雷");
							--mysleep(5)
						else
							--导弹来了，没雷没技能，跑吧
							--wLog("test","switch13,没技能，准备跑路");
							x, y = findImageInRegionFuzzy("daodan.png", 90, 480,90,640, 210, 0);
							--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 85, 1186,10,1506, 260)
							if x ~= -1 and y ~=-1 then  --最右边位置也找到导弹了
								--随便挪个地方碰运气吧
								hd(1,319,500, -500,-250)     --d是标记 xy是坐标 i是距离 b是步长 移到最左边碰运气吧
								mSleep(4000)
								--mysleep(3)
								x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 2, 20, 90, 400, 210) --找最左边到中间位置的路程中间有没有导弹导弹
								while x ~= -1 and y ~= -1 do  --如果找到导弹了，继续等待找导弹，知道找不到导弹了，再向下执行
									--路程中间有导弹
									--当前头顶导弹有没有
									x, y = findImageInRegionFuzzy("daodan.png", 90, 20, 90, 180, 210, 0);
									--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 85, 6, 1, 326, 260)
									if x ~= -1 and y ~=-1 then --如果找到疑似导弹的外围黑点，找导弹的中心白点，如果外围黑点都没找到，也不用找内部白点了
										x,y = -1,-1  --退出循环，赶快跑吧
									else
										mSleep(100)
										--看当前位置到中间的路上有没有导弹
										x, y = findImageInRegionFuzzy("daodan.png", 90, 20, 90, 180, 210, 0);
										--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 85, 166, 1, 926, 260)
									end
									mSleep(50)	
									--wLog("test","switch13,没技能，跑路完了，准备回去");
								end
								--hd(1,166,1830, 600,200)     --d是标记 xy是坐标 i是距离 b是步长
								hd(1,20,500, 300,100)     --d是标记 xy是坐标 i是距离 b是步长
								--wLog("test","switch13,跑路完成，归位。");
							else  --最右边没有雷，移过去吧
								--wLog("test","switch13,最右边没有雷，移过去吧");
								hd(1,319,500, 500,125)     --d是标记 xy是坐标 i是距离 b是步长
								--休眠两秒之后，再移回来
								mSleep(2500)
								--mysleep(3)
								x, y = findImageInRegionFuzzy("daodan.png", 90, 480, 90, 639, 210, 0);
								--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 85, 606, 10, 1830, 260)
								while x ~= -1 and y ~= -1 do  --如果找到导弹了，继续等待找导弹，知道找不到导弹了，再向下执行
									--看看当前位置头顶有没有导弹
									x, y = findImageInRegionFuzzy("daodan.png", 90, 480, 90, 639, 210, 0);
									--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 90, 1186,10,1506, 260)
									if x ~= -1 and y ~=-1 then 
										x,y = -1,-1
									else
										mSleep(200)
										x, y = findImageInRegionFuzzy("daodan.png", 90, 319, 90, 639, 210, 0);
										--x,y = findMultiColorInRegionFuzzy( 0xffffff, "0|-17|0xffffff,-16|-1|0xffffff,14|-1|0xffffff,-1|16|0xffffff,-11|-12|0xffffff,11|-9|0xffffff,-12|10|0xffffff,12|8|0xffffff", 90, 606, 10, 1830, 260)
									end
									mSleep(50)		
									--wLog("test","switch13,最右边等待归位");
								end		
								--wLog("test","switch13,最右边没有雷，跑完归位");
								hd(1,620, 500, -300, -100)     --d是标记 xy是坐标 i是距离 b是步长
							end
						end
					end
				end
			end
		end
		
		--wLog("test","switch13  导弹判断结束");
		--处理完导弹之后，处理一下别的
		--开局冲刺,狂热驱动
		
		if gi_krqd == 0 and li_krqd == 0 then
			x,y = findMultiColorInRegionFuzzy( 0xf7fbff, "-5|40|0x108e7b,28|42|0x109284,-10|-11|0xe7dfe7,28|-11|0xa59aa5,42|52|0x109284,24|2|0x21bab5,-16|59|0x188e7b,22|60|0x109284,12|68|0x109284",90, 157, 305, 253, 411)
			if x ~= -1 and y ~=-1 then
				click(200, 350, 100)
				li_krqd = 1
			end		
		end


		--看看是不是弹出死亡接力了		
		if gi_swjl == 0 and li_swjl == 0 then  --死亡接力
--			x,y = findMultiColorInRegionFuzzy( 0xffffff, "-28|16|0xff82ad,-33|-4|0x18c3f7,-23|84|0x18c7ff,-21|126|0xfff718,48|60|0xff79a5,71|89|0x18b6ef", 95, 678, 551, 874, 753)
			keepScreen(true)
			x,y = findMultiColorInRegionFuzzy( 0xff75a5, "-20|31|0xff82ad,21|37|0xff7da5,0|8|0xffffff,-20|63|0xffef08,21|67|0xfff318,-31|27|0x18bef7,-29|58|0x18baef,31|57|0x18b6ef,35|28|0x18bef7",100, 279, 343, 368, 439)
			keepScreen(false)
--			wLog("test","switch13死亡接力：x="..x.."  y="..y);
			if x ~= -1 and y ~=-1 then
				click(320, 390, 200)
				g_fun_running_13 = 1
				mSleep(1500)  --死亡接力之后，休眠2秒，直接放装备技能，因为没机会再判断掉血放技能了
				click(45, 980, 200)
				li_swjl = 1
			end		
		end	
		
	--装备技能，因为铁流不是无敌，不开放	
--		x,y = findMultiColorInRegionFuzzy( 0xdee7e7, "-12|11|0xde3c00,-7|5|0xc63400,1|4|0xd63800,14|11|0xfffbf7,3|12|0xde3800,7|9|0xffffff,-5|13|0xffffff,10|15|0xefdbc6,4|16|0xffffff",90, 544, 324, 632, 603)
		
		--找卖血技能
		keepScreen(true)
		x,y = findMultiColorInRegionFuzzy( 0x2165ad, "6|-5|0x185594,15|-8|0x216db5,14|-3|0xe7f3f7,25|0|0x08498c,11|4|0x4286c6,8|8|0x3169ad,6|0|0xfffbff,14|-2|0xffffff,12|8|0xffffff",90, 544, 324, 632, 603)
		if x ~= -1 then 
			hd1(6, 319, 900, -800, -200) --向上
			--dialog("3x = "..x.."  y = "..y, 0)
			mSleep(5000)
			hd1(7, 319, 150, 1000, 200) --回来
		else
			hd1(7, 319, 150, 1000, 200) --回来		
		end
		--宠物技能
		x,y = findMultiColorInRegionFuzzy( 0xbd3c6b, "6|-5|0xa53852,14|-8|0xc6416b,14|-3|0xf7ffff,4|4|0xffffff,23|4|0xf7fbff,26|-4|0xc6416b,12|5|0xf7ebde,15|6|0x9c3842,27|3|0xc6416b",90, 544, 324, 632, 603)
		if x ~= -1 then 
			hd1(6, 319, 900, -800, -200) --向上
			--dialog("3x = "..x.."  y = "..y, 0)
			mSleep(5000)
			hd1(7, 319, 150, 1000, 200) --回来
		else
			hd1(7, 319, 150, 1000, 200) --回来		
		end
	

		--圆月之舞
		x,y = findMultiColorInRegionFuzzy( 0xdedbde, "-6|8|0x947910,-1|4|0x8c7910,8|4|0xefd3bd,16|3|0xa59e18,20|7|0xadaa21,8|14|0xada621,-1|13|0xffffff,8|11|0xffffff,16|14|0xffffff",90, 544, 324, 632, 603)
		if x ~= -1 then 
			hd(6, 319, 900, 400, 200)  --最右
			mSleep(500)
			hd(6, 600, 900, -280, 140)  --中间
			mSleep(500)
			hd1(6, 319, 900, -800, -200) --向上
			--dialog("3x = "..x.."  y = "..y, 0)
			mSleep(5000)
			hd1(7, 319, 150, 1000, 200) --回来
		else
			hd1(7, 319, 150, 1000, 200) --回来		
		end
		keepScreen(false)
		
		
		--看看掉血没有
		--x,y = findMultiColorInRegionFuzzy( 0xe75108, "0|4|0xe75508,0|9|0xf75908,0|13|0xf75908,10|13|0xf75908,9|8|0xef5508,8|4|0xe75508", 100, 394, 54, 424, 81)
		x,y = findMultiColorInRegionFuzzy( 0xe75108, "0|5|0xf75508,2|9|0xef5100,5|6|0xef5108,7|4|0xf75508,8|1|0xf75508",90, 105, 112, 140, 125)
		--这里因为血槽掉血后背景色为透明，所以找红色血，找不到了就放技能
		if x ~= -1 and y ~=-1 then  --找到红色血块，说明没掉血
			if gi_choice ==2 and (g_juqing == 2 or g_juqing == 1 or g_juqing == 3) then  --如果是剧情45,54，42直接放技能
				--mSleep(5000)
				mysleep(10)
				click(45, 980, 200) 
				mysleep(10)
				click(590, 980, 200)
				mysleep(10)
				click(45, 840, 200)
				mysleep(5)
			end
		else   --掉血了
			--wLog("test","switch13,掉血了：   "..li_lei.." "..li_jineng.." "..li_jineng1.." "..li_jineng2);
			if li_jineng == 1 then
				click(45, 980, 200) 
				li_jineng = 0
				--mysleep(10)
			else
				if li_jineng1 == 1 then
					click(590, 980, 200)
					li_jineng1 = 0
				else
					if li_jineng2 == 1 then  --飞机主动技能
						click(45, 840, 200)
						li_jineng2 = 0
					else	
						if li_lei == 1 then
							--mysleep(3)
							click(45, 700, 200)  --放多余的雷
							li_lei = 0
							--wLog("test","switch13：没血了--放雷");
							mSleep(5000)
						end
					end
				end	
			end
		end	
		--以下代码，继续判断是否还在战斗界面，如果在战斗界面，就继续while循环，
		--如果不在战斗界面了，那么退出while循环，交给主界面去判断pdjm()
		--13，战斗中
		resetIDLETimer()
		for li_for = 1,3,1 do   --找三遍战斗中界面，减少回到主界面的判断
			keepScreen(true)
			x,y = findMultiColorInRegionFuzzy( 0xffffff, "2|19|0xfff3bd,8|10|0xf7f7e7,20|0|0xffffff,17|19|0xfff3c6,26|19|0xfff3bd,39|0|0xffffff,41|6|0xf7f7f7,29|9|0xde5100,35|4|0xde4d00",90, 7, 104, 58, 134)
			keepScreen(false)
			if x ~= -1 then 
				g_fun_running_13 = 1
				li_for = 0
				break;
			else
				g_fun_running_13 = 0
			end
			mSleep(200)
			if gi_swjl == 0 and li_swjl == 0 then  --死亡接力
--			x,y = findMultiColorInRegionFuzzy( 0xffffff, "-28|16|0xff82ad,-33|-4|0x18c3f7,-23|84|0x18c7ff,-21|126|0xfff718,48|60|0xff79a5,71|89|0x18b6ef", 95, 678, 551, 874, 753)
			keepScreen(true)
			x,y = findMultiColorInRegionFuzzy( 0xff75a5, "-20|31|0xff82ad,21|37|0xff7da5,0|8|0xffffff,-20|63|0xffef08,21|67|0xfff318,-31|27|0x18bef7,-29|58|0x18baef,31|57|0x18b6ef,35|28|0x18bef7",100, 279, 343, 368, 439)
			keepScreen(false)
--			wLog("test","switch13死亡接力：x="..x.."  y="..y);
			if x ~= -1 and y ~=-1 then
				click(320, 390, 200)
				g_fun_running_13 = 1
				mSleep(1500)  --死亡接力之后，休眠2秒，直接放装备技能，因为没机会再判断掉血放技能了
				click(45, 980, 200)
				li_swjl = 1
			end		
		end	
		end
		--wLog("test","switch13战斗中检测,x="..x.."  g_fun_running_13= "..g_fun_running_13.."  ");
	end  --while
	g_fun_running_13  = 0
--	wLog("test","switch13,结束".."   ".."  g_fun_running_13= "..g_fun_running_13.."  ");
	--dialog("退出战斗函数", 0)
end

function switch14() ----14，领任务界面
	keepScreen(false)
	local x,y = 0,0
	for i = 1, 10 do
		--判断有可以完成的任务，只判断最上面一行
		x,y = findMultiColorInRegionFuzzy( 0xf76d18, "-26|26|0xff6d18,0|57|0xffc331,62|42|0xde6108,-7|17|0xfffbf7,7|34|0xfff7ef,12|32|0xffffff,27|19|0xffffff,35|24|0xfffbff,71|34|0xffffff",90, 507, 253, 616, 317)
		if x ~= -1 and y ~=-1 then
			click(330, 290, 200);--点击进入领任务最后确认界面
			break;
		end
		mSleep(200);
	end
	click(60, 980, 200)
	mSleep(200);
end
function switch15() ----15，领任务确定界面
	mSleep(200);
--	dialog("领任务了222", 1)
	if g_auto_lrw == 0 then
		click(320, 640, 100);--点击进入领任务最后确认界面
	else
		click(60, 980, 100)
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
		return click(60,980,200)
	end 
	keepScreen(true)
	x,y = findMultiColorInRegionFuzzy( 0x5a1410, "9|1|0xffe37b,-5|7|0xffdf73,-5|38|0xffba10,3|38|0xffbe10,4|46|0x631c18,-6|46|0x631c18,-6|13|0x9c3010,-24|51|0xf7c742,20|51|0xf7cb42",90, 167, 746, 256, 850)
	keepScreen(false)
	if x ~= -1 and y ~=-1 then  --找到第一关的图标了
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
				click(60, 980, 200)
				rtn= pdjm();
				while rtn ~= 1 do  --回到主界面
					click(60, 980, 200)
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
				x,y = findMultiColorInRegionFuzzy( 0xb57942, "-17|-75|0xffffff,13|-75|0xffffff,-18|-11|0xe7f7f7,8|-11|0xe7f7ff,-20|-31|0xd67931,18|-54|0xb56529,-2|-25|0xd66121,1|-44|0xdec79c,-7|-60|0xa58a4a",90, 376, 200, 451, 800)
				if x == -1 then  --针对ios9
					--wLog("test","fd45,ios8没找到，找ios9的图...");
					x,y = findMultiColorInRegionFuzzy( 0xb57942, "-17|-75|0xffffff,13|-75|0xffffff,-18|-11|0xe7f7f7,8|-11|0xe7f7ff,-20|-31|0xd67931,18|-54|0xb56529,-2|-25|0xd66121,1|-44|0xdec79c,-7|-60|0xa58a4a",90, 376, 200, 451, 800)
				end
				if x ~= -1 and y ~=-1 then
					return click(x , y , 200)
				end
			end
		elseif g_juqing == 2 then
			if g_jq_54 == 1 then
				x,y = findMultiColorInRegionFuzzy( 0xbd7d42, "-32|-86|0x426d94,-35|-74|0x104173,22|-83|0xb5bec6,32|-53|0xeffbff,-33|-24|0xd6e7ef,25|-35|0x2961a5,14|-65|0x211829,0|-24|0xff86b5,-24|-39|0x73bace",90, 201, 200, 281, 800)
				if x ~= -1 and y ~=-1 then
					return click(x , y , 200)
				end	
			end
		elseif g_juqing == 3 then
			if g_jq_42 == 1 then
				x,y = findMultiColorInRegionFuzzy( 0xb57d39, "-11|-37|0x184173,5|-37|0x184173,-27|-56|0x317194,-3|-65|0x296994,33|-56|0xa5c7ce,-43|-11|0x295d84,37|-12|0x316d8c,-34|39|0x4a96bd,27|36|0x397994",90, 296, 200, 416, 800)
				if x ~= -1 and y ~=-1 then
					return click(x, y, 200)
				end	
			end
		elseif g_juqing == 4 then
			if g_jq_39 == 1 then
				x,y = findMultiColorInRegionFuzzy( 0xc68239, "-8|-38|0x18416b,5|-38|0x184173,-25|-53|0x4a9ec6,22|-51|0x4296bd,-37|-26|0x10558c,-40|2|0xe7f3ff,30|-15|0x4a9ec6,-32|36|0x428eb5,26|36|0x3982ad",90, 329, 200, 415, 800)
				if x ~= -1 and y ~=-1 then
					return click(x , y  , 200)
				end		
			end
		elseif g_juqing == 5 then
			if g_jq_36 == 1 then
				x,y = findMultiColorInRegionFuzzy( 0xb56d39, "-1|-11|0xe7f7f7,32|-38|0xbdd7de,1|-74|0xf7ffff,-32|-37|0xbddbe7,-26|-32|0xf7eb6b,22|-66|0xa59618,16|-64|0xff758c,-17|-62|0xe76973,0|-22|0xd6865a",90, 218, 200, 293, 800)
				if x ~= -1 and y ~=-1 then
					return click(x , y , 200)
				end	
			end
		elseif g_juqing == 6 then
			if g_jq_33 == 1 then
				x,y = findMultiColorInRegionFuzzy( 0xbd7539, "-1|-53|0x3161a5,-8|-37|0x18456b,6|-37|0x18456b,0|-45|0xf7ffff,32|-62|0x185184,16|-58|0x104d7b,-22|-54|0x3975a5,-30|-16|0x63b6d6,25|-15|0x4a96bd",90, 196, 200, 267, 800)
				if x ~= -1 and y ~=-1 then
					return click(x, y, 200)
				end		
			end
		elseif g_juqing == 7 then
			if g_jq_63 == 1 then
				x,y = findMultiColorInRegionFuzzy( 0xb57139, "-19|-31|0x42fbc6,21|-61|0x105963,26|-32|0x39be8c,-10|-56|0xd6d3a5,10|-36|0x9c8a42,-37|-77|0xadc7d6,-1|-83|0x6b96b5,-36|-11|0x6b9ec6,37|-11|0x8cb6ce",90, 91, 200, 192, 800)
				if x ~= -1 and y ~=-1 then
					return click(x , y , 200)
				end		
			end			
		end	

--		keepScreen(true)
		x,y = findMultiColorInRegionFuzzy( 0x5a1410, "9|1|0xffe37b,-5|7|0xffdf73,-5|38|0xffba10,3|38|0xffbe10,4|46|0x631c18,-6|46|0x631c18,-6|13|0x9c3010,-24|51|0xf7c742,20|51|0xf7cb42",90, 167, 746, 256, 850)
--		keepScreen(false)
		if x ~= -1 and y ~=-1 then  --找到第一关的图标了
			--wLog("test","switch20,到底部了".."   ");
--			dialog("到底了", 2)
			i_boom = 1
			g_juqing_cs = 0  --重置当前关卡次数，0代表还有次数可刷，直接影响合体界面点击位置
		else
			touchDown(4,595, 780)  --按下动作
			mSleep(50)
			for i=0, 360, 120 do                          
				touchMove(4, 595, 780 - i)       --滑动过程
				mSleep(30)
			end
			touchMove(4, 595, 780 - 360 -1)
			mSleep(30)
			touchUp(4,595, 780 - 360 - 1)                  --弹起动作
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
					click(320, 890, 200)
				else
					click(60, 980, 200)
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
		return click(60,980,200)
	end 
	
	
	if g_juqing > 8  then
		if gi_tili == 0 then
			dialog("剧情关已经刷完, 自动转入刷积分模式。", 3)
			click(60,980,200)
			rtn= pdjm();
			while rtn ~= 1 do  --回到主界面
				click(60,980,200)
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
	x,y = findMultiColorInRegionFuzzy( 0x5a1410, "9|1|0xffe37b,-5|7|0xffdf73,-5|38|0xffba10,3|38|0xffbe10,4|46|0x631c18,-6|46|0x631c18,-6|13|0x9c3010,-24|51|0xf7c742,20|51|0xf7cb42",90, 167, 746, 256, 850)
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
		x,y = findMultiColorInRegionFuzzy( 0x5a1410, "9|1|0xffe37b,-5|7|0xffdf73,-5|38|0xffba10,3|38|0xffbe10,4|46|0x631c18,-6|46|0x631c18,-6|13|0x9c3010,-24|51|0xf7c742,20|51|0xf7cb42",90, 167, 746, 256, 850)
		keepScreen(false)
		if x ~= -1 and y ~=-1 then  --找到第一关的图标了
			--wLog("test","switch20,到底部了".."   ");
--			dialog("到底了", 2)
			i_boom = 1
			g_juqing_cs = 0  --重置当前关卡次数，0代表还有次数可刷，直接影响合体界面点击位置
		else
			touchDown(4,595, 780)  --按下动作
			mSleep(50)
			for i=0, 360, 120 do                          
				touchMove(4, 595, 780 - i)       --滑动过程
				mSleep(30)
			end
			touchMove(4, 595, 780 - 360 -1)
			mSleep(30)
			touchUp(4,595, 780 - 360 - 1)                  --弹起动作
			mSleep(100)
			--wLog("test","switch20,向下滑动找底部".."   ");
		end
		mSleep(200)
	end  --while
	mSleep(500)
	
	--
--	dialog(g_juqing.."  "..g_juqing_cs.." "..g_jq_45, 2)
	--wLog("test","switch20,到底部了".."  开始找关卡 g_juqing="..g_juqing);
	jq_move()
	--wLog("test","sw20-boss: 自然结束。");
end

function switch21()  -- 21, 剧情模式45关弹出选择普通还是英雄主界面
	
	if gi_jq_boss == 1 then
		return switch21_boss()
	end
	local x,y = 0,0
	--先判断普通模式
	if g_fun_running_21 == 1 then
		return
	end
	g_fun_running_21 = 1
	
	if g_juqing > 7 then
			dialog("剧情关已经刷完, 脚本自动停止。", 3)
			lockDevice();
			lua_exit()
	end
--	dialog("g_juqing= "..g_juqing, 3)
	keepScreen(false)
	if g_juqing == 1 or g_juqing == 2 or g_juqing == 5 or g_juqing == 7 then
		x,y = findMultiColorInRegionFuzzy( 0xad3800, "2|4|0xad3800,2|10|0xad3800,-1|13|0xad3400,-3|10|0xb53400,-3|5|0xad3400,-3|2|0xb53400,-5|7|0xad3400,4|5|0xad3808,0|6|0xb5e3ff",90, 477, 570, 499, 590)
	elseif g_juqing == 3 or g_juqing == 4 or g_juqing == 6 then 
		x,y = findMultiColorInRegionFuzzy( 0xa55d42, "3|2|0xad3808,4|6|0xad4110,4|11|0xad3800,1|15|0xb53400,-3|10|0xad3400,-3|4|0xad3400,-4|6|0xad3400,5|10|0xad3400,1|7|0x94d3f7",90, 480, 451, 498, 472)
	end
	
	if x ~= -1 and y ~=-1 then
		if g_juqing == 1 or g_juqing == 2 or g_juqing == 5 or g_juqing == 7 then
--			dialog("点击英雄模式，g_juqing="..g_juqing,2)
			click(480, 480, 200)  --转到英雄模式，等待下一次界面判断之后调用本过程
			mSleep(500)			
			x,y = findMultiColorInRegionFuzzy( 0xad3800, "2|4|0xad3800,2|10|0xad3800,-1|13|0xad3400,-3|10|0xb53400,-3|5|0xad3400,-3|2|0xb53400,-5|7|0xad3400,4|5|0xad3808,0|6|0xb5e3ff",90, 477, 570, 499, 590)
		elseif g_juqing == 3 or g_juqing == 4 or g_juqing == 6 then
			click(480, 340, 200)  --转到英雄模式，等待下一次界面判断之后调用本过程
			mSleep(500)		
			x,y = findMultiColorInRegionFuzzy( 0xa55d42, "3|2|0xad3808,4|6|0xad4110,4|11|0xad3800,1|15|0xb53400,-3|10|0xad3400,-3|4|0xad3400,-4|6|0xad3400,5|10|0xad3400,1|7|0x94d3f7",90, 480, 451, 498, 472)
			
		end
		if x ~= -1 and y ~=-1 then
			--到这里说明本关次数全用完了
			if g_juqing == 1 or g_juqing == 2 or g_juqing == 5 or g_juqing == 7 then  --点击关闭
				mSleep(500)
				click(120, 900, 200)
			elseif g_juqing == 3 or g_juqing == 4 or g_juqing == 6 then
				mSleep(500)
				click(120, 800, 200)
			end
			g_juqing_cs = 1   --当前关卡次数全部用完
			g_juqing = g_juqing + 1
			g_jq_fail = 0
		end
	else
--		dialog("g_juqing= ".. g_juqing.." x= "..x.." y="..y, 3)
		keepScreen(false)
		if g_juqing == 1 or g_juqing == 2  or g_juqing == 5 or g_juqing == 7 then  --点击开始战斗
			click(520, 900, 200)
		elseif g_juqing == 3 or g_juqing == 4 or g_juqing == 6 then
			click(520, 800, 200)
		end
		mSleep(500)
	end
	g_fun_running_21 = 0
	mSleep(500)
end

function switch21_boss()  -- 21, 剧情模式45关弹出选择普通还是英雄主界面
	local x,y = 0,0
	--先判断普通模式
	local jq_k, jq_k1 = IsInTable(gi_jq_x,jq_point)
	
	--找次数的红色数字0
	x,y = findMultiColorInRegionFuzzy( 0xad3800, "2|4|0xad3800,2|10|0xad3800,-1|13|0xad3400,-3|10|0xb53400,-3|5|0xad3400,-3|2|0xb53400,-5|7|0xad3400,4|5|0xad3808,0|6|0xb5e3ff",90, 477, 570, 499, 590)
	if x ~= -1 and y ~=-1 then
		click(480, 480, 200)  --转到英雄模式，等待下一次界面判断之后调用本过程
		mSleep(1000)
		x,y = findMultiColorInRegionFuzzy( 0xad3800, "2|4|0xad3800,2|10|0xad3800,-1|13|0xad3400,-3|10|0xb53400,-3|5|0xad3400,-3|2|0xb53400,-5|7|0xad3400,4|5|0xad3808,0|6|0xb5e3ff",90, 477, 570, 499, 590)
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
		click(120, 900, 200)
	else
		if jq_k ~= nil and jq_k > 0 then
			jq_point[jq_k+1] = jq_point[jq_k+1] + 1
		end
		click(520, 900, 200)
		--click(440, 1700, 200)   --测试用，直接返回，不点开始
		mSleep(1000)
	end

end

function switch25()  --刷剧情提示次数用完，直接点确定
	g_juqing_cs = 1  --正常情况下，不会到这里，能到这里说明前面取色判断次数没有成功，这里只是容错处理：当前关卡用完了而已，这个好像不用要啊
	click(770, 1250, 200)
end

function switch22()  --剧情战斗胜利第一帧，直接点击返回
	click( 60, 980, 200) 
	g_fighting = 0;
	g_jq_fail = 0
	mSleep(500)
end

function switch26()  --俩按钮
--	if g_fighting == 1 then
		click(320, 420, 200)
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

function switch36()
	click(770,1250,200) --点掉提示PK未结算的提示
	mSleep(30000)
	click(470, 1910, 100)  --休眠30秒之后，直接点回到主界面
end

function switch37()
	mSleep(1000)
	x,y = findMultiColorInRegionFuzzy( 0xffffff, "-35|-1|0xfffff7,32|1|0xffffff,-68|-6|0xffffff,-64|32|0xffffff,61|33|0xffffff,74|-3|0xffffff,-37|32|0xffffff,36|31|0xffffff,0|52|0xffffff",90, 90, 170, 1500, 1760)
	if x~= -1 then
		click(x,y,200)
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
		touchDown(4,595, 430)  --按下动作
		mSleep(200)
		for i=0,360, 120 do  
			touchMove(4, 595, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,595, 430 + 360 +1)
		mSleep(20)
		touchUp(4, 595, 430+360+1)                  --弹起动作
		mSleep(200)
		x,y = findMultiColorInRegionFuzzy( 0xb57942, "-17|-75|0xffffff,13|-75|0xffffff,-18|-11|0xe7f7f7,8|-11|0xe7f7ff,-20|-31|0xd67931,18|-54|0xb56529,-2|-25|0xd66121,1|-44|0xdec79c,-7|-60|0xa58a4a",90, 376, 200, 451, 800)
		if x == -1 then  --针对ios9
--			wLog("test","fd45,ios8没找到，找ios9的图...");
			x,y = findMultiColorInRegionFuzzy( 0xb57942, "-17|-75|0xffffff,13|-75|0xffffff,-18|-11|0xe7f7f7,8|-11|0xe7f7ff,-20|-31|0xd67931,18|-54|0xb56529,-2|-25|0xd66121,1|-44|0xdec79c,-7|-60|0xa58a4a",90, 376, 200, 451, 800)
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
		touchDown(4,595, 430)  --按下动作
		mSleep(200)
		for i=0,240, 80 do  
			touchMove(4, 595, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,595, 430 + 240 +1)
		mSleep(50)
		touchUp(4, 595, 430+240+1)                  --弹起动作
		mSleep(200)
		keepScreen(true)
		x,y = findMultiColorInRegionFuzzy( 0xbd7d42, "-32|-86|0x426d94,-35|-74|0x104173,22|-83|0xb5bec6,32|-53|0xeffbff,-33|-24|0xd6e7ef,25|-35|0x2961a5,14|-65|0x211829,0|-24|0xff86b5,-24|-39|0x73bace",90, 201, 200, 281, 800)
		keepScreen(false)
		if x ~= -1 and y ~=-1 then
--			dialog("找到了 "..x.."  "..y, 3)
			i_find = 1
			click(x , y , 200)
			mSleep(500)
		end	
		loop = loop + 1
		if loop > 60 then 
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
		touchDown(4,595, 430)  --按下动作
		mSleep(200)
		for i=0,360, 120 do  
			touchMove(4, 595, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,595, 430 + 360 +1)
		mSleep(20)
		touchUp(4, 595, 430+360+1)                  --弹起动作
		mSleep(200)
		--42关
		x,y = findMultiColorInRegionFuzzy( 0xb57d39, "-11|-37|0x184173,5|-37|0x184173,-27|-56|0x317194,-3|-65|0x296994,33|-56|0xa5c7ce,-43|-11|0x295d84,37|-12|0x316d8c,-34|39|0x4a96bd,27|36|0x397994",90, 296, 200, 416, 800)
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
		touchDown(4,595, 430)  --按下动作
		mSleep(200)
		for i=0,360, 120 do  
			touchMove(4, 595, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,595, 430 + 360 +1)
		mSleep(20)
		touchUp(4, 595, 430+360+1)                  --弹起动作
		mSleep(200)
		keepScreen(true)
		--30关
		x,y = findMultiColorInRegionFuzzy( 0xc68239, "-8|-38|0x18416b,5|-38|0x184173,-25|-53|0x4a9ec6,22|-51|0x4296bd,-37|-26|0x10558c,-40|2|0xe7f3ff,30|-15|0x4a9ec6,-32|36|0x428eb5,26|36|0x3982ad",90, 329, 200, 415, 800)
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
		touchDown(4,595, 430)  --按下动作
		mSleep(200)
		for i=0,360, 120 do  
			touchMove(4, 595, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,595, 430 + 360 +1)
		mSleep(20)
		touchUp(4, 595, 430+360+1)                  --弹起动作
		mSleep(200)
		
		--36关
		keepScreen(true)
		x,y = findMultiColorInRegionFuzzy( 0xb56d39, "-1|-11|0xe7f7f7,32|-38|0xbdd7de,1|-74|0xf7ffff,-32|-37|0xbddbe7,-26|-32|0xf7eb6b,22|-66|0xa59618,16|-64|0xff758c,-17|-62|0xe76973,0|-22|0xd6865a",90, 218, 200, 293, 800)
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
		touchDown(4,595, 430)  --按下动作
		mSleep(200)
		for i=0,240, 80 do  
			touchMove(4, 595, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,595, 430 + 240 +1)
		mSleep(50)
		touchUp(4, 595, 430 + 240 + 1)                  --弹起动作
		mSleep(200)
		keepScreen(true)
		--找34关图标，点击第33关图标
		x,y = findMultiColorInRegionFuzzy( 0xbd7539, "-1|-53|0x3161a5,-8|-37|0x18456b,6|-37|0x18456b,0|-45|0xf7ffff,32|-62|0x185184,16|-58|0x104d7b,-22|-54|0x3975a5,-30|-16|0x63b6d6,25|-15|0x4a96bd",90, 196, 200, 267, 800)
		keepScreen(false)
		if x ~= -1 and y ~=-1 then
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
		touchDown(4,595, 430)  --按下动作
		mSleep(200)
		for i=0,240, 80 do  
			touchMove(4, 595, 430 + i)       --滑动过程
			mSleep(30)
		end
        touchMove(4,595, 430 + 240 +1)
		mSleep(50)
		touchUp(4, 595, 430+240+1)                  --弹起动作
		mSleep(200)
		keepScreen(true)
		--找34关图标，点击第33关图标
		x,y = findMultiColorInRegionFuzzy( 0xb57139, "-19|-31|0x42fbc6,21|-61|0x105963,26|-32|0x39be8c,-10|-56|0xd6d3a5,10|-36|0x9c8a42,-37|-77|0xadc7d6,-1|-83|0x6b96b5,-36|-11|0x6b9ec6,37|-11|0x8cb6ce",90, 91, 200, 192, 800)
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
		touchDown(4,595, 430)  --按下动作
		mSleep(50)
		for i=0,360, 120 do  
			touchMove(4, 595, 430 + i)       --滑动过程
			mSleep(50)
		end
        touchMove(4,595, 430 + 360 +1)
		mSleep(50)
		touchUp(4, 595, 430+360+1)                  --弹起动作
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
	x72,y72 = findMultiColorInRegionFuzzy( 0xbd7d42, "-30|-18|0x9cb6c6,27|-72|0xb5bec6,-27|-28|0xfff77b,22|-39|0xc6b631,24|-61|0xffff7b,-22|-60|0xce4942,11|-55|0xe77173,20|-27|0xde4929,-11|-27|0xd67552",90, 376, 200, 451, 800)
	x,y = findMultiColorInRegionFuzzy( 0xb57539, "-32|15|0xd6efff,27|19|0xd6ebff,-2|-12|0xe7f7f7,-32|-35|0xbddbe7,33|-56|0xefffff,0|-74|0xffffff,-21|-81|0xeffbff,21|-81|0xeffbff",90, 376, 200, 451, 800)
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


