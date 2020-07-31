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
-- server.lua
local socket = require("socket")
local json = require ("dkjson")
--设置开放的命令
local command = {}
command.phone = {   
                    getinfo = true,
                    save = true ,
                    back = true ,
                }
command.control = {
                    getinfo = true,
                    save = true ,
                    back = true , 
                    inquiry = true,
                    control = true ,
                }
command.other = {
                    validate = true
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
--服务器类
server = class()
function server:ctor(host,port,timeout)
    self.host = host or "127.0.0.1"
    self.port = port or "12345"
    self.timeout = timeout or 0
    self.client = {}
    self.disconnect = {}
    self.count = 0
    self.user = require("ConvertXML")
end
function server:start()
    if self.server then
        self.server:close()
        print (self.server)
        print("Server closed" .. self.host .. ":" .. self.port)  
    end
    self.server = assert(socket.bind(self.host, self.port, 1024))
    self.server:settimeout(self.timeout)
    print(self.server)
    print("Server Start " .. self.host .. ":" .. self.port) 
end
function server:addconn()
    local conn = self.server:accept()
    if conn then
        self.count = self.count + 1
        self.client[conn] = client.new(conn,self.count)
        print("A client successfully connect!") 
    end
end
function server:removeconn(conn)
    self.client[conn].conn = "disconnect"
    self.client[conn].connend = os.date("%Y-%m-%d %H:%M:%S", os.time())
    print("Client: "..self.client[conn].name .. " disconnect!")
    table.insert(self.disconnect,self.client[conn])
    conn:close()
    self.client[conn] = nil
end
function server:authorize(tsid,sprite)
    local t = tonumber(os.date("%Y%m%d",os.time()))
    if tonumber(self.user[tsid].date) >= t and (self.user[tsid].sprite.all or self.user[tsid].sprite[sprite]) then
        return true
    else
        return false
    end
end
function server:listen()
    for conn_count, client in pairs(self.client) do
        local recvt, sendt, status = socket.select({client.conn}, nil, 0)
        if #recvt > 0 then
            local receive, receive_status = client.conn:receive()
            if receive_status ~= "closed" then
                if receive then
                    local com = jsoncov(receive) 
                    if command[client.type][com.command] then
                        client[com.command](client,com,self)
                    elseif client.type ~= "other" then
                        client:send({command = "back",errorcode = 101})
                    end
                end
            else
               self:removeconn(conn_count)
            end
        end         
    end
end
--客户端类
client = class()
control = class(client)
phone = class(client)
function client:ctor(conn,count)
    self.type = "other"
    self.name = "client "..count
    self.conn = conn
    self.conntime = os.date("%Y-%m-%d %H:%M:%S", os.time())
end
function client:validate(com,server)
    local az = server:authorize(com.info.tsid,com.sprite)
    local switchkey = {
                        control = function () setmetatable(self,{__index = _class[control]}) end,
                        phone = function () setmetatable(self,{__index = _class[phone]}) end
                    }
    local key = switchkey[com.usertype]
    if az and key then
        key()
        self.type,self.sprite,self.info,self.user = com.usertype,com.sprite,com.info,server.user[com.info.tsid]
        self.name = self.user.devicename
        self:send({command = "back",message = "Validate Type "..self.type.." Complite"})
    else
        self:send({command = "back",errorcode = 102})
    end
end
function client:send(t)
    local j = jsoncov(t)
    assert(self.conn:send(j.."\n"))
    print ("send "..self.name.."\n"..j)
end
function phone:getinfo()
    local r = jsoncov({self})
    self:send({command = "back",message = r})
end     
function control:getinfo(com,server)
    local user 
    local switchkey = {
                        allconn = function () user = server.client end,
                        all = function () 
                                        user = server.client
                                        for k,v in pairs(server.disconnect) do
                                             table.insert(user,v)
                                        end
                                    end,
                        alldisconn = function () user = server.disconnect end,
                        this = function () user = {self} end,
                        selectuser = function () 
                                            for k,v in pairs(com.select[2]) do
                                                if server.client[v] then
                                                   table.insert(user,v)
                                                end  
                                            end
                                        end
                    }
    if switchkey[com.select[1]] then 
        switchkey[com.select[1]]()
        local r = jsoncov(user)
        self:send({command = "back",message = r})
    else
        self:send({command = "back",message = 102})
    end
end

function main()
    local FYServer = server.new("192.168.10.23")
    FYServer:start()
    while true do
        FYServer:addconn()
        FYServer:listen()
    end
end

main()