--存档模块应用案例,案例中生成的存档可在文本编辑器直接打开,为json格式
--调用模板
require("FYtemplet")
--帐号数据格式,如果用其他方式获取帐号数据,请修改模板中account文件中account:update()方法,变成自己的获取方式
--帐号数据和存档模块中,必要的数据是:user(即用户名),server(为可选数据,如果没有,一个帐号只有一组存档)这两个数据配合生成
account.data = {
		{user = "roiffcycc",server = "3"},
		{user = "cyccroiff",server = "2"}
}
--存档选项,存档文件以周为单位,每天12点后,数据自动更新到当天新的数据,存档文件后缀带有周信息,比如周一,存档文件为txwlsave1
--save:option为可选,默认路径为"/User/Media/TouchSprite/lua/" ,默认文件名为defaultsave,
--测试时,可在电脑上直接运行,如在当前文件夹生成,可以用""表示路径,在手机运行时,请写上完整路径
save:option{
		path = "" , --"/User/Media/TouchSprite/lua/"
		file = "txwlsave",
}
--存档初始化函数,请在脚本运行前执行一次,会自动创建新的存档,或者读取当天存档,重复运行是,可继续用之前的存档数据
save:init()
--帐号更新模块,需要获取一个帐号信息,以便生成存档
account:update()

------------------以上是数据初始化-------------
------------------以下为使用案例---------------

--当游戏或者脚本中,遇到需要存储的数据时,先使用save:link()函数,链接存档,参数为数据名
--以下模拟一个部分存档数据
function test()
	local a = save:link("存档数据1")
--可直接修改数据
	a["战斗次数"] = 1
	a["装备等级"] = "s"
--也可用函数修改
	a:update("测试数据","测试") --此语句等同于 a["测试数据"] = "测试"
--使用此update时,可以同时存档
	a:update("测试数据","测试",nil,"save") --更新数据后即立刻写入文件
	save:save() --存入文件
end

function test2()
	local a = save:link("存档数据1")
	local b = save:link("存档数据2")
	print (a["战斗次数"])
	if a["战斗次数"] == 1 then 
		b.xx = 2
	end
end



