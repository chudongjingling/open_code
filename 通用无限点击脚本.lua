w,h = getScreenSize();
--初始化的默认值
ClickX,ClickY = 300,150
function Main()
	os_type = getOSType()
	if os_type=="android" then
		--安卓设备
		init(0)
	elseif os_type=="ios" then
		--ios设备
		init("",0)
	end
	My主函数()
end

function My主函数()
	-- ret=是否点击,
	-- ClickInterval=按下间隔,
	-- Interval=两次按下间隔,
	-- setClick=循环次数,
	-- Cycle=设置坐标方式
	ret,ClickInterval,Interval,setClick,Cycle = My设置()
	
	if ret==1 then
		--	按下抬起间隔 默认30
		ClickInterval	=	tonumber(ClickInterval)
		Interval		=	tonumber(Interval)
		setClick		=	tonumber(setClick)
		Cycle			=	tonumber(Cycle)
		if ClickInterval == "number" and ClickInterval > 0  then
			
		else
			ClickInterval = 30
		end
		
		-- 两次按下间隔 默认0
		if Interval == "number" and Interval > 0then
			
		else
			Interval = 0
		end
		
		-- 设置坐标方式 默认手动设置
		if Cycle == 0 then
			ret,ClickX,ClickY = My手动设置点击位置()
			ClickX = tonumber(ClickX)
			ClickY = tonumber(ClickY)
			if ret == 1 then
				if ClickX ~= nil and ClickX > 0 and ClickX < w and  ClickY  ~= nil and ClickY > 0 and ClickY < h then
					
				else
					ClickX,ClickY = 300,150
				end
			else
				ClickX,ClickY = 300,150
			end
		else
			My自动获取点击位置()
		end
		
		-- 循环次数 默认无限循环
		if setClick == nil  then
			My无限循环(ClickX,ClickY,ClickInterval,Interval)
		elseif setClick > 0  then
			My计次循环(setClick,ClickX,ClickY,ClickInterval,Interval)
		end
		
	else
		toast("退出脚本")
		mSleep(500)
		lua_exit()
	end
end

function My自动获取点击位置()
	dialog("点击确定后,自动捕捉下次点击位置.", 0)
	x,y = catchTouchPoint(); 
	
	choice = dialogRet("确定使用这个坐标值么?\rx:"..x.." y:"..y, "是", "从新获取", "", 0);
	if choice == 0 then      --男
		ClickX = x
		ClickY = y
	elseif choice == 1 then  --女
		My自动获取点击位置()
	end
	mSleep(500)
end

function My计次循环(setClick,ClickX,ClickY,ClickInterval,Interval)
	for x=1,setClick do
		MyClick(ClickX,ClickY,ClickInterval,Interval);
	end
end

function My无限循环(ClickX,ClickY,ClickInterval,Interval)
	while (true) do
		MyClick(ClickX,ClickY,ClickInterval,Interval);
	end
end

function My设置()

MyJsonString = [[
	{
		"style"			: "default",
		"config"		: "shaoye_wuxiandianji",
		"width"			: ]]..w..[[,
		"height"		: ]]..h..[[,
		"bg"			: "#00000000",
		"timer"			: 0,
		"cancelname"	: "取消",
		"okname"		: "开始",
		"views": [
			{
				"type": "Label",
				"text": "请完成设置",
				"size": 25, 
				"align": "center",
				"color": "95,169,0"
			},{
				"type": "Label",
				"text": "  ",
				"size": 25, 
				"align": "center",
				"color": "95,169,0"
			},{
				"type": "Label",
				"text": "按下抬起间隔(单位:毫秒)",
				"size": 22,
				"color": "109,109,109"
			},{
				"type": "Edit",
				"prompt": "默认30毫秒",
				"size": 20,
				"text": "30",
				"align": "left",
				"color": "109,109,109"
			},{
				"type": "Label",
				"text": "  ",
				"size": 25, 
				"align": "center",
				"color": "95,169,0"
			},{
				"type": "Label",
				"text": "两次按下间隔(单位:毫秒)",
				"size": 22,
				"color": "109,109,109"
			},{
				"type": "Edit",
				"prompt": "默认0",
				"size": 20,
				"text": "0",
				"align": "left",
				"color": "109,109,109"
			},{
				"type": "Label",
				"text": "  ",
				"size": 25, 
				"align": "center",
				"color": "95,169,0"
			},{
				"type": "Label",
				"text": "循环次数(无限循环什么都不填)",
				"size": 22,
				"color": "109,109,109"
			},{
				"type": "Edit",
				"prompt": "默认无限循环",
				"size": 20,
				"align": "left",
				"color": "109,109,109"
			},{
				"type": "Label",
				"text": "  ",
				"size": 25, 
				"align": "center",
				"color": "95,169,0"
			},{
				"type": "Label",
				"text": "坐标设置方式",
				"size": 22,
				"color": "109,109,109"
			},{
				"type": "RadioGroup",
				"list": "手动输入点击坐标,自动输入电极坐标",
				"select": "0"
			}
		]
	}
]]

return showUI(MyJsonString);
end

function My手动设置点击位置()

MyJsonString = [[
	{
		"style"			: "default",
		"config"		: "shaoye_wuxiandianji2",
		"width"			: ]]..w..[[,
		"height"		: ]]..h..[[,
		"bg"			: "#00000000",
		"timer"			: 0,
		"cancelname"	: "取消",
		"okname"		: "开始",
		"views": [
			{
				"type": "Label",
				"text": "请完成设置",
				"size": 25, 
				"align": "center",
				"color": "95,169,0"
			},{
				"type": "Label",
				"text": "  ",
				"size": 25, 
				"align": "center",
				"color": "95,169,0"
			},{
				"type": "Label",
				"text": "X轴坐标,取值范围0~]]..w..[[",
				"size": 22,
				"color": "109,109,109"
			},{
				"type": "Edit",
				"prompt": "300",
				"size": 20,
				"align": "left",
				"color": "109,109,109"
			},{
				"type": "Label",
				"text": "  ",
				"size": 25, 
				"align": "center",
				"color": "95,169,0"
			},{
				"type": "Label",
				"text": "Y轴坐标,取值范围0~]]..h..[[",
				"size": 22,
				"color": "109,109,109"
			},{
				"type": "Edit",
				"prompt": "150",
				"size": 20,
				"align": "left",
				"color": "109,109,109"
			}
		]
	}
]]

ret, ClickX,ClickY = showUI(MyJsonString);
return ret,ClickX,ClickY;
end

--[[
	单击方法
		参数说明:
			ClickX			=	点击X坐标
			ClickY			=	点击Y坐标
			ClickInterval	=	按下抬起间隔
			Interval		=	事件结束间隔
]]--
function MyClick(ClickX,ClickY,ClickInterval,Interval)
	--dialog(ClickX..":"..ClickY, 0)
	touchDown(ClickX,ClickY)
	mSleep(ClickInterval) 
	touchUp(ClickX,ClickY)
	mSleep(Interval) 
end

Main()
