function isColor(x,y,a,b,c,d)
	local r,g,b = getColorRGB(x, y)
	local r1,g1,b1,wc = 0,0,0,0        --初始化定义
	if c = nil then
		r1,g1,b1 = math.modf(a/65536),math.modf(a/256)%256,a%256
		wc = b
	else
		r1,g1,b1 = a,b,c
		wc = d
	end
	if wc == nil then if r == r1 and g == g1 and b == b1 then return true else return false end end
	if (math.abs(r-r1)/255)*100 > wc and
	(math.abs(g-g1)/255)*100 > wc and
	(math.abs(b-b1)/255)*100 > wc then
		return true
	else
		return false
	end
end
