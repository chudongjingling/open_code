list = {
"app.weiphone.net.85819.ios.otrlocation",
"com.ts.rebirth",
"app.weiphone.3k.debbgkiller",--3 K 助手
"com.saurik.patcyh",
"com.pk191",
"com.pk192",
"com.pk193",
"com.tongbu.tuideb",--同步推
"app.weiphone.watchdogpro",
"app.weiphone.007gaiji.007gaiji",--007 改机
"app.weiphone.tencent.xin",--威锋微信
"libactivator",
"watchdogpro.178",
"com.ts.touchsprite",--触动旧版
"com.tszuoniqiu.ios",--触动破解版
"app.weiphone.hackyouriphone.backgroundmanager",
"app.weiphone.killbackground7",
"app.weiphone.als",--ALS
"app.weiphone.als.air",--天空数据
"app.weiphone.wukong.wxshaketweak",--悟空助手
"app.weiphone.myrepospace.tzjl.txyapp",--天下游
--"com.touchsprite.ios"--触动精灵
}
for i = 1,#list do
os.execute("dpkg -P "..list[i])
mSleep(100)
end
os.execute("reboot")
