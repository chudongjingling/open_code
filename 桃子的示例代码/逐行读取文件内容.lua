-------------------------------------	读取账号
local Users ={}	 --初始化账号表
file = io.open("/User/Media/TouchSprite/wenben/test.txt","r")	--打开文件流
for line in file:lines() do	 --一行一行读取
string.match(table.insert(Users,line),'%C+')
end
file:close()	 --关闭文件流
-------------------------------------


-------------------------------------	登陆部分
function Login(User,Pass)
--User是账号
--Pass是密码
--inputText即可

end
-------------------------------------

-------------------------------------	循环账号表
for UserPass in ipairs(Users) do	--以Table 遍历账号表
local User, Pass = string.match(UserPass, "([^-]*)[-]*([^-]*)[-]*([^-]*)[-]*([^%c-]*)[-]*")	--拆分账号密码
Login(User, Pass)	 --调用登陆函数
end
-------------------------------------
