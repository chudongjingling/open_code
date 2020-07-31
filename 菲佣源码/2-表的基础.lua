test = {1,2,name = "zhangsan",3}
test.age = 11
test["action"]="say"
age = "name"
test1 = test
--print (test[1],test[2],test[3],test[4])
-- print (test.name,test.age,test.action)
-- print (test["name"],test["age"],test["action"])
--print (test[age],test["age"])
 --print (test)
-- print (test1.name)

 test["table1"] = {1,2,3}

--print (test["table1"])

-- for i,v in ipairs(test) do
-- 	print(i,v)
-- end

-- for k,v in pairs(test) do
-- 	print(k,v)
-- end

-- for i=1,#test do
-- 	print(i)
-- end

function name( ... )
	local t
	t = test
	t[1] = 10
end

name()
print(test[1])
print(t)

function cl( test )
t = {}
for k,v in pairs(test) do
	t[k] = test[k]
	return t
end

print(t[2])
