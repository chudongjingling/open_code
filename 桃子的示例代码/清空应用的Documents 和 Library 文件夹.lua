function ClearBid(Bid)
closeApp(Bid)
clearKeyChain(Bid)
function LastFolder(Path) return string.match(Path, "(.+)/") end
mSleep(1000)
if type(appDataPath) == "function" and appDataPath(Bid) ~= "" then
if string.sub(getOSVer(), 1, 1) == "7" then
mSleep(500)
os.execute("rm -rf "..LastFolder(appDataPath(Bid)).."/Library/Caches/*") --Library
os.execute("rm -rf "..LastFolder(appDataPath(Bid)).."/Documents/*")
os.execute("rm -rf "..LastFolder(appDataPath(Bid)).."/Documents/.*")
os.execute("rm -rf "..LastFolder(appDataPath(Bid)).."/Library/Preferences/" .. Bid .. ".plist")
os.execute("rm -rf "..LastFolder(appDataPath(Bid)).."/Library/Cookies/*")
mSleep(1000)
return true
elseif string.sub(getOSVer(), 1, 1) == "8" then
mSleep(500)
os.execute("rm -rf "..(appDataPath(Bid)).."/Library/Caches/*") --Library
os.execute("rm -rf "..(appDataPath(Bid)).."/Documents/*")
os.execute("rm -rf "..(appDataPath(Bid)).."/Documents/.*")
os.execute("rm -rf "..(appDataPath(Bid)).."/Library/Preferences/" .. Bid .. ".plist")
os.execute("rm -rf "..(appDataPath(Bid)).."/Library/dungeon/*")
--.com.apple.mobile_container_manager.metadata.plist
mSleep(1000)
return true
end
end
end
