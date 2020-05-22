
function zhuchengxu()
	ret,dengji,shezhi1,putongrenwu,wuxianrenwu,rwhuanshishijian,rwwuxianshenyuanshijian,rwwuxianshenyuanjiange,rwyanhuotumoshijian,rwyanhuotumoditu,rwyanhuotumocengshu,piliangfenjiejiange,huanxianxueliang,huichengxueliang=shezhi()

	if ret==1 then 
		dengji=tonumber(dengji) 
		rwhuanshishijian=tonumber(rwhuanshishijian) 
		rwwuxianshenyuanshijian=tonumber(rwwuxianshenyuanshijian)  
		rwwuxianshenyuanjiange=tonumber(rwwuxianshenyuanjiange) 
		rwyanhuotumoshijian=tonumber(rwyanhuotumoshijian) 
		yanhuoditu=tonumber(rwyanhuotumoditu)  
		yanhuocengshu=tonumber(rwyanhuotumocengshu)  
		huichengxueliang=tonumber(huichengxueliang) 
		huanxianxueliang=tonumber(huanxianxueliang) 
		piliangfenjiejiange=tonumber(piliangfenjiejiange) 
	else 

		dengji=0 
		piliangfenjiejiange=99999
		rwwuxianshenyuanjiange=18
		huichengxueliang=60
		huanxianxueliang=40
	end

	if string.find("@"..putongrenwu.."@","@0@") then
		putongrenwu="0"
		rwrichang=1
		rwcanbai=1
		rwchumo=1
		rwxiangmodongku=1
		rwjiaozhudating=1
	else
		if string.find("@"..putongrenwu.."@","@1@") then 

			putongrenwu="2@3@4@5@6@7@8@9@10@11@12@13@14@15@16@17@18"
			rwrichang="0"
			rwcanbai="0"
			rwchumo="0"
			rwxiangmodongku="0"
			rwjiaozhudating="0"
		end

		if string.find("@"..putongrenwu.."@","@6@") then
			rwrichang="0"
		end
		if string.find("@"..putongrenwu.."@","@4@") then
			rwcanbai="0"
		end
		if string.find("@"..putongrenwu.."@","@9@") then
			rwchumo="0"
		end
		if string.find("@"..putongrenwu.."@","@15@") then
			rwxiangmodongku="0"
		end
		if string.find("@"..putongrenwu.."@","@16@") then
			rwjiaozhudating="0"
		end
	end
	pdyidongbaocun() 
	piliangfenjieshijian=os.time() 
	if yanhuoditu==0 then
		yanhuoditu=2   
	end
	if 	yanhuocengshu==0 then
		yanhuocengshu=math.random(1,5)	 
	end
	zaixian=1   
	zaixiansj=1    
	xueliang=100  
	yanhuoyingguaijiange=60
	yanhuoyinguai=os.time()-999






	if dengji==0 then
		pddengji() 
		dialog("您的等级是"..dengji.."以上", 2); 
	end
	if not(string.find("@"..putongrenwu.."@","@0@")) then
		if string.find("@"..putongrenwu.."@","@2@") then
			dialog("开始整理背包", 2);mSleep(1000)
			zhenglizhuangbei()
			dialog("整理背包结束", 2)
		end
		if rwcanbai=="0" then
			dialog("开始参拜龙卫", 2);mSleep(1000)
			if dengji>21 then 
				canbailongwei()
			else
				dialog("等级未达到22级",2); 
			end
			dialog("参拜龙卫完成", 2)
		end
		if string.find("@"..putongrenwu.."@","@5@") then
			dialog("石阁试炼", 2);mSleep(1000)
			if dengji>6 then 
				shigeshilian()	
			else
				dialog("等级未达到7级",2); 
			end
			dialog("石阁试炼完成", 2)
		end
		if rwrichang=="0" then
			dialog("开始日常任务", 2);mSleep(1000)
			if dengji>17 then 
				richangrenwu()
			else
				dialog("等级未达到18级",2); 
			end
			richangrenwu() 
			dialog("日常任务完成", 2)
		end
		if string.find("@"..putongrenwu.."@","@7@") then
			dialog("开始主线任务", 2);mSleep(1000)
			zhuxianrenwu() 
			dialog("主线任务完成", 2)
		end
		if string.find("@"..putongrenwu.."@","@8@") then
			dialog("开始行会任务", 2);mSleep(1000)
			hanghuirenwu() 
			dialog("行会任务完成", 2)
		end
		if rwchumo=="0" then
			dialog("开始除魔任务", 2);mSleep(1000)
			if dengji>19 then 
				chumo() 
			else
				dialog("等级未达到20级",2); 
			end
			dialog("除魔任务完成",2)
		end
		if string.find("@"..putongrenwu.."@","@10@") then
			dialog("开始皇城任务", 2);mSleep(1000)
			if dengji>28 then
				huangcheng()
			else
				dialog("等级未达到29级",2); 
			end
			dialog("皇城任务完成",2)
		end
		if string.find("@"..putongrenwu.."@","@11@") then
			dialog("支线任务-待修改优化，将在最后运行", 2);mSleep(1000)
		end
		if string.find("@"..putongrenwu.."@","@12@") then
			dialog("开始挖矿", 2);mSleep(1000)
			if dengji>19 then 
				wakuang()
			else
				dialog("等级未达到20级，不建议去挖矿",2); 
			end
			dialog("挖矿完成", 2)
		end
		if string.find("@"..putongrenwu.."@","@13@") then
			dialog("开始竟技", 2);mSleep(1000)
			if dengji>24 then
				jingji()
			else
				dialog("等级未达到25级",2); 
			end
			dialog("竟技完成",2)
		end
		if string.find("@"..putongrenwu.."@","@14@") then
			dialog("开始活动深渊",2);mSleep(1000)
			if dengji>10 then 
				huodongshenyuan()
			else
				dialog("等级未达到11级",2); 
			end
			dialog("活动深渊任务完成",2)
		end
		if rwxiangmodongku=="0" then
			anquan()
			dialog("开始降魔洞窟", 2);mSleep(1000)
			if dengji>49 then 
				t110=os.time()
				while rwxiangmodongku=="0" do
					xiangmodongku()
					mSleep(1000)
					xunhuan(36000,t110,"110")
				end
			else
				dialog("等级未达到50级",2); 
			end
			dialog("降魔洞窟完成", 2)
		end
		if rwjiaozhudating=="0" then
			anquan()
			dialog("开始教主大厅", 2);mSleep(1000)
			if dengji>30 then
				t111=os.time()
				while rwjiaozhudating=="0" do
					jiaozhudating()
					mSleep(1000)
					xunhuan(36000,t111,"111")
				end
			else
				dialog("等级未达到31级",2); 
			end
			dialog("教主大厅完成", 2)
		end
		if string.find("@"..putongrenwu.."@","@17@") then
			dialog("开始活动中心", 2);mSleep(1000)
			dialog("程序修改中敬请期待", 2)

			dialog("活动中心完成", 2)
		end
		if string.find("@"..putongrenwu.."@","@18@") then
			dialog("领取奖励",2);mSleep(1000)
			lingjiangli()
			dialog("领取奖励结束",2)
		end
		if string.find("@"..putongrenwu.."@","@3@") then
			dialog("开始整理装备",2);mSleep(1000)
			zhenglizhuangbei()
			dialog("整理装备结束",2)
		end
		if string.find("@"..putongrenwu.."@","@11@") then
			dialog("开始支线任务-待修改优化", 2);mSleep(1000)
			if dengji>20 then
				zhixianrenwu()
			else
				dialog("等级未达到21级",2); 
			end
			dialog("支线任务完成", 2)
		end
	end
	if not(string.find("@"..wuxianrenwu.."@","@0@")) then
		if string.find("@"..wuxianrenwu.."@","@1@") then
			dialog("开始环式任务-待修改优化",2);mSleep(1000)
			huanshi()
			dialog("环式任务结束", 2)
		end
		if string.find("@"..wuxianrenwu.."@","@2@") then
			dialog("开始焰火屠魔-待修改优化",2);mSleep(1000)
			if dengji>36 then 
				yanhuotumo()
			else
				dialog("等级未达到37级",2); 
			end
			dialog("焰火屠魔结束",2)
		end
		if string.find("@"..wuxianrenwu.."@","@3@") then
			dialog("开始无限深渊",2);mSleep(1000)
			wuxianshenyuan()
			dialog("无限深渊结束",2)
		end
	end
end
function shezhi()
	local sz = require("sz")
	local json = sz.json
	local w,h = getScreenSize();
	MyTable = {
		["style"] = "default",
		["width"] = w,
		["height"] = h,
		["config"] = "save_348.dat",
		["timer"] = 60,
		views = {
			{
				["type"] = "Label",
				["text"] = "热血传奇自动任务QQ群336298138，提供免费脚本更新\n使用过程中如果发现错误请截屏发送QQ群\n目前脚本只支持iPhone5/5C/5S/4/4S，其他设备脚本制作中\n运行前请确认已登录游戏\n横屏home键在右边\n使用圈圈的请拉到右下角\n如果点确认后无任何动作请重启触动精灵或重启机器\n发现错误中止可随时再运行,副本内也可\n\n  你的等级是几级，填写0则自动判断",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "请输入您的等级，填写0则自动判断",
				["text"] = "0",
			},
			{
				["type"] = "CheckBoxGroup",
				["list"] =  "使用小飞鞋,使用技能一,使用技能二,使用技能三,日常除魔等任务中插入降魔和教主的匹配",
				["select"] = "0@4",
			},
			{
				["type"] = "Label",
				["text"] = "___________普通任务___________",
				["size"] = 22,
				["align"] = "left",
				["color"] = "255,0,0",
			},
			{
				["type"] = "CheckBoxGroup",
				["list"] =  "不想做普通任务,做所有普通任务,任务前整理背包,任务后整理背包,参拜龙卫,石阁试炼,日常任务,主线任务,行会任务,除魔任务,皇城任务,支线任务,挖矿任务,竟技任务,活动深渊,除魔洞窟,教主大厅,活动中心,领取奖励",
				["select"] = "4@5@6@7@8@9@10@12@13@14@15@16@18",
			},
			{
				["type"] = "Label",
				["text"] = "___________无限任务___________",
				["size"] = 22,
				["align"] = "left",
				["color"] = "255,0,0",
			},
			{
				["type"] = "CheckBoxGroup",
				["list"] =  "不做无限任务,无限环式任务,无限焰火屠魔,无限活动深渊",
				["select"] = "0",
			},
			{
				["type"] = "Label",
				["text"] = "下行请输入环式任务运行时间，例如30分钟填1800",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "无限环式任务",
				["text"] = "1800",
			},
			{
				["type"] = "Label",
				["text"] = "下行请输入无限深渊运行时间，例如60分钟填3600",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "无限深渊",
				["text"] = "3600",
			},
			{
				["type"] = "Label",
				["text"] = "下行请输入无限深渊时间，几秒进出副本一次",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "几秒进出副本一次",
				["text"] = "18",
			},
			{
				["type"] = "Label",
				["text"] = "下行请输入焰火屠魔运行时间，例如120分钟填7200",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "焰火屠魔",
				["text"] = "7200",
			},
			{
				["type"] = "RadioGroup",
				["list"] = "焰火屠魔地图选择：默认Lv20,一心一意Lv10,心心相印Lv20,飞火流星Lv30,浪漫星雨Lv40,绮梦幻想Lv50",
				["select"] = "0",
			},
			{
				["type"] = "RadioGroup",
				["list"] = "焰火屠魔层数选择：默认随机,一层,二层,三层,四层,五层",
				["select"] = "0",
			},
			{
				["type"] = "Label",
				["text"] = "___________其他设置___________",
				["size"] = 22,
				["align"] = "left",
				["color"] = "255,0,0",
			},
			{
				["type"] = "Label",
				["text"] = "下行输入批量分解白蓝装备间隔时间，99999秒不定时分解",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "批量分解白蓝装备间隔时间，99999秒不定时分解",
				["text"] = "99999",
			},
			{
				["type"] = "Label",
				["text"] = "下行输入血量低于百分多少换线，填0不换线",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "换线血量",
				["text"] = "60",
			},
			{
				["type"] = "Label",
				["text"] = "下行输入血量低于百分多少回城，填0不回城",
				["size"] = 12,
				["align"] = "left",
				["color"] = "0,0,255",
			},
			{
				["type"] = "Edit",
				["prompt"] = "回城血量",
				["text"] = "40",
			},			
			isArray = true
		}
	}
	local MyJsonString = json.encode(MyTable);
	return showUI(MyJsonString);
