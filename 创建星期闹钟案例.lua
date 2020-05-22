Week={
         {date="monday",chinese="星期一"},
         {date="tuesday",chinese="星期二"},
         {date="wednesday",chinese="星期三"},
         {date="thursday",chinese="星期四"},
         {date="firday",chinese="星期五"},
         {date="saturday",chinese="星期六"},
         {date="sunday",chinese="星期天"},
      }
--克隆表格
function Clone(tab)
	if type(tab) == table then
		local r = {}
		for k,v in pairs(tab) do
			if type(v) == table then
				Clone(v)
			else
				r[k] = v
			end
		end
		return r
	else 
		return tab
	end
end
--创建星期数据
function Week.Creat(self,...)
	local x = {...}
	local r = {}
	for k,v in pairs(self) do
		if type(v) == "function" then
			r[k] = v
		end
	end
	if not ... then return end
	for i,v in pairs(x) do
		r[v] = Clone(self[v])
	end
	return r
end
--选择星期几数据，然后输出
function Week.Check(self,weeknum)
        return self[weeknum]
end
--删除星期几,可多个
function Week.Remove(self,...)
	if not ... then return end
  	weeknum = {...}
    	for i,v in ipairs(weeknum) do
    		self[v] = nil
    	end
end
--增加，可多个
function Week.Add(self,...)
	if not ... then return end
    weeknum = {...}
    for i,v in ipairs(weeknum) do
    	self[v] = Clone(Week[v])
    end
end
function Week.print(self)
	for k,v in pairs(self) do
		if type(k) == "number" then
		print(v.date.."		 中文:"..v.chinese)
		end
	end
	print("\n")
end
new = Week:Creat(1,5,6)
new:print()
new:Add(4,5)
new:print()
new:Remove(1)
new:print()
