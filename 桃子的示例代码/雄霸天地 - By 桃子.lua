init("0",1);luaExitIfCall(true)
local w, h = getScreenSize()
State={        ["记录"] = false,
	["IP"]   = "192.168.1.89",
	["Move"] = "/User/Media/TouchSprite/XBTD_move.txt",
	["Path"] = "/User/Media/TouchSprite/lua/",
	["Bid"]  = "com.digitalcloud.otwzh",
	["随机常量"] = 0,
	["屏幕宽"] = w,
	["屏幕高"] = h
}

if State["记录"] then initLog(State["IP"],3) end
function AddLog(text) if State["记录"] then        wLog(State["IP"], text) end end
	function _AddLog(text) if State["记录"] then wLog(State["IP"], "{\"deviceid\":\"" .. getDeviceID() .. "\",\"data\":{".. tostring(text).."}}") end end
		function AddTextLog(...) local TmpJson = "" for _,arr in ipairs({...}) do TmpJson = TmpJson .. "\"" .. tostring(_) .. "\":\"" .. tostring(arr) .. "\"," end _AddLog(string.sub(TmpJson,1,-2)) end
			function AddTableLog(Arr) local TmpJson = "" for _,arr in pairs(Arr) do TmpJson = TmpJson .. "\"" .. tostring(_) .. "\":\"" .. tostring(arr) .. "\"," end _AddLog(string.sub(TmpJson,1,-2)) end
				function iif(a,b,c) if a then return b else return c end end

					function SLZT()        --试炼之塔
						local YZW = {
							[1] = {["阵亡"] = (function() return isColor(231,231,0xff0000) end), ["存在"] = (function() return isColor(233,346,0xffffff) end),},
							[2] = {["阵亡"] = (function() return isColor(348,231,0xff0000) end), ["存在"] = (function() return isColor(350,346,0xffffff) end),},
							[3] = {["阵亡"] = (function() return isColor(465,231,0xff0000) end), ["存在"] = (function() return isColor(467,346,0xffffff) end),},
							[4] = {["阵亡"] = (function() return isColor(231,391,0xff0000) end), ["存在"] = (function() return isColor(233,506,0xffffff) end),},
							[5] = {["阵亡"] = (function() return isColor(348,391,0xff0000) end), ["存在"] = (function() return isColor(350,506,0xffffff) end),},
							[6] = {["阵亡"] = (function() return isColor(465,391,0xff0000) end), ["存在"] = (function() return isColor(467,506,0xffffff) end),},
						}
						local WJ = {}
						local function JC()
							local SLTs = {}
							local BackBoo = false
							init("0",0)
							if true then
								touchDown(3,300,525)
								mSleep(83)
								touchMove(3,281,478)
								mSleep(14)
								touchMove(3,280,464)
								mSleep(16)
								touchMove(3,278,447)
								mSleep(17)
								touchMove(3,276,421)
								mSleep(18)
								touchMove(3,275,403)
								mSleep(15)
								touchMove(3,275,378)
								mSleep(18)
								touchMove(3,274,354)
								mSleep(14)
								touchMove(3,272,330)
								mSleep(18)
								touchMove(3,269,305)
								mSleep(16)
								touchMove(3,266,281)
								mSleep(17)
								touchMove(3,264,257)
								mSleep(17)
								touchMove(3,262,236)
								mSleep(16)
								touchMove(3,259,219)
								mSleep(16)
								touchMove(3,257,201)
								mSleep(17)
								touchUp(3,253,197)
							end
							mSleep(200)
							x, y = findColorInRegionFuzzy(0x00ff00, 90, 95,227, 422,569); 
							if x ~= -1 and y ~= -1 then  --如果在指定区域找到某点符合条件
								BackBoo = true
							end
							mSleep(100)
							touchUp(3,253,197)
							init("0",1)
							return BackBoo
						end
						local function JC2()
							local SLTs = {}
							local BackBoo = false
							init("0",0)
							if true then
								touchDown(6,312,263)
								mSleep(198)
								touchMove(6,315,274)
								mSleep(19)
								touchMove(6,315,277)
								mSleep(17)
								touchMove(6,315,280)
								mSleep(15)
								touchMove(6,315,284)
								mSleep(18)
								touchMove(6,315,289)
								mSleep(15)
								touchMove(6,315,295)
								mSleep(17)
								touchMove(6,315,303)
								mSleep(17)
								touchMove(6,315,312)
								mSleep(19)
								touchMove(6,315,321)
								mSleep(15)
								touchMove(6,315,330)
								mSleep(18)
								touchMove(6,315,339)
								mSleep(15)
								touchMove(6,315,347)
								mSleep(17)
								touchMove(6,316,356)
								mSleep(17)
								touchMove(6,317,363)
								mSleep(18)
								touchMove(6,318,369)
								mSleep(16)
								touchMove(6,319,375)
								mSleep(17)
								touchMove(6,320,380)
								mSleep(15)
								touchMove(6,320,385)
								mSleep(17)
								touchMove(6,320,390)
								mSleep(18)
								touchMove(6,320,394)
								mSleep(16)
								touchMove(6,320,399)
								mSleep(17)
								touchMove(6,320,403)
								mSleep(15)
								touchMove(6,320,410)
								mSleep(18)
								touchMove(6,320,418)
								mSleep(15)
								touchMove(6,320,427)
								mSleep(17)
								touchMove(6,320,434)
								mSleep(16)
								touchMove(6,320,443)
								mSleep(17)
								touchMove(6,320,451)
								mSleep(19)
								touchMove(6,320,459)
								mSleep(15)
								touchMove(6,320,468)
								mSleep(18)
								touchMove(6,318,476)
								mSleep(17)
								touchMove(6,318,485)
								mSleep(17)
								touchMove(6,317,492)
								mSleep(16)
								touchMove(6,316,500)
								mSleep(17)
								touchMove(6,315,509)
								mSleep(16)
								touchMove(6,315,517)
								mSleep(18)
								touchMove(6,313,526)
								mSleep(15)
								touchMove(6,313,536)
								mSleep(17)
								touchMove(6,313,546)
								mSleep(18)
								touchMove(6,312,556)
								mSleep(17)
								touchMove(6,311,567)
								mSleep(17)
								touchMove(6,311,579)
								mSleep(17)
								touchMove(6,311,589)
								mSleep(18)
								touchMove(6,311,598)
								mSleep(17)
								touchMove(6,311,608)
								mSleep(17)
								touchMove(6,311,615)
								mSleep(16)
								touchMove(6,311,623)
								mSleep(17)
								touchMove(6,311,629)
								mSleep(16)
								touchMove(6,311,634)
								mSleep(17)
								touchMove(6,311,639)
								mSleep(17)
								touchMove(6,311,642)
								mSleep(17)
								touchMove(6,311,645)
								mSleep(17)
								touchMove(6,311,648)
								mSleep(21)
								touchMove(6,311,651)
								mSleep(12)
								touchMove(6,311,654)
								mSleep(17)
								touchMove(6,311,657)
								mSleep(17)
								touchMove(6,311,660)
								mSleep(15)
								touchMove(6,311,664)
								mSleep(21)
								touchMove(6,311,667)
								mSleep(17)
								touchMove(6,311,670)
								mSleep(23)
								touchMove(6,311,674)
								mSleep(7)
								touchMove(6,311,679)
								mSleep(15)
								touchMove(6,311,683)
								mSleep(16)
								touchMove(6,312,688)
								mSleep(19)
								touchMove(6,312,693)
								mSleep(15)
								touchMove(6,312,696)
								mSleep(20)
								touchMove(6,313,700)
								mSleep(13)
								touchMove(6,315,702)
								mSleep(17)
								touchMove(6,315,705)
								mSleep(16)
								touchMove(6,315,707)
								mSleep(17)
								touchMove(6,315,709)
								mSleep(17)
								touchMove(6,316,710)
								mSleep(16)
								touchMove(6,316,711)
								mSleep(17)
								touchMove(6,316,712)
								mSleep(17)
								touchMove(6,316,713)
								mSleep(17)
								touchMove(6,316,715)
								mSleep(16)
								touchMove(6,316,716)
								mSleep(17)
								touchMove(6,316,717)
								mSleep(17)
								touchMove(6,316,718)
								mSleep(17)
								touchMove(6,316,719)
								mSleep(17)
								touchMove(6,316,720)
								mSleep(17)
								touchMove(6,317,721)
								mSleep(17)
								touchMove(6,317,722)
								mSleep(16)
								touchMove(6,317,723)
								mSleep(17)
								touchMove(6,317,724)
								mSleep(17)
								touchMove(6,317,725)
								mSleep(17)
								touchMove(6,317,726)
								mSleep(17)
								touchMove(6,317,727)
								mSleep(17)
								touchMove(6,317,728)
								mSleep(17)
								touchMove(6,317,729)
								mSleep(17)
								touchMove(6,317,730)
								mSleep(117)
								touchMove(6,317,731)
								mSleep(33)
								touchMove(6,317,732)
								mSleep(50)
								touchMove(6,317,734)
								mSleep(33)
								touchMove(6,317,735)
								mSleep(33)
								touchMove(6,318,735)
								mSleep(627)
								touchMove(6,319,735)
							end
							mSleep(200)
							x, y = findColorInRegionFuzzy(0x00ff00, 90, 95,227, 418,438); 
							if x ~= -1 and y ~= -1 then  --如果在指定区域找到某点符合条件
								BackBoo = true
							end
							mSleep(100)
							touchUp(6,319,735)
							init("0",1)
							return BackBoo
						end
						local RW = {}
						RW["页面"] = 1
						RW["当前英雄"] = 1
						RW["检测英雄"] = false
						RW["攻击普通状态"] = true
						while true do
							if RunNow()==false then return false end

							isColor_Click(919,536,0x1b9bcd)        --攻击
							isColor_Click(655,44,0x8cab69)        --结果
							isColor_Click(859,613,0xc9ff6e)        --返回

							isColor_Click(979,567,0xd71b15)        --筛子
							isColor_Click(897,209,0xc79a0d)        --得到东西
							if isColor(499,27,0x00f600) then        --上楼&换路
								Click_XY(565,140)        --1层上楼
								Click_XY(556,134)        --2层上楼
								Click_XY(318,411)        --3层选路
								Click_XY(193,136)        --3层上楼
								Click_XY(506,498)        --4层选路
								Click_XY(508,320)        --4层选路2
								Click_XY(203,145)        --4层上楼
								Click_XY(509,184)        --5层选路
							end
							if isColor(925,242,0xe281b1) and isColor(940,226,0xfffffb) and isColor(961,230,0xc6615f) and isColor(960,236,0xd47a98) and isColor(949,242,0xea5cb9) and isColor(940,246,0xfffbfb) then
								mSleep(500)
								Click_XY(204,40)
								mSleep(1000)
								Click_XY(569,336)
								if X_isColor_Click(429,327,0xff0000,3000) then 
									Click_XY(892,205)
									mSleep(1000)
									Click_XY(989,46)
									mSleep(1000)
									break
								end
							end
							if X_isColor(826,271,0xfffdbd,500) then
								Click_XY(989,46)        --体力不足
								break
							end
							if isColor(417,313,0x00ff00) and isColor(417,316,0x00ff00) and isColor(417,319,0x00ff00) and isColor(421,320,0x00ff00) and isColor(422,321,0x291808) and isColor(423,321,0x291808) and isColor(426,324,0x2a1808) then
								break
							end
							if isColor_Click(983,571,0x0b7ec4) then        --攻击
								mSleep(1000)
								--检测攻击状态
								if isColor(523,395,0x3a9aff) and isColor(539,398,0x3888f7) and isColor(602,401,0x3167e7) and isColor(597,408,0x1e3577) then
									RW["攻击普通状态"] = false
									Click_XY(560,401)
									mSleep(1000)
								else
									RW["攻击普通状态"] = true
								end

								--首页
								for l = 1 , 10 do
									Click_Move(225,334,579,332)
									if JC2()==false then
										break
									end
									mSleep(300)
								end
								mSleep(1000)

								---------检测英雄
								for l = 1 , 10 do        --检测页面数量
									for _,z in ipairs(YZW) do        --6个位置框
										if z["存在"]() then        --
											if z['阵亡']()==false then
												Click_XY(231+(((_-1)%3)*117),(function(a) if (a>3) then return 391; else return 231; end end)(_));mSleep(500)
												if isColor(515,338,0xc7b299) and isColor(522,343,0x91816f) and isColor(526,343,0xa5937f) and isColor(516,350,0xb29f89) and isColor(522,352,0xab9983) and isColor(551,340,0xb09d87) then
													--WJ[(l-1)*6+_]['法师']=true
													mSleep(1000)
													Click_XY(894,127)
													X_isColor_Click(893,127,0x4c3703,1000)
													mSleep(1000)
													if RW["攻击普通状态"]==false then 
														Click_Move(231+(((_-1)%3)*117),(function(a) if (a>3) then return 391; else return 231; end end)(_),616,194)
														goto GJ
													end
												else
													X_isColor_Click(893,127,0x4c3703,1000)
													mSleep(1000)
													if RW["攻击普通状态"] then 
														Click_Move(231+(((_-1)%3)*117),(function(a) if (a>3) then return 391; else return 231; end end)(_),616,194)
														goto GJ
													end
												end
											end
										end
									end
									mSleep(1000)
									Click_Move(561,544,561,444)
									mSleep(1000)
									if JC()== false then
										break
									end
									mSleep(1000)
								end
								mSleep(800)

								--首页
								for l = 1 , 10 do
									Click_Move(225,334,579,332)
									if JC2()==false then
										break
									end
									mSleep(300)
								end
								mSleep(1000)

								---------检测英雄
								for l = 1 , 10 do        --检测页面数量
									for _,z in ipairs(YZW) do        --6个位置框
										if z["存在"]() then        --
											if z['阵亡']()==false then
												Click_Move(231+(((_-1)%3)*117),(function(a) if (a>3) then return 391; else return 231; end end)(_),616,194)
												goto GJ
											end
										end
									end
									mSleep(1000)
									Click_Move(561,544,561,444)
									mSleep(1000)
									if JC()== false then
										break
									end
									mSleep(1000)
								end
								Click_XY(944,48)
								mSleep(1000)
								Click_XY(204,40)
								mSleep(1000)
								Click_XY(569,336)
								if X_isColor_Click(429,327,0xff0000,3000) then 
									Click_XY(892,205)
									mSleep(1000)
									Click_XY(989,46)
									mSleep(1000)
									break
								end
								::GJ::
								X_isColor_Click(919,536,0x1b9bcd,5000,500)--攻击
								X_isColor_Click(655,44,0x8cab69,5000,500)--结果
								X_isColor_Click(859,613,0xc9ff6e,5000,500)--返回
							end
							mSleep(1000)
						end
						X_isColor_Click(986,53,0x93600d,5000)        --退出
					end

					RW = {
						[1] = {
							["运行"] = true,
							["已执行"] = false,
							["名字"] = "积银成票",
							["脚本"] = (function() 
									mSleep(1700);
									Click_XY(466,446);--钱庄
									mSleep(1700);
									Click_XY(418,523);--兑换
									mSleep(1700);
									Click_XY(502,281);--输入框
									mSleep(1700);
									Click_XY(188,354);--1
									mSleep(1700);
									Click_XY(733,242);--空白位置点击
									mSleep(1700);
									Click_XY(880,523);--确定
									mSleep(1700);
									Click_XY(951,44);--退出
								end)
						},
						[2] = {
							["运行"] = true,
							["已执行"] = false,
							["名字"] = "太学院",
							["脚本"] = (function() 
									mSleep(1700);
									Click_XY(615,514);--太学院
									mSleep(1700);
									Click_XY(568,523);--太学
									mSleep(1700);
									local CK = {
										{285,474},
										{395,476},
										{496,477},
										{622,486},
										{750,490},
										{866,494},
									}
									for _,z in pairs(CK) do
										Click_XY(z[1],z[2])
										mSleep(100)
									end
									mSleep(1700);
									Click_XY(569,340);--确定
									mSleep(1700);
									Click_XY(903,208);--关闭
									mSleep(1700);
									Click_XY(951,44);--退出
								end)
						},
						[3] = {
							["运行"] = true,
							["已执行"] = false,
							["名字"] = "招兵买马",
							["脚本"] = (function() 
									mSleep(1700);
									Click_XY(798,405);--兵营
									mSleep(1700);
									Click_XY(569,519);--义兵
									mSleep(1700);
									Click_XY(951,44);--退出
								end)
						},
						[4] = {
							["运行"] = true,
							["已执行"] = false,
							["名字"] = "官运亨通",
							["脚本"] = (function() 
									mSleep(1700);
									Click_XY(883,265);--官府
									mSleep(1700);
									Click_XY(709,516);--官职
									mSleep(1700);
									Click_XY(436,514);--领取俸禄
									mSleep(1700);
									Click_XY(951,44);--退出
								end)
						},
						[5] = {
							["运行"] = true,
							["已执行"] = false,
							["名字"] = "商运大贾",
							["脚本"] = (function() 
									mSleep(1700);
									Click_XY(226,501);--驿站
									mSleep(1700);
									Click_XY(419,510);--通商
									mSleep(1700);
									Click_XY(834,140);--资源运输
									mSleep(1700);
									Click_XY(305,429);--墨宝
									mSleep(1700);
									Click_XY(706,516);--小量
									mSleep(1700);
									Click_XY(894,523);--下一步
									mSleep(1700);
									Click_XY(858,504);--集结
									mSleep(1700);
									Click_XY(864,516);--出发
									mSleep(1700);
									Click_XY(953,46);--退出
								end)
						},
						[6] = {
							["运行"] = true,
							["已执行"] = false,
							["名字"] = "粮草先行",
							["脚本"] = (function() 
									mSleep(1700);
									Click_XY(1078,564);--功能
									mSleep(1700);
									Click_XY(715,462);--粮草
									mSleep(1700);
									-- 468,341 最小粮草
									LC()
									mSleep(1700);
									Click_XY(832,221);--买粮
									mSleep(1700);
									Click_XY(951,44);--退出
									mSleep(1700);
									Click_XY(951,44);--退出
								end)
						},
						[7] = {
							["运行"] = true,
							["已执行"] = false,
							["名字"] = "求贤若渴",
							["脚本"] = (function() 
									mSleep(1700);
									Click_XY(1078,564);--功能
									mSleep(1700);
									Click_XY(271,455);--寻访
									mSleep(1700);
									while true do
										if RunNow()==false then return false end
										x, y = findColorInRegionFuzzy(0x00ffff, 100, 265,96, 886,150); 
										if x > 0 then 
											Click_XY(763,524)--刷新
											mSleep(1000)
											if isColor(369,345,0x3c8ae2) and isColor(383,344,0x52b0e8) and isColor(379,350,0x254c83) then
												break
											end
											Click_XY(573,507)--遣散
											mSleep(1700);
											Click_XY(594,354)--遣散确定
											mSleep(2000)
										else
											break
										end
									end
									Click_XY(901,206);--关闭
									mSleep(1700);                        
									Click_XY(951,44);--退出
									mSleep(1700);
									Click_XY(951,44);--退出
								end)
						},
						[8] = {
							["运行"] = true,
							["已执行"] = false,
							["名字"] = "农场&银矿",
							["脚本"] = (function() 
									--local X={185,298,416,529,661,777,906,1000}        115
									--local Y={190,300,440}        125
									--8*8
									mSleep(1700);
									Click_XY(877,546);--城外
									mSleep(3000)
									init("0",0)
									for l = 1,3 do
										Click_Move(378,308,47,746,50)
										mSleep(500)
									end
									init("0",1)
									function HD()
										init("0",0)
										touchDown(7,110,508)
										mSleep(15)
										touchMove(7,114,509)
										mSleep(32)
										touchMove(7,120,510)
										mSleep(16)
										touchMove(7,128,510)
										mSleep(17)
										touchMove(7,135,510)
										mSleep(17)
										touchMove(7,143,510)
										mSleep(17)
										touchMove(7,151,510)
										mSleep(16)
										touchMove(7,160,510)
										mSleep(17)
										touchMove(7,168,510)
										mSleep(16)
										touchMove(7,176,510)
										mSleep(17)
										touchMove(7,183,510)
										mSleep(17)
										touchMove(7,191,510)
										mSleep(16)
										touchMove(7,197,510)
										mSleep(18)
										touchMove(7,203,510)
										mSleep(17)
										touchMove(7,209,510)
										mSleep(15)
										touchMove(7,217,510)
										mSleep(16)
										touchMove(7,226,510)
										mSleep(17)
										touchMove(7,235,510)
										mSleep(16)
										touchMove(7,244,510)
										mSleep(16)
										touchMove(7,253,510)
										mSleep(18)
										touchMove(7,261,510)
										mSleep(16)
										touchMove(7,270,510)
										mSleep(15)
										touchMove(7,280,510)
										mSleep(17)
										touchMove(7,289,510)
										mSleep(17)
										touchMove(7,298,510)
										mSleep(17)
										touchMove(7,306,510)
										mSleep(17)
										touchMove(7,313,510)
										mSleep(16)
										touchMove(7,320,510)
										mSleep(17)
										touchMove(7,327,510)
										mSleep(17)
										touchMove(7,334,510)
										mSleep(17)
										touchMove(7,341,510)
										mSleep(17)
										touchMove(7,349,510)
										mSleep(17)
										touchMove(7,359,510)
										mSleep(16)
										touchMove(7,368,510)
										mSleep(15)
										touchMove(7,375,510)
										mSleep(18)
										touchMove(7,382,510)
										mSleep(17)
										touchMove(7,387,510)
										mSleep(17)
										touchMove(7,391,510)
										mSleep(17)
										touchMove(7,394,510)
										mSleep(16)
										touchMove(7,398,510)
										mSleep(17)
										touchMove(7,402,510)
										mSleep(17)
										touchMove(7,407,510)
										mSleep(15)
										touchMove(7,412,510)
										mSleep(19)
										touchMove(7,419,510)
										mSleep(16)
										touchMove(7,425,510)
										mSleep(17)
										touchMove(7,430,510)
										mSleep(17)
										touchMove(7,434,510)
										mSleep(16)
										touchMove(7,438,510)
										mSleep(17)
										touchMove(7,442,510)
										mSleep(17)
										touchMove(7,444,510)
										mSleep(16)
										touchMove(7,445,510)
										mSleep(16)
										touchMove(7,446,510)
										mSleep(17)
										touchMove(7,447,510)
										mSleep(16)
										touchMove(7,448,510)
										mSleep(18)
										touchMove(7,449,510)
										mSleep(20)
										touchMove(7,450,510)
										mSleep(13)
										touchMove(7,451,510)
										mSleep(16)
										touchMove(7,452,510)
										mSleep(17)
										touchMove(7,454,510)
										mSleep(17)
										touchMove(7,455,510)
										mSleep(17)
										touchMove(7,456,510)
										mSleep(16)
										touchMove(7,457,510)
										mSleep(67)
										touchMove(7,458,510)
										mSleep(33)
										touchMove(7,459,510)
										mSleep(50)
										touchMove(7,460,510)
										mSleep(50)
										touchMove(7,461,510)
										mSleep(50)
										touchMove(7,462,510)
										mSleep(33)
										touchMove(7,463,510)
										mSleep(118)
										touchMove(7,464,511)
										mSleep(48)
										touchMove(7,465,511)
										mSleep(41)
										touchMove(7,466,511)
										mSleep(42)
										touchMove(7,467,512)
										mSleep(50)
										touchMove(7,468,512)
										mSleep(17)
										touchMove(7,468,513)
										mSleep(33)
										touchMove(7,469,513)
										mSleep(167)
										touchMove(7,470,513)
										mSleep(167)
										touchUp(7,468,517)
										init("0",1)
									end

									local S1,S2,S3 = 2000,1000,3000
									local YK, NC = false, false
									for l = 1, 3 do
										for i = 1, 8 do
											if RunNow()==false then return false end
											if YK and NC then break end
											Click_XY(181+((i-1)*117), 190+((l-1)*125))        --点击对应点
											if X_isColor(944,47,0x503903,S1) then                --是资源
												if X_isColor(539,337,0xfdc689,S2) == false then        --非别人占领
													mSleep(1000)
													if NC == false and  isColor(567,194,0xffff00) and isColor(572,199,0xf5f500) and isColor(584,209,0xffff00) then        --农田
														mSleep(1000)
														Click_XY(838,521);--占领
														mSleep(S3);
														Click_XY(656,47)--结果
														mSleep(S3);
														Click_XY(840,597);--返回
														NC = true
													end
													if NC == false and isColor(580,194,0xffff00) and isColor(582,194,0xffff00) and isColor(585,194,0xffff00) and isColor(589,200,0xf8f800) and isColor(591,203,0xf0f000) and isColor(593,206,0xf6f600) then        --农田2
														mSleep(1000)
														Click_XY(838,521);--占领
														mSleep(S3);
														Click_XY(656,47)--结果
														mSleep(S3);
														Click_XY(840,597);--返回
														NC = true
													end
													if YK == false and isColor(569,198,0xffff00) and isColor(569,199,0xffff00) and isColor(569,200,0xffff00) and isColor(569,201,0xffff00) and isColor(572,203,0xa7a700) and isColor(575,203,0xffff00) and isColor(575,205,0xffff00) then        --银矿
														mSleep(1000)
														Click_XY(838,521);--占领
														mSleep(S3);
														Click_XY(656,47)--结果
														mSleep(S3);
														Click_XY(840,597);--返回
														YK = true
													end
													if YK == false and isColor(575,196,0xffff00) and isColor(575,197,0xffff00) and isColor(575,198,0xffff00) and isColor(575,200,0xffff00) and isColor(575,201,0xffff00) and isColor(575,203,0xffff00) then
														mSleep(1000)
														Click_XY(838,521);--占领
														mSleep(S3);
														Click_XY(656,47)--结果
														mSleep(S3);
														Click_XY(840,597);--返回
														YK = true
													end
												end
											end
											mSleep(1000)
											isColor_Click(946,47,0xa66e0e)
											mSleep(1000)
										end
									end
									HD()
									mSleep(1200);

									for l = 1, 3 do
										for i = 1, 8 do
											if RunNow()==false then return false end
											if YK and NC then break end
											Click_XY(181+((i-1)*117), 190+((l-1)*125))        --点击对应点
											if X_isColor(944,47,0x503903,S1) then                --是资源
												if X_isColor(539,337,0xfdc689,S2) == false then        --非别人占领
													mSleep(1000)
													if NC == false and  isColor(567,194,0xffff00) and isColor(572,199,0xf5f500) and isColor(584,209,0xffff00) then        --农田
														mSleep(1000)
														Click_XY(838,521);--占领
														mSleep(S3);
														Click_XY(656,47)--结果
														mSleep(S3);
														Click_XY(840,597);--返回
														NC = true
													end
													if NC == false and isColor(580,194,0xffff00) and isColor(582,194,0xffff00) and isColor(585,194,0xffff00) and isColor(589,200,0xf8f800) and isColor(591,203,0xf0f000) and isColor(593,206,0xf6f600) then        --农田2
														mSleep(1000)
														Click_XY(838,521);--占领
														mSleep(S3);
														Click_XY(656,47)--结果
														mSleep(S3);
														Click_XY(840,597);--返回
														NC = true
													end
													if YK == false and isColor(569,198,0xffff00) and isColor(569,199,0xffff00) and isColor(569,200,0xffff00) and isColor(569,201,0xffff00) and isColor(572,203,0xa7a700) and isColor(575,203,0xffff00) and isColor(575,205,0xffff00) then        --银矿
														mSleep(1000)
														Click_XY(838,521);--占领
														mSleep(S3);
														Click_XY(656,47)--结果
														mSleep(S3);
														Click_XY(840,597);--返回
														YK = true
													end
													if YK == false and isColor(575,196,0xffff00) and isColor(575,197,0xffff00) and isColor(575,198,0xffff00) and isColor(575,200,0xffff00) and isColor(575,201,0xffff00) and isColor(575,203,0xffff00) then
														mSleep(1000)
														Click_XY(838,521);--占领
														mSleep(S3);
														Click_XY(656,47)--结果
														mSleep(S3);
														Click_XY(840,597);--返回
														YK = true
													end
												end
											end
											mSleep(1000)
											isColor_Click(946,47,0xa66e0e)
											mSleep(1000)
										end
									end
									HD()
									mSleep(1200);

									for l = 2, 3 do
										for i = 1, 8 do
											if RunNow()==false then return false end
											if YK and NC then break end
											Click_XY(181+((i-1)*117), 190+((l-1)*125))        --点击对应点
											if X_isColor(944,47,0x503903,S1) then                --是资源
												if X_isColor(539,337,0xfdc689,S2) == false then        --非别人占领
													mSleep(1000)
													if NC == false and  isColor(567,194,0xffff00) and isColor(572,199,0xf5f500) and isColor(584,209,0xffff00) then        --农田
														mSleep(1000)
														Click_XY(838,521);--占领
														mSleep(S3);
														Click_XY(656,47)--结果
														mSleep(S3);
														Click_XY(840,597);--返回
														NC = true
													end
													if NC == false and isColor(580,194,0xffff00) and isColor(582,194,0xffff00) and isColor(585,194,0xffff00) and isColor(589,200,0xf8f800) and isColor(591,203,0xf0f000) and isColor(593,206,0xf6f600) then        --农田2
														mSleep(1000)
														Click_XY(838,521);--占领
														mSleep(S3);
														Click_XY(656,47)--结果
														mSleep(S3);
														Click_XY(840,597);--返回
														NC = true
													end
													if YK == false and isColor(569,198,0xffff00) and isColor(569,199,0xffff00) and isColor(569,200,0xffff00) and isColor(569,201,0xffff00) and isColor(572,203,0xa7a700) and isColor(575,203,0xffff00) and isColor(575,205,0xffff00) then        --银矿
														mSleep(1000)
														Click_XY(838,521);--占领
														mSleep(S3);
														Click_XY(656,47)--结果
														mSleep(S3);
														Click_XY(840,597);--返回
														YK = true
													end
													if YK == false and isColor(575,196,0xffff00) and isColor(575,197,0xffff00) and isColor(575,198,0xffff00) and isColor(575,200,0xffff00) and isColor(575,201,0xffff00) and isColor(575,203,0xffff00) then
														mSleep(1000)
														Click_XY(838,521);--占领
														mSleep(S3);
														Click_XY(656,47)--结果
														mSleep(S3);
														Click_XY(840,597);--返回
														YK = true
													end
												end
											end
											mSleep(1000)
											isColor_Click(946,47,0xa66e0e)
											mSleep(1000)
										end
									end
									mSleep(1200);
									Click_XY(772,551);--主城
								end
							)
						},
						--[[
        [8] = {
                ["运行"] = true,
                ["已执行"] = false,
                ["名字"] = "农场主宰",
                ["脚本"] = (function() 
                        mSleep(500)
                        Click_XY(877,546);--城外
                        mSleep(1200);
                        local NT = {
 
                                ['日1'] = {0x8f7210, "-40|19|0xe6a31f,-31|19|0xdca721,-15|18|0xf7b529,-2|18|0xf3ca29,7|21|0xe3b125,15|20|0xe9bd25,19|20|0xce9a1c,-8|39|0xf1c728"},
                                ['日2'] = {0xbd9c21, "-46|14|0xce9d27,-37|14|0xdb9f1f,-21|14|0xcda918,-9|17|0xe0a223,8|22|0xefca29,19|21|0xd8ac22,27|17|0xdfa321,-7|34|0xffd82e"},
                                ['日3'] = {0x907710, "-45|17|0xb39020,-25|17|0xecc427,-21|17|0xc09c17,-4|22|0xcc9618,5|22|0xe6bd24,13|22|0xecbc26,30|24|0xc8b02c,-9|-20|0xffe327"},
                                ['日4'] = {0xa1871e, "-42|21|0xf6dd22,-23|21|0xffe528,-20|20|0xf5d026,1|18|0xecc425,1|18|0xecc425,14|18|0xe2c71c,22|18|0xf1cc2b,28|21|0xe9c229,-8|39|0xfae12f"},
                                ['日5'] = {0x96771a, "-47|23|0xf9d821,-31|23|0xf7cb2b,0|23|0xd6a521,8|23|0xeac127,20|23|0xf7ce31,30|23|0xebc12d,2|35|0xf5cd28,2|35|0xf5cd28,-11|43|0xefbb2d"},
                                ['日6'] = {0xb19b21, "-45|17|0xe3d324,-36|17|0xffe529,-27|17|0xf5cd28,-17|16|0xffd02b,8|21|0xfedf34,25|21|0xf1d227,37|18|0xb29420,-8|33|0xffe327"},
                                ['日7'] = {0xc2a01f, "-41|17|0xc99d21,-35|17|0xe9b621,-26|17|0xfdeb27,0|17|0xffe72d,6|17|0xf1c621,26|17|0xe0ae1f,27|17|0xd6a118,-4|36|0xffff37"},
                                ['日8'] = {0xc1a021, "-40|19|0xecbb25,-40|19|0xecbb25,-25|22|0xfbdc21,-8|22|0xfff12f,-3|22|0xf0c121,21|25|0xe7b924,32|25|0xf4d72d,-10|44|0xffef31"},
                                ['日9'] = {0xbf9e14, "-48|20|0xfff731,-43|20|0xf3b521,-31|20|0xfde727,-23|20|0xfff331,-13|20|0xfcf12b,3|26|0xfbe72d,19|20|0xefbd29,27|20|0xd09324,-7|36|0xffff35"},
                                ['日10'] = {0xe2cb27, "-35|14|0xf4e62b,-24|13|0xeffb30,-13|13|0xf9e92b,-5|11|0xfaed28,6|18|0xefff30,18|20|0xfdfa31,23|20|0xebe32f,-10|33|0xfffd39"},
                                ['日11'] = {0xad9018, "-39|15|0x725f1c,-33|19|0xeefc2a,7|20|0xf5b927,11|20|0xf6e429,18|20|0xfdde29,24|20|0xf8d827,28|20|0xf7d221,7|31|0xefff36,-14|34|0xe7ff39"},
                                ['日12'] = {0xd2a91c, "-46|15|0xcfc526,-39|15|0xf9de24,-8|15|0xfde825,-5|14|0xffef29,6|14|0xf9ed2b,22|16|0xfcf62f,22|29|0xedb231,8|29|0xf2f733,1|28|0xf6d039"},
 
                                ['夜1'] = {0x53441c, "-35|19|0x825c25,-20|19|0x7f6e25,-1|21|0x6c501a,14|23|0x72551f,26|23|0x6c4d20,32|23|0x746324,-8|40|0x7f5f20"},
                                ['夜2'] = {0x58471b, "-37|16|0x725118,-35|17|0x7d571c,-21|17|0x7e6a1e,-16|17|0x81631e,9|22|0x7e6424,21|23|0x725b22,32|23|0x716225,-8|38|0x7f5f1f"},
                                ['夜3'] = {0x594725, "1|14|0x775e28,-27|15|0x7f5933,-28|15|0x7f5a32,-4|16|0x7d642a,2|15|0x7f662c,18|15|0x6c5b21,28|20|0x6c4f22,-2|33|0x866f2d"},
                                ['夜4'] = {0x59492d, "-43|23|0x85752d,-23|24|0x897f34,-8|26|0x897433,3|26|0x7d6131,29|30|0x6a5b31,32|26|0x80732f,-8|45|0x857536"},
                                ['夜5'] = {0x54461c, "-42|19|0x7f7821,-29|19|0x837128,-20|19|0x725a21,6|24|0x826e27,23|24|0x776a1d,34|20|0x705f23,-15|42|0x837228"},
                                ['夜6'] = {0x54451b, "-44|18|0x776918,-36|18|0x7c6221,-14|18|0x78651d,7|18|0x745f1f,16|17|0x77691f,25|17|0x6b5921,-13|40|0x827322"},
                                ['夜7'] = {0x68522d, "-44|16|0x765b31,-28|16|0x877932,-8|19|0x847134,14|19|0x7f6033,22|20|0x816936,-2|36|0x847037,-13|36|0x877e3c"},
 
                                ['夜9'] = {0x68522d, "-39|18|0x837133,-27|17|0x887f36,-20|17|0x867132,-7|17|0x8a7a37,11|14|0x8a7835,19|16|0x826d37,27|18|0x725335,-6|35|0x867b38"},
                                ['夜10'] = {0x766723, "-9|10|0x7c6f26,-11|18|0x878030,-30|22|0x878231,-32|22|0x808030,-8|19|0x867a2e,25|17|0x866f29,-5|30|0x8a8538"},
 
                                ['夜12'] = {0x776a1d, "-13|10|0x7b7620,-24|10|0x807522,-38|11|0x3e361e,-41|16|0x827125,-2|20|0x867b20,8|21|0x81771f,25|21|0x827c22,-7|35|0x827825"},
                        }
                        while true do
                                for _,z in pairs(NT) do
                                        x,y = findMultiColorInRegionFuzzy(z[1],z[2], 95,107,134,1027,513)
                                        if x>1 and y>1 then
                                                dialog(_,1)
                                                mSleep(1500)
                                                Click_XY(x,y)
                                                mSleep(1200)
                                                goto L2
                                        end
                                end
                                SZ = (tonumber(Rnd_Word("0123456789",2)) % (1 + 1)) + 1
                                if SZ == 1 then 
                                        Click_Move(520,589,530,250)--下拖
                                elseif SZ == 2 then 
                                        Click_Move(520,250,530,589)--上拖
                                end
                                mSleep(1500)
                        end
                        ::L2::
                        mSleep(1000)
                        Click_XY(838,521);--占领
                        mSleep(1200);
                        Click_XY(656,47)--结果
                        mSleep(1200);
                        Click_XY(840,597);--返回
                        mSleep(1200);
                        Click_XY(772,551);--主城
                end)
        },
        [9] = {
                ["运行"] = true,
                ["已执行"] = false,
                ["名字"] = "银矿大亨",
                ["脚本"] = (function() 
                        local YK = {
                                ["日1"] = {0xe77600, "-49|-8|0x7b7942,-41|-19|0x847b42,-41|-29|0x6e6b33,-17|-32|0x857a37,-3|-32|0x81793d,8|-32|0x5e5824,16|-15|0x100e00,18|-2|0x615326"},
                                ["日2"] = {0xd06900, "-5|2|0xff8600,-51|-6|0x7c7b45,-43|-33|0x666027,-35|-30|0xb1aa67,-20|-48|0xe0dcae,6|-36|0xa59f5f,2|-15|0x56341b"},
                                ["日3"] = {0xff8b00, "-43|3|0x972536,-43|-27|0x393100,-39|-29|0x5a5221,-37|-40|0x636028,-18|-48|0x7d713a,-10|-43|0x8e9043,-6|-31|0x736e32,0|-14|0x493216"},
                                ["日4"] = {0xe14352, "0|-9|0xb8243d,1|-13|0x4c3918,7|-47|0xe4dc8d,31|-52|0xa09856,51|-50|0xd2ce8c,63|-13|0x655c22,37|-8|0xd0720f,43|-8|0xe77100"},
                                ["日5"] = {0xf77902, "-51|-12|0x304912,-32|-50|0xaea567,-32|-58|0xbdb977,-24|-57|0x605625,-8|-55|0xa1a354,5|-51|0x5f5724,27|-12|0x76724b,22|-7|0x514b1a"},
                                ["日6"] = {0xf77902, "-44|-10|0x39551b,-44|-15|0x273e12,-28|-42|0x969150,-17|-50|0x5e5625,-16|-55|0x4b4810,-7|-55|0x9e985c,-1|-55|0xcfc887,16|-42|0xada960,7|-14|0x472a17"},
                                ["日7"] = {0xff7f00, "-44|-12|0x767447,-37|-35|0x5a5929,-32|-48|0xccc886,-12|-50|0x888c42,6|-53|0xa5a361,12|-46|0x889831,40|-11|0xc2af77,2|-12|0x4e3118"},
                                ["日8"] = {0xd06300, "-45|-11|0x8a8856,-39|-33|0x85844a,-34|-50|0xb2af72,-34|-50|0xb2af72,2|-47|0x5c5625,5|-47|0xb5ad6d,9|-36|0x625d2a,9|-18|0x565027,-3|-11|0x7e5633"},
 
                                ['夜2'] = {0x6e3c0e, "-43|-8|0x423f3a,-38|-15|0x4e4640,-39|-21|0x4c4642,-30|-24|0x5c544b,-11|-27|0x3a322c,27|-5|0x48452e"},
                                ['夜3'] = {0x864a10, "-38|5|0x81293a,-38|-28|0x322e21,-32|-35|0x42402b,-21|-42|0x26211a,-7|-46|0x605c4d,2|-40|0x5a4f43,29|-15|0x554d41"},
                                ['夜4'] = {0x86450c, "-41|6|0x6e213d,-35|-41|0x48432c,-22|-49|0x191811,-6|-49|0x464427,17|-40|0x837c68,29|0|0x383126,14|5|0x291614"},
                                ['夜5'] = {0x854119, "-49|-15|0x323727,-32|-48|0x635e4d,-14|-55|0x534b3c,-2|-55|0x323022,5|-52|0x373426,18|-29|0x383425,-17|-13|0x4f483c"},
                                ['夜6'] = {0x733b20, "-50|-5|0x263621,-49|-14|0x263013,-39|-26|0x4c4839,-31|-49|0x655f51,7|-41|0x6e6860,8|-19|0x181522,24|2|0x75768c,26|5|0x393748"},
                                ['夜7'] = {0x743811, "-40|-9|0x55513d,-34|-31|0x4b4830,-28|-42|0x706d4d,-8|-43|0x4d4e35,7|-43|0x45432f,14|-35|0x585343,26|-19|0x5e5d48,15|11|0x19111a"},
                                ['夜8'] = {0x6d3613, "-45|-13|0x46453b,-37|-37|0x413c36,-32|-45|0x5d584a,-19|-47|0x564f42,2|-46|0x35302b,20|-23|0x726e59"},
 
                        }
                        Click_XY(869,548);--城外
                        mSleep(1200);
                        while true do
                                for _,z in pairs(YK) do
                                        x,y = findMultiColorInRegionFuzzy(z[1],z[2], 80,107,134,1027,513)
                                        if x>1 and y>1 then
                                                dialog(_,1)
                                                AddLog(x .. " " .. y)
                                                mSleep(1000)
                                                Click_XY(x,y)
                                                mSleep(1200)
                                                goto L2
                                        end
                                end
                                SZ = (tonumber(Rnd_Word("0123456789",2)) % (1 + 1)) + 1
                                 
                                if SZ == 1 then 
                                        Click_Move(520,589,530,250)--下拖
                                elseif SZ == 2 then 
                                        Click_Move(520,250,530,589)--上拖
                                end
                                mSleep(2000)
                        end
                        ::L2::
                        mSleep(1000)
                        Click_XY(838,521);--占领
                        mSleep(1200);
                        Click_XY(656,47)--结果
                        mSleep(1200);
                        Click_XY(840,597);--返回
                        mSleep(1200);
                        Click_XY(772,551);--主城
                end)
        },
        --]]
						[9] = {
							["运行"] = true,
							["已执行"] = false,
							["名字"] = "天下",
							["脚本"] = (function() 
									mSleep(1700)
									isColor_Click(973,548,0x9aa441)        --天下
									mSleep(3000)
									if isColor_Click(37,554,0xfded48) then mSleep(2000) end

									init("0",0)
									for l = 1,3 do
										Click_Move(378,308,47,746,50)
										mSleep(500)
									end
									init("0",1)

									function findMultiColorInRegionFuzzys(RetTable,C1,C2,x1,y1,x2,y2)
										local x,y = 0,0
										if x2-x1<30 or y2-y1<30 then return "" end
										x,y = findMultiColorInRegionFuzzy(C1,C2,95,x1,y1,x2,y2)
										if x~=-1 and y~=-1 then 
											table.insert(RetTable,{x,y})
											findMultiColorInRegionFuzzys(RetTable,C1,C2,x1,y1,x,y2)                --左
											findMultiColorInRegionFuzzys(RetTable,C1,C2,x+30,y1,x2,y2)        --右
											findMultiColorInRegionFuzzys(RetTable,C1,C2,x1,y1,x+30,y)                --上
											findMultiColorInRegionFuzzys(RetTable,C1,C2,x1,y+30,x+30,y2)        --右
										end
									end


									for l = 1,4 do
										for i = 1,5 do
											if RunNow()==false then return false end
											local Xian = {}
											findMultiColorInRegionFuzzys(Xian,0x580209,"2|6|0x0b0301,2|7|0x008d00,2|8|0x00fd00,1|9|0x0f0e02,3|8|0x00b300,5|19|0x00ff00,11|18|0x00ff00,18|18|0x01c100,21|18|0x00ff00",137,158,1005,493)
											for _,z in ipairs(Xian) do
												mSleep(1500)
												Click_XY(z[1],z[2])
												mSleep(1700)
												Click_XY(430,518)
												mSleep(1700)
												Click_XY(892,208)
												mSleep(1700)
												Click_XY(943,49)
												mSleep(1700)
											end
											if l == 2 or l == 4 then
												Click_Move(260,302,628,302)
											else
												Click_Move(628,302,260,302)
											end
											mSleep(500)
										end
										Click_Move(500,582,500,370)
										mSleep(1000)
									end
									mSleep(1700)
									Click_XY(769,537)
								end)
						},
						[10] = {
							["运行"] = true,
							["已执行"] = false,
							["名字"] = "军团战",
							["脚本"] = (function() 
									mSleep(1700)
									local JT ={
										{193,194},{334,202},{476,187},{635,193},{772,192},{916,191},{1040,191},
										{192,317},{348,315},{478,310},{619,314},{778,313},{916,318},{1049,311},
										{200,437},{331,440},{486,436},{635,439},{775,437},{909,444},{1053,402},
									}
									Click_XY(1078,564);--功能
									mSleep(1700);
									Click_XY(864,214);--军团战
									mSleep(3000)
									if isColor_Click(42,554,0xfcf725) then mSleep(1700) end
									local JTc = 0
									local JTindex = 1
									while true do
										if JTc >= 5 then break end                --如果次数达到5次
										if JTindex == #JT then break end        --如果军团全部找过了
										if RunNow()==false then return false end
										for l = 1 , 5 do
											Click_XY(JT[JTindex][1],JT[JTindex][2])
											--Click_XY(194,190)        --董卓军团
											mSleep(1700)
											Click_XY(851,524)        --集结
											mSleep(1700)
											if isColor_Click(894,209,0x513a03) then
												mSleep(1700)
												Click_XY(948,50)
												mSleep(1700)
												break
											end
											Click_XY(869,504)        --攻击
											mSleep(1700)
											JTc = JTc + 1
											Click_XY(1014,596)        --结果
											mSleep(1700)
											Click_XY(854,590)        --返回
											mSleep(1700)
										end
										JTindex = JTindex + 1
									end
									mSleep(1700)
									Click_XY(774,554)        --主城
								end)
						},
						[11] = {
							["运行"] = true,
							["已执行"] = false,
							["名字"] = "后宫",
							["脚本"] = (function() 
									mSleep(1700);
									Click_XY(1129,308);--后宫
									mSleep(3000)

									Click_XY(266,568)
									mSleep(1700)
									Click_XY(915,445)
									mSleep(1700)
									Click_XY(784,334)
									mSleep(1700)
									Click_XY(571,402)
									mSleep(1700)
									Click_XY(899,208)
									mSleep(1700)

									Click_XY(390,579)
									mSleep(1700)
									Click_XY(915,445)
									mSleep(1700)
									Click_XY(784,334)
									mSleep(1700)
									Click_XY(571,402)
									mSleep(1700)
									Click_XY(899,208)
									mSleep(1700)

									Click_XY(521,575)
									mSleep(1700)
									Click_XY(915,445)
									mSleep(1700)
									Click_XY(784,334)
									mSleep(1700)
									Click_XY(571,402)
									mSleep(1700)
									Click_XY(899,208)
									mSleep(1700)

									if isColor(689,45,0x00ff00) and isColor(694,41,0x00ff00) and isColor(697,45,0x00ff00) and isColor(697,53,0x00ff00) and isColor(694,55,0x00ff00) and isColor(690,52,0x00c200) and isColor(690,50,0x1d1215) and isColor(693,49,0x00fd00) and isColor(716,48,0x00d800) and isColor(732,52,0x006600) then
										--精力达到90%以上
										Click_XY(638,580)--第四个
										mSleep(800);
										Click_XY(686,441);--宠幸                                
									end
									if isColor(691,44,0x00d200) and isColor(695,52,0x00d500) and isColor(701,51,0x00dd00) and isColor(705,55,0x00ff00) and isColor(705,41,0x00ff00) and isColor(722,47,0x00ff00) and isColor(732,46,0x00ff00) and isColor(736,47,0x00e900) and isColor(743,51,0x00ff00) then
										--精力达到90%以上
										Click_XY(638,580)--第四个
										mSleep(800);
										Click_XY(686,441);--宠幸        
									end
									mSleep(1700);
									Click_XY(982,51);--退出
								end)
						},
					}


					function Main_Login()
						os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite");
						local Moveto = Load_Location(State["Move"])
						if F_Exist(State["Path"].."雄霸天地账号.txt")==false then dialog("请以<账号--密码>格式,文本以UTF-8格式放置<雄霸天地账号.txt>到<"..State["Path"]..">目录.",0);lua_exit() end
						local words = F_ToArray(State["Path"].."雄霸天地账号.txt","([^-]+[-]+[^%c]+)")
						local TmpTable = (function() local RetStr = {};for _,rw in ipairs(RW) do table.insert(RetStr,rw["名字"]); end; return RetStr end)()

						local TmpUser = ToUserPass(words[Moveto])
						local UIRet, UISet, UISave = 0, {}, State["Bid"] .. "_Set.dat"
						local StrUI = {

							{["type"]="Label",                ["size"]=15,                ["align"]="center",                ["color"]="50,50,50",        ["text"]="执行至<"..Moveto..">共计<"..#words..">",},
							{["type"]="Label",                ["size"]=15,                ["align"]="center",                ["color"]="50,50,50",        ["text"]=tostring(TmpUser),        },
							{["type"]="RadioGroup",        ["select"]="0",                ["list"]="继续此位置,跳至上一个,跳至下一个,从头开始",},
							{["type"]="RadioGroup",        ["select"]="0",                ["list"]="循环,不循环",},
							{["type"]="Label",                ["size"]=15,                ["align"]="center",                ["color"]="50,50,50",        ["text"]="结尾跳至头部等待时常(需开启循环)单位秒",        },
							{["type"]="Edit",                ["prompt"]="0",                ["text"]="0",["size"]=15,["align"]="left",                ["color"]="0,0,0"},
							{["type"]="Label",                ["size"]=15,                ["align"]="center",                ["color"]="50,50,50",        ["text"]="选择操作主任务",        },
							{["type"]="CheckBoxGroup",        ["select"]="0",        ["list"]="每日,试炼之塔",},
							{["type"]="Label",                ["size"]=15,                ["align"]="center",                ["color"]="50,50,50",        ["text"]="选择每日任务对应小任务",        },
							{["type"]="CheckBoxGroup",        ["select"]="0",        ["list"]=table.concat(TmpTable,","),}
						}
						UIRet, UISet[1], UISet[2], UISet[3], UISet[4], UISet[5] = showUI([[{
                "style": "default", 
                "config": "]]..UISave..[[",
                "width": ]]..State["屏幕宽"]..[[,
                "height": ]]..State["屏幕高"]..[[,
                "cancelname": "不执行退出",
                "okname": "确认执行",
                "views": []]..string.sub(TableToJson(StrUI),2,-2)..[[]  
        }]])

					if tonumber(UIRet)==0 then lua_exit() end
					F_SavesW("/User/Media/TouchSprite/config/" .. UISave, "ui_input::::" .. table.concat(UISet, "###"))

					for _,tmptable in ipairs(TmpTable) do
						if string.match("@"..UISet[5].."@","(@"..(tonumber(_)-1).."@)") == "@"..(tonumber(_)-1).."@" then
							RW[_]["运行"] = true
						else
							RW[_]["运行"] = false
						end
					end

					if tonumber(UISet[1])==1 then
						if Moveto-1 < 1 then dialog("超过账号表范围",0);lua_exit(); end
						Moveto=Moveto-1;
						F_SavesW(State["Move"], Moveto)
					end
					if tonumber(UISet[1])==3 then
						Moveto=1;
						F_SavesW(State["Move"], Moveto)
					end
					if tonumber(UISet[1])==2 then
						if Moveto+1 > #words then dialog("超过账号表范围",0);lua_exit(); end
						Moveto=Moveto+1;
						F_SavesW(State["Move"], Moveto)
					end
					--主运行框架
					while true do
						if Moveto>#words then if UISet[2] == "0" then Moveto=1;mSleep(tonumber(UISet[3])*1000) else break end end
						local User, Pass=ToUserPass(words[Moveto])
						dialog("账号位置:"..Moveto.."位共计"..#words.."位\n账号:"..User,2)
						closeApp(State["Bid"])
						mSleep(2000)
						ret1,ret2 = Login(User, Pass,string.match(UISet[4],"0")=="0",string.match(UISet[4],"1")=="1")
						Moveto=Moveto+1;
						F_SavesW(State["Move"], Moveto)
					end
				end
				function Week()
					days = {
						["Monday"] = 1,
						["Tuesday"] = 2,
						["Wednesday"] = 3,
						["Thuesday"] = 4,
						["Friday"] = 5,
						["Saturday"]= 6,
						["Sunday"] = 7
					}
					return (days[os.date("%A", os.time())])
				end
				function Login(User,Pass,MR,SL)
					local RetState,BackStr=true,"";
					if runApp(State["Bid"]) ~= 0 then BackStr="启动失败";goto Next end
					mSleep(5000)

					for l=1,100 do
						isColor_Click(24,36,0x47231f)        --选择服务器
						isColor_Click(740,132,0x104b97)        --邮箱登录
						isColor_Click(589,334,0x216392)        --注销账号
						if isColor(693,311,0x4f2b17) and isColor(696,326,0x411d0a) and isColor(659,340,0x33211c) and isColor(626,365,0x2c1505) then
							goto L1
						end
						mSleep(100)
					end
					BackStr="打开APP或登陆";goto Next
					::L1::
					--APP没问题

					--账号登录页面
					mSleep(500)
					Click_XY(425,328)        --账号输入框
					mSleep(500)
					inputText(User)
					mSleep(500)
					Click_XY(1021,598)        --return
					mSleep(500)
					Click_XY(429,394)        --密码输入框
					mSleep(500)
					inputText(Pass)
					mSleep(500)
					Click_XY(1021,598)        --return
					mSleep(500)
					Click_XY(565,514)        --登录
					mSleep(1000)
					Click_XY(403,134)        --服务器列表
					mSleep(500)
					Click_Move(807,316,257,308)        --侧滑列表
					mSleep(1500)
					Click_XY(648,356)        --选择6服
					mSleep(1000)


					for l=1,100 do
						if isColor(217,112,0x17121f) and isColor(228,113,0x060606) and isColor(234,112,0x26212a) and isColor(255,121,0x241821) and isColor(247,131,0x1e191f) then
							mSleep(500)
							Click_XY(955,51)        --关闭首冲大礼包
							X_isColor_Click(567,539,0xb16b4e,10000)
							goto L2
						end
						if isColor_Click(823,489,0x4e9edb) then        --签到
							mSleep(800)
							Click_XY(937,72)
							mSleep(800)
							goto L2
						end
						if isColor(677,541,0xf90e10) and isColor(780,550,0xffd367) and isColor(871,560,0x011535) and isColor(952,548,0xae4d12) and isColor(1069,545,0xbd8900) then
							goto L2
						end
						mSleep(100)
					end
					BackStr="无法登陆后判断状态";goto Next
					::L2::
					if MR then 
						NowRW = copyTab(RW)
						for i = 1 , 2 do
							for _,rw in pairs(NowRW) do
								if RunNow()==false then return false end
								if rw["运行"] == true and rw["已执行"] == false then
									dialog(rw["名字"],0.5)
									mSleep(1000)
									if rw["脚本"]()~=false then 
										mSleep(2000)
										rw["已执行"] = true
									end
								end

							end
						end
						dialog("领取每日任务奖励",2)
						mSleep(2000)
						Click_XY(70,208)        --任务
						mSleep(1200)
						Click_XY(686,137)        --每日
						mSleep(1200)
						while true do
							if X_isColor_Click(788,510,0x50ade5,2000)==false then break end
						end
						mSleep(1200)
						Click_XY(955,44)
						mSleep(1200)
					end
					if SL then
						if Week() == 1 or Week() == 3 or Week() == 6 or Week() == 7 then 
							::RS::
							Click_XY(643,261);--试炼之塔
							mSleep(2000);
							if SLZT()==false then goto RS end
						end
					end
					::Next::
					if BackStr ~= "" then RetState = false;dialog("出错位置:"..BackStr,2) end
					return RetState,BackStr
				end
				function RunNow()
					if isColor(567,539,0xb16b4e) then 
						closeApp(State["Bid"])
						mSleep(20000)
						runApp(State["Bid"])
						X_isColor_Click(567,539,0xb16b4e,10000)
						mSleep(5000)
						return false
					end
					return true
				end
				function LC()
					init("0",0)
					touchDown(9,442,346)
					mSleep(149)
					touchMove(9,446,355)
					mSleep(17)
					touchMove(9,446,358)
					mSleep(17)
					touchMove(9,446,362)
					mSleep(16)
					touchMove(9,446,365)
					mSleep(17)
					touchMove(9,446,367)
					mSleep(16)
					touchMove(9,446,368)
					mSleep(16)
					touchMove(9,446,370)
					mSleep(17)
					touchMove(9,446,371)
					mSleep(17)
					touchMove(9,446,372)
					mSleep(17)
					touchMove(9,446,373)
					mSleep(16)
					touchMove(9,446,374)
					mSleep(17)
					touchMove(9,446,376)
					mSleep(16)
					touchMove(9,446,377)
					mSleep(17)
					touchMove(9,446,379)
					mSleep(17)
					touchMove(9,446,381)
					mSleep(17)
					touchMove(9,446,382)
					mSleep(17)
					touchMove(9,446,384)
					mSleep(16)
					touchMove(9,446,385)
					mSleep(17)
					touchMove(9,446,386)
					mSleep(16)
					touchMove(9,446,387)
					mSleep(16)
					touchMove(9,446,388)
					mSleep(35)
					touchMove(9,446,389)
					mSleep(16)
					touchMove(9,446,390)
					mSleep(16)
					touchMove(9,446,391)
					mSleep(35)
					touchMove(9,446,392)
					mSleep(49)
					touchMove(9,446,393)
					mSleep(117)
					touchMove(9,446,391)
					mSleep(17)
					touchMove(9,446,388)
					mSleep(33)
					touchMove(9,447,385)
					mSleep(17)
					touchMove(9,447,383)
					mSleep(16)
					touchMove(9,448,383)
					mSleep(18)
					touchMove(9,448,381)
					mSleep(17)
					touchMove(9,448,380)
					mSleep(16)
					touchMove(9,449,379)
					mSleep(51)
					touchMove(9,449,378)
					mSleep(16)
					touchMove(9,450,378)
					mSleep(34)
					touchMove(9,451,378)
					mSleep(16)
					touchMove(9,452,378)
					mSleep(17)
					touchMove(9,452,377)
					mSleep(17)
					touchMove(9,453,377)
					mSleep(34)
					touchMove(9,454,377)
					mSleep(17)
					touchMove(9,455,376)
					mSleep(16)
					touchMove(9,456,375)
					mSleep(17)
					touchMove(9,457,375)
					mSleep(17)
					touchMove(9,457,374)
					mSleep(17)
					touchMove(9,458,373)
					mSleep(17)
					touchMove(9,459,372)
					mSleep(16)
					touchMove(9,460,370)
					mSleep(34)
					touchMove(9,461,369)
					mSleep(18)
					touchMove(9,461,367)
					mSleep(16)
					touchMove(9,462,367)
					mSleep(17)
					touchMove(9,462,366)
					mSleep(16)
					touchMove(9,463,365)
					mSleep(34)
					touchMove(9,464,365)
					mSleep(17)
					touchMove(9,465,365)
					mSleep(16)
					touchMove(9,466,364)
					mSleep(17)
					touchMove(9,467,364)
					mSleep(17)
					touchMove(9,468,364)
					mSleep(17)
					touchMove(9,469,363)
					mSleep(17)
					touchMove(9,470,362)
					mSleep(16)
					touchMove(9,471,362)
					mSleep(17)
					touchMove(9,472,361)
					mSleep(16)
					touchMove(9,473,361)
					mSleep(34)
					touchMove(9,474,360)
					mSleep(16)
					touchMove(9,475,360)
					mSleep(34)
					touchMove(9,476,360)
					mSleep(33)
					touchMove(9,476,359)
					mSleep(16)
					touchMove(9,477,359)
					mSleep(68)
					touchMove(9,477,358)
					mSleep(33)
					touchMove(9,478,358)
					mSleep(67)
					touchMove(9,479,357)
					mSleep(35)
					touchMove(9,479,356)
					mSleep(32)
					touchMove(9,480,356)
					mSleep(83)
					touchMove(9,481,356)
					mSleep(34)
					touchMove(9,481,355)
					mSleep(49)
					touchMove(9,482,355)
					mSleep(34)
					touchMove(9,482,354)
					mSleep(183)
					touchMove(9,483,353)
					mSleep(316)
					touchMove(9,483,352)
					mSleep(117)
					touchMove(9,484,352)
					mSleep(67)
					touchMove(9,484,351)
					mSleep(50)
					touchMove(9,484,350)
					mSleep(33)
					touchMove(9,484,349)
					mSleep(34)
					touchMove(9,485,349)
					mSleep(33)
					touchMove(9,485,347)
					mSleep(83)
					touchMove(9,485,346)
					mSleep(118)
					touchMove(9,485,345)
					mSleep(766)
					touchMove(9,485,346)
					mSleep(100)
					touchMove(9,485,347)
					mSleep(168)
					touchMove(9,485,349)
					mSleep(932)
					touchMove(9,485,347)
					mSleep(51)
					touchMove(9,485,346)
					mSleep(133)
					touchMove(9,485,345)
					mSleep(1666)
					touchMove(9,485,346)
					mSleep(133)
					touchMove(9,485,347)
					mSleep(967)
					touchMove(9,485,346)
					mSleep(683)
					touchUp(9,484,346)
					init("0",1)
				end
				function ClearBid(Bid)
					closeApp(Bid)
					clearKeyChain(Bid)
					function LastFolder(Path) return string.match(Path, "(.+)/") end
					if type(appDataPath) == "function" and appDataPath(Bid) ~= "" then
						if string.sub(getOSVer(), 1, 1) == "7" then
							mSleep(500)
							os.execute("rm -rf "..LastFolder(appDataPath(Bid)).."/Library/Caches/*") --Library
							os.execute("rm -rf "..LastFolder(appDataPath(Bid)).."/Documents/*")
							os.execute("rm -rf "..LastFolder(appDataPath(Bid)).."/Library/Preferences/" .. Bid .. ".plist")
							mSleep(1000)
							return true
						elseif string.sub(getOSVer(), 1, 1) == "8" then
							mSleep(500)
							os.execute("rm -rf "..(appDataPath(Bid)).."/Library/Caches/*") --Library
							os.execute("rm -rf "..(appDataPath(Bid)).."/Documents/*")
							os.execute("rm -rf "..(appDataPath(Bid)).."/Library/Preferences/" .. Bid .. ".plist")
							mSleep(1000)
							return true
						end
					end
					return false
				end
				function copyTab(st)
					local tab = {}
					for k, v in pairs(st or {}) do
						if type(v) ~= "table" then
							tab[k] = v
						else
							tab[k] = copyTab(v)
						end
					end
					return tab
				end
				function F_Read(File)
					if F_Exist(File) then 
						local f = assert(io.open(File, "r"))
						local string = f:read("*all")
						f:close()
						return string
					else
						return nil
					end
				end
				function F_Exist(File)
					local Boo = true
					local F,Err=io.open(File,"r+");
					if Err==nil then 
						Boo=true
						F:close();
					else
						Boo=false
					end
					return Boo
				end
				function F_ToArray(File,types)
					local File_Ob,File_Line=0,0;
					local Ret_Arr={};
					if F_Exist(File) == false then return {} end
					local File_Ob = assert(io.open(File,"r"))
					for File_Line in File_Ob:lines() do
						if types == nil and File_Line~="" then
							table.insert(Ret_Arr, File_Line)
						end
						if types ~= nil and string.match(File_Line,types)~="" then
							table.insert(Ret_Arr, string.match(File_Line,types))
						end
					end
					File_Ob:close()

					return Ret_Arr;
				end
				function F_SavesA(File,text)
					local sFlie=io.open(File,"a+");
					sFlie:write(text .. "\r\n");
					sFlie:close();
				end
				function F_SavesW(File, text)
					local sFlie = io.open(File, "w") 
					sFlie:write(text); 
					sFlie:close() 
				end
				function F_Del(File)
					os.remove(File)
				end
				function F_ReadHex(File)
					local F,Err = io.open(File, "rb")
					local HexStr=""
					if Err==nil then
						while true do
							local bytes = F:read(1)
							if not bytes then break end
							HexStr = HexStr ..  string.format("%02X", string.byte(bytes))
						end
						F:close();
						return HexStr
					else
						return ""
					end
				end
				function Load_Location(File)
					local L = F_Read(File)
					if L then 
						if string.match(L,"%d+") then
							return tonumber(string.match(L,"(%d+)"))
						else
							return 1
						end
					else
						return 1
					end
				end
				function Click_XY(x,y,t)
					mSleep(10)
					touchDown(1, x, y)
					if t then mSleep(tonumber(t)) else mSleep(20) end
					touchUp(1, x, y)
					mSleep(10)
				end
				function Click_Move(x1,y1,x2,y2,Step)
					local Step,x,y = iif(Step==nil,5,Step),x1,y1
					touchDown(1,x,y)
					local function v(z,c) if z > c then return (-1 * Step) else return Step end end
						while (math.abs(x-x2)>=Step) or (math.abs(y-y2)>=Step) do
							if math.abs(x-x2)>=Step then x = x + v(x1,x2) end
							if math.abs(y-y2)>=Step then y = y + v(y1,y2) end
							touchMove(1, x, y); 
							mSleep(10)
						end
						touchMove(1, x2, y2);
						mSleep(300)
						touchUp(1,x2,y2)
					end
					function C_Diff(c,c1,wc)
						--local r,g,b = getColorRGB(x, y)
						local r,g,b = C_HextoRGB(c)
						local r1,g1,b1 = C_HextoRGB(c1)
						if wc == nil then if c == c1 then return true else return false end end
						if (math.abs(r-r1)/255)*100 > wc and
						(math.abs(g-g1)/255)*100 > wc and
						(math.abs(b-b1)/255)*100 > wc then
							return true
						else
							return false
						end
					end
					function C_HextoRGB(C_Hex)
						return math.modf(C_Hex/65536),
						math.modf(C_Hex/256)%256,
						C_Hex%256
					end
					function isColor(x,y,c,wc)
						local r,g,b = getColorRGB(x, y)
						local r1,g1,b1 = C_HextoRGB(c)
						if wc == nil then if r == r1 and g == g1 and b == b1 then return true else return false end end
						if (math.abs(r-r1)/255)*100 > wc and
						(math.abs(g-g1)/255)*100 > wc and
						(math.abs(b-b1)/255)*100 > wc then
							return true
						else
							return false
						end

					end
					function isColor_Click(x,y,color,wc,t)
						local iscl=false;
						if isColor(x, y, color, wc) then
							if t then mSleep(tonumber(t)) else mSleep(100) end
							Click_XY(x,y)
							iscl=true
							if t then mSleep(tonumber(t)) else mSleep(100) end
						end
						return iscl;
					end
					function X_isColor(x,y,color,t,t1)
						local iscl,l=false,0;
						for l=1,t/50 do
							if color == getColor(x,y) then 
								if t1 then mSleep(tonumber(t1)) else mSleep(100) end
								iscl=true;
								if t1 then mSleep(tonumber(t1)) else mSleep(100) end

								break
							end
							mSleep(50)
						end
						return iscl;
					end
					function X_isColor_Click(x,y,color,t,t1)
						local iscl,l=false,0;
						for l =1,t/50 do
							if color == getColor(x,y) then
								if t1 then mSleep(tonumber(t1)) else mSleep(100) end
								Click_XY(x,y);
								iscl=true;
								if t1 then mSleep(tonumber(t1)) else mSleep(100) end
								break
							end
							mSleep(50)
						end
						return iscl;
					end
					function StrToHex(Text)
						local TmpHex = ""
						for l = 1 , string.len(Text) do
							TmpHex = TmpHex .. string.format("%02X",string.byte(Text,l))
						end
						return TmpHex
					end
					function HexToStr(Text)
						local TmpStr = ""
						for l = 1 , (string.len(Text)/2) do
							TmpStr = TmpStr .. string.char(tonumber("0x"..string.sub(Text,(l*2)-1,(l*2))))
						end
						return TmpStr
					end
					function ToUserPass(text)
						if text~= nil and string.find(text,"-")~=nil then 
							return string.match(text, "([^-]+)[-]+([^%c]+)")
						else
							return "",""
						end
					end
					function Split(szFullString, szSeparator)
						local nFindStartIndex = 1
						local nSplitIndex = 1
						local nSplitArray = {}
						while true do
							local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
							if not nFindLastIndex then
								nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
								break
							end
							nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
							nFindStartIndex = nFindLastIndex + string.len(szSeparator)
							nSplitIndex = nSplitIndex + 1
						end
						return nSplitArray
					end
					function TableToJson(t)  
						local function serialize(tbl)  
							local tmp = {}  
							for k, v in pairs(tbl) do
								local k_type = type(k)  
								local v_type = type(v)  
								local key = (k_type == "string" and "\"" .. k .. "\":") or (k_type == "number" and "")  
								local value = (v_type == "table" and serialize(v))  
								or (v_type == "boolean" and tostring(v))  
								or (v_type == "string" and "\"" .. v .. "\"")  
								or (v_type == "number" and v)  
								tmp[#tmp + 1] = key and value and tostring(key) .. tostring(value) or nil  
							end
							return "{" .. table.concat(tmp, ",") .. "}" 
						end 
						assert(type(t) == "table")  
						return serialize(t)  
					end
					SJ = 0
					function Rnd_Word(strs,i)
						local ret=""
						local Length
						local z
						if Length == nil then Length = 1 end
						if string.byte(strs:sub(1,1))>=0x80 then
							Length = 3
						end
						math.randomseed(tostring(os.time()):reverse():sub(1, 6) + SJ)  
						math.random(string.len(strs)/Length)
						for i=1, i do
							z=math.random(string.len(strs)/Length)
							ret = ret..string.sub(strs,(z*Length)-(Length-1),(z*Length))
						end
						return(ret)
					end
					SJ = tonumber(Rnd_Word("0123456789",5))
					Main_Login()
--RW[8]["脚本"]()
