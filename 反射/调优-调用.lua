---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/4/24 07:44
---

function foo()
    print("jiang pengyong")
end

local f = assert(loadfile("/Users/jiangpengyong/Desktop/code/Lua/lua_study_2022/反射/调优(统计调用次数).lua"))
-- 运行
f()
debug.sethook(hook, "c")
foo()
debug.sethook()

for func, count in pairs(Counters) do
    print(getName(func), count)
end