function daily()
	multiColTap({{  768,  655, 0x65d926},{  845,  664, 0x65d926},{  764,  315, 0x8c4a1d},{  901,  320, 0x8c4a1d},})--消息领取
	multiColTap({{  676,  273, 0xd27400},{  321,  328, 0xd27400},{  538, 1803, 0xdb2421},{  550, 1780, 0xffffff},{  530, 1759, 0xffffff},{  529, 1780, 0xffffff},})--关闭消息
	multiColTap({{  892,  552, 0xfb5b24},{  851,  588, 0xf73b2c},{  890,  622, 0xdc2421},{  908,  608, 0xffffff},{  872,  568, 0xffffff},{  891,  586, 0xffffff},})--超值礼包
	multiColTap({{  465,  772, 0xf9ed6b},{  579,  756, 0xf9ed6b},{  579,  784, 0xf9ed6b},{  478, 1588, 0x97f646},{  492, 1628, 0x65d926},{  548, 1637, 0x65d926},})--获得碎片确认
end

function go()
	if gem == "剩余2/3" then
		if multiColor({{  606, 1450, 0x3dd7fd},{  607, 1457, 0x1cc3fd},{  426, 1809, 0xba2515},{  513, 1660, 0xffffff},{  568, 1666, 0xffffff},}) then
			tap(568, 1666)
			mSleep(5000)
		end
	elseif gem == "剩一半" then
		if multiColor({{  535, 1437, 0x6bedff},{  543, 1464, 0x07b5fb},{  426, 1809, 0xba2515},{  513, 1660, 0xffffff},{  568, 1666, 0xffffff},}) then
			tap(568, 1666)
			mSleep(5000)
		end
	elseif gem == "全用完" then
		if multiColor({{  355, 1449, 0x44dafd},{  355, 1453, 0x37d3fd},{  426, 1809, 0xba2515},{  513, 1660, 0xffffff},{  568, 1666, 0xffffff},}) then
			tap(568, 1666)
			mSleep(5000)
		end
	end
	if multiColor({{  394, 1869, 0xddd3bc},{  470, 1836, 0xddd3bc},{  620, 1836, 0xddd3bc},{  687, 1871, 0xddd3bc},})then--攻击界面
		x,y = findMultiColorInRegionFuzzy( 0xffffff, "-17|-6|0x89ebf6,-11|3|0xffffff,19|5|0xffffff,25|-1|0x62d1e5,-7|27|0x62d1e5,-20|18|0xffffff,-17|42|0xffffff,-6|42|0x62d1e5,1|34|0x62d1e5", 90, 120, 813, 1035, 1582)--主建筑
		if x ~= -1 then
			tap(x,y)
			toast("攻击主建筑！")
		else
			x,y = findMultiColorInRegionFuzzy( 0x8becf6, "19|11|0xffffff,11|24|0xffffff,3|20|0xffffff,-7|36|0xffffff,32|27|0xffffff,55|26|0x62d1e5,20|46|0x62d1e5,19|33|0xffffff", 90, 120, 813, 1035, 1582)--背景
			if x ~= -1 then
				tap(x,y)
				toast("攻击风景！")
			else
				x,y = findMultiColorInRegionFuzzy( 0x87eaf6, "37|-14|0x62d1e5,44|-8|0xffffff,30|44|0xffffff,41|45|0x62d1e5,21|55|0x62d1e5,9|27|0x62d1e5,1|35|0x62d1e5,18|14|0xffffff,25|27|0x64d2e5", 90, 120, 813, 1035, 1582)--雕塑
				if x ~= -1 then
					tap(x,y)
					toast("攻击雕塑！")
				else
					x,y = findMultiColorInRegionFuzzy( 0x8becf6, "0|16|0xffffff,16|18|0x62d1e5,33|7|0xffffff,34|17|0x62d1e5,37|42|0xffffff,23|48|0x62d1e5,23|37|0xffffff", 90, 126,  856, 1052, 1710)--宠物
					if x ~= -1 then
						tap(x,y)
						toast("攻击宠物！")
					else
						x,y = findMultiColorInRegionFuzzy( 0x8aebf6, "32|2|0xffffff,35|-9|0x62d1e5,42|9|0x62d1e5,27|28|0x62d1e5,22|34|0xffffff,-6|32|0xffffff,45|41|0xffffff,54|25|0xffffff", 90, 126,  856, 1052, 1710)--船舶
						if x ~= -1 then
							tap(x,y)
							toast("攻击船舶！")
						end
					end
				end
			end
		end
	end
	multiColTap({{  824, 1714, 0xf1ecdc},{  851, 1759, 0xa0f845},{  854, 1803, 0x65d926},{  920, 1818, 0x64d925},})--建筑摧毁确认
	if gold == "选1号" then
		multiColTap({{  651,  658, 0xffe101},{  652,  703, 0xffc800},{  272, 1125, 0xffffff},{  261, 1142, 0x62d1e5},{  261, 1154, 0x62d1e5},{  285, 1157, 0x62d1e5},{  271, 1143, 0xffffff},})--土豪1
	elseif gold == "选2号" then
		multiColTap({{  651,  658, 0xffe101},{  652,  703, 0xffc800},{  563, 1565, 0x62d1e5},{  563, 1551, 0xffffff},{  586, 1556, 0xffffff},{  566, 1586, 0xffffff},{  590, 1586, 0xffffff},})--土豪2
	elseif gold == "选3号" then
		multiColTap({{  651,  658, 0xffe101},{  652,  703, 0xffc800},{  789, 1130, 0xffffff},{  783, 1141, 0x62d1e5},{  798, 1142, 0xffffff},{  772, 1147, 0xffffff},})--土豪3
	end
