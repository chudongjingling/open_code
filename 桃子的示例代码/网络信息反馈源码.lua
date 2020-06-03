State={
	["记录"] = true,
	["IP"] = "192.168.1.88"
}
if State["记录"] then initLog(State["IP"],3);  end
function _AddLog(text) if State["记录"] then wLog(State["IP"], "{\"deviceid\":\"" .. getDeviceID() .. "\",\"data\":{".. tostring(text).."}}") end end
	function AddTextLog(...) local TmpJson = "" for _,arr in ipairs({...}) do TmpJson = TmpJson .. "\"" .. tostring(_) .. "\":\"" .. tostring(arr) .. "\"," end _AddLog(string.sub(TmpJson,1,-2)) end
		function AddTableLog(Arr) local TmpJson = "" for _,arr in pairs(Arr) do TmpJson = TmpJson .. "\"" .. tostring(_) .. "\":\"" .. tostring(arr) .. "\"," end _AddLog(string.sub(TmpJson,1,-2)) end

--[[上方代码加入标头 就可以正常使用了 下方为测试代码
        _AddLog("\"1\":\"1\",\"属性\":\"无敌\",\"状态\":\"卍解\"")
        dialog("直接对接",0)
         
        AddTextLog("2",561,true,{""},function() end)
        dialog("批量文本",0)
         
        AddTableLog({["1"]="3",["名字"]=561,["ID"]=true,["PassWord"]={""},["备注"]=function() end})
        dialog("table传输",0)
--]]
