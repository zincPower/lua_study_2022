---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/10/28 22:53
---

print("Hello, jiang pengyong.")

print(age)
showAge()

-- 此处不能用 local ，否则外部就不能使用
--local name = "江澎涌"
name = "江澎涌"
function showName()
    print("lua file", name)
end