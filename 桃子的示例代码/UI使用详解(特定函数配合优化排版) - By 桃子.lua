function UI()
	os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite");                --避免触动文件夹权限引起的 UI 弹出问题
	function TableToJson(t)                                                -- Table 转换 Json
		local function serialize(tbl)  
			local tmp = {}  
			for k, v in pairs(tbl) do 
				local k_type = type(k)  
				local v_type = type(v)  
				local key = (k_type == "string" and "\"" .. k .. "\":")  
				or (k_type == "number" and "")  
				local value = (v_type == "table" and serialize(v))  
				or (v_type == "boolean" and tostring(v))  
				or (v_type == "string" and "\"" .. v .. "\"")  
				or (v_type == "number" and "\"" .. v .. "\"")  
				tmp[#tmp + 1] = key and value and tostring(key) .. tostring(value) or nil  
			end 
			if #tbl == 0 then  
				return "{" .. table.concat(tmp, ",") .. "}" 
			else 
				return "[" .. table.concat(tmp, ",") .. "]" 
			end 
		end 
		assert(type(t) == "table")  
		return serialize(t)  
	end 
	function Split(szFullString,szSeparator)        -- String 转换 Table
		local nFindStartIndex = 1
		local nSplitIndex = 1
		local nSplitArray = {}
		while true do
			local nFindLastIndex = string.find(szFullString,szSeparator,nFindStartIndex)
			if not nFindLastIndex then
				nSplitArray[nSplitIndex] = string.sub(szFullString,nFindStartIndex,string.len(szFullString))
				break
			end
			nSplitArray[nSplitIndex] = string.sub(szFullString,nFindStartIndex,nFindLastIndex - 1)
			nFindStartIndex = nFindLastIndex + string.len(szSeparator)
			nSplitIndex = nSplitIndex + 1
		end
		return nSplitArray
	end
	local StrUI = {
		["style"]="default",                                         -- 'default':默认自动排列模式  'custom':自定义排列模式
		["config"]='UI测试_配置文件.dat',                -- 储存在'/User/Media/TouchSprite/config/'目录下
		["width"]=({getScreenSize()})[1],                -- UI宽度
		["height"]=({getScreenSize()})[2],                -- UI高度
		["cancelname"]="退出",                                        -- 取消按钮显示内容
		["okname"]="确认",                                                -- 确定按钮显示内容
		["views"]={
			{["type"]="Label",                        ["text"]="UI测试",                                                                ["size"]=20,                ["align"]="center",        ["color"]="50,50,50"},
			{["type"]="Label",                        ["text"]="Powerd By 桃子",                                                ["size"]=12,                ["align"]="right",        ["color"]="200,200,200"},
			{["type"]="Label",                        ["text"]="Edit 示例<返回整串字符>",                                ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"},
			{["type"]="Edit",                        ["prompt"]="提示内容",                                                        ["text"]="默认填写内容"},
			{["type"]="Label",                        ["text"]="RadioGroup 示例<返回单选内容>",                ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"},
			{["type"]="RadioGroup",                ["list"]="a,b,c,d,e,f",                                                        ["select"]="0"},
			{["type"]="Label",                        ["text"]="ComboBox 示例<返回单选内容>",                        ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"},
			{["type"]="ComboBox",                ["list"]='a,b,c,d,e,f',                                                        ["select"]="0"},
			{["type"]="Label",                        ["text"]="CheckBoxGroup 示例<返回多选内容>",        ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"},
			{["type"]="CheckBoxGroup",        ["list"]='a,b,c,d,e,f',                                                        ["select"]="0"},
		}
	}
	local UIRet = {showUI(TableToJson(StrUI))}        --弹出UI 直接转换table
	dialog('PS:点击退出则不会有数据回传\n\n你点击的按钮:'..({'退出','确认'})[tonumber(UIRet[1])+1],2)
	if tonumber(UIRet[1])==0 then lua_exit() end;table.remove(UIRet,1)        --如果UI是点击的确认 则 删掉第一项返回 剩下的都是传递的值
		dialog(
			'Edit 内容:' .. UIRet[1] .. "\n\n" ..

			'RadioGroup 内容:' .. UIRet[2] .. "\n" ..
			'RadioGroup 勾选内容:' .. ({'a','b','c','d','e','f'})[tonumber(UIRet[2])+1] .. "\n\n" ..

			'ComboBox 内容:' .. UIRet[3] .. "\n" ..
			'ComboBox 勾选内容:' .. ({'a','b','c','d','e','f'})[tonumber(UIRet[3])+1] .. "\n\n" ..

			'CheckBoxGroup 内容:' .. UIRet[4] .. "\n" .. 
			'CheckBoxGroup 勾选内容:' .. table.concat(
				(function()
						local RetStr={} 
						for _v,v in ipairs(Split(UIRet[4],'@')) do
							table.insert(RetStr,({'a','b','c','d','e','f'})[tonumber(v)+1]) 
						end
						return RetStr 
					end)()
				,",") .. "\n\n"
			,0)
		for _v,v in ipairs(Split(UIRet[4],'@')) do
			dialog("多选框勾选内容:"..({'a','b','c','d','e','f'})[tonumber(v)+1],2)
		end
	end
	function UI2()
		function TableToJson(t)                                                -- Table 转换 Json
			local function serialize(tbl)  
				local tmp = {}  
				for k, v in pairs(tbl) do 
					local k_type = type(k)  
					local v_type = type(v)  
					local key = (k_type == "string" and "\"" .. k .. "\":")  
					or (k_type == "number" and "")  
					local value = (v_type == "table" and serialize(v))  
					or (v_type == "boolean" and tostring(v))  
					or (v_type == "string" and "\"" .. v .. "\"")  
					or (v_type == "number" and "\"" .. v .. "\"")  
					tmp[#tmp + 1] = key and value and tostring(key) .. tostring(value) or nil  
				end 
				if #tbl == 0 then  
					return "{" .. table.concat(tmp, ",") .. "}" 
				else 
					return "[" .. table.concat(tmp, ",") .. "]" 
				end 
			end 
			assert(type(t) == "table")  
			return serialize(t)  
		end 
		function Split(szFullString,szSeparator)        -- String 转换 Table
			local nFindStartIndex = 1
			local nSplitIndex = 1
			local nSplitArray = {}
			while true do
				local nFindLastIndex = string.find(szFullString,szSeparator,nFindStartIndex)
				if not nFindLastIndex then
					nSplitArray[nSplitIndex] = string.sub(szFullString,nFindStartIndex,string.len(szFullString))
					break
				end
				nSplitArray[nSplitIndex] = string.sub(szFullString,nFindStartIndex,nFindLastIndex - 1)
				nFindStartIndex = nFindLastIndex + string.len(szSeparator)
				nSplitIndex = nSplitIndex + 1
			end
			return nSplitArray
		end
		local TopNumber = 0
		function Rect(Left,Width,HeightN,AddN)                -- Rect值生成
			--Rect(Left位置,控件宽度,以一个控件40高度几个高,在基础上增加指定几个高)
			--Left   控件离左边框位置
			--Width  控件宽度
			--Height 控件以40为一个高度 高度数量         (用于 RadioGroup CheckBoxGroup 项目过多造成的问题)
			--AddN   控件以40位一个高度 追加增加高度数量 (用于 RadioGroup CheckBoxGroup 项目过多造成的问题)
			local TmpTop = TopNumber
			local AddN = AddN or 0
			--local HeightN = HeightN or 1
			for l=1,AddN do TopNumber=TopNumber+40 end
			TopNumber = TopNumber+((HeightN-1)*40)
			return Left..","..TmpTop..","..Width..","..(HeightN*40)
		end

		local StrUI = {
			["style"]="custom",                                         -- 'default':默认自动排列模式  'custom':自定义排列模式
			["config"]='UI测试_配置文件.dat',                -- 储存在'/User/Media/TouchSprite/config/'目录下
			["width"]=({getScreenSize()})[1],                -- UI宽度
			["height"]=({getScreenSize()})[2],                -- UI高度
			["cancelname"]="退出",                                        -- 取消按钮显示内容
			["okname"]="确认",                                                -- 确定按钮显示内容
			["views"]={
				{["type"]="Label",                        ["text"]="UI测试",                        ['rect']=Rect(0,300,1,1),        ["size"]=20,                ["align"]="center",        ["color"]="50,50,50"},
				{["type"]="Label",                        ["text"]="Powerd By 桃子",        ['rect']=Rect(0,300,1,1),        ["size"]=12,                ["align"]="right",        ["color"]="200,200,200"},
				{["type"]="Label",                        ["text"]="Edit:",                        ['rect']=Rect(0,100,1),                ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"},
				{["type"]="Edit",                        ["prompt"]="提示内容",                ['rect']=Rect(100,200,1,1),        ["text"]="默认填写内容"},
				{["type"]="Label",                        ["text"]="RadioGroup:",                ['rect']=Rect(0,300,1,1),        ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"},
				{["type"]="RadioGroup",                ["list"]="a,b,c,d,e,f",                ['rect']=Rect(0,300,1,1),        ["select"]="0"},
				{["type"]="Label",                        ["text"]="ComboBox:",                ['rect']=Rect(0,100,1),                ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"},
				{["type"]="ComboBox",                ["list"]='a,b,c,d,e,f',                ['rect']=Rect(100,200,1,1),        ["select"]="0"},
				{["type"]="Label",                        ["text"]="CheckBoxGroup:",        ['rect']=Rect(0,300,1,1),        ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"},
				{["type"]="CheckBoxGroup",        ["list"]='a,b,c,d,e,f',                ['rect']=Rect(0,300,1,1),        ["select"]="0"},
			}
		}
		local UIRet = {showUI(TableToJson(StrUI))}        --弹出UI 直接转换table
		dialog('PS:点击退出则不会有数据回传\n\n你点击的按钮:'..({'退出','确认'})[tonumber(UIRet[1])+1],2)
		if tonumber(UIRet[1])==0 then lua_exit() end;table.remove(UIRet,1)        --如果UI是点击的确认 则 删掉第一项返回 剩下的都是传递的值
			dialog(
				'Edit 内容:' .. UIRet[1] .. "\n\n" ..

				'RadioGroup 内容:' .. UIRet[2] .. "\n" ..
				'RadioGroup 勾选内容:' .. ({'a','b','c','d','e','f'})[tonumber(UIRet[2])+1] .. "\n\n" ..

				'ComboBox 内容:' .. UIRet[3] .. "\n" ..
				'ComboBox 勾选内容:' .. ({'a','b','c','d','e','f'})[tonumber(UIRet[3])+1] .. "\n\n" ..

				'CheckBoxGroup 内容:' .. UIRet[4] .. "\n" .. 
				'CheckBoxGroup 勾选内容:' .. table.concat(
					(function()
							local RetStr={} 
							for _v,v in ipairs(Split(UIRet[4],'@')) do
								table.insert(RetStr,({'a','b','c','d','e','f'})[tonumber(v)+1]) 
							end
							return RetStr 
						end)()
					,",") .. "\n\n"
				,0)
			for _v,v in ipairs(Split(UIRet[4],'@')) do
				dialog("多选框勾选内容:"..({'a','b','c','d','e','f'})[tonumber(v)+1],2)
			end

		end
		function UI3()
			function TableToJson(t)                                                -- Table 转换 Json
				local function serialize(tbl)  
					local tmp = {}  
					for k, v in pairs(tbl) do 
						local k_type = type(k)  
						local v_type = type(v)  
						local key = (k_type == "string" and "\"" .. k .. "\":")  
						or (k_type == "number" and "")  
						local value = (v_type == "table" and serialize(v))  
						or (v_type == "boolean" and tostring(v))  
						or (v_type == "string" and "\"" .. v .. "\"")  
						or (v_type == "number" and "\"" .. v .. "\"")  
						tmp[#tmp + 1] = key and value and tostring(key) .. tostring(value) or nil  
					end 
					if #tbl == 0 then  
						return "{" .. table.concat(tmp, ",") .. "}" 
					else 
						return "[" .. table.concat(tmp, ",") .. "]" 
					end 
				end 
				assert(type(t) == "table")  
				return serialize(t)  
			end 
			function Split(szFullString,szSeparator)        -- String 转换 Table
				local nFindStartIndex = 1
				local nSplitIndex = 1
				local nSplitArray = {}
				while true do
					local nFindLastIndex = string.find(szFullString,szSeparator,nFindStartIndex)
					if not nFindLastIndex then
						nSplitArray[nSplitIndex] = string.sub(szFullString,nFindStartIndex,string.len(szFullString))
						break
					end
					nSplitArray[nSplitIndex] = string.sub(szFullString,nFindStartIndex,nFindLastIndex - 1)
					nFindStartIndex = nFindLastIndex + string.len(szSeparator)
					nSplitIndex = nSplitIndex + 1
				end
				return nSplitArray
			end
			local TopNumber = 0
			function Rect(Left,Width,HeightN,AddN)                -- Rect值生成
				--Rect(Left位置,控件宽度,以一个控件40高度几个高,在基础上增加指定几个高)
				--Left   控件离左边框位置
				--Width  控件宽度
				--Height 控件以40为一个高度 高度数量         (用于 RadioGroup CheckBoxGroup 项目过多造成的问题)
				--AddN   控件以40位一个高度 追加增加高度数量 (用于 RadioGroup CheckBoxGroup 项目过多造成的问题)
				local TmpTop = TopNumber
				local AddN = AddN or 0
				--local HeightN = HeightN or 1
				for l=1,AddN do TopNumber=TopNumber+40 end
				TopNumber = TopNumber+((HeightN-1)*40)
				return Left..","..TmpTop..","..Width..","..(HeightN*40)
			end
			local StrUI = {
				["style"]="custom",                                         -- 'default':默认自动排列模式  'custom':自定义排列模式
				["config"]='UI测试_配置文件.dat',                -- 储存在'/User/Media/TouchSprite/config/'目录下
				["width"]=({getScreenSize()})[1],                -- UI宽度
				["height"]=({getScreenSize()})[2],                -- UI高度
				["cancelname"]="退出",                                        -- 取消按钮显示内容
				["okname"]="确认",                                                -- 确定按钮显示内容
				["views"]={
					{["type"]="Label",                        ["text"]="UI测试",                        ['rect']=Rect(0,200,1,1),        ["size"]=20,                ["align"]="center",        ["color"]="50,50,50"},
					{["type"]="Label",                        ["text"]="Powerd By 桃子",        ['rect']=Rect(0,200,1,1),        ["size"]=12,                ["align"]="right",        ["color"]="200,200,200"},
					{["type"]="Label",                        ["text"]="Edit:",                        ['rect']=Rect(0,100,1),                ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"},
					{["type"]="Edit",                        ["prompt"]="提示内容",                ['rect']=Rect(100,100,1,1),        ["text"]="默认填写内容"},
					{["type"]="Label",                        ["text"]="RadioGroup:",                ['rect']=Rect(0,200,1,1),        ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"},
					{["type"]="RadioGroup",                ["list"]="a,b,c,d,e,f",                ['rect']=Rect(0,200,1,2),        ["select"]="0"},
					{["type"]="Label",                        ["text"]="ComboBox:",                ['rect']=Rect(0,100,1),                ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"},
					{["type"]="ComboBox",                ["list"]='a,b,c,d,e,f',                ['rect']=Rect(100,100,1,1),        ["select"]="0"},
					{["type"]="Label",                        ["text"]="CheckBoxGroup:",        ['rect']=Rect(0,200,1,1),        ["size"]=15,                ["align"]="left",        ["color"]="0,0,0"},
					{["type"]="CheckBoxGroup",        ["list"]='a,b,c,d,e,f',                ['rect']=Rect(0,200,1,2),        ["select"]="0"},
				}
			}
			local UIRet = {showUI(TableToJson(StrUI))}        --弹出UI 直接转换table
			dialog('PS:点击退出则不会有数据回传\n\n你点击的按钮:'..({'退出','确认'})[tonumber(UIRet[1])+1],2)
			if tonumber(UIRet[1])==0 then lua_exit() end;table.remove(UIRet,1)        --如果UI是点击的确认 则 删掉第一项返回 剩下的都是传递的值
				dialog(
					'Edit 内容:' .. UIRet[1] .. "\n\n" ..

					'RadioGroup 内容:' .. UIRet[2] .. "\n" ..
					'RadioGroup 勾选内容:' .. ({'a','b','c','d','e','f'})[tonumber(UIRet[2])+1] .. "\n\n" ..

					'ComboBox 内容:' .. UIRet[3] .. "\n" ..
					'ComboBox 勾选内容:' .. ({'a','b','c','d','e','f'})[tonumber(UIRet[3])+1] .. "\n\n" ..

					'CheckBoxGroup 内容:' .. UIRet[4] .. "\n" .. 
					'CheckBoxGroup 勾选内容:' .. table.concat(
						(function()
								local RetStr={} 
								for _v,v in ipairs(Split(UIRet[4],'@')) do
									table.insert(RetStr,({'a','b','c','d','e','f'})[tonumber(v)+1]) 
								end
								return RetStr 
							end)()
						,",") .. "\n\n"
					,0)
				for _v,v in ipairs(Split(UIRet[4],'@')) do
					dialog("多选框勾选内容:"..({'a','b','c','d','e','f'})[tonumber(v)+1],2)
				end
			end
			({UI,UI2,UI3})[tonumber(dialogRet("选择弹出UI方式", "普通UI", "自定义排列UI", "紧凑版自定义UI", 0))+1]()
