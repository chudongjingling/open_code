function  doUItable()
local sz=require "sz"
local json=sz.json
local w,h=getScreenSize()
MyTable={
		["style"]="default", 					-- 'default':默认自动排列模式  'custom':自定义排列模式
		["config"]='我还要在喊100年.dat',		-- 储存在'/User/Media/TouchSprite/config/'目录下
		["width"]=w,		-- UI宽度
		["height"]=h,		-- UI高度
		["cancelname"]="不喊了",					-- 取消按钮显示内容
		["okname"]="开喊",
	    ["timer"]=300,
		views={
			{ ["type"] = "Label",
            ["text"] = "并不万能的万能喊话王",
            ["size"] = 25,
            ["align"] = "center",
            ["color"] = "0,0,255",},
	{["type"]="Label",			
		["text"]="Edit 示例：请赞助sz",				
		["size"]=15,		["align"]="left",	
		["color"]="0,0,0"},
	{["type"]="Edit",			
		["prompt"]="内容1",							
		["text"]="喊话内容1"},
	{["type"]="Edit",			
		["prompt"]="内容2",							
		["text"]="喊话内容2"},
	{["type"]="Edit",			
		["prompt"]="内容3",							
		["text"]="喊话内容3"},
	{["type"]="Edit",			
		["prompt"]="内容4",							
		["text"]="喊话内容4"},
	{["type"]="Edit",			
		["prompt"]="内容5",							
		["text"]="喊话内容5"},
		{["type"]="Label",			
			["text"]="喊话模式，以阿拉伯数字开始的一系列数字，\n单独填写一个数字则默认重复喊话，如：1",				
			["size"]=15,		
			["align"]="left",	
			["color"]="255,0,0"},
			{["type"]="Label",			
			["text"]="如果需要组合喊话比如喊完1喊2则填写12。",				
			["size"]=15,		
			["align"]="left",	
			["color"]="255,0,0"},
	{["type"]="Edit",			
		["prompt"]="喊话模式",							
		["text"]="1"}
	}
	
}

local MyJsonString = json.encode(MyTable)
return MyJsonString
end
function syninputinit()
	dialog("请在确定后点击输入框，以便系统锁定输入框位置", 0)
	while true do
local x,y=catchTouchPoint()
mSleep(1000)
userchoice=dialogRet("您已完成输入框初始化，是否需要再次确定", "", "需要","不需要",0)
if userchoice==1
then  else  return  x,y
end
end

end
function synenterinit()
dialog("请在确定后点击回发出，因为某些ios系统并不允许调用默认发出，以便系统锁定发出位置", 0)
while 1 do
	local x,y=catchTouchPoint()
	userchoice=dialogRet("您已完成发送键输入框初始化，是否需要再次确定", "","需要" , "不需要", 0)
	if userchoice==1 then
		else 
		return  x,y
	end
end
end
function click(x,y,time)
	local time=time or 50
	touchDown(1, x, y)
	mSleep(time)
	touchUp(1, x, y)
end
function  worksort(mode)
	local sort={}
	local len=#mode
	for i=1,len do
		sort[i]=tonumber(string.sub(mode,i,i))
		if type(sort[i])=="number" then else lua_exit()  dialog("错误的模式输入，在模式里面的第"..i.."个模式", 0) end
	if sort[i]>5 then lua_exit()  dialog("错误的模式输入，在模式里面的第"..i.."个模式", 0) end
	end
	return  sort	
end
function workmode_1(sort)
	while true do
		   for i=1 , #sort do 
		click(syn[3],syn[4])
		mSleep(1000)
		inputText(text[sort[i]])
		click(syn[1],syn[2])
		mSleep(1000)
	      end
    end
end
--begin
UI={}
UI={showUI(doUItable())}
mSleep(2000)
mode=UI[#UI]
if UI[1]==0 then lua_exit() end
sort={}
syn={}
text={}
for i=2,#UI-2 do
text[i-1]=UI[i]
end
syn[3],syn[4]=syninputinit()
	mSleep(2000)
syn[1],syn[2]=synenterinit()
sort=worksort(mode)
workmode_1(sort)
