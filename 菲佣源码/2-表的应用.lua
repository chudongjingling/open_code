Street = {}
Street["杭州"] = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10

}
Street["金华"] = {
	"金三路",
	"金二路",
	"金一路"
}

math.randomseed(os.time())

function CreateAdd( city )
	if Street[city].re == nil or  Street[city].re == 0 then
		Street[city].re = #Street[city]
	end
	local c = math.random(Street[city].re)
	local s = Street[city][c]
	Street[city][c] = Street[city][Street[city].re]
	Street[city][Street[city].re] = s
	Street[city].re = Street[city].re - 1
	return city..s
end

for i=1,10 do
	print (CreateAdd("杭州"))
end
