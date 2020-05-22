# 滑块验证
支持iOS  8-10系统设备，5,5s，se机型和 6系放大模式
功能说明：本工具原理为找到滑块凹槽位置，模拟手动滑动过检。
声明：本脚本仅供技术交流使用，请勿用于违规用途。

使用脚本前首先必须加载
require("TSLib")
require("FindSquare")
这两个文件


函数方法：
tab = find_taget(degree)

参数：
深化强度 degree
填写 100 即可，范围50-200，一般无需调整，
识别概率低时可以进行微调，值变大可提高滑块识别率，值变小可提高凹槽识别率

返回值为一个table
当查找成功时，tab.result返回需要滑动的距离
失败时，tab.result返回-1，tab.msg返回失败原因

脚本示例：


[mw_shl_code=lua,true]--需要在验证码界面运行
require("TSLib")
require("FindSquare")

tab = find_taget(105)
--dialog(tab.result, time)
--mSleep(2000)
if tab.result == -1 then
dialog(tab.msg, time)

end

moveTo(140,600,143+tab.result,600,11,100)[/mw_shl_code]
