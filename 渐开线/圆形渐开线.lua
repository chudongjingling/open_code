init(1)
mSleep(1000)

local x0 = 1010 --起始坐标x
local y0 = 698 --起始坐标y
local rr = 20 --设置递增半径 
local l = 10 --设置点间距 
local p = 0 --初始化角度 
local r = 30 --设置首圈半径
local rn = 10 --设置圈数
touchDown(x0, y0)
mSleep(100)
for var = 1,rn do
while p < math.pi * 2 do
x = x0 + r * math.cos(p) 
y = y0 - r * math.sin(p) 
touchMove(x, y)
mSleep(10)
p = p + l/r
end
p = 0
r = r + rr 
end
touchUp(x0, y0)
