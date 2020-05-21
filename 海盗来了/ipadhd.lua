function daily()
	multiColTap({
			{  768,  655, 0x65d926},
			{  845,  664, 0x65d926},
			{  764,  315, 0x8c4a1d},
			{  901,  320, 0x8c4a1d},
		})--消息领取X
	multiColTap({
			{  209,  191, 0xd27400},
			{  396,  181, 0xd27400},
			{  319, 1064, 0xe02824},
			{  326, 1053, 0xffffff},
			{  312, 1039, 0xffffff},
			{  315, 1052, 0xffffff},
		})--关闭消息
	multiColTap({
			{  892,  552, 0xfb5b24},
			{  851,  588, 0xf73b2c},
			{  890,  622, 0xdc2421},
			{  908,  608, 0xffffff},
			{  872,  568, 0xffffff},
			{  891,  586, 0xffffff},
		})--超值礼包
end

function go()
	if gem == "剩余2/3" then
		if multiColor({
				{  349,  852, 0x86f3fe},
				{  349,  860, 0x24c7fd},
				{  298,  953, 0xf9826d},
				{  304, 1083, 0xbb2717},
				{  300,  978, 0xffffff},
				{  326,  989, 0xffffff},
				}) then
			tap(326,  989)
			mSleep(5000)
		end
	elseif gem == "剩一半" then
		if multiColor({
				{  317,  849, 0x67ecff},
				{  322,  865, 0x07b5fb},
				{  298,  953, 0xf9826d},
				{  304, 1083, 0xbb2717},
				{  300,  978, 0xffffff},
				{  326,  989, 0xffffff},
				}) then
			tap(326,  989)
			mSleep(5000)
		end
	elseif gem == "全用完" then
		if multiColor({
				{  210,  856, 0x45dafe},
				{  210,  858, 0x3bd6fd},
				{  298,  953, 0xf9826d},
				{  304, 1083, 0xbb2717},
				{  300,  978, 0xffffff},
				{  326,  989, 0xffffff},
				}) then
			tap(326,  989)
			mSleep(5000)
		end
	end
	multiColTap({
			{  465,  772, 0xf9ed6b},
			{  579,  756, 0xf9ed6b},
			{  579,  784, 0xf9ed6b},
			{  478, 1588, 0x97f646},
			{  492, 1628, 0x65d926},
			{  548, 1637, 0x65d926},
		})--获得碎片确认X
	x,y = findMultiColorInRegionFuzzy( 0xffffff, "12|5|0xffffff,-4|17|0x62d1e5,6|28|0x62d1e5,-12|32|0x62d1e5,-19|15|0x62d1e5,-11|20|0xffffff", 90, 63, 478, 621, 938)--主建筑
	if x ~= -1 then
		tap(x,y)
		toast("攻击主建筑！")
	else
		x,y = findMultiColorInRegionFuzzy( 0xffffff, "8|-14|0x62d1e5,15|-12|0xffffff,36|-5|0x62d1e5,4|6|0x62d1e5,20|7|0x62d1e5", 90, 60, 393, 624, 862)--背景
		if x ~= -1 then
			tap(x,y)
			toast("攻击风景！")
		else
			x,y = findMultiColorInRegionFuzzy( 0xffffff, "-7|7|0x62d1e5,15|-14|0xffffff,17|10|0x62d1e5,7|19|0xffffff,-2|23|0x62d1e5,-10|17|0xffffff,-11|10|0x62d1e5", 90, 60, 393, 624, 862)--雕塑
			if x ~= -1 then
				tap(x,y)
				toast("攻击雕塑！")
			else
				x,y = findMultiColorInRegionFuzzy( 0xffffff, "9|2|0x62d1e5,14|-1|0x62d1e5,29|-2|0xffffff,29|10|0x62d1e5,13|12|0xffffff,11|21|0x62d1e5", 90, 35, 488, 627, 1023)--宠物
				if x ~= -1 then
					tap(x,y)
					toast("攻击宠物！")
				else
					x,y = findMultiColorInRegionFuzzy( 0xffffff, "-4|16|0x62d1e5,3|16|0x62d1e5,-15|20|0xffffff,-3|31|0x62d1e5,18|14|0xffffff,14|24|0xffffff", 90, 35, 488, 627, 1023)--船舶
					if x ~= -1 then
						tap(x,y)
						toast("攻击船舶！")
					end
				end
			end
		end
	end
	multiColTap({
			{  490, 1015, 0xf1ecdc},
			{  506, 1043, 0xa5f944},
			{  506, 1069, 0x60d921},
			{  551, 1080, 0x65d926},
		})--建筑摧毁确认
	if gold == "选1号" then
		multiColTap({
				{  386,  389, 0xffe101},
				{  386,  414, 0xffc800},
				{  153,  670, 0x62d1e5},
				{  162,  664, 0xffffff},
				{  162,  673, 0xffffff},
				{  162,  681, 0xffffff},
				{  162,  687, 0xffffff},
				{  162,  693, 0x62d1e5},
			})--土豪1
	elseif gold == "选2号" then
		multiColTap({
				{  386,  389, 0xffe101},
				{  386,  414, 0xffc800},
				{  341,  919, 0x62d1e5},
				{  333,  918, 0xffffff},
				{  343,  928, 0xffffff},
				{  335,  934, 0xffffff},
				{  333,  937, 0xffffff},
				{  350,  937, 0xffffff},
			})--土豪2
	elseif gold == "选3号" then
		multiColTap({
				{  386,  389, 0xffe101},
				{  386,  414, 0xffc800},
				{  462,  667, 0xfcfefe},
				{  468,  666, 0xffffff},
				{  475,  672, 0xffffff},
				{  472,  675, 0xffffff},
				{  465,  681, 0xffffff},
				{  456,  676, 0xffffff},
			})--土豪3
	end
