local nowTime = os.date("*t",os.time()) --返回一个 table
dialog(nowTime.year, 0) --年
dialog(nowTime.month, 0) --月
dialog(nowTime.day, 0) --日
dialog(nowTime.hour, 0) --小时
dialog(nowTime.min, 0) --分钟
dialog(nowTime.sec, 0) --秒钟
dialog(nowTime.yday, 0) --显示当前为一年中的第几天

--时间戳格式化当前时间
local nowTime = os.date("%Y-%m-%d %H:%M:%S", os.time())
dialog(nowTime,0)
