
function daily()
	x,y = findMultiColorInRegionFuzzy( 0x424242, "32|-4|0x424242,73|19|0x424242,32|40|0x424242,27|16|0x7ec6bf", 90, 520, 689, 617, 751)--购买商品失败
if x ~= -1 then
	tap(x+30,y+30,tapms,tapimg)
	toast("购买商品失败")
end
	x,y = findMultiColorInRegionFuzzy( 0xece7ed, "15|-2|0xece2ed,6|-11|0x82c542", 90, 406, 517, 448, 556)--离线奖励
	if x ~= -1 then
		tap(364,  792,tapms,tapimg)
	end
	multiColTap({{  338, 1303, 0xff547b},{ 1194, 1306, 0xff547b},{ 1191, 1434, 0xff547b},{  341, 1433, 0xff547b}})--签到
	multiColTap({{ 1038, 1033, 0xd1e926},{ 1048, 1041, 0xd3ea26},{ 1071, 1016, 0xcce326},{  730, 1232, 0x7d7d85},{  754, 1220, 0x808188}})--发现隐藏的鱼
	multiColTap({{  473, 1034, 0xfead00},{  491, 1034, 0xffae00},{  491, 1031, 0xffae00},{  252, 1036, 0x666869}})--关闭宝箱
end

function collect()
	x,y = findMultiColorInRegionFuzzy( 0xd95da5, "10|0|0xd95da5,5|5|0xda5da6", 80, 11, 64, 697, fh)--鱼红心泡泡
	if x ~= -1 then
		tap(x,y,tapms,tapimg)
		toast("找到一颗心哦~")
	else x,y = findMultiColorInRegionFuzzy( 0xdc5ea9, "-3|1|0xdc5ca9,1|4|0xdc5ca9,4|2|0xdc5ca9", 80, 11, 64, 697, fh)
		if x ~= -1 then
			tap(x,y,tapms,tapimg)
			toast("找到一颗心哦~")
		end
	end
end

function festival()
	x,y = findMultiColorInRegionFuzzy( 0xfff3c5, "-1|3|0xfff3c5,-2|4|0xfff3c5,-3|10|0xffffff",90,56, 67, 652, fh)
	if x ~= -1 then
		tap(x,y,30,tapimg)
		toast("物品 +1 呀~坐标："..x.."&"..y)
	else
		x,y = findMultiColorInRegionFuzzy(0xfff8c7, "9|2|0xfff8c7,4|10|0xfe6278,4|13|0xfe6278", 90, 56, 67, 652, fh)
		if x ~= -1 then
			tap(x,y,30,tapimg)
			toast("物品 +1 哇～坐标"..x.."&"..y)
		else
			x,y = findMultiColorInRegionFuzzy(0xffefc5, "-3|0|0xffefc6,7|0|0xffeec5,-2|8|0xffffff,-3|5|0xffffff",90, 56, 67, 652, fh)
			if x ~= -1 then
				tap(x,y,30,tapimg)
				toast("物品 +1 哦~坐标"..x.."&"..y)
			end
		end
	end
end


if shanhushi == 0 then
	左上角红心小手 = {
		{   40, 1023, 0xbe516a},
		{   47, 1020, 0xbe516a},
		{   48, 1075, 0xbb5566},
		{   60, 1087, 0xffffff},
	}
end
xm,ym=655, 1228
x,y = findMultiColorInRegionFuzzyByTable( 左上角红心小手, 90,  23, 1009, 143, 1107)
if x ~= -1 then
	halfmenu = true
else
	halfmenu = false
end

function expand()
	if halfmenu == false then
		tap(xm,ym,tapms,tapimg)
		if multiColor({
				{  338, 1207, 0xffffff},
				{  361, 1205, 0xffffff},
				{  361, 1230, 0xffffff},
				{  339, 1228, 0xffffff},
				}) == false then--扩张未开
			tap(361, 1230)
		end
	end
end

function stonemove()
	if shanhushi == 0 then
		if multiColor({
				{  120, 1824, 0xffffff},
				{  118, 1837, 0xffffff},
				{   91, 1839, 0xffffff},
				{  108, 1806, 0xffffff},
				}) == false then--石头未开
			tap(79, 1223,tapms,tapimg)
		else
			x,y = findMultiColorInRegionFuzzy( 0xfefeff, "14|-2|0xfcfcfd,13|15|0xffffff,36|0|0xfefeff", 90, 499, 1190, 576, 1226)--技能
			if x == -1 then
				moveTo(w/2,h-400,w/2,h-200,10)
			end
		end
	end
