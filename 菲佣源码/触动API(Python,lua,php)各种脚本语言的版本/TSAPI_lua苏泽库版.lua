tsopenapi = require ("tsopenapi")
local TS = {}
TS.request = tsopenapi.request
TS.getauth = tsopenapi.getauth
TS.key = "1m9KBrtFaGWY0eT2A1TGoY8KccjHTeYhxaVYbf858DZIRhSIW6LMVTqTiAoaOLV1"

function TS:new(ip)
	local r = {}
	r.ip = ip
	r.auth = "auth: "..self.getauth(self.key, {self.request(ip, "/deviceid", "GET", nil, nil, 50005, false)["message"]})["auth"]
	setmetatable(r,{__index = self})
	return r
end

function TS:refresh(mode)
	self.deviceid = self:getDeviceid()
	self.devicename = self:getDevicename()
	self.auth = "auth: "..self:getAuth()
	if mode then
		self.status = self:getStatus()
	end
	print("设备名: "..self.devicename)
	print("设备ID: "..self.deviceid)
	print("IP地址: "..self.ip)
	print("手机状态: "..(self.status or ""))
	print(self.auth)
end
function TS:getDeviceid() --设备号
	return self.request(self.ip, "/deviceid", "GET", nil, nil, 50005, false)["message"]
end
function TS:getDevicename() --设备号
	return self.request(self.ip, "/devicename", "GET", nil, nil, 50005, false)["message"]
end
function TS:getAuth() --验证
	return  self.getauth(TS.key, {self.deviceid})["auth"]
end
function TS:getStatus() --手机状态
	return  self.request(self.ip, "/status", "GET", nil, {self.auth}, 50005, false)["message"]
end
function TS:reboot() --重启
	return self.request(self.ip, "/reboot?type=1", "GET", nil, {self.auth}, 50005, false)["message"]
end
function TS:respring() --注销
	return self.request(self.ip, "/reboot?type=0", "GET", nil, {self.auth}, 50005, false)["message"]
end
function TS:setLuaPath(path) --设置运行文件
	paths = '{"path":"'..path..'"}'
	return self.request(self.ip, "/setLuaPath", "POST", paths, {self.auth,
		"Content-Type: application/json",
		"Connection: close",
		"Content-Length: "..#paths}, 50005, false)["message"]
end
function TS:runLua()
	return self.request(self.ip, "runLua", "GET", nil, {self.auth}, 50005, false)["message"]
end
function TS:stopLua()
	local header = self.header
	return self.request(self.ip, "stopLua", "GET", nil, {header}, 50005, false)["message"]
end
function TS:upload(localpath,localname,path,name,root)
	local path,name,root = path or "/",name or localname,root or "lua"
	local file = io.open(localpath..localname,"rb")
	local data = file:read("*all")
	file:close()
	local r = tsopenapi.request(self.ip, "/upload", "POST", data, {
	self.auth,
	"Host: "..self.ip,
	"root: "..root,  
	"path: "..path,  
	"filename: "..name,     
	"Connection: close",
	"Content-Type: touchsprite/uploadfile",
	"Content-Length: "..#data}, 50005, false)
	return r.message
end
function TS:getFile(name,path,root)
	local path,name,root = path or "/",name or localname,root or "lua"
	local r = tsopenapi.request(self.ip, "/getFile", "GET", nil, {
	self.auth,
	"Host: "..self.ip,
	"root: "..root,  
	"path: "..path,  
	"file: "..name,     
	"Connection: close"}, 50005, false)
	return r.message
end
function TS:runformlocal(path,name,tree)
	print("上传文件: "..self:upload(path,name,tree))
	print("设置路径: "..self:setLuaPath("/User/Media/TouchSprite/lua"..tree.."/"..name))
	print("运行程序: "..self:runLua())
	if self:getStatus() == "f01" then
		print("成功上传并运行")
	end
end
function TS.runphone(ip,name,tree)
	if not findMultiColorInRegionFuzzyExt then 
		local phone = TS:new(ip)
		local ml = tree or "/"
		phone:runformlocal("",name,ml)
	end
end
--return TS
local a = TS:new("192.168.10.210")
a:refresh(1)
