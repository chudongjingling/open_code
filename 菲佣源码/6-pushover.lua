function pushover( request )
	local sz = require("sz")
	local json = sz.json
	local http = require("szocket.http")
	local pushover_url = "https://api.pushover.net/1/messages.json"

	local data_str = {}
	for k,v in pairs(request) do
		table.insert(data_str, tostring(k) .. "=" .. tostring(v))
	end
	data_str = table.concat(data_str, "&")

	local res, code = http.request(pushover_url, data_str)
	local back = json.decode(res)
	if (code ~= 200) then
		local errstr = "发送请求错误。错误代码: " .. tostring(code) .. ", 错误信息: " .. tostring(res)
		return false, errstr
	elseif (back.status ~= 1) then
		local errstr = "信息推送错误: " .. tostring(res)
		return false, errstr
	end

	return true

end

local request = { token   = "abNRhRebF4UM4kqvMwohoE3QEJRqRK",   
                  user    = "uK1dVzvMEVxy59YkvcxdgtvUfyf6WC",    
                  device  = "iphone6",
                  title   = "脚本运行错误",
                  message = "请从新启动脚本"
                }

local success, err = pushover( request )

if (success) then
  print("推送成功")
else
  print("推送失败:\n" .. err)
end
