
mP0 = [[
2073---微生物
2267---基础金属
2268---水基液体
2270---贵金属
2272---重金属
2286---浮游生物群
2287---复杂有机生命体
2288---碳化合物
2305---自养生物
2306---非立方晶体
2307---长英矿物岩浆
2308---悬浮等离子
2309---离子溶液
2310---稀有气体
2311---活性气体]]

mP1 = [[
2389---等离子体团
2390---电解物
2392---氧化剂
2393---细菌
2395---蛋白质
2396---生物燃料
2397---工业纤维
2398---反应金属
2399---稀有金属
2400---有毒金属
2401---手性结构
9828---硅
3683---氧
3779---生物质
3645---水]]

mP2 = [[
44---核能燃料
2312---超张力塑料
2317---氧化物
2319---培养基
2321---聚芳酰胺
2327---微纤维护盾
2328---水冷CPU
2329---生物电池
2463---纳米体
3689---机械元件
3691---合成油
3693---肥料
3695---合成纺织品
3697---硅酸盐玻璃
3725---家畜
3775---病原体
3828---建筑模块
9830---火箭燃料
9832---冷却剂
9836---消费级电器
9838---超导体
9840---传信器
9842---微型电子元件
15317---基因肉制品]]

mP3 = [[
2344---凝缩液
2345---监控无人机
2346---合成神经键
2348---凝胶基质生物胶
2349---超级计算机
2351---灵巧单元建筑模块
2352---核反应堆
2354---控制面板
2358---生物技术研究报告
2360---工业炸药
2361---密封薄膜
2366---危险物探测系统
2367---冷冻保存防腐剂
9834---制导系统
9846---大气内穿梭机
9848---机器人技术
12836---透颅微控器
17136---乌克米超导体
17392---数据芯片
17898---高科技传信器
28974---疫苗]]

mP4 = [[
2867---广播节点
2868---反破损快速反应无人机
2869---纳米-工厂
2870---有机砂浆喷注器
2871---递推计算模块
2872---自协调能源核心
2875---无菌管道
2876---湿件主机]]

require("TSLib")
local json = require("sz").json
local w, h = getScreenSize()
local hh = getStatusBarHeight()

UINew("EVE辅助工具","开始","取消","eve_zdsx.txt",0,10,w,h)
UILabel("---------    功能设置    ---------",20,"center","0,0,0")
UIRadio("rdo1","P0,P1,P2,P3,P4,自定义","0",-1,0,"",1,2)
UILabel("---------   自定义设置   ---------",20,"center","0,0,0")
UITextArea("edt1","自定义内容","",15,"left","255,0,0")
UIShow()

if rdo1 == "P0" then
	edt1 = mP0
elseif rdo1 == "P1" then
	edt1 = mP1
elseif rdo1 == "P2" then
	edt1 = mP2
elseif rdo1 == "P3" then
	edt1 = mP3
elseif rdo1 == "P4" then
	edt1 = mP4
end

-- 货币格式转换 1000000 ==> 1,000,000.00
function StrToMoney(num)
	local list = {}
	local mXiaoshu = ".00"
	if string.find(num,"%.") then 
		mXiaoshu = "." .. string.sub(num,string.find(num,"%.")+1)
		num = string.sub(num,1,string.find(num,"%.")-1) 
	end
	local mLen = math.ceil(string.len(num)/3)
	local mNum = ""
	for var = mLen, 1, -1 do
		list[var] = string.sub(num,-3)
		num = string.sub(num,0,-4)
	end
	for var= 1, #list do
		mNum = mNum .. "," .. list[var]
	end
	return string.sub(mNum,2) .. mXiaoshu
end

if edt1 ~= "" then
	local list = strSplit(edt1,"\n")
	fwShowWnd("wid",0,0,w-1,h-1,0)
	fwShowTextView("wid","bg1","","left","ffffff","eeeeee",10,0,0,0,w-1,h-1-hh,1)
	fwShowTextView("wid","bt","EVE吉他市场自动刷新","center","ffffff","000000",15,0,5,5,w-5,50,1)
	fwShowButton("wid","sx","刷新","ff0000","333333","",10,w-105,5,w-5,50)
	jcw = 55
	size = 10
	color = "ffffff"
	w1 = w*0.2
	w2 = w*0.6
	
	fwShowTextView("wid","text1","物品名称","center",color,"000000",size,0,5,jcw,w1,jcw+(size*3),1)
	fwShowTextView("wid","text2","最高收购价","center",color,"000000",size,0,w1+5,jcw,w2,jcw+(size*3),1)
	fwShowTextView("wid","text3","最高售卖价","center",color,"000000",size,0,w2+5,jcw,w-5,jcw+(size*3),1)
	heihei = 0
	function up(...)
		jcw = 55 + (size*3) +5
		for var= 1, #list do
			info = strSplit(list[var],"---")
			if #info == 1 then name = info[1] end
			if #info >= 2 then name = info[2] end
			if #info >= 3 then color = info[3] end
			if #info >= 4 then size = info[4] end
			
			data = json.decode(httpGet("https://www.ceve-market.org/api/market/region/10000002/system/30000142/type/" .. info[1] .. ".json"))
			fwShowTextView("wid","text2" .. var,"  ","right",color,"000000",size,0,w1+5,jcw,w2,jcw+(size*3),1)
			fwShowTextView("wid","text3" .. var,"  ","right",color,"000000",size,0,w2+5,jcw,w-5,jcw+(size*3),1)
			mSleep(heihei)
			fwShowTextView("wid","text1" .. var,"  " .. name,"left",color,"000000",size,0,5,jcw,w1,jcw+(size*3),1)
			fwShowTextView("wid","text2" .. var,StrToMoney(data.buy.max) .. "  ","right",color,"000000",size,0,w1+5,jcw,w2,jcw+(size*3),1)
			fwShowTextView("wid","text3" .. var,StrToMoney(data.sell.min) .. "  ","right",color,"000000",size,0,w2+5,jcw,w-5,jcw+(size*3),1)
			jcw = jcw + (size*3) +5
		end
	end
	up()
	time = os.time()
	heihei = 100
	while (true) do
		local vid = fwGetPressedButton()
		if vid == "sx" then
			if os.time() - time < 3 then
				fwShowTextView("wid","bt2","不要频繁刷新!!!","center","ff0000","000000",20,0,0,0,w,h,0.2)
				mSleep(1000)
				fwCloseView("wid","bt2")
			else
				up()
				time = os.time()
			end
		end
		if os.time() - time >= 10 then
			up()
			time = os.time()
		end
	end
	
else
	dialog("未找到配置信息,脚本结束!")
end
