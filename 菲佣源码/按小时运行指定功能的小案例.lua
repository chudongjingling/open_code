--按小时定时运行任务的简单案例
local dayrun = {}
local day
local timerun = {}
--把时间段的工作都分装进时间运行的入口
timerun[18] = function ()
	print("以下为18点后做的事情")
end
timerun[21] = function ()
	print("以下为19点后做的事情")
end
function timerun.other()
	--如果其他时间不做事情,可以一直mSleep
	--计算当前时间的分钟数,计算出到下个小时的时间
	local t = 60 - tonumber(os.date("%M",os.time()))
	mSleep(t * 60 * 1000 or 60000)
end
--进入循环判断
while true do
	--以天为单位,初始化一下
	if day ~= os.date("%d",os.time()) then
		for i = 1,24 do
			if timerun[i] then
				dayrun[i] = timerun[i]
			else
				dayrun[i] = false
			end
		end
		day = os.date("%d",os.time())
	end
	local timeH = tonumber(os.date("%H",os.time()))
	for i,v in ipairs(dayrun) do
		if v and timeH >= i then
			v()
			v = false
		end
		if i == 24 then timerun.other() end
	end
end
	
