require("TSLib")
local list = getUserApp()
for i=1,#list do
toast("卸载第"..i.."个","共"..#list.."个",10)
if not string.find("com.netease.onmyoji,com.idleif.abyssrium",list[i]) then
ipaUninstall(list[i])
mSleep(50)
end
end
