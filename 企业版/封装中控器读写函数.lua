function writeEEFile(str,path,mode) --写入文件内容，路径，类型，默认路径企业版目录 scriptData/playLog.text 下，自定义路径请把 \ 改为 /。默认类型追加，覆盖第三个参数写 "wb"
mode = mode or "a"
local telib = require("ts_enterprise_lib")
assert(telib,"无法引入企业专用库")
if path==nil then
local ok,msg = telib:controller_injection(
[[
require("lfs").mkdir("scriptData")
local f = io.open("scriptData/playLog.text","a")
if f then
f:write("]]..str..[[\r\n")
f:close()
end
]]
)
else
local ok,msg = telib:controller_injection(
[[
local f = io.open("]]..path..[[","]]..mode..[[")
if f then
f:write("]]..str..[[\r\n")
f:close()
end
]]
)
end
end
