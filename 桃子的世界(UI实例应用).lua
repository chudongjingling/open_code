init("0",0);luaExitIfCall(true)
local w, h = getScreenSize()
State={	["记录"] = false,
		["IP"] = "192.168.1.89",
		["Bid"] = "Tao",
		["Path"] = "/User/Media/TouchSprite/lua/",
		["屏幕宽"] = w,
		["屏幕高"] = h,
		["随机常量"] = 0,
		["move"] = "/User/Media/TouchSprite/Uber_Move.txt",
		["姓氏"]="赵钱孙李周吴郑王冯陈褚卫蒋沈韩杨朱秦尤许何吕施张孔曹严华金魏陶" ..
			"姜戚谢邹喻柏水窦章云苏潘葛奚范彭郎鲁韦昌马苗凤花方俞任袁柳酆鲍" ..
			"史唐费廉岑薛雷贺倪汤滕殷罗毕郝邬安常乐于时傅皮卞齐康伍余元卜顾" ..
			"孟平黄和穆萧尹姚邵湛汪祁毛禹狄米贝明臧计伏成戴谈宋茅庞熊纪舒屈" ..
			"项祝董梁杜阮蓝闵席季麻强贾路娄危江童颜郭梅盛林刁钟徐邱骆高夏蔡" ..
			"田樊胡凌霍虞万支柯咎管卢莫经房裘缪干解应宗宣丁贲邓郁单杭洪包诸" ..
			"左石崔吉钮龚程嵇邢滑裴陆荣翁荀羊於惠甄曲家封芮羿储靳汲邴糜松井" ..
			"段富巫乌焦巴弓牧隗山谷车侯宓蓬全郗班仰秋仲伊宫宁仇栾暴甘钭厉戎" ..
			"祖武符刘景詹束龙叶幸司韶郜黎蓟薄印宿白怀蒲邰从鄂索咸籍赖卓蔺屠" ..
			"蒙池乔阴鬱胥能苍双闻莘党翟谭贡劳逄姬申扶堵冉宰郦雍却璩桑桂濮牛" ..
			"寿通边扈燕冀郟浦尚农温别庄晏柴瞿阎充慕连茹习宦艾鱼容向古易慎戈" ..
			"廖庾终暨居衡步都耿满弘匡国文寇广禄阙东欧殳沃利蔚越夔隆师巩厍聂" ..
			"晁勾敖融冷訾辛阚那简饶空曾毋沙乜养鞠须丰巢关蒯相查后荆红游竺权" ..
			"逯盖益桓公万俟司马上官欧阳夏侯诸葛闻人东方赫连皇甫尉迟公羊澹台" ..
			"公冶宗政濮阳淳于单于太叔申屠公孙仲孙轩辕令狐钟离宇文长孙慕容鲜" ..
			"于闾丘司徒司空亓官司寇仉督子车颛孙端木巫马公西漆雕乐正壤驷公良" ..
			"拓拔夹谷宰父谷粱晋楚闫法汝鄢涂钦段干百里东郭南门呼延归海羊舌微" ..
			"生岳帅缑亢况后有琴梁丘左丘东门西门商牟佘佴伯赏南宫墨哈谯笪年爱" ..
			"阳佟第五言福百家姓终",
		["名字"]="安彤含祖赩涤彰爵舞深群适渺辞莞延稷桦赐帅适亭濮存城稷澄添悟绢绢澹迪婕箫识悟舞添剑深禄延涤" ..
			"濮存罡禄瑛瑛嗣嫚朵寅添渟黎臻舞绢城骥彰渺禾教祖剑黎莞咸浓芦澹帅臻渟添禾亭添亭霖深策臻稷辞" ..
			"悟悟澄涉城鸥黎悟乔恒黎鲲涉莞霖甲深婕乔程澹男岳深涉益澹悟箫乔多职适芦瑛澄婕朵适祖霖瑛坤嫚" ..
			"涉男珂箫芦黎珹绢芦程识嗣珂瑰枝允黎庸嗣赐罡纵添禄霖男延甲彰咸稷箫岳悟职祖恒珂庸琅男莞庸浓" ..
			"多罡延瑛濮存爵添剑益骥澄延迪寅婕程霖识瑰识程群教朵悟舞岳浓箫城适程禾嫚罡咸职铃爵渺添辞嫚" ..
			"浓寅鲲嗣瑛鸥多教瑛迪坤铃珹群黎益澄程莞深坤澹禄职澹赩澄藉群箫骥定彰寅臻渟枝允珹深群黎甲鲲" ..
			"亭黎藏浓涤渟莞寅辞嗣坤迪嫚添策庸策藉瑰彰箫益莞渺乔彰延舞祖婕澹渺鸥纵嗣瑛藏濮存婕职程芦群" ..
			"禾嫚程辞祖黎职浓桦藏渟禾彰帅辞铃铃黎允绢濮存剑辞禾瑰添延添悟赐祖咸莞男绢策婕藉禾浓珹涤祖" ..
			"汉骥舞瑛多稷赐莞渟黎舞桦黎群藏渺黎坤桦咸迪澈舞允稷咸剑定亭澄濮存鲲臻全鸥多赐程添瑛亭帅悟" ..
			"甲男帅涤适纵渟鲲亭悟琅亭添允舞禾庸咸瑛教鲲允箫芦允瑛咸鸥帅悟延珂黎珹箫爵剑霖剑霖禄鸥悟涉" ..
			"彰群悟辞帅渺莞澄桦瑛适臻益霖珹亭澹辞坤程嗣铃箫策澈枝赐莞爵渟禄群枝添芦群浓赐职益城澄赩琅" ..
			"延群乔珹鲲祖群悟黎定庸澄芦延霖罡鲲咸渺纵亭禄鸥赩涤剑澹藏纵濮存澄芦剑延瑰稷黎益赩澄允悟澈" ..
			"甲嗣绢朵益甲悟涤婕群咸臻箫鲲寅鸥桦益珂舞允庸芦藉寅渺咸赐澄程剑瑰霖瑰铃帅男铃悟识瑰仕仕城" ..
			"允莞全朵涤铃剑渺稷剑珂铃箫全仕益纵芦桦珂濮存城朵朵咸程剑澄定澈爵寅庸定莞瑛教彰黎箫仕黎桦" ..
			"赩深赩爵迪悟珹涤琅添箫桦帅瑛黎黎策识寅嫚涉迪策汉舞定彰允男祖教澄群瑛濮存男禾教莞禾鸥澈濮" ..
			"存岳城嫚深舞教岳澄亭禾坤朵亭职莞稷寅瑰城庸亭舞禾瑛恒坤浓彰莞澄澈鸥臻稷教琅辞益剑藉黎添瑛" ..
			"延舞坤仕岳多婕骥迪帅黎悟全澄识益甲桦纵适罡彰澄禾婕程黎城涤浓枝箫咸渟岳渟澹臻珹识珹澄箫辞" ..
			"浓鲲识悟允悟禾识群祖迪渟鲲群庸莞珹悟澹瑰悟鸥汉群甲莞庸职琅莞桦鲲朵深乔辞允彰渺朵瑰亭瑰朵" ..
			"定深男识群职霖益男舞城允舞爵赩枝罡罡群澹芦藉爵悟渟澹禾多庸箫坤乔芦甲濮存多渟藉珹赐汉纵亭" ..
			"禾城枝剑露以玉春飞慧娜悠亦元晔曜霜宁桃彦仪雨琴青筠逸曼代菀孤昆秋蕊语莺丝红羲盛静南淑震晴" ..
			"彭祯山霞凝柔隽松翠高骊雅念皓双洛紫瑞英思歆蓉娟波芸荷笑云若宏夏妍嘉彩如鹏寄芝柳凌莹蝶舒恬" ..
			"虹清爽月巧乾勋翰芳罗刚鸿运枫阳葳杰怀悦凡哲瑶凯然尚丹奇弘顺依雪菡君畅白振馨寻涵问洁辉忆傲" ..
			"伟经润志华兰芹修晨木宛俊博韶天锐溪燕家沈放明光千永溶昊梅巍真尔馥莲怜惜佳广香宇槐珺芷帆秀" ..
			"理柏书沛琪仙之竹向卉欣旻晓冬幻和雁淳浩歌荣懿文幼岚昕牧绿轩工旭颜醉玑卓觅叶夜灵胜晗恨流佁" ..
			"乐火音采睿翎萱民画梦寒泽怡丽心石邵玮佑旺壮名一学谷韵宜冰赫新蕾美晖项琳平树又炳骏气海毅敬" ..
			"曦婉爰伯珊影鲸容晶婷林子昌梧芙澍诗星冉初映善越原茂国腾孟水烟半峯莉绮德慈敏才戈梓景智盼霁" ..
			"琇苗熙姝从谊风发钰玛忍婀菲昶可荌小倩妙涛姗方图迎惠晤宣康娅玟奕锦濯穆禧伶丰良祺珍曲喆扬拔" ..
			"驰绣烁叡长雯颖辰慕承远彬斯薇成聪爱朋萦田致世实愫进瀚朝强铭煦朗精艺熹建忻晏冷佩东古坚滨菱" ..
			"囡银咏正儿瑜宝蔓端蓓芬碧人开珠昂琬洋璠桐舟姣琛亮煊信今年庄淼沙黛烨楠桂斐胤骄兴尘河晋卿易" ..
			"愉蕴雄访湛蓝媛骞娴儒妮旋友娇泰基礼芮羽妞意翔岑苑暖玥尧璇阔燎偲靖行瑾资漪晟冠同齐复吉豆唱" ..
			"韫素盈密富其翮熠绍澎淡韦诚滢知鹍苒抒艳义婧闳琦壤杨芃洲阵璟茵驹涆来捷嫒圣吟恺璞西旎俨颂灿" ..
			"情玄利痴蕙力潍听磊宸笛中好任轶玲螺郁畴会暄峻略琼琰默池温炫季雰司杉觉维饮湉许宵茉贤昱蕤珑" ..
			"锋纬渊超萍嫔大霏楚通邈飙霓谧令厚本邃合宾沉昭峰业豪达彗纳飒壁施欢姮甫湘漾闲恩莎祥启煜鸣品" ..
			"希融野化钊仲蔚生攸能衍菁迈望起微鹤荫靓娥泓金琨筱赞典勇斌媚寿喜飇濡宕茜魁立裕弼翼央莘绚焱" ..
			"奥萝米衣森荃航璧为跃蒙庆琲倚穹武甜璐俏茹悌格穰皛璎龙材湃农福旷童亘苇范寰瓃忠虎颐蓄霈言禹" ..
			"章花健炎籁暮升葛贞侠专懋澜量纶布皎源耀鸾慨曾优栋妃游乃用路余珉藻耘军芊日赡勃卫载时三闵姿" ..
			"麦瑗泉郎怿惬萌照夫鑫樱琭钧掣芫侬丁育浦磬献苓翱雍婵阑女北未陶干自作伦珧溥桀州荏举杏茗洽焕" ..
			"吹甘硕赋漠颀妤诺展俐朔菊秉苍津空洮济尹周江荡简莱榆贝萧艾仁漫锟谨魄蔼豫纯翊堂嫣誉邦果暎珏" ..
			"临勤墨薄颉棠羡浚兆环铄"
}
function iif(a,b,c) if a then return b else return c end end

