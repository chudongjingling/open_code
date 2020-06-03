--[[接码平台函数模块
"http://api.f02.cn/http.do"       --爱码
"http://sms.xudan123.com/do.aspx" --飞Q
"http://www.you-m.com/do.aspx"    --U码
  
local vCode = _vCode("http://api.f02.cn/http.do","asfa","sds","29")     --初始化接码平台 0:爱码 1:飞Q 2:U码
vCode.getVcodeAndReleaseMobile()                                        --获取短信并不再使用
vCode.getVcodeAndHoldMobilenum(Pid2)                                    --获取短信继续使用(Pid2为二次接码PID)
vCode.addIgnoreList()                                                   --获取不到短信拉黑处理
vCode.getMobilenum()                                                    --获取手机号
vCode.Number                                                            --手机号
  
    msg = vCode.getVcodeAndReleaseMobile()
    b,z=string.find(msg,"%d%d%d%d%d%d")  --获取6个长度数值
    if (b==nil or z==nil) then
        vCode.addIgnoreList()
        dialog("短信没有获取到",2)
        goto Next; --出错跳转至结尾
    end
    inputText(string.sub(msg,b,z))
  
]]
function _vCode(Sever,User,Pass,PID)
	local Tmp = {}
	Tmp.KFZ, Tmp.Number, Tmp.Token = "chendbdb", "", ""

	function Tmp.getVcodeAndReleaseMobile()
		local RetTmp = ""
		for i=1,20,1 do
			RetTmp = Tmp.Post(Sever,"action=getVcodeAndReleaseMobile&mobile="..Tmp.Number.."&uid="..User.."&token="..Tmp.Token.."&author_uid="..Tmp.KFZ)
			if string.find(RetTmp,"|") ~= nil then 
				break
			end
			dialogRet("等待获取验证码\n"..i.."次共20次", "", "", "", 1)
			mSleep(3000)
		end
		if string.find(RetTmp,"|") ~= nil then 
			return string.sub(RetTmp,string.find(RetTmp,"|")+1,-1)
		else
			dialog(Errrr(RetTmp),2)
			return ""
		end
	end

	function Tmp.getVcodeAndHoldMobilenum(Pid2)
		local RetTmp = ""
		for i=1,10,1 do
			RetTmp = Tmp.Post(Sever,"action=getVcodeAndHoldMobilenum&mobile="..Tmp.Number.."&uid="..User.."&token="..Tmp.Token.."&author_uid="..Tmp.KFZ.."&next_pid="..Pid2)
			if string.find(RetTmp,"|") ~= nil then 
				break
			end
			dialogRet("等待获取验证码\n"..i.."次共10次", "", "", "", 1)
			mSleep(5000)
		end
		if string.find(RetTmp,"|") ~= nil then 
			return string.sub(tmp,string.find(RetTmp,"|")+1,-1)
		else
			dialog(Errrr(RetTmp),2)
			return ""
		end
	end

	function Tmp.addIgnoreList()
		return Tmp.Post(Sever,"action=addIgnoreList&mobile="..Tmp.Number.."&uid="..User.."&token="..Tmp.Token.."&pid="..PID)
	end

	function Tmp.getMobilenum()
		Tmp.Number=""
		if Tmp.Token=="" then Tmp.loginIn() end
		local RetTmp = Tmp.Post(Sever,"action=getMobilenum&pid="..PID.."&uid="..User.."&token="..Tmp.Token)
		if string.find(RetTmp,"|")==12 and string.len(string.match(RetTmp,"(%d+)")) == 11 then 
			Tmp.Number=tonumber(string.sub(RetTmp,1,11))
		else
			return false
		end
		return true
	end

	function Tmp.loginIn()
		local RetTmp = Tmp.Post(Sever,"action=loginIn&uid="..User.."&pwd="..Pass)
		if string.find(RetTmp,"|") ~= nil then 
			Tmp.Token = string.sub(RetTmp,string.find(RetTmp,"|")+1)
			return true
		else
			dialog(Errrr(RetTmp),2)
			return false
		end
	end

	function Errrr(r)
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

	function Tmp.Get(Url)
		local Http = require("sz").i82.http
		local Status, Headers, Body
		while true do
			Status, Headers, Body = Http.get(Url, 5)
			if Headers ~= nil and Body ~= "" then
				break
			else
				dialog("等待3秒重试",1)
				mSleep(3000)
			end
		end
		return Body
	end

	function Tmp.Post(Url,PostData)
		local Http = require("sz").i82.http
		local Status, Headers, Body
		while true do
			Status, Headers, Body = Http.post(Url, 5, "", PostData)
			if Headers ~= nil and Body ~= "" then
				break
			else
				dialog("等待3秒重试",1)
				mSleep(3000)
			end
		end
		return Body
	end

	return Tmp
end

