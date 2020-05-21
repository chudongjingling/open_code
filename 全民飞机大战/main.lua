function main()
	
	init("com.tencent.feiji",0)
	luaExitIfCall(true)                        --如果电话进入自动终止脚本	
	
	local isfront = 1;
	local flag;
	local li_cs = 0;

	flag = deviceIsLock();
	while flag ~= 0 do
	    unlockDevice(); --解锁屏幕
		mSleep(2000)
		flag = deviceIsLock();
		li_cs = li_cs + 1
		if li_cs > 5 then
			dialog("解锁设备屏幕失败，无法定时挂机。", 0);
			lua_exit();
		end
	end

--	bid = frontAppBid();
--	if bid ~= "com.tencent.feiji" then 
--		dialog("请先打开 全民飞机大战 再运行该脚本！"..bid, 3);
--		mSleep(500); 
		--lockDevice();
--		lua_exit();
--	end
--[[
	dialog("全民飞机大战免费刷PK,剧情脚本。",2)
	dialog("作者：IOS微信 飞机团：暴跳大香蕉，七分醉",4)
	dialog("飞行团ID：3571 欢迎加入",5)
	dialog("现在，开始吧......",2)
	dialog("最后说一句：免费脚本，学习使用，一切后果，作者不负责，不解释",3)
	dialog("不许骂人，免费的，你就忍忍吧，下面正式开始......",2)
	--感谢oncet大神，抄袭一段判断屏幕分辨率的代码，嘻嘻
]]
	g_id = 1
--[[	
	local text_id = dialogInput("本脚本免费提供给IOS微信3571团成员使用", "请输入团授权码：", "确认");
	if id ~= "" then
		if text_id ~= "3571" then
			dialog("授权错误，非本团成员，单次使用时间为30分钟,如需解除本限制，请加IOS微信3571飞行团。", 0)
		else
			dialog("欢迎团友，限制解除。", 3)
			g_id = 1
		end
	else
		dialog("输入错误，脚本退出，请从新运行脚本并输入。", 5)
		lua_exit()
	end
	]]
	local w, h = getScreenSize(); --获取屏幕分辨率函数
 	if w == 640 and h == 1136 then --获取的屏幕分辨率如果满足W.H 则。
	 --iPhone 5, 5S, 5C，iPod touch 5 
		require "5S-1"
	elseif w == 640 and h == 960 then--同上
	  --iPhone 4,4S, iPod touch 4 
		dialog("该脚本不支持此分辨率的设备，本程序只支持Retina屏幕的设备,ipad,3,4,5,mini2，mini3，air，air2,iphone5系列 ",5)--提示
		lua_exit(); --退出脚本
	elseif w == 768 and h == 1024 then--同上
	  --iPad 1,2, mini 1 
		dialog("该脚本不支持此分辨率的设备，本程序只支持Retina屏幕的设备,ipad,3,4,5,mini2，mini3，air，air2 ,iphone5系列",5)--提示
		lua_exit(); --退出脚本
	elseif w == 1536 and h == 2048 then--同上
	  --iPad 3,4,5，mini2，mini3，air，air2
		require "pad-1"
		--require "5S-1"
	elseif w == 750 and h == 1334 then--同上
	  --iPhone6
		dialog("该脚本不支持此分辨率的设备，本程序只支持Retina屏幕的设备,ipad,3,4,5,mini2，mini3，air，air2 ,iphone5系列",5)--提示
		lua_exit(); --退出脚本
	elseif w == 1242 and h == 2208 then--同上
	  --iPhone6 Plus
		dialog("该脚本不支持此分辨率的设备，本程序只支持Retina屏幕的设备,ipad,3,4,5,mini2，mini3，air，air2 ,iphone5系列",5)--提示
		lua_exit(); --退出脚本
	else--如都不满足
		dialog("该脚本不支持此分辨率的设备，当前只支持1536 X 2048分辨率,iPad 3,4,5，mini2，mini3，air，air2,iphone5系列",5)--提示
		lua_exit(); --退出脚本
	end
	
  	isfront = isFrontApp("com.tencent.feiji");    --更新前台状态
	if isfront == 0 then
		local r = runApp("com.tencent.feiji");    --启动应用 
		mSleep(10000);
		if r ~= 0 then
			dialog("请先打开 全民飞机大战 游戏主界面，再运行该脚本！", 3);
			lua_exit();
		end
	end
	
	jq_point = {0,0}
	gi_jq_boss = 0; --只刷boss关
	gi_jq_x = 0;
	g_fighting = 0;
	g_juqing = 1;
	g_juqing_cs = 0;
	g_jm = 0;
	g_fun_running_21 = 0;
	g_fun_running_13 = 0;
	g_fun_running = 0;
	g_jq_fail = 0;
	g_auto_lrw = 0;
	g_kxcs = 0;
	
	gi_choice = 0;  -- 0, 经典， 1，pk10000金币, 2,刷剧情45
	gi_choice_temp = 0
	
	local MyJsonString  = "{ \"style\":\"default\", \"config\":\"cfg.dat\",\"timer\":\"10\",\"width\":\"650\",\"height\":\"1300\", \"views\" : ["
	--显示一个文字，控件，名字，大小，对齐方式，颜色
	MyJsonString = MyJsonString .. "{ \"type\":\"Label\", \"text\":\"                  设置\", \"size\":25, \"align\":\"left\", \"color\":\"0,0,255\"}" .. ","
    MyJsonString = MyJsonString .. "{ \"type\":\"Label\", \"text\":\"剧情模式下要刷的关卡\", \"size\":15, \"align\":\"left\", \"color\":\"0,0,255\"}" .. ","
	MyJsonString = MyJsonString .. "{\"type\":\"CheckBoxGroup\",\"list\":\"剧情45, 54, 42, 30, 36, 33, 63,刷boss关卡(选中此项，其他剧情关不刷)\",\"select\":\"@7\"}" .. ","
	
