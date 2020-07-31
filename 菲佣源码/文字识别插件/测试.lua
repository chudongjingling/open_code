local FYorc = require("FYorc")
--local text = orc("/User/Media/TouchSprite/lua/txwl.txt", 				--字库文件
--											269, 664, 313, 692,			--识别区域
--											0x1A0F0C,0x140C09,			--偏色值
--											87,							--偏色值的模糊度
--											95)							--字库比对的错误率
--dialog(text,0)
local t = os.clock()										
local text = FYorc.orctext("/User/Media/TouchSprite/lua/txwl.txt", 				--字库文件
											232, 386, 277, 413,			--识别区域
											--0x36393F,0xA9A39B,			--偏色值
											0x1A0F0C,0x140C09,
											87,							--偏色值的模糊度
											95)							--字库比对的错误率
t = os.clock() - t
dialog("识别文字为: "..text.."\n耗时: "..t.." 秒",0)										
