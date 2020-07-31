
local sz = require ("sz")
local json = sz.json
local rule = {
				area = {243, 485, 265, 505},
				colourcast = "1C130D-170F0C",
				--area = { 262,  682,  305,  704},
				--colourcast = "36393F-A9A39B",
				fuzzy = 95,
				char = "十",
				savefile = "txwl.txt"
			}
function rule:init()
	self.colourcast = self.colourcast:split("-")
	self.colourcast[1] = tonumber("0x"..self.colourcast[1])
	self.colourcast[2] = tonumber("0x"..self.colourcast[2])
	if self.colourcast[1] < self.colourcast[2] then
		self.colourcast[1],self.colourcast[2] = self.colourcast[2],self.colourcast[1]
	end
end
function rule:test()
	local c1,c2,s = self.colourcast[1],self.colourcast[2],self.fuzzy
	local r = {}
	r[1] = {self.char,self.colourcast,self.fuzzy}
	local n = 2
	local p = {}
	local f = false
	local save 
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
	keepScreen(true)
	for x = self.area[1],self.area[3] do
		local yl = 1
		for y = self.area[2],self.area[4] do
			if isColor(x,y,c1,c2,s) then
				if not f then 
					f = {x,y}
				else
					r[n] = {x-f[1],y-f[2]}
					n = n + 1
				end
				p[yl] = (p[yl] or "").."██"
			else
				p[yl] = (p[yl] or "").."  "
			end
			yl = yl + 1
		end
	end
	for i = 1,#p-1 do
		nLog(table.concat(p,"\n",i,i+1))
	end
	nLog("\n")
	keepScreen(false)
	
	local choice = dialogRet("是否录入文字：\""..r[1][1].."\" 到字库？", "是", "否","自定义", 0)
	if choice == 2 then
		local text = dialogInput("请输入识别的字符", r[1][1] , "确认")
		r[1][1] = text
		choice =0
	end
	if choice == 0 then
		local s = json.encode(r)
		local file = io.open("/User/Media/TouchSprite/lua/"..self.savefile,"a")
		if file then
			file:write(s.."\n")
			file:close()
			nLog("已录入文字：\""..r[1][1].."\" 到字库文件："..self.savefile)
			dialog("已录入文字：\""..r[1][1].."\" 到字库文件："..self.savefile,0)
		end
	end
end
rule:init()
rule:test()
