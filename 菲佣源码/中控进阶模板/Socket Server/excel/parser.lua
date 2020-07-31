local SLAXML = require('excel.slaxdom')

local function ExcelExtract(element, level)

	local function GetAttribute(attr, name)
		for _,v in pairs(attr) do
			if v.name==name then
				return v.value
			end
		end
	end

	local function GetDataValue(data)
		local type = GetAttribute(data.attr, 'Type')
		for _,v in pairs(data.kids) do
			if v.name=='#text' then
				if type=='Number' then
					return tonumber(v.value)
				else
					return v.value
				end
			end
		end
	end

	level = level or 1
	local name = {"Worksheet", "Table", "Row", "Cell", "Data"}

	local result = {}

	for _,v in pairs(element.kids) do
		if v.type=='element' and v.name==name[level] then
			if name[level]=="Worksheet" then
				table.insert(result, {Name=GetAttribute(v.attr, 'Name'), Sheet=ExcelExtract(v, level + 1)} )
			elseif name[level]=="Table" then
				result = {Col=tonumber(GetAttribute(v.attr, 'ExpandedColumnCount')), Row=tonumber(GetAttribute(v.attr, 'ExpandedRowCount')), Data=ExcelExtract(v, level + 1)}
			elseif name[level]=="Row" then
				table.insert(result, ExcelExtract(v, level + 1))
			elseif name[level]=="Cell" then
				local temp = ExcelExtract(v, level + 1)
				if type(temp)~="table" then
					table.insert(result, temp)
				else
					result = nil
				end
			elseif name[level]=="Data" then
				result = GetDataValue(v)
			end
		end
	end

	return result
end

local function ExcelParser(path)
	local file, err = io.open(path, "r")
	--print(file,path,err)
	if file then
		local text = file:read("*a")
		file:close()
		local doc = SLAXML:dom(text, {simple=true})
		return ExcelExtract(doc.root)
	else
		return false, err
	end
end

return ExcelParser
