function daily()
	multiColTap({
			{  325,  722, 0xfdde9c},
			{  364,  778, 0x7eea1b},
			{  369,  750, 0x91f833},
			{  276,  747, 0x91f833},
			{  539,  496, 0xffffff},
		})--邀请金币翻倍
	multiColTap({
			{  260,  915, 0xfed547},
			{  258,  957, 0xfdc72a},
			{  378,  955, 0xfdc72a},
			{  384,  918, 0xfed547},
			{  585,  360, 0xffffff},
		})--用完能量邀请金币
		
	multiColTap({{  768,  655, 0x65d926},{  845,  664, 0x65d926},{  764,  315, 0x8c4a1d},{  901,  320, 0x8c4a1d},})--消息领取X
	multiColTap({{  209,  191, 0xd27400},{  396,  181, 0xd27400},{  319, 1064, 0xe02824},{  326, 1053, 0xffffff},{  312, 1039, 0xffffff},{  315, 1052, 0xffffff},})--关闭消息
	multiColTap({{  892,  552, 0xfb5b24},{  851,  588, 0xf73b2c},{  890,  622, 0xdc2421},{  908,  608, 0xffffff},{  872,  568, 0xffffff},{  891,  586, 0xffffff},})--超值礼包
	multiColTap({{  269,  928, 0xa6f944},{  375,  932, 0xa2f845},{  372,  969, 0x65d926},{  274,  968, 0x65d926},{  317,  974, 0x65d926},})--领取抽奖道具
	multiColTap({{  465,  772, 0xf9ed6b},{  579,  756, 0xf9ed6b},{  579,  784, 0xf9ed6b},{  478, 1588, 0x97f646},{  492, 1628, 0x65d926},{  548, 1637, 0x65d926},})--获得碎片确认X
	multiColTap({
			{  322,  596, 0xfdde9c},
			{  319,  664, 0xfdde9c},
			{  539,  517, 0xffffff},
			{  547,  526, 0xffffff},
			{  323,  761, 0x7eea1b},
			{  355,  728, 0x91f833},
		})--友情提示：刷新
end

function go()
	if gem == "剩余2/3" then
		if multiColor({
				{  375,  560, 0x1db3f7},
				{  365,  560, 0x11afff},
				{  279,  559, 0x11aefe},
				{  276,  560, 0x11afff},
				}) == false then
			tap(320,  994)
			mSleep(4000)
		end
	elseif gem == "剩一半" then
		if multiColor({
				{  376,  571, 0x1db3f7},
				{  368,  572, 0x11aefe},
				{  275,  572, 0x11afff},
				{  271,  571, 0x11afff},
				}) == false then
			tap(320,  994)
			mSleep(4000)
		end
	elseif gem == "全用完" then
		if multiColor({
				{  318,  632, 0x129fe8},
				{  321,  632, 0x129fe8},
				{  325,  632, 0x129fe8},
				}) == false then
			tap(320,  994 )
			mSleep(4000)
		end
	end
	if multiColor({
			{  413,  158, 0xfdb642},
			{  414,  181, 0xfdaa3a},
			{  458,  184, 0xe27808},
			{  496,  180, 0xfdaa3a},
			{  500,  161, 0xfdb642},
			}) then--攻击界面
		x,y = findMultiColorInRegionFuzzy( 0xffffff, "8|-1|0xffffff,2|10|0xffffff,-8|17|0xffffff,14|16|0xffffff,3|32|0x0fb6fb", 90, 63, 478, 621, 938)--主建筑
		if x ~= -1 then
			tap(x,y)
			toast("攻击主建筑！")
		else
			x,y = findMultiColorInRegionFuzzy( 0xffffff, "-15|6|0xffffff,13|9|0xffffff,-9|15|0xffffff,4|15|0xffffff,-1|33|0x0fb6fb", 90, 60, 393, 624, 862)--风景
			if x ~= -1 then
				tap(x,y)
				toast("攻击风景！")
			else
				x,y = findMultiColorInRegionFuzzy( 0xffffff, "-3|22|0xffffff,0|22|0xffffff,5|23|0xffffff,1|38|0x0fb6fb", 90, 60, 393, 624, 862)--雕塑
				if x ~= -1 then
					tap(x,y)
					toast("攻击雕塑！")
				else
					x,y = findMultiColorInRegionFuzzy( 0xffffff, "15|-7|0xffffff,30|0|0xffffff,10|13|0xffffff,20|15|0xffffff,16|30|0x0fb6fb", 90, 35, 488, 627, 1023)--宠物
					if x ~= -1 then
						tap(x,y)
						toast("攻击宠物！")
					else
						x,y = findMultiColorInRegionFuzzy( 0xffffff, "-7|10|0xffffff,16|7|0xffffff,-6|28|0xffffff,10|28|0xffffff,6|42|0x0fb6fb", 90, 35, 488, 627, 1023)--船舶
						if x ~= -1 then
							tap(x,y)
							toast("攻击船舶！")
						end
					end
				end
			end
		end
	end
	multiColTap({
			{  506, 1072, 0x7eea1b},
			{  574, 1076, 0x7eea1b},
			{  573, 1048, 0x91f833},
			{  501, 1046, 0x91f833},
		})--建筑摧毁确认
	if gold == "选1号" then
		multiColTap({
				{  407,  194, 0xe27808},
				{  376,  389, 0xffe101},
				{  386,  390, 0xffe101},
				{  398,  390, 0xffe101},
				{  490,  384, 0xffe802},
				{  147,  697, 0xffffff},
				{  146,  708, 0xffffff},
				{  146,  717, 0xffffff},
			})--土豪1
	elseif gold == "选2号" then
		multiColTap({
				{  407,  194, 0xe27808},
				{  376,  389, 0xffe101},
				{  386,  390, 0xffe101},
				{  398,  390, 0xffe101},
				{  490,  384, 0xffe802},
				{  318,  935, 0xffffff},
				{  335,  935, 0xffffff},
				{  319,  958, 0xffffff},
			})--土豪2
	elseif gold == "选3号" then
		multiColTap({
				{  407,  194, 0xe27808},
				{  376,  389, 0xffe101},
				{  386,  390, 0xffe101},
				{  398,  390, 0xffe101},
				{  490,  384, 0xffe802},
				{  460,  698, 0xffffff},
				{  455,  705, 0xffffff},
				{  460,  715, 0xffffff},
			})--土豪3
	end