State["属性"] = {
	["名字"] = "",
	["QQ"] = "",
	["攻击力"] = 0,
	["防御力"] = 0,
	["血量"] = 0,
	["等级"] = 0,
	["经验"] = 0,
	["金钱"] = 0,
	["武器"] = {}
	}

State["评价"] = {"有个性","幽默","有责任心","好学","勤奋","是非分明","坚强","开朗","爱国","孜孜不倦","拼搏","自信","高尚","伟岸","出淤泥而不染","幽默","智慧","热心","细心","乐观","谦虚","老实","积极向上","有涵养","心灵手巧","大公无私","大义凛然","平易近人","奋不顾身","持之以恒","舍己为人","光明磊落","忍辱负重","对答如流","足智多谋","学贯中西","一丝不苟","专心致志","手不释卷","滔滔不绝","坚持不懈","锲而不舍","举一反三","才华横溢"}

State["怪物"] = {
	["桃子"] = {
		["攻击力"]=1,
		["防御力"] = 1,
		["血量"]=1,
		["技能"]="逃跑",
		["掉落"]="",
		["QQ"]="270001300"
		},
	["煭鎽"] = {
		["攻击力"]=10,
		["防御力"] = 0,
		["血量"]=20,
		["技能"]="被调戏",
		["掉落"]="",
		["QQ"]="313113385"
		},
	["瞌睡猫"] = {
		["攻击力"]=5,
		["防御力"] = 0,
		["血量"]=80,
		["技能"]="遇挂b",
		["掉落"]="",
		["QQ"]="316608269"
		},
	["Ke"] = {
		["攻击力"]=19,
		["防御力"] = 0,
		["血量"]=50,
		["技能"]="调戏",
		["掉落"]="",
		["QQ"]="825742"
		},
	["老猫"] = {
		["攻击力"]=29,
		["防御力"] = 0,
		["血量"]=80,
		["技能"]="无限收藏",
		["掉落"]="",
		["QQ"]="9585808"
	},
	["嘎嘎嘎"] = {
		["攻击力"]=39,
		["防御力"] = 0,
		["血量"]=100,
		["技能"]="汪汪汪",
		["掉落"]="",
		["QQ"]="358182209"
	},
	["T-BUG"] = {
		["攻击力"]=49,
		["防御力"] = 0,
		["血量"]=150,
		["技能"]="无人问津",
		["掉落"]="",
		["QQ"]="278833100"
	},
	["lonelyなwind"] = {
		["攻击力"]=59,
		["防御力"] = 0,
		["血量"]=200,
		["技能"]="种子服务器集群",
		["掉落"]="",
		["QQ"]="328872308"
	},
	["丫丫"] = {
		["攻击力"]=69,
		["防御力"] = 0,
		["血量"]=300,
		["技能"]="大小姐的愤怒",
		["掉落"]="",
		["QQ"]="2728108294"
	},
	["首付"] = {
		["攻击力"]=79,
		["防御力"] = 0,
		["血量"]=79,
		["技能"]="雇凶刺杀",
		["掉落"]="",
		["QQ"]="714015086"
	},
	["苏泽"] = {
		["攻击力"]=89,
		["防御力"] = 0,
		["血量"]=89,
		["技能"]="200T的种子",
		["掉落"]="",
		["QQ"]="1004695100"
	},
	["坑大"] = {
		["攻击力"]=99,
		["防御力"] = 0,
		["血量"]=99,
		["技能"]="看手册去",
		["掉落"]="",
		["QQ"]="133856"
	},
	["F大"] = {
		["攻击力"]=900,
		["防御力"] = 0,
		["血量"]=900,
		["技能"]="背后的菊花",
		["掉落"]="",
		["QQ"]="1923598063"
	},
	["皇上"] = {
		["攻击力"]=1000,
		["防御力"] = 0,
		["血量"]=1000,
		["技能"]="白苹果",
		["掉落"]="触动授权号",
		["QQ"]="2192400484"
	},
}

