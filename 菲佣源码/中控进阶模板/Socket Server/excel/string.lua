--[[function string:split(delimiter)
	if #delimiter==0 then return {self} end
	local result = {}
	local from = 1
	local delim_from, delim_to = string.find(self, delimiter, from)
	while delim_from do
		table.insert(result, string.sub(self, from, delim_from - 1))
		from = delim_to + 1
		delim_from, delim_to = string.find(self, delimiter, from)
	end
	table.insert(result, string.sub(self, from))
	return result
end]]
function string:split(delimiter)
	if #delimiter==0 then return {self} end

	local result = {}
	local position = 1
		
	repeat
		local delim_start, delim_end = self:find(delimiter, position)
		
		local temp = ""
		if delim_start then
			temp = self:sub(position, delim_start - 1)
			position = delim_end + 1
		else
			temp = self:sub(position)
		end
		
		if temp~="" then
			if tonumber(temp) then
				table.insert(result, tonumber(temp))
			else
				table.insert(result, temp)
			end
		end
		
	until not delim_start
	return result
end

function string:super_split(...)
	local arg = {...}
	local result = self:split(table.remove(arg, 1))
	if #arg~=0 then
		for k,v in pairs(result) do
			result[k] = tostring(v):super_split(unpack(arg))
		end
	end
	
	return result
end

function string:split_build(delimiters, ...)
	local doc = self:super_split(unpack(delimiters))
	local argv = {...}

	local function deep_build(t, level)
		if level==0 then
			local temp = ""
			for i,v in ipairs(argv) do
				if t[i] then
					if type(t[i])=="number" then
						temp = temp .. v .. " = " .. t[i] .. ", "
					elseif type(t[i])=="string" then
						temp = temp .. v .. ' = "' .. t[i] .. '", '
					end
				end
			end
			return temp:sub(0,-3)
		else
			local temp = ""
			for _,v in pairs(t) do
				temp = temp.."{"..deep_build(v, level-1).."}, "
			end
			return temp:sub(0,-3)
		end
	end

	return "{" .. deep_build(doc,#delimiters-1) .. "}"
end

function string:split_time(delimiter)
	if #delimiter==0 then return {self} end

	local result = ""
	local position = 1	
	if self == "never" then return 21000101 end
	repeat
		local delim_start, delim_end = self:find(delimiter, position)
		
		local temp = ""
		if delim_start then
			temp = self:sub(position, delim_start - 1)
			position = delim_end + 1
		else
			temp = self:sub(position)
		end
		
		if temp~="" then
			if temp:find("T00:") then
				result = result..temp:sub(1,2)
			else
				result = result..temp
			end
		end
	until not delim_start
	return result
end
function string:split_sprite(delimiter)
	if #delimiter==0 then return {self} end

	local result = {}
	local position = 1
		
	repeat
		local delim_start, delim_end = self:find(delimiter, position)
		
		local temp = ""
		if delim_start then
			temp = self:sub(position, delim_start - 1)
			position = delim_end + 1
		else
			temp = self:sub(position)
		end
		
		if temp~="" then
			result[temp] = true
		end	
	until not delim_start
	return result
end