end
function isColor(x,y,c,s)
	local fl,abs = math.floor,math.abs
	s = fl(0xff*(100-s)*0.01)
	local r,g,b = fl(c/0x10000),fl(c%0x10000/0x100),fl(c%0x100)
	local rr,gg,bb = getColorRGB(x,y)
	if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
		return true
	end
end
function touch(x,y)
	touchDown(1,x,y);mSleep(50);touchUp(1,x,y);mSleep(50)
end
function touchm(x,y,x1,y1)
	touchDown(1,x,y);mSleep(50);touchMove(1, x1, y1);mSleep(500);touchUp(1,x1, y1);mSleep(50)
end
function baojing()
	vibrator(); 

end
function pdshebei()
	width, height = getScreenSize();
	if width == 320 and height == 480 then
		shebei=1   
	elseif width == 640 and height == 960 then
		shebei=2   
		ir=0
		im=0
		iq=0
		yq=0
	elseif width == 640 and height == 1136 then
		shebei=3   
		ir=176
		im=88
		iq=104
		yq=-1
	elseif width == 750  and height == 1334 then
		shebei=4   
		ir=176
		im=88
		iq=104
		yq=-1
	elseif width == 1242 and height == 2208 then
		shebei=5   
	elseif width == 768 and height == 1024 then
		shebei=6   
	elseif width == 1536 and height == 2048 then
		shebei=7   
	end
	if shebei~=2 and shebei~=3 then 
		dialog("该脚本可能无法在您的设备上使用，目前脚本只支持iPhone5/5C/5S/4/4S，其他设备脚本制作中。。。敬请期待", 300)
	end
end
function pdfanzhuan()
	mSleep(1000)
	if isColor(470+im,23,0x5282ff,85) and isColor(485+im,22,0xb50808,85) and isColor(487+im,24,0xd63018,85) and isColor(469+im,24,0x4a79ff,85) then
		dialog("请翻转屏幕180度\n保持home键在右边\n准备好后按确认", 999)
	end
end
function xunhuan(c,t,s)
	if os.time()-t>c*2 then
		baojing()
		dialog("程序出错，错误代码:"..s,99999)
		dialog("将以下知道的发送QQ群336298138\n错误代码:"..s.."\n有没有手动操作\n在做什么任务\n按确认后截屏\n以方便作者改进，谢谢",60);mSleep(1000)
	end
	pdlixian() 
	if lixian==1 then

		return true
	end
end
function xunhuan2(c,t,s)
	if os.time()-t>c then
		baojing()
		dialog("程序出错，超出循环时间",99999)
		dialog("将以下知道的发送QQ群336298138\n错误代码"..s.."\n有没有手动操作\n在做什么任务\n按确认后截屏\n以方便作者改进，谢谢",60);mSleep(1000)
	end
end
function pddengji()
	if dengji==0 then 
		dengji=1
		kongzhifangxiang()
		dakaihuodongrili()
		mSleep(500);
		if dengji<22 then
			if isColor(769+im,280,0xdeb284,85) and isColor(790+im,287,0xc69a6b,85) and isColor(817+im,283,0xbd8e5a,85) then
				dengji=22 
			end
		end
		if dengji<20 then
			if isColor(764+im,537,0xd6ae7b,85) and isColor(772+im,540,0xe7ba8c,85) and isColor(788+im,540,0xc69e6b,85) then
				dengji=20 
			end
		end
		if dengji<18 then
			if isColor(576+im,280,0xefc794,85) and isColor(594+im,282,0xbd9263,85) and isColor(619+im,280,0xd6a273,85) then
				dengji=18 
			end
		end
		if dengji<16 then
			if isColor(576+im,537,0xe7c38c,85) and isColor(592+im,550,0xdeb284,85) and isColor(614+im,549,0xdeb284,85) then
				dengji=16 
			end
		end
		if dengji<11 then
			if isColor(373+im,536,0xe7c394,85) and isColor(398+im,539,0xefc394,85) and isColor(417+im,542,0xefc394,85) then
				dengji=11 
			end
		end
		if dengji<7 then
			if isColor(376+im,279,0xdeb284,85) and isColor(411+im,281,0xcea273,85) and isColor(430+im,286,0xb5865a,85) then
				dengji=7  
			end
		end
		if isColor(638+im,220,0x42ba7b,85) and isColor(656+im,210,0x31a663,85) and isColor(662+im,214,0x42c77b,85) then
			rwrichang=1 
		end
		if isColor(795+im,324,0xcec7b5,85) and isColor(796+im,337,0xbdb2a5,85) and isColor(796+im,331,0xbdbaa5,85) then
			rwcanbai=1 
		end
		if isColor(841+im,464,0x39a26b,85) and isColor(859+im,472,0x4ac37b,85) and isColor(847+im,474,0x4ac784,85) then
			rwchumo=1 
		end
		touchm(510+im,560,510+im,120);mSleep(50); 
		touchm(510+im,560,510+im,120);mSleep(800); 
		if dengji<37 then
			if isColor(571+im,267,0xe7be8c,85) and isColor(599+im,268,0xdeb284,85) and isColor(614+im,273,0xc69a6b,85) then
				dengji=37 
			end
		end
		if dengji<35 then
			if isColor(385+im,265,0xd6ae7b,85) and isColor(413+im,265,0xdeb684,85) and isColor(430+im,264,0xe7be8c,85) then
				dengji=35 
			end
		end
		if dengji<50 then
			if isColor(572+im,530,0xdeba8c,85) and isColor(582+im,532,0xe7be8c,85) and isColor(614+im,542,0x843c08,85) then
				dengji=50 
			end
		end
		if isColor(657+im,453,0x31aa63,85) and isColor(657+im,458,0x42c384,85) and isColor(659+im,455,0x292818,85) then
			rwxiangmodongku=1 
		end
	end 
	huidaozhengchanghuamian(0)
	if dengji<20 then
		if isColor(10,13,0xbdb6ad,85) and isColor(9,24,0xefe3de,85) and isColor(18,19,0xcebeb5,85) and isColor(24,14,0xd6cbc6,85) and isColor(23,24,0xcebeb5,85) then
			dengji=20 
		end
	elseif dengji<18 then
		if isColor(9,15,0x9c928c,85) and isColor(20,18,0xc6beb5,85) and isColor(19,15,0xd6cfc6,85) and isColor(19,24,0xb5a6a5,85) and isColor(25,21,0xc6beb5,85) and isColor(12,23,0xcec3bd,85) then
			dengji=18 
		end
	elseif  dengji<3 then
		if isColor(13,13,0x948684,85) and isColor(19,15,0xcec7bd,85) and isColor(16,18,0xb5aea5,85) and isColor(19,21,0xbdb2a5,85) and isColor(15,24,0xb5a69c,85) then
			dengji=3  
		end
	end
end
function pdditu() 
	ditu=0 
	if pdtouxiang() and pdyouxishequ() then
		ditu=1  
	elseif pdfuben() then
		ditu=2 
	elseif isColor(653+im,32,0xffe7c6,85) and isColor(694+im,30,0xf7e3c6,85) and isColor(926+im,29,0x842421,85) then
		ditu=3 
	elseif isColor(780+im,31,0xffe7c6,85) and isColor(805+im,30,0xffe7ce,85) and isColor(925+im,28,0x8c2c29,85) then
		ditu=4 
	end
	return ditu
end
function pdfuben() 
	if isColor(34,147,0xf7e7bd,85) and isColor(31,153,0xdecb9c,85) and isColor(37,160,0x7b4521,85) then
		return true 
	elseif isColor(861+ir,105,0xf7be21,85) and isColor(898+ir,103,0xdeb639,85) and isColor(926+ir,102,0xffcf29,85) and isColor(956+ir,107,0xa5926b,85) and isColor(947+ir,122,0x211410,85) then
		return true 
	elseif isColor(818+ir,45,0x3986de,85) and isColor(829+ir,50,0x397dce,85) and isColor(839+ir,55,0x318ae7,85) and isColor(853+ir,57,0x3186de,85) and isColor(942+ir,81,0xdecb7b,85) then
		return true 
	end
end
function pdtouxiang()
	if isColor(96,40,0x9c4510,85) and isColor(114,48,0x312010,85) and isColor(135,49,0x735d31,85)then
		return true	
	end
end
function pdyouxishequ()
	if isColor(894+ir,110,0xef9a31,85) and isColor(902+ir,114,0xf7cf5a,85) and isColor(908+ir,128,0xad6500,85)then
		return true 
	end 