function Main()
	Start()
	while true do
		Go()
	end
end

function Go()
	local GW = {}
	for _,srk in pairs(State["怪物"]) do
		table.insert(GW,_)
	end
	os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite");	--避免触动大姨妈
	local UIRet, UISet, UISave = 0, {}, State["Bid"].."_Set.dat"
	local StrUI = {
		{["type"]="Label",	["size"]=20,	["align"]="left",	["color"]="50,50,50",	["text"]="属性"},
		{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="名字:" .. State["属性"]["名字"]},
		{["type"]="Image",	["src"]=GetHeadFace(State["属性"]["QQ"])},
		{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="攻击力:" .. State["属性"]["攻击力"]},
		{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="防御力:" .. State["属性"]["防御力"]},
		{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="血量:" .. State["属性"]["血量"]},
		{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="等级:" .. State["属性"]["等级"]},
		{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="经验:" .. State["属性"]["经验"] .. "/" .. (100 * State["属性"]["等级"])},
		{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="金钱:" .. State["属性"]["金钱"] .. "(然并卵)"},
		{["type"]="Label",	["size"]=20,	["align"]="left",	["color"]="50,50,50",	["text"]="选择攻击哪个家伙"},
		{["type"]="RadioGroup",				["list"]=table.concat(GW, ","),		["select"]="0"},
	}
	UIRet, UISet[1], UISet[2], UISet[3], UISet[4], UISet[5], UISet[6], UISet[7], UISet[8], UISet[9], UISet[10], UISet[11], UISet[12], UISet[13], UISet[14], UISet[15], UISet[16] = showUI([[{
		"style": "default", 
		"width": ]]..State["屏幕宽"]..[[,
		"height": ]]..State["屏幕高"]..[[,
		"cancelname": "没保存哦",
		"okname": "确认执行",
		"views": []]..string.sub(TableToJson(StrUI),2,-2)..[[]  
	}]])
	if tonumber(UIRet)==0 then lua_exit() end 
	F_SavesW("/User/Media/TouchSprite/config/" .. UISave, "ui_input::::" .. table.concat(UISet, "###"))
	local NowGw = copyTab(State["怪物"][GW[UISet[1]+1]])
	local NowGwName = GW[UISet[1]+1]
	--[[
	while true do
		Str = tonumber("1." .. Rnd_Word("0123456789",5)) * State["属性"]["攻击力"]
		dialog("你 攻击 " .. NowGwName .. "\n\n掉血" .. Str,1)
		NowGw["血量"] = NowGw["血量"] - Str
		if NowGw["血量"] < 0 then break end
		
		Str = tonumber("1." .. Rnd_Word("0123456789",5)) * NowGw["攻击力"]
		dialog(NowGwName .. " 攻击 你" .. "\n\n" .. iif(Rnd_Word("01",1) == "0","\n使用技能 " .. NowGw["技能"] .. "\n","") .. "掉血" .. Str,1)
		State["属性"]["血量"] = State["属性"]["血量"] - Str
		if State["属性"]["血量"] < 0 then break end
	end
	--]]
	VS(NowGwName,NowGw)
	if State["属性"]["血量"] < 0 then dialog("骚年你挂了",0);lua_exit() end	
	
	GetL = tonumber("1." .. Rnd_Word("0123456789",5)) * NowGw["攻击力"]
	State["随机常量"] = State["随机常量"] + GetL
	State["属性"]["经验"] = State["属性"]["经验"] + GetL
	
	GetM = tonumber("1." .. Rnd_Word("0123456789",5)) * NowGw["攻击力"]
	State["随机常量"] = State["随机常量"] + GetM
	State["属性"]["金钱"] = State["属性"]["金钱"] + GetM
	
	dialog("恭喜你击败了" .. NowGwName .. "\n获得经验:" .. GetL .. "\n获得金钱:" .. GetM,5)
	
	if (State["属性"]["经验"] / (100 * State["属性"]["等级"]) ) >= State["属性"]["等级"] then
		State["属性"]["等级"] = State["属性"]["等级"] + 1
		State["属性"]["攻击力"] = State["属性"]["等级"] * 10
		State["属性"]["血量"] = State["属性"]["血量"] + (State["属性"]["等级"] * 10)
		dialog("等级提升至" .. State["属性"]["等级"] .. "\n\n攻击力:" .. State["属性"]["攻击力"] .. "血量:" .. State["属性"]["血量"],5)
	end 
