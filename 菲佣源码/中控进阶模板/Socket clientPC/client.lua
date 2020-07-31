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
-- client.lua
local socket = require("socket")
local json = require ("dkjson")
local host = "192.168.10.23"
local port = 12345
local sock = socket.connect(host, port)
sock:settimeout(1)

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

local command = {}
function command.send(t)
    local j = jsoncov(t)
    assert(sock:send(j.."\n"))
end
function command.back(com)
    print("server back:"..com.message)
end

local zc = {  command = "validate",
        info = {
                os_type = "IOS",        --返回设备的系统类型 iOS、android
                type = "Ihpone",        --设备类型 0 == iPod Touch；1 == iPhone；2 == iPad
                tsid = 1,               --触动设备号
                versionts = "2.2.6",    --触动版本号
                versionos = "8.3",      --系统版本号
                tsp = "lua",    --脚本运行状态            
                },
        sprite = "test1",
        usertype = "phone",
        }
local cx = {command = "validate"}
local sendt
local input
print("请输入要模拟的手机编号:")
while true do 
    input = io.read()
    if tonumber(input) then
        sendt = zc
        sendt.info.tsid = tonumber(input)
        break
    else
        print("请输入数字:")
    end
end
print("请输入要模拟的运行脚本的名字:") 
input = io.read()
if #input>0 then
    sendt.sprite = input
end
command.send(sendt)

local input, recvt, sendt, status
while true do
    recvt, sendt, status = socket.select({sock}, nil, 1)
    while #recvt > 0 do
        local response, receive_status = sock:receive()
        if receive_status ~= "closed" then
            if response then
            	com = json.decode(response)
                if command[com.command] then
                    command[com.command](com)
                else
                    print("无法识别服务器的命令:\n"..response)
                end
                recvt, sendt, status = socket.select({sock}, nil, 1)
            end
        else
            break
        end
    end
end

