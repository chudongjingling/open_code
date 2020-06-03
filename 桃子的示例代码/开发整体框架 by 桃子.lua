init("0",0);luaExitIfCall(true)
local w, h = getScreenSize()
State={     ["记录"] = false,                                        --远程调试是否开启
	["IP"] = "192.168.1.88",                        --调试服务器IP
	["Bid"] = "com.tencent.mqq",
	["屏幕宽"] = w,
	["屏幕高"] = h,
	["随机常量"] = 0,
	["Path"] = "/User/Media/TouchSprite/lua/",
	["Move"] = "/User/Media/TouchSprite/QQ_Move.txt",
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

if State["记录"] then initLog(State["IP"],3) end
--[[远程调试内容反馈
Str = Addlog(Str)
Int = Addlog(Int)
nil = Addlog(nil)
function = Addlog(function)
table = Addlog(table)
....
]]
function AddLog(text) if State["记录"] then        wLog(State["IP"],tostring(text)) end return text end --有需要自己加 [DATE]
--[[iif功能添加
  
a=true
b=iif(a,b,c)
  
a=false
c=iif(a,b,c)
  
]]
	function iif(a,b,c) if a then return b else return c end end
--[[VB 习惯msgbox
nil = msgbox("aaaa")
]]
		function msgbox(text) dialog(text,0);mSleep(500) end

--主窗体
		function main()
			----------------------------------------------------------------------------------------------
			--UI部分

			--避免触动大姨妈
			os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite");
			local UIRet, UISet, UISave = 0, {}, State["Bid"] .. "_Set.dat"
			local StrUI = {
				{["type"]="Label",                ["text"]="主账号",                        ["size"]=15,                ["align"]="center",        ["color"]="50,50,50"},
				{["type"]="RadioGroup",        ["list"]="单一(下方填写),来自文件<主账号.txt>",        ["select"]="0"},
				{["type"]="Edit",                ["prompt"]="账号",                        ["text"]="",                ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"}, 
				{["type"]="Edit",                ["prompt"]="密码",                        ["text"]="",                ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"}, 
				{["type"]="RadioGroup",        ["list"]="接码,本地猫池",        ["select"]="0"},
			}
			--多弄不影响
			UIRet, UISet[1], UISet[2], UISet[3], UISet[4], UISet[5], UISet[6], UISet[7], UISet[8], UISet[9], UISet[10], UISet[11], UISet[12], UISet[13], UISet[14], UISet[15] = showUI([[{
                "style": "default", 
                "config": "]]..UISave..[[",
                "width": ]]..State["屏幕宽"]..[[,
                "height": ]]..State["屏幕高"]..[[,
                "cancelname": "不执行退出",
                "okname": "确认执行",
                "views": []]..string.sub(TableToJson(StrUI),2,-2)..[[]  
        }]])
		if tonumber(UIRet)==0 then lua_exit() end        --点击取消退出
		--避免触动大姨妈
		F_SavesW("/User/Media/TouchSprite/config/" .. UISave, "ui_input::::" .. table.concat(UISet, "###"))



		----------------------------------------------------------------------------------------------
		--执行部分










		Sub()












	end

	function Sub(Str)

		dialog(Sub)







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

--[[获取文件内容转换成数组(空行会跳过,types为格式空则无格式要求)
Array = F_ToArray("c:/1.txt","%d+")]]
	function F_ToArray(File,types)
		local File_Ob,File_Line=0,0;
		local Ret_Arr={}; 
		if F_Exist(File) == false then return {} end
		local File_Ob = assert(io.open(File,"r"))
		for File_Line in File_Ob:lines() do
			if types == nil and File_Line~="" then
				table.insert(Ret_Arr, File_Line)
			end
			if types ~= nil and string.match(File_Line,types)~="" then
				table.insert(Ret_Arr, string.match(File_Line,types))
			end
		end
		File_Ob:close()

		return Ret_Arr;
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

--[[读取指定文件十六进制
Str = F_ReadHex("c:/1.txt")]]
	function F_ReadHex(File)
		local F,Err = io.open(File, "rb")
		local HexStr=""
		if Err==nil then
			while true do
				local bytes = F:read(1)
				if not bytes then break end
				HexStr = HexStr ..  string.format("%02X", string.byte(bytes))
			end
			F:close();
			return HexStr
		else
			return ""
		end
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

--[[加载lua文件
nil = Load_Lua("s")]]
	function Load_Lua(File)
		package.loaded[File] = nil
		local Path="/User/Media/TouchSprite/lua/"
		if F_Exist(Path..File..".lua") then 
			require(File)
			return true
		else
			dialog(File..".lua\n文件不存在\n请搭配好环境",3)
			return false
		end
	end

--[[转换文本到16进制
Str = StrToHex("sd#_")]]
	function StrToHex(Text)
		local TmpHex = ""
		for l = 1 , string.len(Text) do
			TmpHex = TmpHex .. string.format("%02X",string.byte(Text,l))
		end
		return TmpHex
	end

--[[转换16进制到文本
Str = HexToStr("7364235F")]]
	function HexToStr(Text)
		local TmpStr = ""
		for l = 1 , (string.len(Text)/2) do
			TmpStr = TmpStr .. string.char(tonumber("0x"..string.sub(Text,(l*2)-1,(l*2))))
		end
		return TmpStr
	end

--[[点击一个位置(t如果不填写则点击20毫秒)
nil = Click_XY(100,200,10)]]
	function Click_XY(x,y,t)
		touchDown(1, x, y)
		if t then mSleep(tonumber(t)) else mSleep(20) end
		touchUp(1, x, y)
	end

--[[从一个位置拖动到另一个位置(Step如果不填写则步长默认10个像素)
nil = Click_Move(100,200,200,200)]]
	function Click_Move(x1,y1,x2,y2)
		local Step,x,y = 10,x1,y1
		touchDown(1,x,y)
		local function v(z,c) if z > c then return (-1 * Step) else return Step end end
			while (math.abs(x-x2)>=Step) or (math.abs(y-y2)>=Step) do
				if math.abs(x-x2)>=Step then x = x + v(x1,x2) end
				if math.abs(y-y2)>=Step then y = y + v(y1,y2) end
				touchMove(1, x, y); 
				mSleep(15)
			end
			touchMove(1, x2, y2);
			mSleep(150)
			touchUp(1,x2,y2)
		end

--[[判断两个色彩是否相似(wc为色差不填写为判断100相似)
Boo = C_Diff(0xffffff,0xffffff,90)]]
		function C_Diff(c,c1,wc)
			--local r,g,b = getColorRGB(x, y)
			local r,g,b = C_HextoRGB(c)
			local r1,g1,b1 = C_HextoRGB(c1)
			if wc == nil then if c == c1 then return true else return false end end
			if (math.abs(r-r1)/255)*100 > wc and
			(math.abs(g-g1)/255)*100 > wc and
			(math.abs(b-b1)/255)*100 > wc then
				return true
			else
				return false
			end
		end

--[[16进制色彩转换至RGB色
R,G,B = C_HextoRGB("0xFFFFFF")]]
		function C_HextoRGB(C_Hex)
			return math.modf(C_Hex/65536),
			math.modf(C_Hex/256)%256,
			C_Hex%256
		end

--[[判断指定点与色的相似度(wc为色差不填写为判断100相似)
Boo = isColor(100,200,0xffffff,90)]]
		function isColor(x,y,c,wc)
			local r,g,b = getColorRGB(x, y)
			local r1,g1,b1 = C_HextoRGB(c)
			if wc == nil then if r == r1 and g == g1 and b == b1 then return true else return false end end
			if (math.abs(r-r1)/255)*100 > wc and
			(math.abs(g-g1)/255)*100 > wc and
			(math.abs(b-b1)/255)*100 > wc then
				return true
			else
				return false
			end

		end

--[[判断制定点色是否满足 满足点击(t如果不填写则点击100毫秒)
Boo = isColor_Click(100,200,0xffffff,90)]]
		function isColor_Click(x,y,color,wc,t)
			local iscl=false;
			if isColor(x, y, color) then
				if t then mSleep(tonumber(t)) else mSleep(100) end
				Click_XY(x,y)
				iscl=true
				if t then mSleep(tonumber(t)) else mSleep(100) end
			end
			return iscl;
		end

--[[指定时间内判断一个点是否满足色彩(1t如果不填写则点击100毫秒)
Boo = X_isColor(100,200,0xffffff,9000,200)]]
		function X_isColor(x,y,color,t,t1)
			local iscl,l=false,0;
			for l=1,t/50 do
				if color == getColor(x,y) then 
					if t1 then mSleep(tonumber(t1)) else mSleep(100) end
					iscl=true;
					if t1 then mSleep(tonumber(t1)) else mSleep(100) end

					break
				end
				mSleep(50)
			end
			return iscl;
		end

--[[指定时间内判断一个点是否满足色彩满足点击(1t如果不填写则点击100毫秒)
Boo = X_isColor(100,200,0xffffff,9000,200)]]
		function X_isColor_Click(x,y,color,t,t1)
			local iscl,l=false,0;
			for l =1,t/50 do
				if color == getColor(x,y) then
					if t1 then mSleep(tonumber(t1)) else mSleep(100) end
					Click_XY(x,y);
					iscl=true;
					if t1 then mSleep(tonumber(t1)) else mSleep(100) end
					break
				end
				mSleep(50)
			end
			return iscl;
		end

--[[获取App起始位 和 结束位
From,To = App_FromTo()]]
		function App_FromTo()
			local F,T = 0,0
			while true do
				F,T = dialogInput("设置起始BID与结束BID","从#至","确认")
				if type(F)=="number" and type(T)=="number" then 
					if tonumber(F) > 0 and tonumber(T) > 0 and tonumber(T) > tonumber(F) then 
						return tonumber(F),tonumber(T)
					end
				end
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
  
Str = Rnd_Word("0123456789",5)                                                --获取5个数字
Str = Rnd_Word("abcdefghyjklmnopqrstuvwxyz",5)                --获取5个字母
Str = Rnd_Word("敢达收费高速到法国",5,3)                        --获取5个中文字
  
Str = Rnd_Word(State["Xing"],1,3) .. Rnd_Word(State["Ming"],1,3)        --获取一个名字
  
Str = Rnd_Word("赵钱孙李周吴郑王冯",1) .. Rnd_Word("彤含祖赩涤彰爵舞深群适渺辞莞延",2)  --获取一个名字
Str = Rnd_Word("abcdefghyjklmnopqrstuvwxyz",5)              --随机5位英文
Int = tonumber(Rnd_Word("0123456789",2)) + 1                --获取1-100随机数
Int = (tonumber(Rnd_Word("0123456789",2)) % (4 + 1)) + 1    --获取1-4随机数
]]
		SJ = 0  --定义全局变量
		function Rnd_Word(strs,i)
			local ret=""
			local Length
			local z
			if Length == nil then Length = 1 end
			if string.byte(strs:sub(1,1))>=0x80 then
				Length = 3
			end
			math.randomseed(tostring(os.time()):reverse():sub(1, 6) + SJ)  
			math.random(string.len(strs)/Length)
			for i=1, i do
				z=math.random(string.len(strs)/Length)
				ret = ret..string.sub(strs,(z*Length)-(Length-1),(z*Length))
			end
			return(ret)
		end
		SJ = tonumber(Rnd_Word("0123456789",5)) --产生随机数 避免同时间段 不同设备出现相同随机数

		function ClearBid(Bid)
			closeApp(Bid)
			clearKeyChain(Bid)
			function LastFolder(Path) return string.match(Path, "(.+)/") end
			if type(appDataPath) == "function" and appDataPath(Bid) ~= "" then
				if string.sub(getOSVer(), 1, 1) == "7" then
					mSleep(500)
					os.execute("rm -rf "..LastFolder(appDataPath(Bid)).."/Library/Caches/*") --Library
					os.execute("rm -rf "..LastFolder(appDataPath(Bid)).."/Documents/*")
					os.execute("rm -rf "..LastFolder(appDataPath(Bid)).."/Library/Preferences/" .. Bid .. ".plist")
					mSleep(1000)
					return true
				elseif string.sub(getOSVer(), 1, 1) == "8" then
					mSleep(500)
					os.execute("rm -rf "..(appDataPath(Bid)).."/Library/Caches/*") --Library
					os.execute("rm -rf "..(appDataPath(Bid)).."/Documents/*")
					os.execute("rm -rf "..(appDataPath(Bid)).."/Library/Preferences/" .. Bid .. ".plist")
					mSleep(1000)
					return true
				end
			end
			return false
		end


		main()        --分清先后顺序整个加载完毕后 执行主框架
