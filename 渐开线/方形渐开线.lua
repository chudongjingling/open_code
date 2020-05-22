init(1)
mSleep(1000)

local x = 1010 --起始坐标x
local y = 698 --起始坐标y
local v = 30 --两点间距离
touchDown(x, y)
mSleep(100)
for var = 1,20 do
j = 0
k = v
for _i = 1,2 do
for i = 1,10 do
x = x + j
y = y + k
touchMove(x, y)
mSleep(20)
end
j = v
k = 0
end
v = v * (-1.05)
end
touchUp(x, y)
