--由于 lua 中的随机函数产生的随机数是伪随机，我们需要设置一个随机种子来解决此问题
--改进方法
math.randomseed(tostring(os.time()):reverse():sub(1, 6)) -- 随机种子
dialog(math.random())
--进阶方法，需加载扩展库中的 socket 模块
local ts = require("ts")
local socket = require("szocket") -- 需要用到 luasocket 库 
local function get_seed() 
local t = string.format("%f", socket.gettime())
local st = string.sub(t, string.find(t, "%.") + 1, -1) 
return tonumber(string.reverse(st))
end 
math.randomseed(get_seed()) 
for var = 1,5 do
nLog(math.random())
end
