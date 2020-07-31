--菲佣orc插件,请勿用于商业用途
local sz = require ("sz")
local json = sz.json
local FYorc = {}
function FYorc.orctext(fontfile,area1,area2,area3,area4,cast1,cast2,fuzzy,errorrate)
	fuzzy = fuzzy or 90
	errorrate = errorrate or 95
	local function isColor(x,y,c1,c2,s)
		local fl,abs = math.floor,math.abs
		s = fl(0xff*(100-s)*0.01)
		local r1,g1,b1 = fl(c1/0x10000),fl(c1%0x10000/0x100),fl(c1%0x100)
		local r2,g2,b2 = fl(c2/0x10000),fl(c2%0x10000/0x100),fl(c2%0x100)
		local rr,gg,bb = getColorRGB(x,y)
		if abs(r1-rr)<(s+r2) and abs(g1-gg)<(s+g2) and abs(b1-bb)<(s+b2) then
			return true
		end
	end
	local font = {}
	--确保主色值在前面,偏色在后面
	if cast1 < cast2 then cast1,cast2 = cast2,cast1 end
	--读取字库文件
	local file = io.open(fontfile,"r")
	assert(file,"fontfile non-existent")
	if file then
		local n = 1
	    for l in file:lines() do 
			if #l > 0 then
				font[n] = json.decode(l)
				n = n + 1
			end
	    end
	  	file:close()
	  	--排序,复杂的文字先检测,避免出现,三被识别成一的尴尬情况
		table.sort 	( font , function(a, b) return #a > #b end )
	end
	--用两张表来记录二值化
	local screent = {}
	local screenb = {}
	local n = 1
	local rate= 1-errorrate/100
	local save 
	--保持屏幕取屏幕二值化信息
	keepScreen(true)
	for x = area1,area3 do
		for y = area2,area4 do
			if isColor(x,y,cast1,cast2,fuzzy) then
				screent[n] = {x,y}
				if screenb[x] then 
					screenb[x][y] = n 
				else 
					screenb[x] = {} 
					screenb[x][y] = n 
				end
				n = n + 1
			end
		end
	end
	keepScreen(false)
	local orctext = ""
	local temp = 0
	local fl = math.floor
	for id,vd in ipairs(screent) do
	--已被识别出文字的区域将不会进入循环,直接跳过
		if id < temp then goto lable2 end 
		for ik,vk in ipairs(font) do
			local l = #vk
			local errn = fl(l * rate) --允许出错的点的个数
			if id + l >= #screent - errn or 
			(screent[id + l][1] - vd[1] > vk[l-errn][1]) then
				goto lable1
			end
			local err = 0
			for iz = 2,l do
				local x,y = vd[1]+vk[iz][1],vd[2]+vk[iz][2]
				if not screenb[x] then
					err = err + 1
					if err > errn  then break end
				elseif not screenb[x][y] then
					err = err + 1
					if err > errn  then break end
				end
				if iz == l then
					local e = 1
					while not (screenb[x] and screenb[x][y]) do 
						x,y = vd[1]+vk[iz-e][1],vd[2]+vk[iz-e][2]
						e = e + 1
					end
					if screenb[x][y] - temp > l * 5 then break end
					orctext = orctext..vk[1][1]
					temp = screenb[x][y]
					goto lable2
				end
			end
			::lable1::
		end
		::lable2::
	end
	return orctext
end

return FYorc
										