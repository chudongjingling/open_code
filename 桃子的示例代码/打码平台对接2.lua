init("0",0)
luaExitIfCall(true)

State={}
State["记录"] = false
State["IP"] = "192.168.1.88"
function AddLog(text)   if State["记录"] then wLog(State["IP"], "[DATE] "..text)  end end
	State["Move"] = "/User/Media/TouchSprite/WeChat_move.txt"
	State["Path"] = "/User/Media/TouchSprite/lua/"



	function main()
		Code.GetOne()
		while true do
			if Login() then 
				Code.GetOne()
			end
		end
	end

	function Login()
		local BackStr="";
		local AppBid = "com.zhongsou.souyue"
		local IsLogin = false
		dialog(Code.PhoneNumber,2) 
		--ClearIos()
		if ClearBid(AppBid) then dialog("清理成功",1) else dialog("清理失败",0) end
		local ret=runApp(AppBid)
		if ret~=0 then
			BackStr="启动失败"
			goto Next;
		end
		mSleep(2000)
		for l=1,100 do
			--避免弹出通知
			isColor_Click(902, 1144, 0x007aff)
			isColor_Click(639, 1129, 0x50a0f7)
			isColor_Click(632, 1140, 0x4299f9)
			isColor_Click(599, 1135, 0x007aff)
			if isColor(578, 899, 0xff9621) then Click_Move(555, 871,87, 861) end
			if isColor(566, 664, 0x8abc1d) then Click_Move(555, 871,87, 861) end
			if isColor(536, 694, 0x06b1d0) then Click_Move(555, 871,87, 861) end
			isColor_Click(331, 512, 0x55b5f2)
			if isColor_Click(549, 254, 0xf4e7df) then goto L1 end
			mSleep(200)
		end
		BackStr="打开APP或登陆";goto Next
		::L1::

		if X_isColor_Click(329, 1088, 0xffffff, 5000)==false then BackStr="进入搜悦首页";goto Next end
		if X_isColor_Click(560, 982, 0xb7b7b7, 5000)==false then BackStr="跳过";goto Next end
		if X_isColor_Click(55, 107, 0xefefef, 5000)==false then BackStr="头像";goto Next end
		if X_isColor_Click(55, 107, 0xefefef, 5000)==false then BackStr="头像";goto Next end
		if X_isColor_Click(321, 203, 0xefefef, 5000)==false then BackStr="立即登陆";goto Next end
		if X_isColor_Click(134, 640, 0x007aff, 5000)==false then BackStr="不再提示";goto Next end
		if X_isColor_Click(530, 364, 0xd2d2d2, 5000)==false then BackStr="找回密码";goto Next end
		if X_isColor_Click(69, 291, 0xacacac, 5000)==false then BackStr="填写账号";goto Next end


		mSleep(1000)
		inputText(Code.PhoneNumber)
		mSleep(500)
		Click_XY(378, 429)

		if X_isColor_Click(393, 349, 0x67abdf, 5000)==false then BackStr="发送验证码";goto Next end

		mSleep(500)
		Click_XY(393, 349)
		mSleep(500)
		mSleep(500)
		Click_XY(98, 350)
		mSleep(500)
		inputText(string.match(Code.SMS("验证码为"),"%d%d%d%d%d%d"))
		mSleep(500)
		Click_XY(320, 501)

		if X_isColor_Click(61, 299, 0xa9a9a9, 5000)==false then BackStr="密码输入框";goto Next end
		mSleep(500)
		Click_XY(97, 294)
		mSleep(500)
		inputText("a123456")
		mSleep(500)
		Click_XY(113, 418)
		mSleep(500)
		inputText("a123456")
		mSleep(500)
		Click_XY(325, 516)
		mSleep(500)

		if X_isColor_Click(108, 242, 0xc7c7cd, 5000)==false then BackStr="登陆页面";goto Next end
		mSleep(500)
		Click_XY(202, 247)
		mSleep(500)
		inputText(Code.PhoneNumber)
		mSleep(500)
		Click_XY(190, 371)
		mSleep(500)
		inputText("a123456")
		mSleep(500)
		Click_XY(414, 487)
		mSleep(500)

		if X_isColor_Click(393, 349, 0x67abdf, 5000)==false then BackStr="发送验证码";goto Next end
		mSleep(500)
		Click_XY(393, 349)
		mSleep(500)
		Click_XY(98, 350)
		mSleep(500)
		inputText(string.match(Code.SMS("验证码为"),"%d%d%d%d%d%d"))
		mSleep(500)
		Click_XY(320, 501)

		if X_isColor_Click(108, 242, 0xc7c7cd, 5000)==false then BackStr="登陆页面";goto Next end
		mSleep(500)
		Click_XY(202, 247)
		mSleep(500)
		inputText(Code.PhoneNumber)
		mSleep(500)
		Click_XY(190, 371)
		mSleep(500)
		inputText("a123456")
		mSleep(500)
		Click_XY(414, 487)
		mSleep(500)

		for l = 1,50 do
			isColor_Click(402, 1071, 0x383838)--发现
			isColor_Click(57, 575, 0xffa3a3)--搜悦贺卡
			if isColor(475, 1068, 0xfee300) then break end--活动页面
			isColor_Click(33, 78, 0xc8c8c8)--返回
			mSleep(1000)
		end

		Click_Move(338,978,351,222)

		mSleep(1000)

		if X_isColor_Click(270, 978, 0xe1e1e1, 5000)==false then BackStr="立即充值";goto Next end
		dialog("完成",1)
		mSleep(5000)

		IsLogin = true

		::Next::
		closeApp(Bid)
		if BackStr ~= "" then dialog("出错位置:"..BackStr,2) end
		return IsLogin
	end


	function ClearIos()

		ret = runApp("org.ioshack.iGrimace")
		if ret~=0 then 
			dialogRet("iGrimace\n启动失败","","","",2)
			return false
		end
		mSleep(1000)

		for l = 1,10 do
			--IG2.05
			if (isColor(513, 831, 0xcccccc, 85) and isColor(431, 808, 0xcccccc, 85) and isColor(453, 806, 0xcccccc, 85) and isColor(499, 807, 0x000000, 85) and isColor(532, 810, 0x000000, 85) and isColor(553, 817, 0xcccccc, 85) and isColor(459, 825, 0xbbbbbb, 85) and isColor(447, 826, 0xcccccc, 85) and isColor(447, 826, 0xcccccc, 85) and isColor(472, 829, 0x232323, 85)) then
				Click_XY(490, 824)
				mSleep(3800)
				break
			end

			if (isColor(538, 846, 0xcccccc, 80) and isColor(415, 807, 0xcccccc, 80) and isColor(456, 807, 0xcccccc, 80) and isColor(499, 807, 0x3f3f3f, 80) and isColor(541, 807, 0xcccccc, 80) and isColor(580, 814, 0xcccccc, 80) and isColor(535, 825, 0xcccccc, 80) and isColor(471, 825, 0x969696, 80) and isColor(453, 840, 0xcccccc, 80) and isColor(478, 838, 0xcccccc, 80)) then
				Click_XY(489, 820)
				mSleep(3800)
				break
			end

			if (isColor(511, 973, 0xcccccc, 85) and isColor(454, 940, 0xcccccc, 85) and isColor(463, 948, 0x000000, 85) and isColor(485, 948, 0xcccccc, 85) and isColor(544, 951, 0xcccccc, 85) and isColor(512, 958, 0xcccccc, 85) and isColor(462, 964, 0x343434, 85) and isColor(435, 968, 0xcccccc, 85) and isColor(457, 973, 0xcccccc, 85) and isColor(493, 973, 0xcccccc, 85)) then
				Click_XY(489, 820)
				mSleep(3800)

				break
			end
			mSleep(500)
			if l==10 then 
				dialogRet("没有找到对应一键刷机按钮","","","",5)
				return false
			end
		end



		return true
	end


	function Code_(SeverIP)
		local Tmp = {}
		Tmp.Com, Tmp.Com_Sms, Tmp.PhoneNumber = 0, 0, 0

		function Tmp.GetOne()
			Tmp.Com, Tmp.PhoneNumber = string.match(Tmp.Post(SeverIP,"action=getone"),"(%w+),(%w+)")
			if Tmp.PhoneNumber ~= nil then
				return true
			else
				dialog("更新手机号码表后点击确定继续",0)
				return Tmp.GetOne()
			end
		end

		function Tmp.SmsNumber()
			return Tmp.Post(SeverIP,"action=smsn&com=" .. Tmp.Com)
		end

		function Tmp.SMS(Strs)
			local SMS_Number = Tmp.SmsNumber()
			dialog("当前端口"..Tmp.Com.."\n有"..SMS_Number.."条短信",1)

			while true do
				tmp = string.match(Tmp.SmsNumber(),"%d+")
				if tmp > SMS_Number  then 
					ret = Tmp.Post(SeverIP,"action=sms&com="..Tmp.Com.."&n="..tmp)
					b,z=string.find(ret,Strs)
					if b~=nil and z~=nil then
						Tmp.Com_Sms = ret
						dialog("取得短信\n\n"..ret,2)
						return ret
					else
						break
					end

				end
				SMS_Number = tmp
				dialog("等待短信接收",1)
				mSleep(1000)
			end
		end

		function Tmp.Post(Sever,Text)
			loadPlugin("NetworkTools")
			while true do
				tmp = callPlugin("NetworkTools", "httpPost", Sever.."$"..Text)
				if string.sub(tmp,1,1) ~="<" and string.sub(tmp,1,1) ~="!" then 
					break
				end
				dialog("等待1秒重试\n\n" .. tmp,1)
				mSleep(1000)
			end
			unloadPlugin("NetworkTools")
			return tmp
		end

		return Tmp
	end