--[[
        local vCode = YIma("asdf","asgg",4282)
        vCode.getPhone()
        vCode.getMessage()
        vCode.Number
        vCode.addBlacklist()
         
--]]
function YIma(User,Pass,PID)
	local Tmp = {
		["Sever"] = "http://www.yzm1.com/api/do.php",
		["KFZ"] = "chendbdb",
		["Number"] = "",
		["Token"] = "",
	}

	function Tmp.getMessage()
		local RetTmp = ""
		for i=1,20,1 do
			RetTmp = Tmp.Post(Tmp.Sever,"action=getMessage&phone="..Tmp.Number.."&token="..Tmp.Token.."&author="..Tmp.KFZ.."&sid="..PID)
			if string.sub(RetTmp,1,1) == "1" then 
				break
			end
			dialogRet("等待获取验证码\n"..i.."次共20次", "", "", "", 0.2)
			mSleep(2000)
		end
		if string.sub(RetTmp,1,1)=="1" then 
			return string.sub(RetTmp,3,-1)
		else
			dialog(RetTmp,2)
			return ""
		end
	end

	function Tmp.addBlacklist()
		return Tmp.Post(Tmp.Sever,"action=addBlacklist&phone="..Tmp.Number.."&token="..Tmp.Token.."&sid="..PID)
	end

	function Tmp.getPhone()
		Tmp.Number=""
		if Tmp.Token=="" then Tmp.loginIn() end
		local RetTmp = Tmp.Post(Tmp.Sever,"action=getPhone&sid="..PID.."&token="..Tmp.Token)
		if string.sub(RetTmp,1,1) == "1" then 
			Tmp.Number = tonumber(string.match(RetTmp,"|(%d+)"))
			return true
		else
			dialog(RetTmp,0)
			return false
		end
	end

	function Tmp.loginIn()
		local RetTmp = Tmp.Post(Tmp.Sever,"action=loginIn&name="..User.."&password="..Pass)
		if string.sub(RetTmp,1,1) == "1" then 
			Tmp.Token = string.sub(RetTmp,3,-1)
			return true
		else
			dialog(RetTmp,0)
			return false
		end

	end

	function Tmp.Get(Url)
		local Http = require("sz").i82.http
		local Status, Headers, Body
		while true do
			Status, Headers, Body = Http.get(Url, 5)
			if Headers ~= nil and Body ~= "" then
				break
			else
				dialog("等待3秒重试",1)
				mSleep(3000)
			end
		end
		return Body
	end
	function Tmp.Post(Url,PostData)
		local Http = require("sz").i82.http
		local Status, Headers, Body
		while true do
			Status, Headers, Body = Http.post(Url, 5, "", PostData)
			if Headers ~= nil and Body ~= "" then
				break
			else
				dialog("等待3秒重试",1)
				mSleep(3000)
			end
		end
		return Body
	end

	return Tmp

end
function YZM51(User,Pass,PID)
	local Tmp = {
		["Sever"] = "http://www.jikesms.com/common/ajax.htm",
		["KFZ"] = "chendbdb",
		["Number"] = "",
		["Token"] = "",
	}

	function Tmp.getMessage()
		local RetTmp = ""
		local sz = require("sz")
		local TmpJson = {}
		for i=1,20,1 do
			RetTmp = Tmp.Post(Tmp.Sever,"action=phone:PhoneEventAction&event_name_getMessage=提交&phone="..Tmp.Number.."&token="..Tmp.Token.."&partnerId="..Tmp.KFZ.."&serviceId="..PID)
			TmpJson = sz.json.decode(RetTmp)
			if TmpJson.succeed then 
				return TmpJson.model.message

			end
			dialogRet("等待获取验证码\n"..i.."次共20次\n"..TmpJson.model.message, "", "", "", 0.5)
			mSleep(2000)
		end

		return ""
	end

	function Tmp.addBlacklist()
		return Tmp.Post(Tmp.Sever,"action=phone:PhoneEventAction&event_name_addBlacklist=提交&phone="..Tmp.Number.."&token="..Tmp.Token.."&serviceId="..PID)
	end

	function Tmp.getPhone()
		Tmp.Number=""
		local sz = require("sz")
		if Tmp.Token=="" then Tmp.loginIn() end
		local RetTmp = Tmp.Post(Tmp.Sever,"action=phone:PhoneEventAction&event_name_getPhone=提交&serviceId="..PID.."&token="..Tmp.Token)
		local TmpJson = sz.json.decode(RetTmp)
		if TmpJson.succeed then 
			Tmp.Number = TmpJson.model.phone
			return true
		else
			dialog(TmpJson.model.message,0)
			return false
		end
	end

	function Tmp.loginIn()
		local sz = require("sz")
		local RetTmp = Tmp.Post(Tmp.Sever,"action=user:UserEventAction&event_name_login=提交&uid="..User.."&password="..Pass:md5().."&useToken=true")
		local TmpJson = sz.json.decode(RetTmp)
		if TmpJson.succeed then 
			Tmp.Token = TmpJson.model.token
			return true
		else
			dialog(TmpJson.model.message,0)
			return false
		end

	end

	function Tmp.Get(Url)
		local Http = require("sz").i82.http
		local Status, Headers, Body
		while true do
			Status, Headers, Body = Http.get(Url, 5)
			if Headers ~= nil and Body ~= "" then
				break
			else
				dialog("等待3秒重试",1)
				mSleep(3000)
			end
		end
		return Body
	end
	function Tmp.Post(Url,PostData)
		local Http = require("sz").i82.http
		local Status, Headers, Body
		while true do
			Status, Headers, Body = Http.post(Url, 5, "", PostData)
			if Headers ~= nil and Body ~= "" then
				break
			else
				dialog("等待3秒重试",1)
				mSleep(3000)
			end
		end
		return Body
	end

	return Tmp

end