--	MyJsonString = MyJsonString .. "{ \"type\":\"Label\", \"text\":\"是否使用死亡接力：\", \"size\":15, \"align\":\"left\", \"color\":\"0,0,255\"}" .. ","
	
	MyJsonString = MyJsonString .. "{\"type\":\"RadioGroup\",\"list\":\"使用死亡接力, 不使用死亡接力\",\"select\":\"1\"}" .. ","
	
	MyJsonString = MyJsonString .. "{\"type\":\"RadioGroup\",\"list\":\"尽量打高分, 出门直接自杀\",\"select\":\"1\"}" .. ","

--  MyJsonString = MyJsonString .. "{ \"type\":\"Label\", \"text\":\"是否使用狂热驱动：\", \"size\":15, \"align\":\"left\", \"color\":\"0,0,255\"}" .. ","
	
	MyJsonString = MyJsonString .. "{\"type\":\"RadioGroup\",\"list\":\"使用狂热驱动, 不使用狂热驱动  \",\"select\":\"1\"}" .. ","	
	
	MyJsonString = MyJsonString .. "{\"type\":\"RadioGroup\",\"list\":\"剧情、积分连刷, 不连刷  \",\"select\":\"1\"}" .. ","	
	
    MyJsonString = MyJsonString .. "{ \"type\":\"Label\", \"text\":\"选择功能\", \"size\":15, \"align\":\"left\", \"color\":\"0,0,255\"}" .. ","	
	
	--显示一群单选，控件名，需要几个选项以及选项的名称，默认选项（0开始）
	MyJsonString = MyJsonString .. "{ \"type\":\"RadioGroup\", \"list\":\"  刷经典模式        ,  刷5888金币模场     ,  刷剧情关          ,  刷PK2888金币场      ,远征前4关\",\"select\":\"2\"}" .. "] }"
	--显示一群多选，控件名，需要几个选项以及选项的名称，默认选项（0开始）,最后那个是结尾

	local rtn, input2, input3, input6, input4, input5, input1 = showUI(MyJsonString)
