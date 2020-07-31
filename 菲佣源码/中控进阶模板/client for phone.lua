----------------------------------------------------
    ------------中控纯lua版,随便做着玩玩------------    
    ------------有能力的同学请自行修改-----------
----------------------------------------------------
    ------------版权所无，敬请复制--------------
    ------------您可以随意使用代码--------------
----------------------------------------------------
    ------------脚本制作人：菲佣----------------
    ------------创建时间：2016-1-19------------
----------------------------------------------------
local sz = require("sz")
local json = sz.json

local command = {
                    getinfo = true,
                    save = true ,
                    back = true , 
                    inquiry = true,
                    control = true ,
                }
local errorcode = {
                [101] = "Invalid command" ,
                [102] = "validate fail" ,

	}
	--克隆表格
function CloneTab(tab)
    if type(tab) ~= "table" then return tab end
    local function _dump(t)
        local cl = {}
        for k, v in pairs(t) do
            if type (k) == "userdata" then  
              k = tostring(k):sub(14,22)
            end
            if type(v) == "table" then
                cl[k] = _dump(v)       
            elseif type(v) == "string" or type(v) == "number" then
                cl[k] = v
            end
        end
            return cl
    end
    return _dump(tab)
end
--Json转换,输入的是表,则返回json,输入json,则返回表
local function jsoncov(j) 
    if type(j) == "table" and next(j) ~= nil then
        local j = CloneTab(j)
        local tojson = json.encode(j) 
        return tojson
    elseif type(j) == "string" and #j >0 then
        local totable = json.decode(j)
        if type(totable) ~= "table" then return {command="error"} end
        --解决json模块的数组和哈希共存
        local r = {}
        for k,v in pairs (totable) do
            if tonumber(k)  then
                r[tonumber(k)] = v
            else
                r[k] = v
            end
        end
        return r
    else 
        return {command=nil} 
    end
end
local _class={} 
function class(super)
    local class_type={}
    class_type.ctor=false
    class_type.super=super
    class_type.new=function(...) 
            local obj={}
            do
                local create
                create = function(c,...)
                    if c.super then
                        create(c.super,...)
                    end
                    if c.ctor then
                        c.ctor(obj,...)
                    end
                end
                create(class_type,...)
            end
            setmetatable(obj,{ __index = _class[class_type] })
            return obj
        end
    local vtbl={}
    _class[class_type]=vtbl
 
    setmetatable(class_type,{__newindex=
        function(t,k,v)
            vtbl[k]=v
        end
    })
    if super then
        setmetatable(vtbl,{__index=
            function(t,k)
                local ret=_class[super][k]
                vtbl[k]=ret
                return ret
            end
        })
    end
    return class_type
end

client = class()
function client:ctor(host,port,timeout)
    self.host = host 
    self.port = port or 12345
    self.timeout = timeout or 0
end
function client:conn()
	self.sock = assert(socket.connect(self.host, self.port))
	self.sock:settimeout(self.timeout)
end
function client:send(t)
	local j = jsoncov(t)
    assert(self.sock:send(j.."\n"))
end
function client:recvt()
    while 1 do
        local response, receive_status = self.sock:receive()
        if receive_status ~= "closed" then
            if response then
				nLog(response)
            	return json.decode(response)
            end
        else
            break
        end
    end
end
function client:validate()
	local zc = {  command = "validate",
        info = {
                os_type = "IOS",        --返回设备的系统类型 iOS、android
                type = "Ihpone",        --设备类型 0 == iPod Touch；1 == iPhone；2 == iPad
                tsid = 6,               --触动设备号
                versionts = "2.2.6",    --触动版本号
                versionos = "8.3",      --系统版本号
                tsp = "lua",    --脚本运行状态            
                },
        sprite = "test1",
        usertype = "control",
	}
	self:send(zc)
	self:recvt()
end
function client:getinfo()
	local cx = {command="getinfo",select={"allconn"}}
	self:send(cx)
	return self:recvt()
end
FYctrl = client.new("192.168.10.23",12345,10)
FYctrl:conn()
FYctrl:validate()
local si = FYctrl:getinfo()
local sm = jsoncov(si.message)
MyTable = {
	["style"] = "default",
	["orient"] = 1,
  	["width"] = ({getScreenSize()})[2],
  	["height"] = ({getScreenSize()})[1],
  	["config"] = "config.dat",
  	["pagetype"] = "multi",
  	["cancelname"] = "取消",
  	["okname"] = "确定",
  	["timer"] = 200,
	pages = {{}},
}
local i = 1
for k,v in pairs(sm) do
	MyTable.pages[1][i] = {}
	MyTable.pages[1][i].type = "CheckBoxGroup"
	MyTable.pages[1][i].size = "12"
	MyTable.pages[1][i].align = "left"
	MyTable.pages[1][i].color = "0,0,255"
	MyTable.pages[1][i].list = v.name.."		"..v.conntime.."		"..v.info.tsid.."		"..v.user.date
	i = i + 1
end
local MyJsonString = json.encode(MyTable);
retTable = {showUI(MyJsonString)};
for var = 1,#retTable do
    nLog(retTable[var])   --输出每一个返回值
end