end

function reward()
	if multiColor({
			{   83,  228, 0xff4e31},
			{  595,  165, 0x65d926},
			{  606,  153, 0xffffff},
			}) then--主界面
		if dailyreward ~= 0 then
			multiColTap({
					{  585,  236, 0x9d2e16},
					{  571,  244, 0xfaf793},
					{  594,  238, 0x5280d4},
					{  574,  223, 0x5280d4},
					{  598,  209, 0xfe0402},
					{  596,  215, 0xfe0402},
					{  602,  215, 0xfe0402},
				})--浏览器红点
			multiColTap({
					{  577,  328, 0xf4e3b5},
					{  579,  343, 0xe8b27b},
					{  585,  328, 0xf4e3b5},
					{  599,  307, 0xfe0402},
					{  597,  313, 0xfe0402},
					{  601,  313, 0xfe0402},
				})--每日登陆红点
			multiColTap({
					{  232,  207, 0xd27400},
					{  422,  201, 0xd27400},
					{  286,  988, 0x9cf746},
					{  282, 1020, 0x65d926},
					{  322, 1023, 0x65d926},
				})--领取奖励
			multiColTap({
					{  275,  986, 0xbebebe},
					{  300, 1024, 0x8d8d8d},
					{  554,  189, 0xffffff},
					{  577,  209, 0xffffff},
					{  555,  209, 0xffffff},
				})--关闭每日登陆界面
			if multiColor({
					{  585,  236, 0xfaf793},
					{  571,  244, 0xa12e19},
					{  599,  215, 0xfe0402},
					{  599,  308, 0xfa120a},
					{  582,  328, 0xf4e3b5},
					}) == false then
				dailyreward = 0
				toast("每日登陆奖励已领取！",1)
			end
		end
	end
end

function building()
	if  multiColor({{   86,  228, 0xff4e31},{  597,  164, 0x65d926},{  605,  153, 0xffffff},{  586,  871, 0xff0402},{  583,  876, 0xfa160c},{  587,  876, 0xff0402},}) then--进入建筑界面
		island ~= 0
		tap(587,  876)
	end
	multiColTap({
			{   83,  232, 0xff4e31},
			{  593,  164, 0x65d926},
			{  605,  153, 0xffffff},
			{  298,  993, 0x79829d},
			{  259, 1040, 0xde8765},
			{  396, 1021, 0x808eb5},
			{  355, 1039, 0xffffff},
		})--锤子按钮
	if multiColor({
			{  228,  216, 0xd27400},
			{  420,  214, 0xd27400},
			{  305, 1087, 0xfaf6eb},
			{  288, 1086, 0xfaf6eb},
			}) then--建造岛屿界面
		local local x,y = findMultiColorInRegionFuzzy( 0xfaf6eb, "1|4|0xffaa01,1|10|0xfaf6eb,1|16|0xffaa00,1|20|0xfaf6eb", 75, 68, 385, 593, 1066)--建造
		if x ~= -1 then
			tap(x,y-70)
			mSleep(500)
		else
			toast("没有可以升级的建筑",1)
			island = 0
			tap(566,  213)--关闭建造岛屿界面
			island = 0
			multiColTap({{   87,  229, 0xff4e31},{  594,  162, 0x65d926},{  605,  153, 0xffffff},{   82,  880, 0xfaf7c9},{   93,  905, 0xf4a966},{  103,  899, 0xf19e47},})--回到主界面
		end
	end
end
