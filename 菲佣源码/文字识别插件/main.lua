local FYorc = require("FYorc")
--local text = orc("/User/Media/TouchSprite/lua/txwl.txt", 				--字库文件
--											269, 664, 313, 692,			--识别区域
--											0x1A0F0C,0x140C09,			--偏色值
--											87,							--偏色值的模糊度
--											95)							--字库比对的错误率
--dialog(text,0)
										
local text = FYorc.orctext("/User/Media/TouchSprite/lua/txwl.txt", 				--字库文件
											263, 682, 309, 705,			--识别区域
											0x36393F,0xA9A39B,			--偏色值
											87,							--偏色值的模糊度
											95)							--字库比对的错误率
dialog(text,0)										
										
