local sz = require("sz")
local json = sz.json
w,h = getScreenSize();
if w <= 0 then w,h = 3000,3000 end
MyTable = {
	["style"]		 =	"default",
	["width"]		 =	w,
	["height"]		 =	h,
	["config"]		 =	"save_002.dat",
	["bg"]			 =	"#cdffff",
	["pagetype"]	 =	"multi",
	["cancelname"]	 =  "取消",
	["okname"]		 =  "开始",
	["title"]		 =  "title是这里",
--	["rettype"]		 =  "array",
	pages			 =
	{
		{
			{
				["type"]		 =	"Label",
				["text"]		 =	"第一页",
				["size"]		 =	25,
				["align"]		 =	"center",
				["color"]		 =	"0,0,255"
			},
			{
				["type"]		 =	"Label",
				["text"]		 =	"账号 : ",
				["align"]		 =	"center",
				["size"]		 =	20,
				["color"]		 =	"134,187,21",
				["width"]		 =	"200",
				["nowrap"]		 =	"1"
			},
			{
				["id"]			 = "edit_username",
				["type"]		 = "Edit",
				["prompt"]		 = "请输入账户",
				["size"]		 =	20
			},
			{
				["type"]		 =	"Label",
				["text"]		 =	"密码 : ",
				["align"]		 =	"center",
				["size"]		 =	20,
				["color"]		 =	"134,187,21",
				["width"]		 =	"200",
				["nowrap"]		 =	"1"
			},
			{
				["id"]			 = "edit_password",
				["type"]		 = "Edit",
				["prompt"]		 = "请输入密码",
				["size"]		 =	20
			},
			{
				["id"]			 = "生肖1",
				["type"]		 = "ComboBox",
				["list"]		 = "12生肖,12星座",
				["select"]		 = "0",
				["data"]		 = "鼠,牛,虎,兔,龙,蛇,马,羊,猴,鸡,狗,猪#白羊座,金牛座,双子座,巨蟹座,狮子座,处女座,天秤座,天蝎座,射手座,摩羯座,水瓶座,双鱼座",
				["width"]		 =	"500",
				["source"]		 = "test",
				["nowrap"]		 =	"1"
			},
			{
				["id"]			 = "生肖2",
				["type"]		 = "ComboBox",
				["select"]		 = "0",
				["dataSource"]	 = "test",
				["width"]		 =	"500",
			},
			{
				["type"]		 =	"Label",
				["text"]		 =	"生日 : ",
				["align"]		 =	"center",
				["size"]		 =	20,
				["color"]		 =	"134,187,21",
				["width"]		 =	"200",
				["nowrap"]		 =	"1"
			},
			{
				["id"]			 = "年",
				["type"]		 = "Edit",
				["prompt"]		 = "输入年",
				["width"]		 =	"300",
				["size"]		 =	20,
				["nowrap"]		 =	"1"
			},
			{
				["type"]		 =	"Label",
				["text"]		 =	"年",
				["size"]		 =	20,
				["color"]		 =	"134,187,21",
				["width"]		 =	"60",
				["nowrap"]		 =	"1"
			},
			{
				["id"]			 = "月",
				["type"]		 = "ComboBox",
				["list"]		 = "1,2,3,4,5,6,7,8,9,10,11,12",
				["select"]		 = "0",
				["width"]		 =	"200",
				["nowrap"]		 =	"1",
				["source"]		 = "test"
			},
			{
				["type"]		 =	"Label",
				["text"]		 =	"月",
				["size"]		 =	20,
				["color"]		 =	"134,187,21",
				["width"]		 =	"60",
				["nowrap"]		 =	"1"
			},
			{
				["id"]			 = "日",
				["type"]		 = "ComboBox",
				["list"]		 = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31",
				["select"]		 = "0",
				["width"]		 =	"200",
				["nowrap"]		 =	"1",
				["source"]		 = "test"
			},
			{
				["type"]		 =	"Label",
				["text"]		 =	"日",
				["size"]		 =	20,
				["color"]		 =	"134,187,21",
				["width"]		 =	"60",
			},
			{
				["type"]		 =	"Label",
				["text"]		 =	"性别 : ",
				["size"]		 =	20,
				["align"]		 =	"center",
				["color"]		 =	"134,187,21",
				["width"]		 =	"200",
				["nowrap"]		 =	"1"
			},
			{
				["id"]		 = "性别",
				["type"]	 = "RadioGroup",
				["align"]	 = "center",
				["list"]	 = "男,女,人妖",
				["select"]	 = "0",
			}
		},{
			{
				["type"]	 =	"Label",
				["text"]	 =	"第二页",
				["size"]	 =	25,
				["align"]	 =	"center",
				["color"]	 =	"0,168,233",
			},
			{
				["type"]	 =	"Label",
				["text"]	 =	"带图片单选",
				["size"]	 =	22,
				["align"]	 =	"center",
				["color"]	 =	"134,187,21",
			},
			{
				["id"]		 = "单选",
				["type"]	 = "RadioGroup",
				["align"]	 = "center",
				["list"]	 = "选项00,选项01,选项02,选项03,选项04,选项05,选项06,选项07,选项08,选项09,选项10,选项11,选项12,选项13,选项14,选项15,选项16,选项17",
				["images"]	 = "a.png,b.png,c.png,d.png,e.png,f.png,g.png,h.png,i.png,j.png,k.png,l.png,m.png,n.png,o.png,p.png,q.png,r.png",
				["scale"]	 = "0.7",
				["select"]	 = "0",
				["width"]	 = "200",
				["nowrap"]	 = "1"
			},
			{
				["id"]		 = "单选",
				["type"]	 = "RadioGroup",
				["align"]	 = "center",
				["list"]	 = "选项00,选项01,选项02,选项03,选项04,选项05,选项06,选项07,选项08,选项09,选项10,选项11,选项12,选项13,选项14,选项15,选项16,选项17",
				["images"]	 = "a.png,b.png,c.png,d.png,e.png,f.png,g.png,h.png,i.png,j.png,k.png,l.png,m.png,n.png,o.png,p.png,q.png,r.png",
				["scale"]	 = "0.7",
				["select"]	 = "0",
				["width"]	 = "200",
			},
			{
				["type"]	 =	"Label",
				["text"]	 =	"带图片多选",
				["size"]	 =	22,
				["align"]	 =	"center",
				["color"]	 =	"134,187,21",
			},
			{
				["id"]		 = "多选",
				["type"]	 = "CheckBoxGroup",
				["align"]	 = "center",
				["list"]	 = "选项00,选项01,选项02,选项03,选项04,选项05,选项06,选项07,选项08,选项09,选项10,选项11,选项12,选项13,选项14,选项15,选项16,选项17",
				["color"]	 =	"0,0,255",
				["images"]	 = "a.png,b.png,c.png,d.png,e.png,f.png,g.png,h.png,i.png,j.png,k.png,l.png,m.png,n.png,o.png,p.png,q.png,r.png",
				["scale"]	 = "0.75",
				["select"]	 = "3@5",
			}
		},{
			{
				["type"]	 =	"Label",
				["text"]	 =	"第三页",
				["size"]	 =	25,
				["align"]	 =	"center",
				["color"]	 =	"0,168,233",
			},
			{
				["type"]	 =	"Image",
				["src"]		 =	"http://www.baidu.com/img/bdlogo.png",
				["align"]	 =	"left",
				["scale"]	 =  "0.5",
			},
			{
				["type"]	 =	"Image",
				["src"]		 =	"http://www.baidu.com/img/bdlogo.png",
				["align"]	 =	"center",
				["scale"]	 =  "1",
			},
			{
				["type"]	 =	"Image",
				["src"]		 =	"http://www.baidu.com/img/bdlogo.png",
				["align"]	 =	"right",
				["scale"]	 =  "1.5",
			}
		}
	}	
}

local MyJsonString = json.encode(MyTable);

tblUIParm = {showUI(MyJsonString)};

string = "返回值:"
for i = 1 , #tblUIParm[2] do
	string = string.."第"..i.."个返回值 : " .. tblUIParm[2][i].. "\r\n"
end

dialog(string..string..string,0)