--	dialog("input2="..input2,3)
--	dialog("ret = "..ret.." gi_choice = "..gi_choice, 3)
	if rtn == 0 then
		dialog("取消，脚本退出。", 3)
		lua_exit()
		return
	end
	gi_choice,gi_swjl, gi_krqd, gi_tili, gi_killme = 0, 0, 0, 0, 0, 0
	gi_choice = tonumber(input1)
	gi_swjl = tonumber(input3)
	gi_krqd = tonumber(input4)
	gi_tili = tonumber(input5)
	gi_killme= tonumber(input6)
	if gi_choice < 0 then
		dialog("参数错误，脚本退出。", 3)
		lua_exit()
		return
	end	
	g_jq_45,g_jq_54,g_jq_42,g_jq_39,g_jq_36,g_jq_33,g_jq_63 = 0,0,0,0,0,0,0
	if string.find(input2, "0") == nil then
		g_jq_45 = 0
	else
		g_jq_45 = 1
	end
	if string.find(input2, "1")== nil then
		g_jq_54 = 0
	else
		g_jq_54 = 1
	end
	if string.find(input2, "2") == nil then
		g_jq_42 = 0
	else
		g_jq_42 = 1
	end
	if string.find(input2, "3") == nil then
		g_jq_39 = 0
	else
		g_jq_39 = 1
	end
	if string.find(input2, "4") == nil then
		g_jq_36 = 0
	else
		g_jq_36 = 1
	end
	if string.find(input2, "5") == nil then
		g_jq_33 = 0 
	else
		g_jq_33 = 1
	end
	if string.find(input2, "6") == nil then
		g_jq_63 = 0 
	else
		g_jq_63 = 1
	end		
	if string.find(input2, "7") == nil then
		gi_jq_boss = 0 
	else
		gi_jq_boss = 1
	end		
	--dialog(" " .. input2 .. ", " ..gi_jq_boss , 0)
	action = {
		--1、主界面
		--2、模式选择界面
		--3、判断pk界面
		--4, pk选择界面（世界对战，好友对战，积分兑换）
		--5,合体界面
		--6,买天神祝福界面
		--7，恭喜你界面
		--8，加油哦界面
		--9，PK胜利界面
		--10，PK失败界面
		--11，PK等待结算界面
		--12，PK选择界面(金币，钻石场选择)
		--13，战斗中
		--14，领任务界面
		--15，领任务确定界面
		--20，剧情模式主界面
		--21，剧情45关选择普通还是英雄开始界面
		[0] = function () switch0() end,
		[1] = function () switch1() end,
		[2] = function () switch2() end,
		[3] = function () switch3() end,
		[4] = function () switch4() end,
		[5] = function () switch5() end,
		[6] = function () switch6() end,
		[7] = function () switch7() end,
		[8] = function () switch8() end,
		[9] = function () switch9() end,
		[10] = function () switch10() end,
		[11] = function () switch11() end,
		[12] = function () switch12() end,
		[13] = function () switch13() end,
		[14] = function () switch14() end,
		[15] = function () switch15() end,
		[20] = function () switch20() end,
		[21] = function () switch21() end,
		[22] = function () switch22() end,
		[23] = function () switch22() end,
		[24] = function () switch22() end,
		[25] = function () switch25() end,
		[26] = function () switch26() end,
		[27] = function () switch27() end,
		[28] = function () switch28() end,
		[29] = function ()  switch0() end,
		[30] = function () switch30() end,
		[36] = function () switch36() end,
		[37] = function () switch37() end,
		[38] = function () switch38() end,
		[39] = function () switch39() end,
		[40] = function () switch40() end,
		[41] = function () switch41() end
	}	
	
	local i = 0;
	--剧情、PK连刷功能，先剧情，后积分
		--dialog("1 rtn="..g_fun_running,3)
 initLog("test", 1);--把 0 换成 1 即生成形似 test_1397679553.log 的日志文件 
 wLog("test","gi_choice="..gi_choice.."  "); 		
		--先回到主界面
	rtn = pdjm();
	wLog("test","rtn = "..rtn);
	while rtn ~= 1 do
		if w == 640 then
			if rtn == 7 then
				click(320, 890, 200)
			else
				click(60, 980, 200)
			end
		elseif w == 1536 then
			if rtn == 7 then
				click(780, 1722, 200)
			else
				click(210, 1900, 200)
			end
		end
		if rtn == 13 then
			action[rtn](1)
		end
	
		mSleep(1000)
		rtn = pdjm();