end
function pdzhidongzhandou(zhandou) 
	local zhidongzhandou=0
	if isColor(880+ir,319,0xefdf7b,85) and isColor(924+ir,317,0xf7df63,85) and isColor(923+ir,336,0xad5931,85) then
		zhidongzhandou=1   
		if zhandou==2 then
			touch(880,319) 
			dialog("取消自动战斗1",1);mSleep(500)
		end
	end	
	if isColor(883+ir,248,0xd6b25a,85) and isColor(892+ir,247,0x7b5931,85) and isColor(920+ir,247,0xa5864a,85) then
		zhidongzhandou=1   
		if zhandou==2 then
			touch(883+ir,248) 
			dialog("取消自动战斗2",1);mSleep(500)
		end
	end	
	if isColor(885+ir,253,0xce8242,85) and isColor(910+ir,249,0xc69a4a,85) and isColor(919+ir,249,0xbd964a,85) and isColor(915+ir,274,0xdeb663,85) then
		zhidongzhandou=0   
		if zhandou==1 then
			touch(885+ir,253) 
			dialog("开启自动战斗1",1);mSleep(500)
		end
	end	
	if isColor(885+ir,321,0xcec363,85) and isColor(911+ir,320,0xb58e4a,85) and isColor(894+ir,328,0xd69242,85) and isColor(884+ir,350,0xd6b663,85) then
		zhidongzhandou=0   
		if zhandou==1 then
			touch(885+ir,321) 
			dialog("开启自动战斗2",1);mSleep(500)
		end
	end	
	if isColor(1057-176+ir,314,0xefe7ef,85) and isColor(1096-176+ir,349,0xdeba63,85) and isColor(1087-176+ir,327,0xa56d39,85) and isColor(1071-176+ir,350,0xbd9a52,85) then
		zhidongzhandou=0   
		if zhandou==1 then
			touch(885+ir,321) 
			dialog("开启自动战斗3",1);mSleep(500)
		end
	end
	if zhidongzhandou==1 then

		if string.find("@"..shezhi1.."@","@1@") then
			touch(850+ir,423);mSleep(200)
		end
		if string.find("@"..shezhi1.."@","@2@") then
			touch(797+ir,477);mSleep(200)
		end
		if string.find("@"..shezhi1.."@","@3@") then
			touch(769+ir,555);mSleep(200)
		end
		return true
	end
end
function pdzhidongxunlu() 
	if isColor(337+im,164,0x391c18,85) and isColor(341+im,164,0xbd926b,85) and isColor(341+im,169,0x63654a,85) then
		if string.find("@"..shezhi1.."@","@0@") then
			touch(340+im,170);
			dialog("使用小飞鞋",1);mSleep(500)
		end
		return true
	else
	end
end
function kongzhifangxiang()
	if pdzhidongxunlu() then 
		suijifangxiang()
	else   
	end
end 
function suijifangxiang()
	touchm(150,500,50+math.random(50,150),400+math.random(50,150)) 
end 
function pdyidong()
	s=0
	if isColor(3,108,dian1,85)  then
		s=s+1
	end
	if isColor(3,36,dian2,85)  then
		s=s+1
	end
	if isColor(274,29,dian3,85)  then
		s=s+1
	end
	if isColor(625+ir,7,dian4,85)  then
		s=s+1
	end
	if isColor(941+ir,86,dian5,85)  then
		s=s+1
	end		
	if isColor(946+ir,199,dian6,85)  then
		s=s+1
	end		
	if isColor(949+ir,309,dian7,85)  then
		s=s+1
	end
	if s>6 then

		if os.time()-yidongshijian>60 then
			suijifangxiang() 
			dialog("长时间未动作,将随机走动防卡住",1);mSleep(500)
		end
	else
		pdyidongbaocun()
		return true
	end
end
function pdyidongbaocun()
	yidongshijian=os.time()
	dian1=getColor(3,108)
	dian2=getColor(3,36)
	dian3=getColor(274,29)
	dian4=getColor(625+ir,7)
	dian5=getColor(941+ir,86)
	dian6=getColor(946+ir,199)
	dian7=getColor(949+ir,309)
end
function dakaihuodongrili()
	t112=os.time()
	while not(isColor(435+im,28,0xefc794,85) and isColor(470+im,29,0xefc794,85) and isColor(484+im,33,0xefc794,85)) do
		huidaozhengchanghuamian(0)
		touch(660+ir,130);mSleep(2000);
		xunhuan(2500,t112,"112")
	end
end
function huidaozhengchanghuamian(yidong) 
	jiancha()  
	if yidong==1 then 
		pdzhidongzhandou(2)
		kongzhifangxiang()
	elseif yidong==2 then 
		pdzhidongzhandou(2)
	elseif yidong==3 then
		kongzhifangxiang() 
	end
	if isColor(853+ir,303,0xe7b24a,85) and isColor(889+ir,388,0xffeb6b,85) and isColor(903+ir,386,0x8c6108,85) then
		touch(480+im,580) 
	end
	if isColor(120,132,0xefd342,85) and isColor(131,131,0xd6be31,85) and isColor(150,146,0xd69629,85) then
		touch(50,140) 
	end
	mSleep(500)
	if os.time()- piliangfenjieshijian>piliangfenjiejiange then 
		piliangfenjiezhuangbei()
		piliangfenjieshijian=os.time()
		huidaozhengchanghuamian(0)
	end
end
function anquan()
	huidaozhengchanghuamian(1)

	if isColor(827+ir,57,0x31a663,85) and isColor(866+ir,52,0x31b26b,85) and isColor(845+ir,55,0x31b26b,85) then

	else
		huicheng() 
	end
end
function jiancha()
	pdditu()
	if isColor(461+im,66,0xefcfb5,85) and isColor(471+im,71,0xefd3ad,85) and isColor(496+im,74,0xefd3b5,85) then
		touch(870+im,80); 
		dialog("关闭任务对话框",1);mSleep(500)
	end
	jiancha1()
	jiancha2()
	jiancha3()
	jiancha4()
end
function jiancha1()
	pdjiequrenwu() 
	if ditu==1 then
		zhidongzhudui() 
	end
	if isColor(550+im,529,0xf7be7b,85) and isColor(598+im,528,0xf7ba73,85) and isColor(882+im,101,0x842421,85) then
		touch(560+im,520);mSleep(1000) 
		dialog("每日签到领奖",1);mSleep(500)
	end
	if isColor(550+im,529,0xf7be7b,85) and isColor(598+im,528,0xf7ba73,85) and isColor(882+im,101,0x842421,85) then
		touch(880+im,100) 
		dialog("每日签到关闭XX",1);mSleep(500)
	end
	if isColor(491+im,316,0xdeba5a,85) and isColor(481+im,367,0x212010,85) and isColor(474+im,9,0x736d6b,85) then
		touch(490+im,320) 
		dialog("关闭左边聊天框",1);mSleep(500)
	end
	if isColor(311-88+im,360,0x00ff00,85) and isColor(802-88+im,141,0x7b2421,85) and isColor(810-88+im,150,0x732421,85) then
		touch(240+im,340);mSleep(500); 
		dialog("跳转地图",1);mSleep(500)
	end
	if isColor(718+im,137,0xe7be8c,85) and isColor(723+im,141,0xceb69c,85) and isColor(726+im,144,0xdeaa6b,85) then
		touch(720+im,140) 
		dialog("关闭NPC对话框", 1);mSleep(500)
	end
	if isColor(66+im,330,0x847952,85) and isColor(892+im,286,0x847952,85) and isColor(908+im,84,0x732421,85) then
		touch(920+im,80) 
		dialog("关闭活动中心",1);mSleep(500)
	end
	if isColor(516+im,298,0xd6cfbd,85) and isColor(526+im,308,0xdecfbd,85) and isColor(539+im,310,0xd6cbbd,85) then
		touch(570+im,410) 
		dialog("提示是否进入挂机，取消",1);mSleep(500)
	end
	if isColor(464+im,27,0xf7c794,85) and isColor(498+im,27,0xefc794,85) and isColor(925+im,29,0x7b2021,85) then
		touch(930+im,30) 
		dialog("充值页面关闭XX",1);mSleep(500)
	end
	if isColor(497+im,445,0xefc794,85) and isColor(514+im,447,0xefc794,85) and isColor(233+im,294,0x080408,85) and isColor(238+im,202,0xe7be8c,85) then
		touch(480+im,450) 
		dialog("挂机结束",1);mSleep(500)
	end
	if isColor(441+im,210,0xe7be94,85) and isColor(472+im,212,0xefc794,85) and isColor(484+im,218,0xefc794,85) and isColor(506+im,213,0xe7c394,85) and isColor(369+im,193,0x393c31,85) then
		touch(570+im,410) 
		dialog("取消组队邀请",1);mSleep(500)
	end
	if isColor(444+im,146,0xdebe94,85) and isColor(461+im,150,0xefc79c,85) and isColor(471+im,154,0xefcb9c,85) and isColor(493+im,158,0xe7be94,85) and isColor(463+im,154,0x5a595a,85) then
		touch(785+im,145) 
		dialog("目标选择框关闭XX",1);mSleep(500)
	end
	if isColor(931+im,24,0xf7d7bd,85) and isColor(934+im,26,0xdecbb5,85) and isColor(935+im,28,0xc6aa84,85) then
		touch(930+im,30) 
		dialog("背包XX关闭",1);mSleep(500)
	end
	if isColor(438+im,39,0xefc794,85) and isColor(491+im,33,0xefc38c,85) and isColor(491+im,41,0xefc38c,85) and isColor(924+im,27,0x732829,85) then
		touch(930+im,30) 
	end
	if isColor(931+im,23,0xefd3b5,85) and isColor(933+im,26,0xdec7ad,85) and isColor(936+im,28,0xc69e73,85) then
		touch(930+im,30) 
		dialog("关闭XX",1);mSleep(500)
	end
	if isColor(796+im,32,0xf7e3c6,85) and isColor(801+im,33,0xf7e3c6,85) and isColor(829+im,37,0xe7d7b5,85) then
		touch(930+im,30) 
		dialog("除魔对话框关闭XX",1);mSleep(500)
	end
	if isColor(660+im,321,0xefe7de,85) and isColor(641+im,320,0xefe3de,85) and isColor(609+im,518,0xefc794,85) then

		touch(890+im,93);mSleep(1000);   
		zhixian=9 
	end
	if isColor(549,517,0xe7be8c,85) and isColor(609,519,0xefc394,85) and isColor(884,91,0x8c2829,85) then
		touch(890+im,93);mSleep(1000);   
	end
	if ditu==3 or ditu==4 then
		touch(930+im,30) 
		dialog("关闭当前地图或世界地图的XX",1);mSleep(500)
	end
	if isColor(433+im,147,0xcecbbd,85) and isColor(448+im,158,0xe7dfd6,85) and isColor(482+im,154,0xefe3d6,85) and isColor(520+im,154,0xe7d7ce,85) then

	end
	pdtiaoguoyindao() 
	pdtiaoguojuqing() 
