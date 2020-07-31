local rule = 
{
    sheet = "用户信息",		--转换哪一张表，也支持1、2、3序号索引
    index = {"设备号"},		--表中索引，支持多个字段
    table = {["类型"]="type",["设备名称"]="devicename",["授权脚本"]="sprite",["授权私钥"]="sn",["授权状态"]="status",["授权日期"]="date"},		--默认第一行为表头
    filter = function(key, value) --过滤函数，在其中处理复杂数据
        if key=="sprite" then
            return value:split_sprite(',')
        end
        if key=="date" then
            return value:split_time('-')
        end
    end
}

local excel = require('excel.excel')
local doc,err = excel.read(io.popen("cd"):read("*l").."\\data\\user\\user.xml")
if doc then
    local result = excel.process(doc, rule)
    --excel.save(result, "2.lua")		--并不实际保存
    return result
end 