--[[读取位置数据(文件不存在则为1)
--Int = Load_Location("c:/1.txt")]]
	function Load_Location(File)
		local L = Read_File(File)
		if L then 
			if string.match(L,"%d+") then
				return string.match(L,"(%d+)")
			else
				return 1
			end
		else
			return 1
		end
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

--[[写入文件内容(直接清空写入)
nil = F_SavesW("7364235F")]]
	function F_SavesW(File, text)
		local sFlie = io.open(File, "w") 
		sFlie:write(text); 
		sFlie:close() 
	end

--[[写入文件内容(原有基础上追加写入)
nil = F_SavesA("7364235F")]]
	function F_SavesA(File,text)
		local sFlie=io.open(File,"a+");
		sFlie:write(text .. "\r\n");
		sFlie:close();
	end

--[[删除文件
nil = F_Del("c:/1.txt")]]
	function F_Del(File)
		os.remove(File)
	end

--[[点击一个位置(t如果不填写则点击20毫秒)
nil = Click_XY(100,200,10)]]
	function Click_XY(x,y,t)
		touchDown(1, x, y)
		if t then mSleep(tonumber(t)) else mSleep(20) end
		touchUp(1, x, y)
	end

--[[从一个位置拖动到另一个位置(Step如果不填写则步长默认10个像素)
nil = Click_Move(100,200,200,200,10)]]
	function Click_Move(x1,y1,x2,y2,Step)
		if not Step then Step = 10 end
		local x,y = x1,y1
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
			if (math.abs(r-r1)/255)*100 < wc and
			(math.abs(g-g1)/255)*100 < wc and
			(math.abs(b-b1)/255)*100 < wc then
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
			if (math.abs(r-r1)/255)*100 < wc and
			(math.abs(g-g1)/255)*100 < wc and
			(math.abs(b-b1)/255)*100 < wc then
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
			if string.find(text,"-")~=nil then 
				return string.match(text, "(%w+)%W+(%w+)")
			else
				return "",""
			end
		end

