file = {
--判断文件是否存在
exist = (function(file) local sFlie,Err = io.open(file,"r+");if Err~=nil then return false end sFlie:close();return true end),
--读取文件内容
read = (function(file) local sFlie,Err = io.open(file,"r");if Err~=nil then return nil end local _tmp = sFlie:read("*all");sFlie:close();return _tmp end),
--读取文件内容并转化成 table
totable = (function(file) local _tmp = {};local sFlie,Err = io.open(file,"r");if Err~=nil then return {} end;for _line in sFlie:lines() do table.insert(_tmp, string.match(_line,"%C+")) end;sFlie:close();return _tmp; end),
--保存文件内容
save = (function(file,data,append) local sFlie,Err = io.open(file,(append and "a") or "w");sFlie:write(data..((append and "\r\n") or ""));sFlie:close() end),
--删除
delete = (function(file) os.remove(file) end)
}
touch = {
--点击
click = (function(x,y,startwait,stopwait) mSleep(startwait);touchDown(1,x,y);mSleep(20);touchUp(1,x,y);mSleep(stopwait) end),
--拖动
drag = (function(x1,y1,x2,y2,step,wait,stepwait) local step = step or 30;touchDown(1,x1,y1);repeat x1,y1 = ((math.abs(x2-x1)<step and x1) or x1 + (step * ((x2-x1<0 and -1) or 1))),((math.abs(y2-y1)<step and y1) or y1 + (step * ((y2-y1<0 and -1) or 1)));touchMove(1,x1,y1);mSleep(stepwait or 30);until ((math.abs(x2-x1)<step) and (math.abs(y2-y1)<step));touchMove(1,x2,y2);mSleep(wait or 300)touchUp(1,x2,y2) end),
}
color = {
--转化rgb色
torgb = (function(_color) return math.modf(_color/65536),math.modf(_color/256)%256,_color%256 end),
--获取两色颜色差异
contrast = (function(_c1,_c2) local r1,g1,b1 = color.torgb(_c1);local r2,g2,b2 = color.torgb(_c2); return math.abs(r1-r2)+math.abs(g1-g2)+math.abs(b1-b2) end),
--对比颜色值
issim = (function(_c1,_c2,_sim) local r1,g1,b1 = color.torgb(_c1);local r2,g2,b2 = color.torgb(_c2);return (math.abs(r1-r2))<_sim and (math.abs(g1-g2))<_sim and (math.abs(b1-b2))<_sim end),
}