end

function VS(NowGwName,NowGw)
	local JLTmp = ""
	F_SavesW("/User/Media/TouchSprite/config/" .. "VS_Set.dat", "ui_input::::" .. table.concat({}, "###"))
	while true do
		Str = tonumber("1." .. Rnd_Word("0123456789",5)) * State["属性"]["攻击力"]
		NowGw["血量"] = NowGw["血量"] - Str
		JLTmp = JLTmp .. "你 攻击 " .. NowGwName .. " 掉血" .. Str .. "\\n"
		os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite");	--避免触动大姨妈
		local UIRet, UISet, UISave = 0, {}, "VS_Set.dat"
		local StrUI = {
			{["type"]="Label",	["size"]=20,	["align"]="left",	["color"]="50,50,50",	["text"]="属性"},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="名字:" .. State["属性"]["名字"]},
			{["type"]="Image",	["src"]=GetHeadFace(State["属性"]["QQ"])},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="攻击力:" .. State["属性"]["攻击力"]},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="防御力:" .. State["属性"]["防御力"]},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="血量:" .. State["属性"]["血量"]},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="等级:" .. State["属性"]["等级"]},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="经验:" .. State["属性"]["经验"] .. "/" .. (100 * State["属性"]["等级"])},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="金钱:" .. State["属性"]["金钱"] .. "(然并卵)"},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="战斗记录:\\n" .. JLTmp},
		}
		showUI([[{
			"style": "default", 
			"config": "]]..UISave..[[",
			"width": ]]..State["屏幕宽"]..[[,
			"height": ]]..State["屏幕高"]..[[,
			"timer": 2,
			"cancelname": "继续",
			"okname": "继续",
			"views": []]..string.sub(TableToJson(StrUI),2,-2)..[[]  
		}]])
		if NowGw["血量"] < 0 then break end
		
		Str = tonumber("1." .. Rnd_Word("0123456789",5)) * NowGw["攻击力"]
		JLTmp = JLTmp .. NowGwName .. " 攻击 你" .. iif(Rnd_Word("01",1) == "0"," 使用技能 " .. NowGw["技能"],"") .. " 掉血" .. Str .. "\\n"
		State["属性"]["血量"] = State["属性"]["血量"] - Str
		os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite");	--避免触动大姨妈
		local UIRet, UISet, UISave = 0, {}, "VS_Set.dat"
		local StrUI = {
			{["type"]="Label",	["size"]=20,	["align"]="left",	["color"]="50,50,50",	["text"]="怪物属性"},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="名字:" .. NowGwName},
			{["type"]="Image",	["src"]=GetHeadFace(NowGw["QQ"])},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="攻击力:" .. NowGw["攻击力"]},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="防御力:" .. NowGw["防御力"]},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="血量:" .. NowGw["血量"]},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="技能:" .. NowGw["技能"]},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="掉落:" .. NowGw["掉落"]},
			{["type"]="Label",	["size"]=15,	["align"]="left",	["color"]="50,50,50",	["text"]="战斗记录:" .. JLTmp},
		}
		showUI([[{
			"style": "default", 
			"config": "]]..UISave..[[",
			"width": ]]..State["屏幕宽"]..[[,
			"height": ]]..State["屏幕高"]..[[,
			"timer": 2,
			"cancelname": "继续",
			"okname": "继续",
			"views": []]..string.sub(TableToJson(StrUI),2,-2)..[[]  
		}]])
		if State["属性"]["血量"] < 0 then break end
	end
