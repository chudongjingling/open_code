SelectModel = {
  ["iphone5"] = function () return 640,1136 end,
  ["iphone6"] = function () return 750,1334 end,
  ["iPadmini"] = function () return 768,1024 end,
  ["other"] = function (x,y) return x,y end,
  ["print"] = function (x,y) print(x,y) end,
}
function Switch(case,key,...)
    return case[key](...) 
end

Switch(SelectModel,"print",1024,768)
print(Switch(SelectModel,"iphone5"))
