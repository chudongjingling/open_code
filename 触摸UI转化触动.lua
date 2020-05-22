UI = {
        { 'TextView{-请如实填写哦-}'                   },
        { 'InputBox{}',             'name',    '姓名:' },
        { 'DropList{帅哥|美女}',    'sex',     '性别:' },
        { 'InputBox{18}',           'age',     '年龄:' },
        { 'DropList{是|否}',        'married', '婚否:' },
}
function TouchtoTouch(...)--触摸UI转化触动UI
   local sz=require "sz"
   local json=sz.json   
   local Explist={}
   local ComboBoxlist={}  
   local c_index=1   
   local index=1
   local getindex=1  
   local w,h=getScreenSize()
   local  pos=1   
	 MyTable={   --定义空控件页
	 ["style"]        = "default",
    ["rettype"]      = "table",
    ["width"]        = w,
    ["height"]       = h,
    ["config"]       = "save01.dat",
    ["timer"]        = 99,
    ["orient"]       = 0,
    ["pagetype"]     = "multi",
    ["title"]        = "触动精灵脚本UI演示",
    ["cancelname"]   = "取消",
    ["okname"]       = "开始",
pages={{}}  --空控件页 
}
function Split(str,symbol,pos)  --分割字符串      
                local pos = pos or 1
				local symbol=symbol or "@"
                local index = 1
                local tmp = {}
                while true do
                        local newpos = string.find(str,symbol,pos)
                        if not newpos then
                                tmp[index] = string.sub(str,pos,string.len(str))
                                break
                        end
                       tmp[index] = string.sub(str,pos,newpos - 1)
                        pos = newpos + string.len(symbol)
                        index = index + 1
                end
             return tmp
        end
local function formatTextView(table,i)   --格式化触摸TextView为触动Label
	local tmp={
                ["type"] = "Label",
                ["text"] ="",
                ["size"] = 25,
                ["align"] = "center",
                ["color"] = "0,0,0"
            }
	local x=string.find(table[1],"{")
	local y=string.find(table[1],"}")
    local text=string.sub(table[1],x+1,y-1)
	tmp["text"]=text
	return tmp
end
local function formatInputBox(table,i)   --格式化触摸InputBox为触动Lbael+Edit
local tmp1={
                ["type"] = "Label",
                ["text"] ="",
                ["size"] = 16,
                ["align"] = "left",
                ["color"] = "0,0,0"
            }
local tmp2={
                ["type"] = "Edit",
                ["kbtype"] = "default",
				["text"]=""
            }
			local x=string.find(table[1],"{")
	        local y=string.find(table[1],"}")
			local text=string.sub(table[1],x+1,y-1)
			tmp1["text"]=table[3]
			tmp2["text"]=text
			return tmp1,tmp2
			
end
local function formatDropList(table,i)   --格式化触摸DropList为触动Label+Combox
local tmp1={
                ["type"] = "Label",
                ["text"] ="",
                ["size"] = 16,
                ["align"] = "left",
                ["color"] = "0,0,0"
            }
local tmp2= {["type"] = "ComboBox",
                ["list"] = "选项1,选项2,选项3",
                ["select"] = "1"
            }
			local x=string.find(table[1],"{")
	        local y=string.find(table[1],"}")
			local text=string.sub(table[1],x+1,y-1)
local tmp3={}
tmp3=Split(text,"|")
list=""
for k=1,#tmp3 do
	if k==tmp3 then list=list..tmp3[k] else
	list=list..tmp3[k]..","
end
end
ComboBoxlist[c_index]=list
c_index=c_index+1
tmp2["list"]=list
tmp1["text"]=table[3]
return tmp1 ,tmp2
end
for i=1,#UI do  -- 第一遍for循环完成UI格式化
	if string.sub(UI[i][1],1,1)=="T" then MyTable.pages[1][pos]=formatTextView(UI[i]) pos=pos+1 end
	if string.sub(UI[i][1],1,1)=="I" then MyTable.pages[1][pos],MyTable.pages[1][pos+1]=formatInputBox(UI[i]) pos=pos+2 Explist[index]=UI[i][2] index=index+1 end
    if string.sub(UI[i][1],1,1)=="D" then MyTable.pages[1][pos],MyTable.pages[1][pos+1]=formatDropList(UI[i]) pos=pos+2 Explist[index]=UI[i][2] Explist[tostring(index)]=true index=index+1 end
end
MyUI={showUI(json.encode(MyTable))}  --执行触动UI
for i=2,#MyUI do      --第二遍for循环完成处理UI返回值为表，表的key为触摸作者变量名，表的value为触动UI返回值，并处理UI返回值为触摸格式
	ui_value=Explist[i-1]--从第一个值开始取,保存当前变量名
	Explist[i-1]=nil--删除表中多余值
	if  Explist[tostring(i-1)] then --有标记,这是个combox
	--	toast(1111111111)
		local newtmp={}
		newtmp=Split(ComboBoxlist[getindex],",")
		getindex=getindex+1
		Explist[ui_value]=newtmp[MyUI[i]+1]
	else Explist[ui_value]=MyUI[i]
		end
end
for i,v in pairs(Explist) do   --创建全局变量，方便兼容触摸作者
	_G[i]=v
	end
end
TouchtoTouch()
toast(name,sex,age,married)