end

function Start()
	os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite");	--避免触动大姨妈
	local UIRet, UISet, UISave = 0, {}, State["Bid"].."_Set.dat"
	local StrUI = {
		{["type"]="Label",	["size"]=25,	["align"]="center",	["color"]="255,50,50",	["text"]="欢迎来到桃子的世界"},
		{["type"]="Label",	["size"]=25,	["align"]="center",	["color"]="50,50,50",	["text"]="大侠来起个卖萌的名字吧",},
		{["type"]="Edit",	["size"]=15,	["align"]="left",	["color"]="0,0,0",		["prompt"]="", 	["text"]=Rnd_Word(State["姓氏"],1,3)..Rnd_Word(State["名字"],2,3),}, 
		{["type"]="Label",	["size"]=25,	["align"]="center",	["color"]="50,50,50",	["text"]="你的扣扣号",},
		{["type"]="Edit",	["size"]=15,	["align"]="left",	["color"]="0,0,0",		["prompt"]="", 	["text"]=""}, 
		--{["type"]="Label",	["size"]=15,	["align"]="center",	["color"]="50,50,50",	["text"]="选择一个身世",},
		--{["type"]="RadioGroup",				["list"]=table.concat(State["身世"], ","),	["select"]="0"},
		{["type"]="Label",	["size"]=25,	["align"]="center",	["color"]="50,50,50",	["text"]="请真实填写个人性格",},
		{["type"]="CheckBoxGroup",		["list"]=table.concat(State["评价"], ","),			["select"]=(function() local TmpStr = "";for _,srk in pairs(State["评价"]) do TmpStr = TmpStr .. _ .. "@" end return TmpStr end)()},

	}
	UIRet, UISet[1], UISet[2], UISet[3], UISet[4], UISet[5], UISet[6], UISet[7], UISet[8], UISet[9], UISet[10], UISet[11], UISet[12], UISet[13], UISet[14], UISet[15], UISet[16] = showUI([[{
		"style": "default", 
		"width": ]]..State["屏幕宽"]..[[,
		"height": ]]..State["屏幕高"]..[[,
		"cancelname": "左手撸习惯",
		"okname": "确认执行",
		"views": []]..string.sub(TableToJson(StrUI),2,-2)..[[]  
	}]])
	if tonumber(UIRet)==0 then lua_exit() end 
	F_SavesW("/User/Media/TouchSprite/config/" .. UISave, "ui_input::::" .. table.concat(UISet, "###"))
	
	State["属性"]["名字"] = UISet[1]
	State["属性"]["攻击力"] = 90
	State["属性"]["防御力"] = 90
	for _,srk in pairs(Split(UISet[3],"@")) do
		State["属性"]["攻击力"] = State["属性"]["攻击力"] - 2
		State["属性"]["防御力"] = State["属性"]["防御力"] - 2
	end
	State["属性"]["QQ"] = UISet[2]
	State["属性"]["血量"] = 100
	State["属性"]["等级"] = 1
	State["属性"]["经验"] = 0
	State["属性"]["金钱"] = 1000
	