end
function zhidongzhudui() 
	if isColor(236+im,167,0xefc794,85) and isColor(263+im,171,0xceae84,85) and isColor(263+im,183,0xc6aa7b,85) and isColor(237+im,181,0x423c39,85) then

		if isColor(754-88+im,421,0xf7f3f7,85) and isColor(754-88+im,423,0xe7e3de,85) and isColor(754-88+im,425,0xe7dfde,85) and isColor(760-88+im,428,0xe7e7e7,85) and isColor(761-88+im,430,0xefefe7,85) then	

			touch(460+im,490)  

		elseif isColor(759-88+im,421,0xeff7f7,85) and isColor(759-88+im,423,0xd6dbde,85) and isColor(759-88+im,425,0xdedfde,85) and isColor(759-88+im,427,0xdedfde,85) and isColor(759-88+im,430,0xfffbf7,85) and isColor(759-88+im,433,0xdedfde,85) then
			if rwxiangmodongku~="0" and rwjiaozhudating=="0" then
				touch(460+im,490) 
			end
		else
			touch(785+im,118) 






		end
	end
end
function pdtiaoguojuqing() 
	if isColor(870+ir,21,0xf7cf29,85) and isColor(931+ir,18,0xf7d731,85) and isColor(945+ir,29,0x312c29,85) and isColor(827+ir,31,0xc68a21,85) then
		touch(872+ir,26)
		dialog("跳过剧情",1);mSleep(500)
	end
end
function pdtiaoguoyindao() 
	if isColor(422+im,24,0x7b5d21,85) and isColor(461+im,27,0x8c6521,85) and isColor(491+im,24,0xb58e31,85) then   
		touch(480+im,30)
		dialog("跳过引导",1);mSleep(500)
	end
end
function pdrenwuwancheng() 
	if isColor(695+im,342,0xefcb94,85) and isColor(745+im,342,0xefc794,85) and isColor(796+im,136,0x842821,85) then
		touch(706+im,350)
		dialog("任务完成",1);mSleep(500)
	end
end
function pdjiequrenwu() 
	if isColor(695+im,342,0xefcb94,85) and isColor(695+im,348,0xefc794,85) and isColor(796+im,136,0x842821,85) then
		touch(706+im,350)
		dialog("接取任务，完成任务",1);mSleep(500)
	end
	if isColor(695+im,378,0xefc794,85) and isColor(695+im,383,0xefc38c,85) and isColor(795+im,136,0x842429,85) then
		touch(700+im,380)
		dialog("接取任务，完成任务,日常",1);mSleep(500) 
	end
end
function jiancha2()
	if isColor(529+im,411,0xe7c384,85) and isColor(606+im,414,0xefc38c,85) and isColor(464+im,214,0xefc794,85) and isColor(665+im,456,0x393431,85) then
		touch(570+im,410) 
		dialog("新称号",1);mSleep(500)
	end
	if isColor(661+ir,494,0xefc794,85) and isColor(667+ir,489,0xefc394,85) and isColor(701+ir,351,0x843021,85) then
		touch(646+ir,494);mSleep(1500) 
		touch(646+ir,494) 
		dialog("领取礼包",1);mSleep(500)
	end
	if isColor(399+ir,240,0xffffff,85) and isColor(441+ir,258,0xffffff,85) and isColor(513+ir,262,0xffffff,85) and isColor(551+ir,260,0xffffff,85) and isColor(460+ir,406,0xffffff,85) and isColor(496+ir,390,0x000000,85) then
		touch(400+ir,475) 
		dialog("低电池电量",1);mSleep(500)
	end
	if isColor(372+im,197,0xe7be5a,85) and isColor(377+im,197,0x181800,85) and isColor(385+im,197,0xf7cb5a,85) and isColor(431+im,196,0xf7ef9c,85) then
		touch(646+im,494) 
		dialog("礼包框",1);mSleep(500)
	end
	pdlijizhuangbei() 
end
function pdlijizhuangbei() 
	if isColor(558+ir,442,0xdebe8c,85) and isColor(566+ir,453,0xefc794,85) and isColor(585+ir,440,0x847d6b,85) then
		touch(637+ir,492)
		dialog("立即装备",1);mSleep(500)
	end
end
function jiancha3()
	pdxueliang() 
	pdsiwang()   
	pdyidong() 
	if pdlixian() then 

	end
end
function pdsiwang() 
	if ditu==1 then
		if isColor(558+im,264,0xffef00,85) and isColor(593+im,373,0xe7c394,85) and isColor(618+im,379,0xe7be8c,85) then
			playAudio("../lua/qicheshenyin.wav");mSleep(3000); 
			dialog("死亡1", 2);mSleep(1000)
			touch(600+im,380) 
			return true
		end
	elseif	ditu==2 then
		if isColor(558+im,264,0xffef00,85) and isColor(436+im,381,0xefc794,85) and isColor(464+im,381,0xefc794,85) and isColor(483+im,382,0xefc794,85) and isColor(530+im,381,0xadaa9c,85) then
			playAudio("../lua/qicheshenyin.wav");mSleep(3000); 
			dialog("死亡2", 2);mSleep(1000)
			touch(600+im,380) 
			return true
		end
		if isColor(338+im,272,0xcec3b5,85) and isColor(340+im,279,0xd6cbb5,85) and isColor(364+im,280,0xc6baa5,85) and isColor(373+im,278,0xd6cbb5,85) and isColor(365+im,408,0xefc384,85) then
			playAudio("../lua/qicheshenyin.wav");mSleep(3000); 
			dialog("死亡3", 2);mSleep(1000)

			return true
		end
	end
end
function pdxueliang()
	if isColor(476+im,538,0xe7e3ce,85) and isColor(483+im,538,0xe7d7c6,85) then
		if isColor(472+im,540,0x420c08,85) then
			xueliang=90
		elseif isColor(472+im,550,0xad1018,85) then
			xueliang=80
		elseif isColor(472+im,560,0xa52021,85) then
			xueliang=70
		elseif isColor(472+im,570,0xa51010,85) then
			xueliang=60
		elseif isColor(472+im,580,0x940000,85) then
			xueliang=50
		elseif isColor(472+im,590,0xa50000,85) then
			xueliang=40
		elseif isColor(472+im,600,0xc61810,85) then
			xueliang=30
		elseif isColor(472+im,610,0xde3821,85) then
			xueliang=20
		elseif isColor(472+im,620,0x9c1808,85) then
			xueliang=10
		elseif isColor(471+im,625,0x212018,85) then
			xueliang=1
		end
	end
	if ditu==2 then

		if xueliang<huanxianxueliang then
			touchDown(1,150,500);
			mSleep(50);touchMove(1,100,500);mSleep(1000)
			mSleep(50);touchMove(1,100,550);mSleep(1000)
			mSleep(50);touchMove(1,150,550);mSleep(1000)
			mSleep(50);touchMove(1,200,550);mSleep(1000)
			mSleep(50);touchMove(1,200,500);mSleep(1000)
			mSleep(50);touchMove(1,200,450);mSleep(1000)
			mSleep(50);touchMove(1,150,450);mSleep(1000)
			mSleep(50);touchMove(1,100,450);mSleep(1000)
			touchUp(1,100,450);mSleep(50) 
			dialog("警告:血量低于百分"..xueliang.."，离怪",1);mSleep(500)
		end
	elseif ditu==1 then

		if xueliang<huichengxueliang then 
			huicheng()
			dialog("低血量警告，回城",1);mSleep(500)
		elseif xueliang<huanxianxueliang then 
			huanxian()
			dialog("低血量警告，换线",1);mSleep(500)
		end
	end
end
function huicheng()
	if ditu==1 then
		t113=os.time()		
		touch(840+ir,25);mSleep(200) 
		while pdditu()~=4 do
			touch(840+im,25);mSleep(200) 
			xunhuan(10,t113,"113")
			if pdsiwang() then
				break
			end
		end
		t114=os.time()
		touch(760-88+im,415);mSleep(200) 
		while pdditu()~=1 do
			touch(477-88+im,412);mSleep(500) 
			xunhuan(10,t114,"114")
		end
		dialog("回城",1);mSleep(500)
	end
end
function huanxian()
	if ditu==1 then
		touch(220,85);mSleep(100) 
		t115=os.time()
		while not(isColor(219+im,189,0xe7c38c,85) and isColor(223+im,192,0xefc794,85) and isColor(227+im,201,0x313029,85) and isColor(230+im,202,0xdebe8c,85)) do
			mSleep(100)
			if pdsiwang() then
				break
			end
			xunhuan(10,t115,"115")
		end
		t116=os.time()
		while zaixian==zaixiansj do
			zaixiansj=math.random(0,2)
			xunhuan(10,t116,"116")
		end
		zaixian=zaixiansj
		mSleep(100)
		touch(400+im+zaixian*146,260);mSleep(500)
		touch(500+im,195) 
		dialog("换线",1);mSleep(500)
	end
end
function pdlixian()
	if ditu==1 then
		lixian=0
	end
	if ditu==0 then
		if isColor(427+im,506,0xefdfbd,85) and isColor(462+im,509,0xceba94,85) and isColor(588+im,528,0x080808,85) and isColor(594+im,500,0xa59663,85) and isColor(356+im,507,0x84754a,85) then 
			dialog("掉线重连",2);mSleep(500) 
			t117=os.time()
			while not(isColor(443+im,553,0xe7ebbd,85) and isColor(464+im,554,0xf7efc6,85) and isColor(488+im,562,0xded39c,85)) do			
				touch(480+im,448);mSleep(800) 
				touch(470+im,506);mSleep(800) 
				xunhuan2(120,t117,"117")
			end

			t118=os.time()
			while pdditu()~=1 do
				touch(470+im,560);mSleep(800) 
				xunhuan2(120,t118,"118")
			end
			touch(480+im,450);mSleep(800) 
			jiancha1()
			lixian=1
			return true
		end
	end
end
function jiancha4()
	if ditu==1 then
		pdtishijinrufuben(0)  
		if isColor(459+im,207,0xefc794,85) and isColor(376+im,416,0xe7c384,85) and isColor(376+im,420,0xe7c384,85) and isColor(309+im,422,0x52454a,85) then
			touch(390+im,415);mSleep(500) 
			dialog("返回城镇或者入口",1);mSleep(500)
		end
	end
	likaifuben() 
end
function pdtishijinrufuben(jingru) 
	if isColor(380+im,417,0xefc78c,85) and isColor(380+im,411,0xefc78c,85) and isColor(462+im,214,0xefc794,85) and isColor(292+im,453,0x313431,85) then
		if jingru==1 then
			touch(388+im,414) 
			dialog("进入副本",1);mSleep(500)
		else
			touch(570+im,410)	
			dialog("取消进入副本",1);mSleep(500)
		end
		return true
	end