end

function reward()
	if multiColor({{   83,  228, 0xff4e31},{  595,  165, 0x65d926},{  606,  153, 0xffffff},}) then--主界面
		if dailyreward ~= 0 then
			multiColTap({{  585,  236, 0x9d2e16},{  571,  244, 0xfaf793},{  594,  238, 0x5280d4},{  574,  223, 0x5280d4},{  598,  209, 0xfe0402},{  596,  215, 0xfe0402},{  602,  215, 0xfe0402},})--浏览器红点
			multiColTap({{  577,  328, 0xf4e3b5},{  579,  343, 0xe8b27b},{  585,  328, 0xf4e3b5},{  599,  307, 0xfe0402},{  597,  313, 0xfe0402},{  601,  313, 0xfe0402},})--每日登陆红点
			multiColTap({{  232,  207, 0xd27400},{  422,  201, 0xd27400},{  286,  988, 0x9cf746},{  282, 1020, 0x65d926},{  322, 1023, 0x65d926},})--领取奖励
			multiColTap({{  275,  986, 0xbebebe},{  300, 1024, 0x8d8d8d},{  554,  189, 0xffffff},{  577,  209, 0xffffff},{  555,  209, 0xffffff},})--关闭每日登陆界面
			if multiColor({{  585,  236, 0xfaf793},{  571,  244, 0xa12e19},{  599,  215, 0xfe0402},{  599,  308, 0xfa120a},{  582,  328, 0xf4e3b5},}) == false then
				dailyreward = 0
				toast("每日登陆奖励已领取！",1)
			end
		end
	end
end

function building()
	if multiColor({{   86,  228, 0xff4e31},{  597,  164, 0x65d926},{  605,  153, 0xffffff},{  586,  871, 0xff0402},{  583,  876, 0xfa160c},{  587,  876, 0xff0402},}) then --进入建筑界面
		island = 1
		tap( 587,  876)
	end
	multiColTap({{   83,  232, 0xff4e31},{  593,  164, 0x65d926},{  605,  153, 0xffffff},{  298,  993, 0x79829d},{  259, 1040, 0xde8765},{  396, 1021, 0x808eb5},{  355, 1039, 0xffffff},})--锤子按钮
	if multiColor({{  228,  216, 0xd27400},{  420,  214, 0xd27400},{  305, 1087, 0xfaf6eb},{  288, 1086, 0xfaf6eb},}) then--建造岛屿界面
		local x,y = findMultiColorInRegionFuzzy( 0xfaf6eb, "1|4|0xffaa01,1|10|0xfaf6eb,1|16|0xffaa00,1|20|0xfaf6eb", 75, 68, 385, 593, 1066)--建造
		if x ~= -1 then
			tap(x,y-70)
			mSleep(500)
		else
			toast("没有可以升级的建筑",1)
			island = 0
			tap( 565, 214)
			mSleep(500)
			multiColTap({{   84,  868, 0xfee6c4},{  107,  884, 0xfee6c4},{   91,  904, 0xf4a966},{   82,  881, 0xfaf7c9},})--回到抽奖界面
		end
	end
end
