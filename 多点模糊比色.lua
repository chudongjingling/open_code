--在实际游戏脚本制作中，很多界面单靠 1 个点不容易进行准确的判断，这里封装一个配合 table 使用的多点模糊比色函数来实现精确判断：
--参数 s 为模糊度，范围 0 - 100，一般使用 90 即可。
--实例中的 table 格式可使用触动精灵抓色器生成。
function multiColor(array,s)
s = math.floor(0xff*(100-s)*0.01)
keepScreen(true)
for var = 1, #array do
local lr,lg,lb = getColorRGB(array[var][1],array[var][2])
local r = math.floor(array[var][3]/0x10000)
local g = math.floor(array[var][3]%0x10000/0x100)
local b = math.floor(array[var][3]%0x100)
if math.abs(lr-r) > s or math.abs(lg-g) > s or math.abs(lb-b) > s then
keepScreen(false)
return false
end
end
keepScreen(false)
return true
end

--用法
g_t_Table = {
{ 1962, 52, 0xefdccf},
{ 2150, 50, 0xefd8d0},
{ 1964, 76, 0xe9d1c5},
{ 2152, 74, 0xefdcd1},
{ 2122, 62, 0xf1ddd1},
{ 2146, 1080, 0x893824},
{ 1840, 1082, 0x593724},
}
if multiColor(g_t_Table,90) then
touchDown(100,100)
mSleep(50)
touchUp(100,100)
end