end
function likaifuben() 
	pdditu()
	if ditu==2 then
		local time1=os.time()
		local time2=os.time()
		dialog("副本",1);mSleep(500)
		t119=os.time()
		while pdditu()~=1 do 
			pdzhidongzhandou(1) 
			if isColor(181+im,149,0xe7c38c,85) and isColor(180+im,160,0xd6b684,85) and isColor(194+im,161,0xdeb68c,85) then
				if os.time()-yanhuoyinguai>yanhuoyingguaijiange then 

					touchDown(1,150,500);
					mSleep(50);touchMove(1,100,500);mSleep(2000)
					mSleep(50);touchMove(1,100,550);mSleep(2000)
					mSleep(50);touchMove(1,150,550);mSleep(2000)
					mSleep(50);touchMove(1,200,550);mSleep(2000)
					mSleep(50);touchMove(1,200,500);mSleep(2000)
					mSleep(50);touchMove(1,200,450);mSleep(2000)
					mSleep(50);touchMove(1,150,450);mSleep(2000)
					mSleep(50);touchMove(1,100,450);mSleep(2000)
					touchUp(1,100,450);mSleep(50) 
					yanhuoyinguai=os.time()
				end

			end


















			jiancha2()
			pdxueliang()
			pdsiwang() 
			mSleep(500)
			if isColor(295+im,240,0xdeba9c,85) and isColor(336+im,246,0xefc79c,85) and isColor(358+im,243,0xd6b694,85) then
				touch(550+im,350);mSleep(500) 
			end
			if isColor(369+im,179,0xc68a52,85) and isColor(383+im,179,0xd6ae7b,85) and isColor(413+im,183,0x392010,85) and isColor(421+im,183,0xad8a7b,85) and isColor(395+im,187,0x9479a5,85) then
				touch(550+im,350);mSleep(500) 
			end
			xunhuan(1900,t119,"119")
		end 
	end
end
function zhenglizhuangbei()
	anquan() 
	zhidongpipei(0) 
	shiyongwupin()
	xunzhang()
	youjian()
	if getDeviceID()=="18cce7f413a738849928c3f670603d33" or getDeviceID()=="79e55f4c8610cc4177fb5c17b3e6dd82" then 
		dialog("开始合成", 2)
		hecheng()
		dialog("合成结束", 2)
		dialog("开始强化", 2)
		qianghua()
		dialog("强化结束", 2)
	else
		piliangfenjiezhuangbei()
	end
end
function hecheng()
	huidaozhengchanghuamian(1);mSleep(1000);
	touch(480+im,580);mSleep(2000);  
	touch(387+im,584);mSleep(1000);  
	touch(429+im,448);mSleep(2000);  
	local s=3
	t120=os.time()
	while s==3 do
		if  isColor(323+im,296,0x181818,85) then
			touch(690+im,460);mSleep(1500);  
		end
		s=0

		if isColor(234+im,156,0x7b7d73,85) then
			s=s+1
		end
		if  isColor(142+im,298,0xa5a294,85)  then
			s=s+1
		end 
		if isColor(323+im,298,0x8c8a7b,85) then
			s=s+1
		end

		if isColor(241+im,162,0x3141c6,85) then
			s=s+1
		end
		if isColor(149+im,303,0x3141c6,85) then
			s=s+1
		end
		if isColor(330+im,303,0x3141c6,85) then
			s=s+1
		end
		if s==3 then
			touch(800+im,460);mSleep(1500);  
		end
		pdlijizhuangbei() 
		mSleep(200)
		xunhuan(120,t120,"120")
	end
end
function shiyongwupin()
	dialog("使用物品", 2)
	huidaozhengchanghuamian(1);mSleep(1000)
	touch(480+im,580);mSleep(2000);  
	touch(220+im,580);mSleep(2000);  
	if isColor(77+im,138,0xffcb7b,85) and isColor(79+im,131,0x8c6139,85) and isColor(77+im,144,0xb58a5a,85) then
		touch(80+im,130);mSleep(1000);  
		touch(700+im,450);mSleep(1000);  
		touchm(334+im,434,620+im,430);mSleep(1000);  
		touch(360+im,530);mSleep(1000);  
	end
	if isColor(78+im,119,0x422018,85) and isColor(79+im,129,0xffffff,85) and isColor(85+im,136,0x634139,85) then
		touch(80+im,130);mSleep(1000);  
		touch(700+im,450);mSleep(1000);  
		touchm(334+im,434,620+im,430);mSleep(1000);  
		touch(360+im,530);mSleep(1000);  
	end
	for x=0,4 do
		for y=0,4 do
			if isColor(77+im+x*82,345+y*82-82*2,0xe7e7d6,85) and isColor(85+im+x*82,338+y*82-82*2,0x211421,85) and isColor(103+im+x*82,343+y*82-82*2,0xf7f7f7,85) and isColor(86+im+x*82,367+y*82-82*2,0x9c8e84,85) then
				for i=1,10 do
					touch(80+im+x*82,130+y*82);mSleep(500); 
					touch(700+im,450);mSleep(500);  
				end
			end
			if isColor(236+im-82*2+x*82,373+y*82-82*3,0xffffce,85) and isColor(246+im-82*2+x*82,373+y*82-82*3,0xbd694a,85) and isColor(250+im-82*2+x*82,384+y*82-82*3,0xb55d18,85) then
				for i=1,10 do
					touch(80+im+x*82,130+y*82);mSleep(500); 
					touch(700+im,450);mSleep(500);  
				end
			end
		end
	end
end
function youjian()
	huidaozhengchanghuamian(1)

	if isColor(472+im,485,0x522810,85) and isColor(467+im,496,0x6b498c,85) and isColor(476+im,499,0x8455ad,85) then
		dialog("收取邮件", 2);mSleep(1000);
		touch(480+im,580);mSleep(2000);  
		touch(570+im,580);mSleep(1000);  
		touch(460+im,30);mSleep(3000);  
		t121=os.time()
		while isColor(618+im,470,0xefc38c,85) and isColor(629+im,474,0xefbe8c,85) and isColor(618+im,471,0xefc38c,85) do 
			if isColor(770+im,465,0xdeae7b,85) and isColor(808+im,465,0xdeb27b,85) and isColor(821+im,477,0xbd9263,85) then
				touch(770+im,470);mSleep(1000);  
			else
				touch(590+im,470);mSleep(1000);  
			end
			mSleep(500)
			xunhuan(60,t121,"121")
		end
		jiancha()
	end
end
function xunzhang()
	if isColor(417,549,0xb53431,85) and isColor(422,554,0xad2829,85) then
		dialog("勋章", 2);mSleep(1000);
		touch(387+im,584);mSleep(1500);  
		if isColor(183,416,0xbd3839,85) and isColor(189,422,0xb52829,85) then
			touch(160+im,445);mSleep(3000);  
			touch(830+im,460);mSleep(1000);  
			touch(830+im,460);mSleep(1000);  
			touch(830+im,460);mSleep(1000);  
			touch(570+im,410);mSleep(1000);  
			touch(930+im,30);mSleep(1000);  
		end
	end
end
function piliangfenjiezhuangbei()
	dialog("批量分解装备", 2)
	mSleep(1000);
	touch(480+im,580);mSleep(2500);  
	touch(387+im,584);mSleep(1500);  
	touch(60+im,450);mSleep(3000);  
	touch(700+im,470);mSleep(1000); 
	touch(420+im,200);mSleep(1000); 
	touch(480+im,450);mSleep(1000); 
	touch(390+im,410);mSleep(1000); 
end
function qianghua()
end
function dakaizhuangbei()

	t127=os.time()
	while not(isColor(547+im,37,0xd6be9c,85) and isColor(569+im,40,0xf7dbbd,85) and isColor(582+im,44,0xf7dfbd,85)) do
		huidaozhengchanghuamian(1)
		mSleep(1000); 
		touch(480+im,580);mSleep(2000);  
		touch(220+im,580);mSleep(2000);  
		touch(560+im,35);mSleep(2000);  
		xunhuan(1900,t127,"127")
	end
	local o=1
	zhuangbeigeshu=0
	t128=os.time()
	while o<5 do
		local y=0
		t129=os.time()
		while y<5 do
			local x=0
			t130=os.time()
			while x<5 do
				zhuangbeigeshu=zhuangbeigeshu+1

				if isColor(105+im+x*82,151+y*82,0x429621,85) and isColor(110+im+x*82,154+y*82,0x399a18,85) and isColor(109+im+x*82,164+y*82,0x089208,85) then
					touch(80+im+x*82,130+y*82);mSleep(2000); 
					touch(840+im,450);mSleep(3000);  
					x=x-1
				end

				if isColor(53+im+x*82,113+y*82,0xf7fbf7,85) and isColor(63+im+x*82,106+y*82,0xf7f7ff,85) and isColor(70+im+x*82,108+y*82,0xfffbff,85) and isColor(65+im+x*82,113+y*82,0xeff3ef,85) then
					touch(80+im+x*82,130+y*82);mSleep(2000); 

					if isColor(883+im,104,0xef0c08,85) and isColor(877+im,104,0xe70c08,85) and isColor(877+im,110,0xff0408,85) and isColor(885+im,116,0xa54531,85) and isColor(877+im,118,0xef1010,85) then
					else	

						touch(560+im,450);mSleep(500); 
						touch(400+im,410);mSleep(500); 
						touch(400+im,410);mSleep(500); 
						x=x-1
						qianghuama=0 
					end
				end

				if isColor(77+im+x*82,119+y*82,0x182021,85) and isColor(81+im+x*82,126+y*82,0x292421,85) and isColor(88+im+x*82,143+y*82,0x211c21,85) and isColor(106+im+x*82,157+y*82,0x292421,85) and isColor(90+im+x*82,149+y*82,0x212421,85) then
					x=9
					y=9
					o=9
				end
				x=x+1
				jiancha2()
				xunhuan(60,t130,"130")
			end
			y=y+1
			xunhuan(120,t129,"129")
		end
		if 0<5 then
			touchm(420+im,335,110+im,335);mSleep(1000); 
			o=o+1
		end
		xunhuan(500,t128,"128")
	end
	if zhuangbeigeshu<7 then
		qianghuama=1 
	end
end
function canbailongwei()
	kongzhifangxiang()
	dakaihuodongrili()
	if isColor(795+im,323,0xbdb6a5,85) and isColor(791+im,334,0xbdb2a5,85) and isColor(793+im,337,0xb5b29c,85) then

		t131=os.time()
		while  not(isColor(447+im,119,0xe7c394,85) and isColor(479+im,119,0xd6b68c,85) and isColor(493+im,120,0xdeba94,85)) do
			dakaihuodongrili()
			touch(800+im,280);mSleep(2000); 
			touch(600+im,500);mSleep(1000); 
			pdzhidongxunlu()  
			mSleep(2000) 
			xunhuan(1900,t131,"131")
		end
		touch(360+im,500);mSleep(1000); 
	end
end
function shigeshilian()

	t132=os.time()
	while not(isColor(346+im,409,0xcea26b,85) and isColor(356+im,411,0xd6ae73,85) and isColor(358+im,417,0x5a1800,85) and isColor(376+im,419,0xefc38c,85) and isColor(371+im,424,0xdeb27b,85))  do
		kongzhifangxiang()
		dakaihuodongrili()
		touch(400+im,280);mSleep(2000); 
		touch(600+im,500);mSleep(1000); 
		touch(400+im,410);mSleep(1000); 
		likaifuben()
		xunhuan(1900,t132,"132")
	end 
	touch(570+im,410);mSleep(1000); 
	touch(890+im,90);mSleep(1000); 
