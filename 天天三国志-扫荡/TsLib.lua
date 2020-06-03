--=====================--TS扩展LUA库[找色/比色]--=====================--
function click(...)
	touchDown(...)
	mSleep(30)
	touchUp(...)
end

-- 函数:单点比色
function isColor(x,y,c,s)
	local fl,abs = math.floor,math.abs
	s = fl(0xff*(100-s)*0.01)
	local r,g,b = fl(c/0x10000),fl(c%0x10000/0x100),fl(c%0x100)
	local rr,gg,bb = getColorRGB(x,y)
	if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
		return true
	end
end

-- 函数:多点比色
function multiColor(array,s)
	s = math.floor(0xff*(100-s)*0.01)
	keepScreen(true)
	for var = 1, #array do
		local lr,lg,lb = getColorRGB(array[var][1],array[var][2])
		local r = math.floor(array[var][3]/0x10000)
		local g = math.floor(array[var][3]%0x10000/0x100)
		local b = math.floor(array[var][3]%0x100)
		if math.abs(lr-r) > s or math.abs(lg-g) > s or math.abs(lb-b) > s then
			return false
		end
	end
	keepScreen(false)
	return true
end

function colorFlag(c,p,x,y,x1,y1)
	local x0,y0 = findColorInRegionFuzzy(c,p,x,y,x1,y1);
	if x0 ~= -1 and y0 ~= -1 then
		return true
	else
		return false
	end
end

--=====================--TS扩展LUA库[文件操作]--=====================--
function saveStr(path,s)
	file = io.open(path, "w+");
	file:write(s);
	file:close();
end

-- 函数:获取当前脚本路径
function z_getScriptPathList()
local pathlist = {};
local i,s = 1,package.path;
	while true do
		n = string.find(s,";");
		if n == nil then
			break;
		end
		s = string.sub(s,n+1,string.len(s));
		pathlist[i] = string.sub(s,1,string.find(s,"?")-1);
		i = i + 1;
	end
	return pathlist;
end

function z_getScriptPath()
	local pl = z_getScriptPathList()
	return pl[#pl]
end

-- 函数:删除文件
function delFile(path)
    os.execute("rm -rf "..path);
end

-- 函数:遍历文件
function getList(path)
	local a = io.popen("ls "..path);
	local f = {};
	for l in a:lines() do
		table.insert(f,l)
	end
    return f
end

-- 函数:复制文件
function copyFile(path,to)
    os.execute("cp -rf "..path.." "..to);
end

-- 函数:移动文件
function moveFile(path,to)
    os.execute("mv "..path.." "..to);
end

-- 函数:创建文件夹
function newFolder(path)
    os.execute("mkdir "..path);
end

function fileToHexString(file)
	local file = io.open(file, 'rb');
	local data = file:read("*all");
	file:close();
	local t = {};
	for i = 1, string.len(data),1 do
			local code = tonumber(string.byte(data, i, i));
			table.insert(t, string.format("%02x", code));
	end
	return table.concat(t, "");
end

function HexToRes(Path,hexstr)
	local bytesfile = io.open(Path, "wb")
	if nil == bytesfile then
		dialog("Can not open output file to write!\n",0)
		return
	end
	for i = 1, string.len(hexstr) - 1, 2 do
		local doublebytestr = string.sub(hexstr, i, i+1)
		local n = tonumber(doublebytestr, 16)
		if 0 == n then
			bytesfile:write('\00')
		else
			bytesfile:write(string.format("%c", n))
		end
	end
	bytesfile:close()
	return Tmp
end

--=====================--TS扩展LUA库[字符串操作]--=====================--
-- 函数:生成随机字符串
function randomStr(str, num)
	local ret =''
	math.randomseed( tonumber(tostring(os.time()):reverse():sub(1,6)) );
	for i=1 ,num do
		local rchr = math.random(1, string.len(str))
		ret = ret .. string.sub(str, rchr, rchr)
	end
	return ret
end

function isToday(timestamp)
	local today = os.date("*t")
	local secondOfToday = os.time({day=today.day, month=today.month,
		year = today.year, hour=0, minute=0, second=0})
	if timestamp >= secondOfToday and timestamp < secondOfToday + 24 * 60 * 60 then
		return true
	else
		return false
	end
end














