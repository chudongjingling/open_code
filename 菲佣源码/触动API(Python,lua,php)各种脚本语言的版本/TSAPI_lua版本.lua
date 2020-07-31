TS_API = {}
TS_API.key = CONFIG.TS_KEY 
TS_API.ip  = CONFIG.TestPhoneIP

if CONFIG.CustomIDESystem == "win" then 
	TS_API.savepath = "CustomIDE\\auth"
else 
	TS_API.savepath = "CustomIDE/auth"
end

local function APIGET(api,headers)
	http.TIMEOUT = 3
    local response_body = {}
    local rep , code = http.request{
        url = "http://"..TS_API.ip..":50005"..api,
        headers = headers  ,
        sink = ltn12.sink.table(response_body),
    }
    assert(rep,"找不到设备,请正确填写手机IP并保持触动服务开启!")
    return response_body
end

local function APIPOST(api,headers,data)
	http.TIMEOUT = 5
	local response_body = {}
    local rep , code = http.request{
        url = "http://"..TS_API.ip..":50005"..api,
        method = "POST",
        headers = headers  ,
        source = ltn12.source.string(data),
        sink = ltn12.sink.table(response_body),
    }
    assert(rep,"找不到设备,请正确填写手机IP并保持触动服务开启!")
    return response_body
end

local function SaveAuth(id,auth)
	local file = io.open(TS_API.savepath,"w")
	if file then
		file:write(id.."\n"..os.time().."\n"..auth.."\n"..TS_API.key.."\n"..TS_API.ip.."\n")
		file:close();
    end
end

local function LoadAuth(id)
	local file = io.open(TS_API.savepath,"r")
	if file then
		if file:read("*l") == id then
			if os.time()-(tonumber(file:read("*l")) or 0) < 3560 then
				TS_API.auth = file:read("*l")
				return true
			end
		end
    end
end

function TS_API:Load()
	local file = io.open(TS_API.savepath,"r")
	if file then
		local id    = file:read("*l")
		local time  = file:read("*l")
		self.auth = file:read("*l")
		self.key  = file:read("*l")
		self.ip   = file:read("*l")
	end
end

function TS_API:getAuth()
	local id = APIGET("/deviceid")[1]
	if LoadAuth(id) then return true end
	local request = {
			action = "getAuth",
			key = self.key,
			devices = {id},
			valid = 3600,
			time = os.time()
		}
	local data = sz.json.encode(request)
	http.TIMEOUT = 5
	local response_body = {}
    local rep , code = http.request{
        url = CONFIG.TS_APIServer,
        headers = {["Content-Length"] = #data},
   		source = ltn12.source.string(data),		
        sink = ltn12.sink.table(response_body),
    }
    assert(code==200,"获取Auth的服务器无法链接,请检查Server地址是否正确或者联系作者!")
    assert(response_body[1]:find("auth"),"开发者KEY错误!")
    local auth = sz.json.decode(response_body[1])
    self.auth = auth.auth
    SaveAuth(id,self.auth)
end

function TS_API:upload()
	local function up(filetable)
		local localfile,path,filename = filetable[1],filetable[2],filetable[3]
		local file = io.open(localfile,"rb")
		local data = file:read("*all")
		file:close()
		local headers = {
				["auth"] = self.auth,
				["Host"] = self.ip,
				["root"] = CONFIG.TS_MainPath,
				["path"] = path,
				["filename"] = filename,
				["Connection"] =  "close",
				["Content-Type"] = "touchsprite/uploadfile",
				["Content-Length"] = #data,
			}
		assert (APIPOST("/upload",headers,data)[1] == "ok", "文件: "..filename.."上传失败,请重试")
		return true
	end
	local uploadlist = assert(require "CustomIDE.filelist","获取本地文件失败:您的系统可能不被支持")
	for k,v in pairs(uploadlist) do
		up(v)
	end
end


function TS_API:setLuaPath() 
	local datat = {path="/User/Media/TouchSprite/"..CONFIG.TS_MainPath.."/"..CONFIG.Main_Lua}
	local data = sz.json.encode(datat)
	local headers = {
			["auth"] = self.auth,
			["Content-Type"] = "application/json",
			["Connection"] = "close",
			["Content-Length"] = #data,
		}
	assert (APIPOST("/setLuaPath",headers,data)[1] == "ok", "设置运行文件: "..CONFIG.Main_Lua.."失败,请重试")
end

function TS_API:runLua()
	local headers = {["auth"] = self.auth}
	if APIGET("/runLua",headers)[1] == "ok" then return true end
	local status = APIGET("/status",headers)[1]
	assert(status == "f00","远程启动脚本失败,请重试,如有错误弹窗,请手动关闭")
	local code = {f00 = "空闲" , f01 = "运行",f02 = "录制"}
	assert(nil,"手机处于\""..code[status].."\"状态,请先停止手机运行")
end

function TS_API:stopLua()
	local headers = {["auth"] = self.auth}
	if APIGET("/stopLua",headers)[1] == "ok" then return false end
	local status = APIGET("/status",headers)[1]
	assert(status == "f01","远程关闭脚本失败,请手动关闭")
end