end


function menu()
	if halfmenu == false then
		tap(xm,ym,tapms,tapimg)
	else
		stonemove()
	end
end

function shutmenu()
	if halfmenu == true then
		tap(973, 1831,tapms,tapimg)
	end
end

function farmmove()
	if shanhushi == 0 then
		if multiColor({{  146, 1093, 0xffffff},{  146, 1085, 0xffffff},{  150, 1072, 0xffffff}}) == false then--珊瑚未开
			tap(146, 1085,tapms,tapimg)
		else
			x,y = findMultiColorInRegionFuzzy( 0x93db49, "-4|13|0xffffff,-25|27|0xffffff,20|38|0xffffff", 90, 17, 702, 109, 798)--海带农场
			if x == -1 then
				moveTo(w/2,h-400,w/2,h-200,10)
			end
		end
	end
end

function farm()
	if shanhushi == 0 then
		x,y = findMultiColorInRegionFuzzy( 0x512790, "-1|3|0x522593,-7|0|0x4e2988", 90, 42, 209, 79, 240)--半屏海胆
		if x ~= -1 then
			tap(x,314,tapms,tapimg)
			mSleep(500)
			toast("收割海胆~")
		end
		x,y = findMultiColorInRegionFuzzy( 0x7cca9c, "6|-5|0x7fc792,12|-11|0x83c68e,10|-1|0x67aba6", 90, 117, 172, 151, 199)--半屏海带
		if x ~= -1 then
			tap(x,247,tapms,tapimg)
			mSleep(500)
			toast("收割海带~")
		end
		x,y = findMultiColorInRegionFuzzy( 0xfef4ff, "3|-1|0xfff6ff,2|6|0xffffff,6|5|0xffffff,7|11|0xfef7ff", 90, 572, 187, 602, 216)--半屏贝壳
		if x ~= -1 then
			tap(x,264,tapms,tapimg)
			mSleep(500)
			toast("收割贝壳~")
		end
		x,y = findMultiColorInRegionFuzzy( 0x6c23ab, "-2|2|0x6825a6,2|-3|0x6925a2", 90, 60, 465, 89, 490)--全屏海胆
		if x ~= -1 then
			tap(x,558,tapms,tapimg)
			mSleep(500)
			toast("收割海胆~")
		end
		x,y = findMultiColorInRegionFuzzy( 0x97c6ab, "-5|5|0x94c9b2,6|-5|0x9dc5a6,4|3|0x81acbc", 90, 127, 430, 161, 456)--全屏海带
		if x ~= -1 then
			tap(x,514,tapms,tapimg)
			mSleep(500)
			toast("收割海带~")
		end
		x,y = findMultiColorInRegionFuzzy( 0xfff4ff, "2|0|0xfff5ff,1|6|0xffffff,5|4|0xffffff", 90, 565, 439, 591, 466)--全屏贝壳
		if x ~= -1 then
			tap(x,506,tapms,tapimg)
			mSleep(500)
			toast("收割贝壳~")
		end
	end
end

function stoneup()
	if shanhushi == 0 then
		x,y = findMultiColorInRegionFuzzy( 0xfbae17, "68|1|0xfbae17,-1|67|0xfbae17,72|68|0xfbae17", 90, 14, 787, 116, 1183)--获取升级奖励
		if x ~= -1 then
			tap(x,y,tapms,tapimg)
		end
		x1,y1=763,1513
		multiColTap({
				{  x1, y1, 0x1095b4},
				{ x1+260, y1, 0x1095b4},
				{  x1, y1+110, 0x1095b4},
				{ x1+260, y1+110, 0x1095b4},
			})--升级珊瑚石（蓝色）
		multiColTap({
				{   x1, y1, 0x223042},
				{   x1+260, y1, 0x223042},
				{  x1, y1+110, 0xe8972d},
				{  x1+260, y1+110, 0xe8972d},
			})--升级珊瑚石（黄色）
	end
end

function stoneskill()
	if shanhushi == 0 then
		multiColTap({
				{  110,  880, 0xf9f9f9},
				{  122,  880, 0xf9f9f9},
				{  141,  881, 0xf9f9f9},
			})--火山爆发
		multiColTap({
				{  422,  893, 0x2f7496},
				{  417,  929, 0x172e3f},
				{  441,  928, 0xececec},
			})--月之歌
		multiColTap({
				{  275,  874, 0xe9566e},
				{  279,  881, 0xe9566e},
				{  295,  875, 0xdb4964},
			})--海鲜大餐
	end
end
