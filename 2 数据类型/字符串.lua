---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/4/5 12:57
---

print("--------------------------")
print("获取字符串所占字节（#）：")
a = "Jiang 澎涌"
print(a .. " size: " .. #a)

print("--------------------------")
print("转义字符：")
print("jiang\tpeng\tyong\n江澎涌")
--- 两种写法一样的表示 （A == '0x41' ，\n == '\0' ，1 == '\049'）
print("ALO\n123\"")
print('\x41LO\10\04923"')
---  UTF 8
print("\u{3b1} \u{3b2} \u{3b3}")
print("\u{6C5F}\u{6F8E}\u{6D8C}")

print("--------------------------")
print("多行文本")
multiLines = [[
    Hello world.
    Jiang Pengyong.
]]
print(multiLines)
superMultiLines = [=====[
    Hello world
    Jiang Pengyong
    --[[
    ]]
]=====]
print(superMultiLines)

print("--------------------------")
print("\\z 可以去除之后的空白字符，直到非空白字符")
data = "123\z
        456"
print(data)

print("--------------------------")
print("字符串运算：")
print("10" + "1")
print("10" + 1)
print(10 + "1")
print(10 + 1)
print("10.0" + "1")
print(10 .. 1)
print("\"10\" + 1 ===>>", "10" + 1, math.type("10" + 1))

print("--------------------------")
print("tonumber: ")
print(tonumber("   -3  "))
print(tonumber("   10e2  "))
print(tonumber("   10e  "))
print(tonumber("   0x1.3p-4  "))
print(tonumber("100101", 2))
print(tonumber("fff", 16))
print(tonumber("-ZZ", 36))
print(tonumber("987", 8))

print("--------------------------")
print("比较运算符: ")
print("10" == 10)   --> false
-- 不能将数值和字符串进行比较，否则异常 attempt to compare number with string
--print("10" < 11)    -- attempt to compare string with number
--print(10 < "11")    -- attempt to compare string with number
-- 字符串之间比较的是字符顺序
print("10" < "11")   --> true
print(10 < 11)       -->

print("--------------------------")
print("string: ")
name = "Jiang Pengyong"
-- string.len(name) 等同于 #name
print(string.len(name))
print(#name)
print(name:len())
print(string.rep("jiang", 5))
print(string.reverse(name))
print(string.upper(name))
print(string.lower(name))

-- 字符串的索引是从 1 开始，裁剪的包括两个下标 [i, j]
print(string.sub(name, 1, 5))
-- 负数表示从后往前计算，-1 表示最后一个字符
print(string.sub(name, 1, -2))
print(string.sub(name, 11, -1))

print(string.char(97))
print(string.char(97, 98, 99))
-- byte 如果没有填第二个参数，则直接使用第一个字符
-- 索引也是从 1 开始
print(string.byte("abc"))
print(string.byte("abc", 2))
print(string.byte("abc", -1))
print(string.byte("abc", 1, -1))

-- 创建一个包含 name 中所有字符的表，只是要控制好大小，不能超过 1 M
local t = { string.byte(name, 1, -1) }
print("table: " .. #t)
for i = 1, #t do
    print(i .. "-->" .. t[i])
end
-- find 查询到会返回两个数 开始位置 结束位置， 如果找不到则返回 nil
print(string.find(name, "Jiang"))
print(string.find(name, "jiang"))
-- 进行替换字符，会返回两个 替换的字符 替换的个数
print(string.gsub(name, "j", "."))
print(string.gsub(name, "ong", "."))
print(string.gsub(name, "g", "."))

print("--------------------------")
print("string.format")
--------- string.format -----------
-- 因为 Lua 是通过调用 C 语言标准库来完成实际工作，所以格式化和 C 一样
print(string.format("pi = %.4f", math.pi))
-- 如果不使用 0 ，则默认使用空格
print(string.format("%02d/%02d/%04d", 4, 5, 2022))
print(string.format("%2d/%2d/%4d", 4, 5, 2022))
print(string.format("%x", 15))
print(string.format("%X", 15))
print(string.format("%15s", "jiang"))

print("--------------------------")
print("utf8:")
---- utf8 ----
chineseName = "江澎涌"
--- 不适合处理 utf8 的函数
print(string.reverse(chineseName))
print(string.upper(chineseName))
print(string.lower(chineseName))
print(string.byte(chineseName))
--print(string.char(chineseName))   -- bad argument #1 to 'char' (number expected, got string)

--- 适合处理 utf8 的函数
print(string.format("名字： %s", chineseName))
print(string.rep(chineseName, 5))
print(string.len(chineseName))
print(string.sub(chineseName, 2, -1))

-- utf8 编码的字符串，需要使用 utf8
print("utf8.len: ", utf8.len(chineseName), "string.len", string.len(chineseName))
print(utf8.len("ab\x93"))
-- offset 可以通过 字符索引 获取 字符串的 字节位置
print("offset：", utf8.offset(chineseName, 2))
-- codepoint 相当于 string.byte ，获取字符的在 utf8 的数字
print("codepoint：", utf8.codepoint(chineseName, utf8.offset(chineseName, 2)))
print("codepoint：", utf8.codepoint("澎"))
-- char 相当于 string.char
print("char", utf8.char(28558))
-- 使用 string sub 进行截取，使用 utf8 offset 获取第二个字符的真正下标
print(utf8.offset(chineseName, 2))
print(string.sub(chineseName, utf8.offset(chineseName, 2)))
-- codes 遍历 utf8 字符串中的每一个字符
for i, j in utf8.codes(chineseName) do
    print(i .. "-->" .. j .. "-->" .. utf8.char(j))
end