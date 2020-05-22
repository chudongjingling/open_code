function rndLetter(num)
local ret = ""
pcall(function()
for var = 1,num do
if math.random()>0.5 then
ret = ret..string.char(math.random(65,90))
else
ret = ret..string.char(math.random(97,122))
end
end
end)
return ret
end

--用法
math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,6))) --设置随机种子
for var = 1,5 do
nLog(rndLetter(10)) --生成一个 10 位随机大小写字母的字符串
end