end
function richangrenwu() 
	local rc=0
	t133=os.time()
	while rc<2 do
		mSleep(900);
		huidaozhengchanghuamian(0) 
		zhidongpipei(1) 
		if pdrichangrenwu() then  
			rc=0 
		else                 
			pdditu()
			if ditu==1 then
				rc=rc+1
			end
			pdjiequrenwu() 
			zhidongzhudui() 
		end
		xunhuan(2500,t133,"133")
	end
end
function pdrichangrenwu()
	touchm(216,167,216,327);mSleep(500)  
	for i=0,2 do
		if isColor(12,178+69*i,0xad55ad,85) and isColor(41,182+69*i,0xb555ad,85) and isColor(25,178+69*i,0xb555ad,85) and isColor(40,172+69*i,0xa555ad,85) then
			touch(50,190+69*i);mSleep(500); 
			pdzhidongxunlu() 
			return true
		end
	end
end
function zhuxianrenwu() 
	local zx=0
	t134=os.time()
	while zx<2 do
		huidaozhengchanghuamian(0) 
		zhidongpipei(1) 
		if pdzhuxianrenwu() then  
			zx=0 
			mSleep(500);
			pdtishijinrufuben(1) 
			if isColor(445+im,31,0xefc794,85) and isColor(470+im,36,0xefc794,85) and isColor(505+im,42,0xf7cb9c,85) and isColor(532+im,40,0xefc794,85) then
				touch(480+im,560);mSleep(1000); 
				touch(480+im,480);mSleep(30000);
				t135=os.time()
				while not(isColor(420+im,205,0xdebe94,85) and isColor(446+im,213,0xdeba94,85) and isColor(476+im,212,0xdebe8c,85)) do 
					mSleep(1000)
					xunhuan(120,t135,"135")
				end
				touch(570+im,410);mSleep(500) 
				touch(430+im,350);mSleep(300)
				touch(340+im,410);mSleep(300) 
				touch(340+im,410);mSleep(300) 
				touch(340+im,410);mSleep(1300) 
			end
			pddengji()
			if dengji==20 then
				shigeshilian() 
				dengji=21
			elseif dengji==18 then 
				richangrenwu() 
				dengji=19
			elseif  dengji==3 then  
				dakaizhuangbei() 
				dengji=4
			end
		else  
			pdditu()
			if ditu==1 then
				zx=zx+1
			end
			pdjiequrenwu() 
			zhidongzhudui() 

		end
		xunhuan(7200,t134,"134")
	end
end
function pdzhuxianrenwu()
	touchm(216,167,216,327);mSleep(500)  
	local zhuxian=0
	if isColor(18,171,0xe7e373,85) and isColor(26,187,0xdedf73,85) and isColor(19,185,0xdedb6b,85) and isColor(45,184,0xf7f77b,85) and isColor(43,170,0xcecf6b,85) and isColor(35,170,0xe7e373,85) then
		zhuxian=1
	end 
	if isColor(18,172,0xe7e373,85) and isColor(15,188,0xe7e373,85) and isColor(27,188,0xe7df73,85) and isColor(33,186,0xf7f37b,85) and isColor(44,182,0xd6d36b,85) then
		zhuxian=1
	end
	if isColor(18,171,0xf7f77b,85) and isColor(19,187,0xe7eb73,85) and isColor(45,185,0xeff37b,85) then
		zhuxian=1
	end
	if zhuxian==1 then

		touch(50,190);mSleep(500); 
		pdzhidongxunlu() 
		return true
	end
end
function hanghuirenwu() 
	local hh=0
	t136=os.time()
	while hh<2 do
		huidaozhengchanghuamian(0) 
		zhidongpipei(1) 
		if pdhanghuirenwu() then  
			hh=0 

			if isColor(307-88+im,360,0x00ff00,85) and isColor(309-88+im,344,0x10cf08,85) and isColor(340-88+im,348,0x00f300,85) and isColor(802-88+im,141,0x7b2421,85) then

				touch(240+im,350);mSleep(3000); 

				touch(480+im,30);mSleep(2000) 
				touch(820+im,560);mSleep(2000); 
				touch(390+im,410);mSleep(2000); 
				touch(930+im,30);mSleep(7000); 
				hh=99 
			end
		else  
			pdditu()
			if ditu==1 then
				hh=hh+1
			end
			pdjiequrenwu() 
			zhidongzhudui() 
		end
		mSleep(2000);
		xunhuan(2500,t136,"136")
	end
end
function pdhanghuirenwu()
	touchm(216,167,216,327);mSleep(500)  
	local i=0
	t137=os.time()
	while i<3 do
		if isColor(12,179+i*69,0x3992f7,85) and isColor(25,177+i*69,0x3192f7,85) and isColor(39,182+i*69,0x3996f7,85) then
			hh=0 
			touch(50,190+i*69);mSleep(1000); 
			pdzhidongxunlu() 
			return true
		end
		i=i+1
		xunhuan(30,t137,"137")
	end
end
function chumo()
	local cm=0
	t138=os.time()
	while cm<20 do
		touchm(216,167,216,327);mSleep(500)  
		for i=-1,1 do 
			if isColor(61,246+i*69,0x3182de,85) and isColor(73,250+i*69,0x3996ff,85) and isColor(93,249+i*69,0x3192f7,85) then

				cm=1 
				touch(61,247+i*69);mSleep(5000); 
			end
			if isColor(218+im,330,0x00ff00,85) and isColor(229+im,330,0x00ff00,85) and isColor(236+im,330,0x00ff00,85) then
				touch(240+im,310);mSleep(5000); 
			end
			if isColor(218+im,359,0x00ff00,85) and isColor(231+im,359,0x00ff00,85) and isColor(238+im,359,0x00ff00,85) then
				touch(240+im,340);mSleep(5000); 
			end
		end
		if cm==1 then

		else
			pdjiequrenwu() 

			touch(830+im,470);mSleep(1000); 
			dakaihuodongrili()
			mSleep(1000)
			if isColor(836+im,464,0x31b66b,85) and isColor(858+im,471,0x42c37b,85) and isColor(851+im,439,0x42c384,85) then

				cm=99
			else
				touch(800+im,540);mSleep(1500); 
			end			
			zhidongzhudui() 
		end
		if isColor(265+im,160,0xdeb68c,85) and isColor(250+im,160,0xd6b284,85) and isColor(230+im,158,0xbda27b,85) and isColor(199+im,158,0xceae84,85) then
			touch(830+im,470);mSleep(2500); 
			touch(830+im,470);mSleep(1000); 
		end
		cm=cm+1
		jiancha()
		zhidongpipei(1) 
		mSleep(1000);
		xunhuan(5000,t138,"138")
	end  
end
function huangcheng()
	local hc=0
	t139=os.time()
	while hc<2 do
		huidaozhengchanghuamian(0) 
		zhidongpipei(1) 
		if pdhuangcheng() then  
			hc=0 
		else                 
			hc=hc+1
			pdjiequrenwu() 
		end
		if isColor(311-88+im,311,0x00f708,85) and isColor(356-88+im,310,0x00ff00,85) and isColor(339-88+im,320,0x08f300,85) and isColor(801-88+im,141,0x7b2421,85) then
			touch(260+im,310);mSleep(2000); 
		end
		jiancha()
		mSleep(1000);
		xunhuan(2500,t139,"139")
	end
end
function pdhuangcheng()
	touchm(216,167,216,327);mSleep(500)  
	for i=0,2 do 
		if isColor(22,176+i*69,0x3996ff,85) and isColor(69,184+i*69,0x398eef,85) and isColor(85,175+i*69,0x3196ff,85) and isColor(96,173+i*69,0x3992f7,85) then
			hc=0
			touch(50,190+i*69);mSleep(500); 
			pdzhidongxunlu() 
			mSleep(500);
			return true
		end
	end
end
function zhixianrenwu()
	for i=0,10 do
		zhixian=0
		t140=os.time()
		while zhixian<2 do
			if i<3 then
				huidaozhengchanghuamian(0) 
				zhidongpipei(1) 
				touchm(216,167,216,327);mSleep(500)  
				if isColor(19,173+69*i,0x31ae6b,85) and isColor(44,180+69*i,0x31b26b,85) and isColor(46,185+69*i,0x31aa6b,85) then	

					zhixian=0 
					touch(50,190+69*i);mSleep(1000); 
					chulizhixian()
				else
					zhixian=zhixian+1 
				end
			elseif  i>2 and i<6 then
				kejierenwu()
				touch(240+im,385);mSleep(1000);   
				if isColor(174+im,449+(i-4)*62,0xe7c342,85) and isColor(204+im,444+(i-4)*62,0xf7c34a,85) and isColor(213+im+(i-4)*62,443,0xffc74a,85) then
					zhixian=9 
				else
					touch(240+im,385+(i-3)*62);mSleep(1000);   
					touch(600+im,485);mSleep(1000);   
				end
				if isColor(166+im,195,0xd63410,85) and isColor(230+im,203,0xf7c352,85) and isColor(253+im,200,0xffc752,85) and isColor(863+im,84,0x8c2831,85) then
					touch(870+im,80); 
					dialog("关闭任务对话框",1);mSleep(500)
				end
				chulizhixian()
			else
				kejierenwu() 
				touch(620+im,120);mSleep(1000); 
				touch(240+im,385);mSleep(1000);   
				touchm(312+im,478,312+im,228)   
				touchm(312+im,478,312+im,228)   
				touchm(312+im,478,312+im,228)   
				mSleep(1000);
				touch(230+im,430-(i-6)*62);mSleep(1000);   
				touch(600+im,485);mSleep(1000);   
				if isColor(461+im,66,0xefcfb5,85) and isColor(471+im,71,0xefd3ad,85) and isColor(496+im,74,0xefd3b5,85) then
					touch(870+im,80); 
					dialog("关闭任务对话框",1);mSleep(500)
				end
				chulizhixian()
			end
			mSleep(100)
			xunhuan(5000,t140,"140")
		end
	end
end
function kejierenwu()
	huidaozhengchanghuamian(0) 
	zhidongpipei(1) 

	t160=os.time()
	while not(isColor(747,112,0xefd3b5,85) and isColor(764,121,0xefd3b5,85) and isColor(865,85,0x7b2821,85)) do
		touch(50,135);mSleep(2000);   
		touch(755+im,120);mSleep(1000);   
		jiancha1()
		pdtishijinrufuben(1)
		xunhuan(3700,t160,"160")
	end
