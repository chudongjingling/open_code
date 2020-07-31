local header = 1 --表头所在的行

local function DocConvert(doc, rule)
	local result = {}

	--寻找Sheet
	local Sheet = nil
	if type(rule.sheet)=='number' and doc[rule.sheet] then
		Sheet = doc[rule.sheet].Sheet
	end
	if type(rule.sheet)=='string' then
		for _,v in pairs(doc) do
			if v.Name==rule.sheet then
				Sheet = v.Sheet
				break
			end
		end
	end

	--根据index和table转换数据
	if Sheet then
		assert(#Sheet.Data>=header)

		--构建index和table索引
		local indexs = {}
		local tables = {}
		for col,v in ipairs(Sheet.Data[header]) do
			tables[col] = rule.table[v]
		end
		for _,name in ipairs(rule.index) do
			for col,v in ipairs(Sheet.Data[header]) do
				if v==name then
					table.insert(indexs, col)
					break
				end
			end
		end

		assert(#indexs>0)

		local function AppendToResult(row_data, key, value)
			local temp = result
			for _,index in ipairs(indexs) do
				local sid = row_data[index]
				if not temp[sid] then temp[sid] = {} end
				temp = temp[sid]
			end

			temp[key] = value
		end

		for row=header+1,#Sheet.Data do
			for col,value in ipairs(Sheet.Data[row]) do
				if tables[col] then
					local ret = nil
					local key = tables[col]
					if rule.filter then
						ret = rule.filter(key, value)
						if ret then
							AppendToResult(Sheet.Data[row], key, ret)
						end
					end

					if not ret then
						if tonumber(value) then
							AppendToResult(Sheet.Data[row], key, value)
						elseif value:find(",") then
							AppendToResult(Sheet.Data[row], key, '{'..value..'}')
						else
							AppendToResult(Sheet.Data[row], key, '"'..value..'"')
						end
					end
				end
			end
		end
	end

	return result
end

return DocConvert
