local function echo(t,n,saved)
	if type(t)~="table" then return end --
	saved = saved or {}
	n = n or 0

	for k in pairs(t) do
		local str = ''
		if n~=0 then
			local fmt = '%' .. 4*n .. 's'
			str = string.format(fmt, '')
		end
		io.write(str,tostring(k), ' = ')
		if type(t[k])=='table' then
			local m = n
			m = m+1
			if saved[t[k]] then
				io.write(saved[t[k]], '\n')
			else
				saved[t[k]] = k
				io.write('{\n')
				echo(t[k], m, saved)
				io.write(str,'}\n')
			end
		else
			if type(t[k])=='string' then
				io.write('"',tostring(t[k]),'",\n')
			else
				io.write(tostring(t[k]),',\n')
			end
		end
	end
end

return function(str) echo(str) end