end

function GetHeadFace(QQ)
	if QQ ~= "" then 
		return "http://q2.qlogo.cn/headimg_dl?bs=" .. QQ .. "&dst_uin=" .. QQ .. "&dst_uin=" .. QQ .. "&dst_uin=" .. QQ .. "&spec=100&url_enc=0&referer=bu_interface&term_type=PC"
	else
		return ""
	end
end

--[[拆分脚本]]
function Split(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
		local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
		if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
			break
		end
		nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
		nFindStartIndex = nFindLastIndex + string.len(szSeparator)
		nSplitIndex = nSplitIndex + 1
	end
	return nSplitArray
end

--[[Table to Json]]
function TableToJson(t)  
    local function serialize(tbl)  
        local tmp = {}  
        for k, v in pairs(tbl) do
            local k_type = type(k)  
            local v_type = type(v)  
            local key = (k_type == "string" and "\"" .. k .. "\":") or (k_type == "number" and "")  
            local value = (v_type == "table" and serialize(v))  
                    or (v_type == "boolean" and tostring(v))  
                    or (v_type == "string" and "\"" .. v .. "\"")  
                    or (v_type == "number" and v)  
            tmp[#tmp + 1] = key and value and tostring(key) .. tostring(value) or nil  
        end
        return "{" .. table.concat(tmp, ",") .. "}"  
    end  
    assert(type(t) == "table")  
    return serialize(t)  
end

function copyTab(st)
    local tab = {}
    for k, v in pairs(st or {}) do
        if type(v) ~= "table" then
            tab[k] = v
        else
            tab[k] = copyTab(v)
        end
    end
    return tab
end

--[[读取指定文件
Str = F_Read("c:/1.txt")]]
function F_Read(File)
	if F_Exist(File) then 
		local f = assert(io.open(File, "r"))
		local string = f:read("*all")
		f:close()
		return string
	else
		return nil
	end
end

--[[判断文件是否存在
Boo = IsSave("c:/1.txt")]]
function F_Exist(File)
	local Boo = true
	local F,Err=io.open(File,"r+");
	if Err==nil then 
		Boo=true
		F:close();
	else
		Boo=false
	end
	return Boo
end

--[[写入文件内容(原有基础上追加写入)
nil = F_SavesA("7364235F")]]
function F_SavesA(File,text)
	local sFlie=io.open(File,"a+");
	sFlie:write(text .. "\r\n");
	sFlie:close();
end

--[[写入文件内容(直接清空写入)
nil = F_SavesW("7364235F")]]
function F_SavesW(File, text)
	local sFlie = io.open(File, "w") 
	sFlie:write(text); 
	sFlie:close() 
end

--[[删除文件
nil = F_Del("c:/1.txt")]]
function F_Del(File)
	os.remove(File)
end

--[[读取位置数据(文件不存在则为1)
--Int = Load_Location("c:/1.txt")]]
function Load_Location(File)
	local L = F_Read(File)
	if L then 
		if string.match(L,"%d+") then
			return tonumber(string.match(L,"(%d+)"))
		else
			return 1
		end
	else
		return 1
	end
end

--[[转换字符为账号密码形态
U,P = ToUserPass("asdas-4897489")]]
function ToUserPass(text)
	if text~= nil and string.find(text,"-")~=nil then 
		return string.match(text, "([^-]*)[-]*([^%c-]*)[-]*([^%c-]*)[-]*([^%c-]*)[-]*([^%c-]*)[-]*([^%c-]*)")
	else
		return "",""
	end
end

--[[随机内容(UTF-8中文字符占3个字符)
"0123456789"
"abcdefghyjklmnopqrstuvwxyz"
Str = Rnd_Word("abcdefghyjklmnopqrstuvwxyz",5)
Str = Rnd_Word("敢达收费高速到法国",5,3)]]
function Rnd_Word(strs,i,Length)
	local ret=""
	local z
	if Length == nil then Length = 1 end
	math.randomseed(tostring(os.time()):reverse():sub(1, 6)+State["随机常量"])  
	math.random(string.len(strs)/Length)
	for i=1, i do
		z=math.random(string.len(strs)/Length)
		ret = ret..string.sub(strs,(z*Length)-(Length-1),(z*Length))
	end
	return(ret)
end
State["随机常量"] = tonumber(Rnd_Word("0123456789",5))

Main()

