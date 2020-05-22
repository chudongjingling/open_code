function randomStr(str, num)
local ret =''
for i = 1, num do
local rchr = math.random(1, string.len(str))
ret = ret .. string.sub(str, rchr, rchr)
end
return ret
end

--用法
math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,6))) --设置随机种子
for var = 1,5 do
s = randomStr("abcdefghijklmnopqrstuvwxyz", 6) --生成 6 位随机字母
nLog(s)
end