--[[接码平台函数模块
vCode = v_Code("zhanghao","mima","97",0)    --初始化接码平台 0:爱码 1:飞Q 2:U码
vCode.getVcodeAndReleaseMobile()                --获取短信并不再使用
vCode.getVcodeAndHoldMobilenum(Pid2)            --获取短信继续使用(Pid2为二次接码PID)
vCode.addIgnoreList()                           --获取不到短信拉黑处理
vCode.getMobilenum()                            --获取手机号
vCode.Number                                    --手机号]]
		function v_Code(JM_User,JM_Pass,JM_PID,vCodeSelect)
			local Tmp = {}
			local JM_KFZ="chendbdb"     --开发者帐号

			local Number,Token="",""

			local function getVcodeAndReleaseMobile()
				if JM_Sever()=="" then return "" end
				for i=1,10,1 do
					tmp = Post(JM_Sever(),"action=getVcodeAndReleaseMobile&mobile="..Number.."&uid="..JM_User.."&token="..Token.."&author_uid="..JM_KFZ)
					if string.find(tmp,"|") ~= nil then 
						break
					end
					dialogRet("等待获取验证码\n"..i.."次共10次", "", "", "", 1)
					mSleep(5000)
				end
				if string.find(tmp,"|") ~= nil then 
					return string.sub(tmp,string.find(tmp,"|")+1,-1)
				else
					dialog(Errrr(tmp),2)
				end
			end

			local function getVcodeAndHoldMobilenum(Pid2)
				if JM_Sever()=="" then return "" end
				for i=1,10,1 do
					tmp = Post(JM_Sever(),"action=getVcodeAndHoldMobilenum&mobile="..Number.."&uid="..JM_User.."&token="..Token.."&author_uid="..JM_KFZ.."&next_pid="..PID)
					if string.find(tmp,"|") ~= nil then 
						break
					end
					dialogRet("等待获取验证码\n"..i.."次共10次", "", "", "", 1)
					mSleep(5000)
				end
				if string.find(tmp,"|") ~= nil then 
					return string.sub(tmp,string.find(tmp,"|")+1,-1)
				else
					dialog(Errrr(tmp),2)
				end
			end

			local function addIgnoreList()
				return Post(JM_Sever(),"action=addIgnoreList&mobile="..Number.."&uid="..JM_User.."&token="..Token.."&pid="..JM_PID)
			end

			local function getMobilenum()
				if JM_Sever()=="" then return "" end
				Number=""
				if Token=="" then 
					vCode_loginIn()
				end
				tmp = Post(JM_Sever(),"action=getMobilenum&pid="..JM_PID.."&uid="..JM_User.."&token="..Token)
				if string.find(tmp,"|")==12 then 
					Number=string.sub(tmp,1,11)
				else
					dialog(Errrr(tmp),2)
				end
				return Number
			end

			local function loginIn()
				Token = ""
				tmp = Post(JM_Sever(),"action=loginIn&uid="..JM_User.."&pwd="..JM_Pass)
				if string.find(tmp,"|") ~= nil then 
					Token = string.sub(tmp,string.find(tmp,"|")+1)
				else
					dialog(Errrr(tmp),2)
				end
				return Token
			end

			local function JM_Sever()
				local BackStr = ""
				if vCodeSelect==0 then 
					BackStr = "http://api.f02.cn/http.do"       --爱码
				elseif vCodeSelect==1 then 
					BackStr = "http://sms.xudan123.com/do.aspx" --飞Q
				elseif vCodeSelect==2 then 
					BackStr = "http://www.you-m.com/do.aspx"    --U码
				else
					BackStr = ""                                --返回空
				end
				return BackStr
			end

			local function Errrr(r)
				if r=="wait_a_moment" then
					return "数据加载中，请稍后进行操作."
				elseif r=="unknow_error" then
					return "未知错误,如果在获取号码或获取验证码时返回则再次请求就会正确返回."
				elseif r=="not_login" then
					return "没有登录,在没有登录下去访问需要登录的资源，忘记传入uid,token"
				elseif r=="not_found_project" then
					return "没有找到项目,项目ID不正确"
				elseif r=="not_found_moblie" then
					return "没有找到手机号"
				elseif r=="login_error" then
					return "用户名密码错误"
				elseif r=="mobile_exists" then
					return "手机号己存在"
				elseif r=="parameter_error" then
					return "传入参数错误"
				elseif r=="no_data" then
					return "没有数据"
				elseif r=="project_state_error" then
					return "项目状态不对,可能项目还没通过审核"
				elseif r=="mobile_state_error" then
					return "手机号状态不对,立即放弃该号码，调用getMobilenum获取新的号码，不用加黑"
				elseif r=="max_count_disable" then
					return "已经达到了当前等级可以获取手机号的最大数量，请先处理完您手上的号码再获取新的号码（处理方式：能用的号码就获取验证码，不能用的号码就加黑）"
				elseif r=="message|please try again later" then
					return "访问速度过快，请限速稍后再访问。说明：取号/50ms（每次间隔），取验证码/100ms（每次间隔），加黑/50ms（每次间隔）"
				elseif r=="account_is_locked" then 
					return "账号被锁定"
				elseif r=="account_is_stop" then 
					return "账号被停用。"
				else
					return r
				end
			end

			local function Post(Sever,Text)
				loadPlugin("NetworkTools")

				while true do
					tmp = callPlugin("NetworkTools", "httpPost", Sever.."$"..Text)
					if string.sub(tmp,1,1) ~="<" and string.sub(tmp,1,1) ~="!" then 
						break
					end
					dialog("等待1秒重试",1)
					mSleep(1000)
				end
				unloadPlugin("NetworkTools")
				return tmp
			end

			return {getVcodeAndReleaseMobile=getVcodeAndReleaseMobile,
				getVcodeAndHoldMobilenum=getVcodeAndHoldMobilenum,
				addIgnoreList=addIgnoreList,
				getMobilenum=getMobilenum,
				loginIn=loginIn,
				Sever=Sever,
				PID=PID,
				Errrr=Errrr,
				Post=Post,
				Number=Number,
				JM_KFZ=JM_KFZ,
				Token,Token}
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
			math.randomseed(tostring(os.time()):reverse():sub(1, 6))  
			math.random(string.len(strs)/Length)
			for i=1, i do
				z=math.random(string.len(strs)/Length)
				ret = ret..string.sub(strs,(z*Length)-(Length-1),(z*Length))

			end
			return(ret)
		end


