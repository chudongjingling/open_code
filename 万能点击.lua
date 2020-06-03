local sz = require("sz")

function click(...)
	touchDown(...)
	mSleep(30)
	touchUp(...)
end

function setDirection()
	local s = dialogRet("请选择您的屏幕方向", "Home键在左手边", "Home键在左手边", "Home在下方", 0);
	if s == 0 then
		init(0)
	elseif s == 1 then
		init(2)
	else
		init(1)
	end
end

function setPointNum()
	while true do
		local text_a,text_b = dialogInput("输入您要录制的点的个数与脚本运行时间(分钟)", "输入点的数量（最小为1）#脚本运行时间", "确认");
		if text_a ~= nil and text_b ~= nil then
			if type(tonumber(text_a) == "number") and type(tonumber(text_b) == "number") then
--				myColor = {}
--				for var = 1,text_a do
--					myColor[var] = {}
--				end
				return text_a,text_b
			else
				dialog("脚本设置错误，请重新输入")
			end
		else
			dialog("脚本设置错误，请重新输入")
		end
	end
end

function main()
	local loop = 0
	local lastTime = os.time()
	local point,totalTime = setPointNum()
	while true do
		if loop == 0 then
			dialog("点击确定后请点击您要点击的坐标点")
			ret = catchTouchPoint(point);
			toast("成功获取坐标点~")
			loop = 1
		elseif loop == 1 then
			delay = dialogInput("请输入延迟时间(毫秒，数值越小越快)", "请输入大于30的数字", "确认");
			if delay ~= nil and type(tonumber(delay) == "number") then
				toast("设置结束，2秒之后开始运行脚本")
				loop = 2
			else
				dialog("您输入的信息不正确，请重新输入")
			end
		elseif loop == 2 then
			if os.difftime(os.time(),lastTime) < tonumber(totalTime * 60) then
				for var = 1,#ret do
					click(ret[var].x,ret[var].y)
					mSleep(delay)
				end	
			else
				toast("脚本运行结束，谢谢使用哟")
				lua_exit()
			end
		end
	end
end

setDirection()
main()
		
		
		
 


