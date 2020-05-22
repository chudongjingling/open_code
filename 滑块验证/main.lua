local function argth()
	local _ENV = {
		tonumber = tonumber,
		type = type,
		error = error,
		select = select,
		string = {
			format = string.format,
			find = string.find,
		},
		debug = {
			getinfo = debug.getinfo,
		},
	}
	local function bad_arg(field, arg_count, mean, expected_type, got_type, level_plus)
		level_plus = tonumber(level_plus) or 0
		local dbinfo = debug.getinfo(2 + level_plus)
		local ftype = (type(dbinfo.namewhat)=="string" and dbinfo.namewhat) or ""
		local fname = (type(dbinfo.name)=="string" and dbinfo.name) or (type(field)=="string" and field) or "?"
		if got_type~="" then
			got_type = string.format(", 得到 %s", got_type)
		end
		return error(string.format("未能成功运行,参数序号:#%d%s 函数:%s '%s' (需要 %s %s)", arg_count, mean, ftype, fname, expected_type, got_type), 3 + level_plus)
	end

	local function TsCheck(arg_count, expected_type, ...)
		if type(arg_count)~="number" then
			bad_arg("TsCheck", 1, "(arg_count)", "number", type(arg_count))
		end
		if type(expected_type)~="string" then
			bad_arg("TsCheck", 2, "(expected_type)", "string", type(expected_type))
		end
		local argc = select("#", ...)
		if argc<arg_count then
			return bad_arg("", arg_count, "", expected_type, "no value")
		else
			local the_value = select(arg_count, ...)
			if string.find(expected_type, "number") and tonumber(the_value) then
				return tonumber(the_value)
			elseif not string.find(expected_type, type(the_value)) then
				return bad_arg("", arg_count, "", expected_type, type(the_value))
			else
				return the_value
			end
		end
	end

	local function opt_value(arg_count, expected_type, default_val, ...)
		if type(arg_count)~="number" then
			bad_arg("opt_value", 1, "(arg_count)", "number", type(arg_count))
		end
		if type(expected_type)~="string" then
			bad_arg("opt_value", 2, "(expected_type)", "string", type(expected_type))
		end
		if (not string.find(expected_type, type(default_val))) and type(default_val)~="nil" then
			bad_arg("opt_value", 3, "(default_val)", expected_type, type(default_val))
		end
		local argc = select("#", ...)
		if argc<arg_count then
			return default_val
		else
			local the_value = select(arg_count, ...)
			if string.find(expected_type, "number") and tonumber(the_value) then
				return tonumber(the_value)
			elseif not string.find(expected_type, type(the_value)) then
				return bad_arg("", arg_count, "", "opt."..expected_type, type(the_value))
			else
				return the_value
			end
		end
	end
	return {
		TsCheck = TsCheck,
		opt_value = opt_value,
		bad_arg = bad_arg,
	}
end

local argthlib = argth()
local TsCheck = argthlib.TsCheck
local TsOpt = argthlib.opt_value

require("TSLib")
local ts = require("ts")
local path = userPath().."/res/"
local w,h = getScreenSize()
if  w +h ~= 1136 + 640 then
	dialog("暂未适配该设备，请联系作者并提交设备型号", time)
end


local function jxtab(tab)
	local result = ""
	for k,v in pairs(tab) do
		local info = ""
		if type(v) == "table" then
			info = jxtab(v)
			info = "{\n"..info.."}"
		else
			info = v
		end
		result = result .. k ..":"..info.."\n"
	end
	return result;
end

function find_taget(...)
	-- body
	local degree = TsOpt(1, "number", 115, ...)
	local retab = {
		result = -1,
		msg = "",
	}

	if ts.binaryzation == nil then
		dialog("请升级ts.so扩展库后重启服务", time)
	end
--	ts.binaryzation(0,0,600,600,115)
	local piece = {}
	local pis = ""
	local trpiece = {}
	local targetpis = ""
	local tab = {}
	local taget = {}
	for i=1,20  do
		piece[#piece + 1] = {i,1,0}
		piece[#piece + 1] = {i+1,2,255}
		piece[#piece + 1] = {1,i,0}
		piece[#piece + 1] = {2,i+1,255}
		pis = pis..i.."|".."-1".."|".."0,"
		pis = pis..i.."|".."0".."|".."255,"
		pis = pis.."-1".."|"..i.."|".."0,"
		pis = pis.."0".."|"..i.."|".."255,"
	end

	--local pis = "" ---触动多点找色版
	--for i=1,25  do
	--	pis = pis..i.."|".."0".."|".."0x000000,"
	--	pis = pis..i.."|".."1".."|".."0xffffff,"
	--	pis = pis.."0".."|"..i.."|".."0x000000,"
	--	pis = pis.."1".."|"..i.."|".."0xffffff,"
	--end
	pis = string.sub(pis, 1, -2)

	--dialog(pis, time)
	--x, y = findMultiColorInRegionFuzzy(0x000000, "pis", 100, 84, 239, 127, 501)
	--dialog(x.."|"..y, time)

	for i=0,25  do
		trpiece[#trpiece + 1] = {i,1,0}
		trpiece[#trpiece + 1] = {i+1,2,255}
		trpiece[#trpiece + 1] = {1,i,0}
		trpiece[#trpiece + 1] = {2,i+1,255}
		targetpis = targetpis..i.."|0|".."0,"
		targetpis = targetpis..(i+61).."|0|".."0,"
		--	targetpis = targetpis..i.."|86|".."0,"
		targetpis = targetpis..(i+61).."|86|".."0,"
		targetpis = targetpis.."0|"..i.."|".."0,"
		if i<12 then
		targetpis = targetpis..(i+1).."|"..(i+1).."|".."0,"
		end
		--	targetpis = targetpis.."0|"..(i+63).."|".."0,"
	end	
	targetpis = string.sub(targetpis, 1, -2)


	ts.binaryzation(0,0,600,600,degree)
	tab = ts.imgFindColor(path.."tmp.jpg",255,pis,60, 239, 127, 501)
	if tab[1] then

		taget = ts.imgFindColor(path.."tmp.jpg",0,targetpis,tab[1].x+98,tab[1].y,600, tab[1].y+90)
		if taget[1] then
			--moveTo(140,600,140+taget[1].x-tab[1].x,600,11,100)
			retab.result = taget[1].x - tab[1].x
		else 
			retab.result = -1
			retab.msg = "凹槽未找到"
			return retab
		end
	else
		for i = 5, 30,5 do
			ts.binaryzation(0,0,600,600,degree+i)
			tab = ts.imgFindColor(path.."tmp.jpg",255,pis,60, 239, 127, 501)
--			toast(i,1)
			if tab[1] then
--				ts.binaryzation(0,0,600,600,degree)
				taget = ts.imgFindColor(path.."tmp.jpg",0,targetpis,tab[1].x+98,tab[1].y,600, tab[1].y+90)
				if taget[1] then
					--moveTo(140,600,140+taget[1].x-tab[1].x,600,11,100)
					retab.result = taget[1].x - tab[1].x
					return retab
				else 
					retab.result = -1
					retab.msg = "凹槽未找到"
					return retab
				end
			end
		end
		retab.result = -1
		retab.msg = "滑块未找到"
	end
	return retab
end