--[[清理指定Bid内容(清理所有匹配的)
Str = ClearBid("com.tencent.xin")
Str = ClearBid("com.tencent.xin",true)  IOS8
]]
		function ClearBid(Bid,Ios8)
			local Info,HexInfo = "",""
			local index_a, index_b = 0,0

			local function Startindex()
				return string.sub(HexInfo,index_a-2,index_a-1)
			end

			local function Endindex()
				return string.sub(HexInfo,index_b+1,index_b+2)
			end

			local function isValidChar(char)
				local validChar = "31 32 33 34 35 36 37 38 39 30 61 62 63 64 65 66 67 68 69 6A 6B 6C 6D 6E 6F 70 71 72 73 74 75 76 77 78 79 7A 41 42 43 44 45 46 47 48 49 4A 4B 4C 4D 4E 4F 50 51 52 53 54 55 56 57 58 59 5A 2E 2D 5F"
				if string.find(validChar, char) ~= nil then
					return true
				else
					return false
				end
			end

			local function stripfilename(filename)
				return string.match(filename, "(.+)/[^/]*%.%w+$")
			end

			local HexBid = StrToHex(Bid)
			closeApp(Bid)
			mSleep(500)
			if not Ios8 then 
				os.execute("find /Applications/*.app/Info.plist /private/var/mobile/Applications/*/*.app/Info.plist -prune > \"/tmp/lua_getAppPath.log\"")
				local file = io.open("/tmp/lua_getAppPath.log", 'r')
				if file then
					for line in file:lines() do
						HexInfo = F_ReadHex(line)
						if HexInfo ~= "" then
							index_a, index_b = string.find(HexInfo, HexBid)
							if index_a ~= nil and index_b ~= nil then
								local tmpBid = Bid
								--[[
                        while (index_a > 0 and isValidChar(Startindex()) and string.len(Startindex())==2) do
                            tmpBid = HexToStr(Startindex()) .. tmpBid 
                            index_a = index_a - 2 
                        end
                         
                        while (index_b < string.len(HexInfo) and isValidChar(Endindex()) and string.len(Endindex())==2) do
                            tmpBid = tmpBid .. HexToStr(Endindex())
                            index_b = index_b + 2
                        end
                        dialog(Bid.."  "..tmpBid,1)
                        if Bid==tmpBid then
                        ]]
								local FilePath = ""
								FilePath = stripfilename(stripfilename(line))
								if FilePath ~= nil then 
									os.execute("rm -rf "..FilePath.."/tmp/*")
									os.execute("rm -rf "..FilePath.."/Library/Caches/*") --Library
									os.execute("rm -rf "..FilePath.."/Documents/*")
									os.execute("rm -rf "..FilePath.."/Library/Preferences/"..Bid..".plist")
									return true
								end
								--end
							end
						end
					end
					file:close()
					return false
				else
					return false
				end
			else
				os.execute("find /var/mobile/Containers/Data/Application/*/.com.apple.mobile_container_manager.metadata.plist -prune > \"/tmp/lua_getAppPath.log\"")
				local file = io.open("/tmp/lua_getAppPath.log", 'r')
				if file then
					for line in file:lines() do
						HexInfo = F_ReadHex(line)
						if HexInfo ~= "" then
							index_a, index_b = string.find(HexInfo, HexBid)
							if index_a ~= nil and index_b ~= nil then
								local tmpBid = Bid
								while (index_a > 0 and string.len(Startindex())==2 and isValidChar(Startindex())) do
									tmpBid = HexToStr(Startindex()) .. tmpBid 
									index_a = index_a - 2 
								end

								while (index_b < string.len(HexInfo) and string.len(Endindex())==2 and isValidChar(Endindex())) do
									tmpBid = tmpBid .. HexToStr(Endindex())
									index_b = index_b + 2
								end
								dialog(Bid.."  "..tmpBid,1)
								if Bid==tmpBid then
									local FilePath = ""
									FilePath = stripfilename(line)
									if FilePath ~= nil then 
										os.execute("rm -rf "..FilePath.."/tmp/*")
										os.execute("rm -rf "..FilePath.."/Library/Caches/*") --Library
										os.execute("rm -rf "..FilePath.."/Documents/*")
										os.execute("rm -rf "..FilePath.."/Library/Preferences/"..Bid..".plist")
										return true
									end
								end
							end
						end
					end
					file:close()
					return false
				else
					return false
				end
			end
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
		Code = Code_("http://192.168.1.88")
		main()
