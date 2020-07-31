function serialize(t)
	if type(t)~="table" then return tostring(t) end --
	local function ser_table(tbl,level)
		level = level or 1
		local align = "\n" .. string.rep("\t", level-1)
		local indent = string.rep("\t", level)

		local tmp = {}
		for k,v in pairs(tbl) do
			local key = type(k)=="number" and "["..k.."]" or k
			if type(v)=="table" then
				table.insert(tmp, indent..key.." = "..ser_table(v, level + 1))
			elseif type(v) ~= "boolean" then
				table.insert(tmp, indent..key.." = "..v)
			else
				table.insert(tmp, indent.."[\""..key.."\"]".." = "..tostring(v))
			end
		end
		return align .. "{\n" .. table.concat(tmp,",\n") .. align .. "}"
	end

	return print("do\nlocal cfgs = " .. ser_table(t) .. "\nreturn cfgs\nend")
end

return serialize
