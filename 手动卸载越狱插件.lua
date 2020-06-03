::getInfo::
bid = dialogInput("从 Cydia 已安装中复制应用 ID 到下方", "com.weiphone.xx", "立即卸载")
if bid ~= "" then
mSleep(1000)
toast("开始卸载……")
os.execute("dpkg -P "..bid)
mSleep(3000)
toast("卸载完成~重启设备~…")
mSleep(5000)
os.execute("reboot")
else
dialog("请填写应用 ID！", 5);
goto getInfo
end
