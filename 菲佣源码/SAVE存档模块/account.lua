local account = {}
function account:update()
	self.count = self.count or 1 
	if self.count > #self.data then self.count = 1 end
	self.cur_account = self.data[self.count]
	local r = {
				user = self.cur_account.user,
				server = self.cur_account.server
}
	return r
end
return account
