--[[
简单的发账号示例
script/account.txt 内保存账号密码
--]]

local ok,account = telib:controller_injection(
[[
local f = io.open("script/account.txt", "r")
if f then
local account_tab = {} 
local account = f:read()
while account do 
table.insert(account_tab,account) 
account = f:read() 
end
f:close()

if #account_tab > 0 then
local f = io.open("script/account.txt", "w")
if f then
for i = 2,#account_tab do
f:write(account_tab[i].."\n")
end
f:close()
end
return account_tab[1]
else
return false
end 
end
return false
]]
)

assert(ok,account)
if account then
nLog("获取账号:"..account)
toast("获取账号:"..account)
else
nLog("获取账号失败")
toast("获取账号失败")
end
mSleep(1000)
----------
