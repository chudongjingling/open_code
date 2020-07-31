local t = os.clock()
local recognize = ocrText(238, 149, 283, 176, 1);  
t = os.clock() - t
dialog("识别出的字符："..recognize.."\n耗时: "..t.." 秒", 0);