end
function chulizhixian()
	pdzhidongxunlu() 
	pdditu()
	if ditu==1 then
		if isColor(366+im,148,0xe7dbce,85) and isColor(366+im,152,0xe7d7ce,85) and isColor(404+im,153,0xe7dfd6,85) then

			zhixian=9 
		end
		if isColor(218+im,330,0x00ff00,85) and isColor(229+im,330,0x00ff00,85) and isColor(236+im,330,0x00ff00,85) then
			touch(240+im,310);mSleep(5000); 
		end
		if isColor(218+im,359,0x00ff00,85) and isColor(231+im,359,0x00ff00,85) and isColor(238+im,359,0x00ff00,85) then
			touch(240+im,340);mSleep(5000); 
		end
	end
	if ditu==0 then
		if isColor(183+im,439,0xf76d31,85) and isColor(138+im,440,0xefc394,85) and isColor(375+im,547,0xf7c74a,85) then
			touch(910+im,80);mSleep(500); 
			yanhuotumo() 
		end
		if isColor(848+im,462,0xefc394,85) and isColor(811+im,470,0xefc394,85) and isColor(267+im,219,0x181010,85) then

			touch(266+im,220);mSleep(2000); 
			touch(430+im,230);mSleep(2000); 
			touch(830+im,465);mSleep(2000); 
			touch(390+im,410);mSleep(2000);   
			touch(890+im,93);mSleep(1000);   
		end
		if isColor(269+im,212,0x211410,85) and isColor(845+im,468,0xdeb684,85) and isColor(724+im,463,0xefc394,85) then

			touch(266+im,220);mSleep(2000); 
			touch(430+im,230);mSleep(2000); 
			touch(830+im,465);mSleep(2000); 
			touch(390+im,410);mSleep(2000); 
			touch(838+im,70);mSleep(2000); 
			touch(890+im,93);mSleep(1000);   
		end
		if isColor(660+im,321,0xefe7de,85) and isColor(641+im,320,0xefe3de,85) and isColor(609+im,518,0xefc794,85) then

			touch(890+im,93);mSleep(1000);   
			zhixian=9 
		end
		if isColor(455+im,561,0xefc794,85) and isColor(495+im,566,0xefc794,85) and isColor(927+im,27,0x7b2821,85) then

			touch(930+im,30);mSleep(1000);   
			zhixian=9 
		end
	end
	pdtishijinrufuben(1)
end
function wakuang()
	local time=os.time() 
	t141=os.time()
	while os.time()-time<1700 do 
		jiancha2()
		pdsiwang()   
		pdxueliang() 
		zhidongpipei(0) 
		mSleep(300)
		if tonumber(os.date("%H"))==23 and tonumber(os.date("%M"))>28 then
			time=0 
		else  
			if isColor(846+ir,12,0xe7be8c,85) and isColor(852+ir,23,0xceaa84,85) and isColor(871+ir,21,0xd6b684,85) and isColor(883+ir,18,0xbd9e7b,85) then

				if isColor(655+ir,573,0xffdb63,85) and isColor(655+ir,579,0xe7ba52,85) then
					touchDown(1,150,500);mSleep(50);touchMove(1,50,500);mSleep(3000);touchUp(1,50,500);mSleep(50)  
					touch(670+ir,560);mSleep(2000) 
				else


				end
			else  
				huanxian()
				t142=os.time()
				while not(isColor(266+im,410,0x00fb00,85) and isColor(245+im,405,0x00fb00,85) and isColor(269+im,365,0x00fb00,85)) do 
					dakaihuodongrili()
					touchm(510+im,560,510+im,120);mSleep(50); 
					touchm(510+im,560,510+im,120);mSleep(800); 
					touch(800+im,270);mSleep(1500); 
					pdzhidongxunlu() 
					mSleep(2500)

					xunhuan(2100,t142,"142")
				end
				if dengji>36 then
					touch(230+im,360);mSleep(2000); 
				elseif dengji<20 then
					touch(230+im,360-29-29);mSleep(2000); 
				else 
					touch(230+im,360-29);mSleep(2000); 
				end

				if isColor(579+im,182,0xd6cbbd,85) and isColor(583+im,187,0xbdb6a5,85) and isColor(590+im,191,0xcec3b5,85) and isColor(602+im,191,0xcec7b5,85) then
					touch(722+im,142);mSleep(2000); 
					time=0
				end			
			end
		end
		xunhuan(4000,t141,"141")
	end

	t144=os.time()
	while not(isColor(266+im,410,0x00fb00,85) and isColor(245+im,405,0x00fb00,85) and isColor(269+im,365,0x00fb00,85)) do 
		dakaihuodongrili()
		touchm(510+im,560,510+im,120);mSleep(50); 
		touchm(510+im,560,510+im,120);mSleep(800); 
		touch(800+im,270);mSleep(1500); 
		pdzhidongxunlu() 
		mSleep(2500)

		xunhuan(120,t144,"144")
	end
	touch(260+im,410);mSleep(2000); 
	touch(240+im,315); 
end
function jingji()

	t162=os.time()
	while not(isColor(805+im,446,0xefc394,85) and isColor(846+im,448,0xefc38c,85) and isColor(924+im,28,0x7b2821,85)) do
		anquan() 
		zhidongpipei(0) 
		mSleep(1000)
		touch(902+ir,124);mSleep(2000); 
		touch(896+ir,230);mSleep(2000); 		
		touch(175+im,246);mSleep(2000); 	
		touch(165+im,508);mSleep(2000); 	
		touch(820+im,604);mSleep(3000); 	
		xunhuan(1900,t162,"162")
	end

	t146=os.time()
	while not(isColor(438+im,552,0xf7f7f7,85) and isColor(437+im,549,0xefefef,85) and isColor(438+im,544,0xf7f7f7,85) and isColor(445+im,545,0xf7fbf7,85) and isColor(446+im,547,0xf7f3f7,85) and isColor(445+im,552,0xfffbff,85)) do
		t163=os.time()
		while isColor(805+im,446,0xefc394,85) and isColor(846+im,448,0xefc38c,85) and isColor(924+im,28,0x7b2821,85) do
			touch(820+im,450);mSleep(2000); 	
			touch(390+im,410);mSleep(4000); 	
			xunhuan(20,t163,"163")
		end

		t147=os.time()
		while not(isColor(805+im,446,0xefc394,85) and isColor(846+im,448,0xefc38c,85) and isColor(924+im,28,0x7b2821,85)) do
			pdzhidongzhandou(1)
			jiancha2()
			if isColor(464+im,436,0xefc79c,85) and isColor(471+im,441,0xefc79c,85) then
				touch(480+im,440);mSleep(1000);  
			end
			mSleep(500); 
			xunhuan(120,t147,"147")
		end
		jiancha2()
		xunhuan(1200,t146,"146")
	end
	touch(930+im,30);mSleep(1000)
end
function huodongshenyuan()
	anquan() 
	zhidongpipei(0) 
	jinruhuodongshenyuan() 
	if isColor(471+im,285,0xd6cfbd,85) and isColor(479+im,291,0xd6cfbd,85) and isColor(492+im,296,0xd6cfbd,85) then
		touch(570+im,420);mSleep(1000); 
		touch(784+im,147) 
		touch(933+im,26) 
		ditu=1 
	else  
		ditu=0  
	end
	t148=os.time()
	while ditu~=1 do
		if isColor(371+im,173,0x846921,85) and isColor(391+im,173,0xefba52,85) and isColor(412+im,173,0x8c3c29,85) and isColor(481+im,173,0xe7aa21,85) and isColor(548+im,173,0xe79a18,85) then
			touch(430+im,350);
		end
		if isColor(664+ir,19,0xceb229,85) and isColor(681+ir,18,0xbd9a31,85) and isColor(698+ir,27,0xce9621,85) and isColor(734+ir,27,0xf7b629,85) and isColor(741+ir,35,0xad7521,85) then
			touch(720+ir,20); 
		end
		if isColor(462+im,205,0xefc794,85) and isColor(474+im,211,0xceae8c,85) and isColor(489+im,210,0xceb28c,85) and isColor(488+im,222,0xe7be94,85) and isColor(499+im,220,0xefc794,85) then
			touch(610+im,410); 
			mSleep(1000)
			touchDown(1,150,500);mSleep(50);touchMove(1,200,500);mSleep(1500);touchUp(1,200,500);mSleep(50) 
			touchDown(1,150,500);mSleep(50);touchMove(1,150,550);mSleep(700);touchUp(1,150,550);mSleep(50) 
		end	
		mSleep(300);
		ditu=2
		pdxueliang()
		ditu=pdditu()
		jiancha2()
		pdzhidongzhandou(1)
		xunhuan(1900,t148,"148")
	end
end
function jinruhuodongshenyuan()
	dakaihuodongrili()
	touch(420+im,540);mSleep(500); 
	t149=os.time()
	while isColor(372+im,246,0xcecbce,85) and isColor(393+im,258,0xdedfde,85) and isColor(398+im,266,0xad5d31,85) and isColor(451+im,256,0xefefef,85) do
		mSleep(1000); 
		xunhuan(300,t149,"149")
	end

	t164=os.time()
	while not(isColor(455+im,561,0xefc794,85) and isColor(505+im,563,0xefc794,85) and isColor(926+im,27,0x842421,85)) do
		mSleep(200); 
		xunhuan(300,t164,"164")
	end
	mSleep(100);
	touch(480+im,560);mSleep(500); 
	t165=os.time()
	while not(isColor(479+im,490,0xefc794,85) and isColor(494+im,482,0xefc794,85) and isColor(776+im,147,0x842421,85)) do
		mSleep(200); 
		xunhuan(10,t165,"165")
	end
	touch(480+im,480);mSleep(800); 
end
function xiangmodongku() 
	if rwxiangmodongku=="0" then
		dakaihuodongrili()
		touchm(510+im,560,510+im,120);mSleep(50); 
		touchm(510+im,560,510+im,120);mSleep(1500); 
		if isColor(602+im,567,0x9c9284,85) and isColor(595+im,566,0x73695a,85) and isColor(595+im,580,0xc6b6a5,85) and isColor(602+im,580,0x9c9684,85) and isColor(603+im,575,0xadae94,85) then
			rwxiangmodongku=1 
		else
			touch(600+im,530);mSleep(2000); 

			if isColor(151+im,467,0xdeba8c,85) and isColor(186+im,463,0xefc794,85) then
				touch(190+im,470) ;mSleep(2000)

				if isColor(397+im,408,0xefcb8c,85) and isColor(423+im,411,0xefc384,85) and isColor(423+im,421,0xefc384,85) then
					touch(569+im,415);mSleep(500); 
					touch(917+im,80);mSleep(1500); 
					rwxiangmodongku=1 
				end
			end
		end
	end
	if rwxiangmodongku~="0" and rwjiaozhudating=="0" then
		jiaozhudating() 
	end