end

function reward()
	if multiColor({{   46,  355, 0xff4e31},{   44,  399, 0xff4e31},{ 1007,  286, 0x65d926},{ 1042,  284, 0x65d926},}) then--主界面
		if dailyreward ~= 0 then
			multiColTap({{  956,  394, 0x5280d4},{  970,  385, 0x5280d4},{ 1003,  407, 0x5280d4},{ 1008,  361, 0xfe0302},{ 1015,  357, 0xff0302},{ 1013,  371, 0xfe0302},})--浏览器红点
			multiColTap({{  971,  561, 0xf4e3b5},{  985,  560, 0xf4e3b5},{  993,  558, 0xf6e3b8},{ 1010,  527, 0xfd0704},{ 1016,  527, 0xfe0302},{ 1016,  533, 0xfe0302},})--每日登陆红点
			multiColTap({{  438,  371, 0xffffff},{  520,  343, 0xffffff},{  570,  354, 0xffffff},{  394,  354, 0xd27400},{  490, 1669, 0x9cf746},{  491, 1725, 0x65d926},{  549, 1733, 0x65d926},})--领取奖励
			multiColTap({{  882,  350, 0xd27400},{  887,  307, 0xd27400},{  935,  319, 0xffffff},{  977,  363, 0xffffff},{  934,  362, 0xffffff},})--关闭每日登陆界面
			if multiColor({{  989,  405, 0xfaf793},{  964,  419, 0x992e14},{ 1009,  526, 0xfe0302},{ 1016,  530, 0xfa140c},}) == false then
				dailyreward = 0
				toast("每日登陆奖励已领取！",1)
			end
		end
	end
end

function building()
	if multiColor({{ 1003,  281, 0x65d926},{ 1023,  265, 0xffffff},{  135,  391, 0xff4e31},{  924, 1485, 0xdd895a},{  986, 1478, 0xfe0402},{  993, 1481, 0xfd0c07},}) then --进入建筑界面
		island = 1
		tap( 993, 1481)
	end
	multiColTap({{   83,  232, 0xff4e31},{  593,  164, 0x65d926},{  605,  153, 0xffffff},{  298,  993, 0x79829d},{  259, 1040, 0xde8765},{  396, 1021, 0x808eb5},{  355, 1039, 0xffffff},})--锤子按钮C
	if multiColor({{  228,  216, 0xd27400},{  420,  214, 0xd27400},{  305, 1087, 0xfaf6eb},{  288, 1086, 0xfaf6eb},}) then--建造岛屿界面C
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
