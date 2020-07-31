local sz = require("sz")
local json = sz.json
local save = {}
function save:save() 
	local savetab = json.encode(self.data)
	local file = io.open(self.path..self.file..os.date("%w",os.time()),"w")
	if file then
		file:write(savetab.."\n")
		file:close();
		return true
    end
    return false
end
function save:load()
	local file = io.open(self.path..self.file..os.date("%w",os.time()),"r")
	if file then
		local r = file:read("*a")
		file:close();
		return json.decode(r) 	
	end 
	return false
end
function save:init()
	self.path = self.path or "/User/Media/TouchSprite/lua/"
	self.file = self.file or "defaultsave" 
 	self.data = self:load() or {}
 	if self.data.day ~= os.date("%m%d",os.time()) then
 		self.data = {}
 		self.data.day = os.date("%m%d",os.time())
 	end
end
function save:link(name)
	local user = account.cur_account.user
	local server = account.cur_account.server or "1"
	if not self.data[user] then self.data[user] = {} end
	if not self.data[user][server] then self.data[user][server] = {} end
	if not self.data[user][server][name] then self.data[user][server][name] = {} end
	local r = self.data[user][server][name]
	setmetatable(r,{__index = self.fun})
	return r
end
function save:option (t)
	if t.path then self.path = t.path end
	if t.file then self.file = t.file end
end
save.fun = {}
function save.fun:update(k,v,mode,write)
	if save.data.day ~= os.date("%m%d",os.time()) then
		save.data = {}
		save.data.day = os.date("%m%d",os.time())
		local user = account.cur_account.user
		local server = account.cur_account.server
		save.data[user] = {}
		save.data[user][server] = {}
		for k,v in pairs(self) do
			v = 0
		end
		save.data[user][server][name] = self
	end
	if mode == "add" then
		self[k] = (self[k] or 0) + v
	else
		self[k] = v
	end
	if write then
		save:save()
	end
	return true
end
return save