end
function zhidongpipei(pipei) 
	if pdditu()==1 then
		if string.find("@"..shezhi1.."@","@4@") then

			if isColor(148,122,0xef9a00,85) and isColor(178,118,0xefb600,85) then

				if pipei==0 then


					t157=os.time()
					while not(isColor(646+im,496,0xefc794,85) and isColor(654+im,496,0xefc794,85) and isColor(662+im,497,0x632408,85)) do
						touch(40,94);mSleep(1000); 
						xunhuan(10,t157,"157")
					end

					t158=os.time()
					while not(isColor(363+im,415,0xefc784,85) and isColor(376+im,420,0xefc384,85)) do
						touch(646+im,496);mSleep(1000); 
						xunhuan(10,t158,"158")
					end

					t159=os.time()
					while isColor(363+im,415,0xefc784,85) and isColor(376+im,420,0xefc384,85) do
						touch(390+im,415);mSleep(1000); 
						xunhuan(10,t159,"159")
					end
				end
			else

				if pipei==1 then

					if rwxiangmodongku=="0" then
						xiangmodongku() 
					else
						if rwjiaozhudating=="0" then
							jiaozhudating() 
						end
					end
					mSleep(2000)

					if isColor(151+im,467,0xdeba8c,85) and isColor(186+im,463,0xefc794,85) and isColor(908,81,0x842c21,85) then
						touch(190+im,470);mSleep(500); 
						touch(920+im,80) 
						dialog("关闭自动匹配",2);mSleep(500)
					end
					zhidongzhudui() 
				end
			end
		end
	end
end
function jiaozhudating() 
	if rwjiaozhudating=="0" then
		dakaihuodongrili()
		touchm(510+im,560,510+im,120);mSleep(50); 
		touchm(510+im,560,510+im,120);mSleep(1000); 
		touchDown(1,510+im,120);mSleep(50);touchMove(1,510+im,210);mSleep(500);touchUp(1,510+im,210);mSleep(1000)  
		touch(800+im,100);mSleep(2000); 

		if isColor(151+im,467,0xdeba8c,85) and isColor(186+im,463,0xefc794,85) then
			if isColor(464+im,141,0xffffff,85) and isColor(464+im,148,0xffffff,85) and isColor(471+im,148,0xffffff,85) and isColor(471+im,141,0xf7fbf7,85) and isColor(471+im,144,0xefebef,85) and isColor(464+im,144,0xffffff,85) then
				rwjiaozhudating=1
				touch(920+im,80) 
			end
			touch(190+im,470);mSleep(500); 
		end
	end
end
function huodongzhongxin()
	for i=0,2 do
		anquan() 
		mSleep(1000)
		touch(740,40);mSleep(2000); 
		touch(240,190+101*i);mSleep(1000); 
		touchm(820,480,820,200);mSleep(1000); 
		touch(620,500);mSleep(2000); 
		likaifuben()
		if isColor(644,587,0xbcbcbc,85) and isColor(630,614,0xc8c8c8,85) and isColor(643,610,0x3b3939,85) then
			touch(830,600);mSleep(2000); 
		end
		if isColor(334,277,0xd6b284,85) and isColor(342,278,0xd6b284,85) and isColor(366,280,0xefc794,85) then
			touch(915,81);mSleep(2000); 
		end
		if isColor(826,51,0xd66142,85) and isColor(840,53,0xb55539,85) and isColor(858,53,0xe7694a,85) then 
			touch(887,28);mSleep(2000); 
			touch(388,409);mSleep(2000); 
		end
	end
	if isColor(913,79,0xd6aa73,85) and isColor(918,83,0xcebead,85) and isColor(922,89,0xa56139,85) then
		touch(913,79);mSleep(2000); 
	end
end
function lingjiangli()
	anquan() 
	mSleep(1000)
	touch(740+ir,130);mSleep(2000); 
	touch(840+im,390);mSleep(1000); 
	touch(840+im,500);mSleep(1000); 
	touch(930+im,30);mSleep(1000);
	touch(580+ir,130);mSleep(2000); 
	if isColor(550+im,529,0xf7be7b,85) and isColor(598+im,528,0xf7ba73,85) then
		touch(565+im,520);mSleep(1000);
		touch(890+im,100);mSleep(1000); 
		touch(580+ir,130);mSleep(2000); 
	end
	touch(830+im,170);mSleep(1000); 
	touch(830+im,290);mSleep(1000); 
	touch(830+im,420);mSleep(1000); 
	touch(820+im,540);mSleep(1000); 
	touch(930+im,30);mSleep(1000);
end
function huanshi() 
	t161=os.time()
	while os.time()-t161<rwhuanshishijian do
		for i=0,2 do
			while true do
				kejierenwu() 
				touch(240+im,450);mSleep(1000);
				touchm(312+im,478,312+im,228);mSleep(1000);  
				touch(240+im,365+i*62);mSleep(1000);
				if isColor(447+im,319,0x000000,85) and isColor(452+im,324,0x000000,85) then
					touch(595+im,485);mSleep(1000); 
				end
				if isColor(931+im,23,0xefd3b5,85) and isColor(933+im,26,0xdec7ad,85) and isColor(936+im,28,0xc69e73,85) then
					touch(930+im,30) 
					dialog("关闭XX",1);mSleep(500)
				end
				if isColor(447+im,319,0x948663,85) and isColor(452+im,324,0x948652,85) then
					break 
				end
			end
		end
		for i=0,2 do
			while true do
				kejierenwu() 
				touch(240+im,450);mSleep(1000);
				touchm(312+im,478,312+im,228);mSleep(1000);  
				touch(240+im,365+i*62);mSleep(1000);
				if isColor(931+im,23,0xefd3b5,85) and isColor(933+im,26,0xdec7ad,85) and isColor(936+im,28,0xc69e73,85) then
					touch(930+im,30) 
					dialog("关闭XX",1);mSleep(500)
				end
				if isColor(447+im,319,0x948663,85) and isColor(452+im,324,0x948652,85) then
					touch(595+im,485);mSleep(1000); 
				end
				if isColor(447+im,319,0x000000,85) and isColor(452+im,324,0x000000,85) then
					break 
				end
			end
		end
		xunhuan(360000,t161,"161")
	end
end
function yanhuotumo() 
	t150=os.time()
	while os.time()-t150<rwyanhuotumoshijian do
		anquan() 
		dakaihuodongrili()

		t151=os.time()
		while not(isColor(640+im,269,0xefc794,85) and isColor(648+im,269,0xefc394,85)) do
			touchm(510+im,560,510+im,120);mSleep(50); 
			touchm(510+im,560,510+im,120);mSleep(1000); 
			xunhuan(10,t151,"151")
		end
		touch(640+im,269);mSleep(500);

		t152=os.time()
		while not(isColor(138+im,441,0xefc794,85) and isColor(183,439,0xf76d31,85)) do
			mSleep(1000)
			xunhuan(10,t152,"152")
		end

		if yanhuoditu==1 then 
			touch(460+im,200);mSleep(300)
		end

		if yanhuoditu==2 then
			touch(730+im,200);mSleep(300)
		end
		if yanhuoditu==3 then
			touch(460+im,300);mSleep(300)
		end
		if yanhuoditu==4 then
			touch(730+im,300);mSleep(300)
		end
		if yanhuoditu==5 then
			touch(460+im,400);mSleep(300)
		end	

		t153=os.time()
		while not(isColor(490,392,0xefc394,85) and isColor(509,387,0xefc38c,85)) do
			mSleep(1000)
			xunhuan(10,t153,"153")
		end
		if yanhuocengshu==1 then
			touch(330+im,222);mSleep(800)
		end
		if yanhuocengshu==2 then
			touch(478+im,222);mSleep(800)
		end
		if yanhuocengshu==3 then
			touch(626+im,222);mSleep(800)
		end
		if yanhuocengshu==4 then
			touch(330+im,284);mSleep(800)
		end
		if yanhuocengshu==5 then
			touch(478+im,284);mSleep(800)
		end
		touch(480+im,390);mSleep(800) 
		t154=os.time()
		while ditu~=2 do
			mSleep(1000)
			pdditu()
			xunhuan(20,t154,"154")
		end
		likaifuben()
		xunhuan(360000,t150,"150")
	end
end
function wuxianshenyuan() 
	anquan() 
	zhidongpipei(0) 
	t155=os.time()
	while os.time()-t155<rwwuxianshenyuanshijian do
		if tonumber(os.date("%H"))==0 and tonumber(os.date("%M"))>=0 and tonumber(os.date("%M"))<6 then
			huodongshenyuan() 
		end
		jinruhuodongshenyuan() 
		if isColor(471+im,285,0xd6cfbd,85) and isColor(479+im,291,0xd6cfbd,85) and isColor(492+im,296,0xd6cfbd,85) then
			touch(388+im,414);mSleep(1000); 
		end
		t156=os.time()
		while pdditu()~=2 do
			mSleep(300);
			xunhuan(10,t156,"156")
		end
		mSleep(200)
		touchDown(1,150,500);mSleep(50);touchMove(1,200,500);mSleep(1500);touchUp(1,200,500);mSleep(50) 
		touchDown(1,150,500);mSleep(50);touchMove(1,150,550);mSleep(700);touchUp(1,150,550);mSleep(50) 
		local time1=os.time()	
		t157=os.time()
		while os.time()-time1<rwwuxianshenyuanjiange do
			pdzhidongzhandou(1) 
			mSleep(1000); 
			jiancha2() 
			xunhuan(600,t157,"157")
		end
		touch(870+ir,30);mSleep(1000); 
		touch(400+im,410);mSleep(500) 
		xunhuan(360000,t155,"155")
	end
end
function dixiaduobao() 

	if isColor(300,272,0xc6baa5,85) and isColor(307,271,0xcec7b5,85) and isColor(339,280,0xcec7b5,85) and isColor(306,311,0xd6cbb5,85) and isColor(376,417,0xdeb27b,85) then
		touch(390,410);mSleep(1000); 
		touch(570,410);mSleep(1000); 
	end

	touch(511,217);mSleep(3000); 
	if isColor(695+im,342,0xefcb94,85) and isColor(695+im,348,0xefc794,85) and isColor(796+im,136,0x842821,85) then
		touch(706+im,350)
		dialog("接取任务，完成任务",1);mSleep(500)
	end
	pdzhidongxunlu()
	while not(isColor(695+im,342,0xefcb94,85) and isColor(695+im,348,0xefc794,85) and isColor(796+im,136,0x842821,85)) do
		mSleep(1000)
	end
	touch(706+im,350)
	dialog("接取任务，完成任务",1);mSleep(500)
	likaifuben()
end
init("0",1);
math.randomseed(tostring(os.time()):reverse():sub(1, 6)) 
vibrator(); 
pdshebei() 
pdfanzhuan() 
zhuchengxu()
baojing()
dialog("脚本结束，谢谢您的使用", 9999);  