--		wLog("test","回主界面 rtn = "..rtn);
		i = i + 1
		if i > 30 then
		--	wLog("test","连刷模式转主界面错误");
			lockDevice();
			lua_exit()
		end			
	end
	
	--wLog("test","gi_tili = "..gi_tili.."  temp="..gi_choice_temp.."choice="..gi_choice.."jq_boss="..gi_jq_boss); 
	if gi_choice == 4 then gi_tili = 1 end
	
	if gi_tili == 0 then
		if gi_choice == 2 then
			gi_tili = 1
		else
			gi_choice_temp = gi_choice
			gi_choice = 2
		end
	end
	--wLog("test","gi_tili = "..gi_tili.."  temp="..gi_choice_temp.."choice="..gi_choice);
	
--	wLog("test","回主界面 gi_choice,gi_swjl, gi_krqd, gi_tili, gi_killme = "..gi_choice..gi_swjl..gi_krqd..gi_tili..gi_killme);
	

	local current_time,start_time
	start_time =  os.time();

	while true do --进入无限循环
		current_time =  os.time();
		if g_id == 0 and current_time - start_time > 1800 then
			dialog("非3571团成员，单次挂机时间不超过30分钟，时间到，10秒后脚本自动退出。", 10)
			lua_exit();
		end
		
		if g_fun_running == 0 then --信号灯
			rtn = pdjm(); 
		end
		if rtn ~= 29 then
			wLog("test","rtn = "..rtn.."   ");
		end
		
--[[
		for i = 1, 5 do
			recognize = ocrText(990, 290, 1250, 340, 10);
			mSleep(2000);
			--dialog("识别出的字符  1："..recognize, 1)
			if string.find(recognize, "3571") ~= nil then
				dialog("识别出的字符  1："..recognize, 1);
				recognize = ""
				--break
			end
		end
]]		
--[[
		x,y = findMultiColorInRegionFuzzy( 0xdef7ff, "5|13|0xf7ffff,11|28|0xffffff,26|2|0xf7ffff,36|28|0xf7ffff,49|0|0xeff7ff,60|30|0x21b6ff,74|10|0x94dbff,85|1|0xffffff,82|29|0x9cdbff", 90, 1080, 290, 1195, 340)
		--x, y = findImageInRegionFuzzy("3571.png", 100, 1080, 290, 1195, 340, 0);
		dialog("x="..x.."  y="..y, 0)
		if rtn == 1 and jm == 0 then
			x,y = findMultiColorInRegionFuzzy( 0xdef7ff, "5|13|0xf7ffff,11|28|0xffffff,26|2|0xf7ffff,36|28|0xf7ffff,49|0|0xeff7ff,60|30|0x21b6ff,74|10|0x94dbff,85|1|0xffffff,82|29|0x9cdbff", 90, 1080, 290, 1195, 340)
			--x, y = findImageInRegionFuzzy("3571.png", 100, 1080, 290, 1195, 340, 0);
			dialog("x="..x.."  y="..y, 0)
			if x ~= -1 then 
			end
		end
]]		
		
		if 	rtn == g_jm then
			g_kxcs = g_kxcs + 1;
			if g_kxcs > 50 and rtn ~= 29 then
				current_time = os.date("%Y-%m-%d-%H%M%S", os.time());
				keepScreen(true)
				snapshot(current_time.."rtn-"..rtn..".png", 0, 0, 1536, 2048); --以时间戳命名进行截图
				keepScreen(false)
				dialog("界面检测失败次数太多，程序退出，当前界面已截图",3)
				lockDevice(); 
				lua_exit();
			end
		else
			g_jm = rtn
			g_kxcs = 0
		end
			
		if rtn > 0 and rtn < 90 then
			if g_fun_running == 0 then
				g_fun_running = 1
				action[rtn](1)
				g_fun_running = 0
			end 
		end
		mSleep(300)
	end
end

main()
