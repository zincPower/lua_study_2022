---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/4/14 14:11
---

print("-------------------")
print("os.date 和 os.time 是反函数：")
do
    local time = os.time()
    print(time, os.time(os.date("*t", time)) == time)
end

print("-------------------")
print("获取日期表：")
do
    print("当前时间戳的日期表：")
    local t = os.date("*t")
    local content = "[ "
    for k, v in pairs(t) do
        content = content .. tostring(k) .. " = " .. tostring(v) .. ", "
    end
    print(content .. " ]")

    print("提供时间戳的日期表：")
    -- 1665536638 --> 北京时间 2022-10-12 09:03:58
    t = os.date("*t", 1665536638)
    content = "[ "
    for k, v in pairs(t) do
        content = content .. tostring(k) .. " = " .. tostring(v) .. ", "
    end
    print(content .. " ]")
end

print("-------------------")
print("格式化日期：")
do
    -- 北京时间 2022-10-12 09:03:58
    local timestamp = 1665536638
    print("%a 星期简称", os.date("%a", timestamp))
    print("%A 星期全称", os.date("%A", timestamp))
    print("%b 月份简写", os.date("%b", timestamp))
    print("%B 月份全名", os.date("%B", timestamp))
    print("%c 日期和时间", os.date("%c", timestamp))
    print("%d 一个月中的第几天", os.date("%d", timestamp))
    print("%H 24 小时制", os.date("%H", timestamp))
    print("%I 12 小时制", os.date("%I", timestamp))
    print("%j 一年中的第几天", os.date("%j", timestamp))
    print("%m 月份", os.date("%m", timestamp))
    print("%M 分钟", os.date("%M", timestamp))
    print("%p am 或 pm", os.date("%p", timestamp))
    print("%S 秒数", os.date("%S", timestamp))
    print("%w 星期", os.date("%w", timestamp))
    print("%W 一年中的第几周", os.date("%W", timestamp))
    print("%x 日期", os.date("%x", timestamp))
    print("%X 时间", os.date("%X", timestamp))
    print("%y 两位数的年份", os.date("%y", timestamp))
    print("%Y 完整的年份", os.date("%Y", timestamp))
    print("%z 时区", os.date("%z", timestamp))
    print("%% 百分号", os.date("%%", timestamp))
    -- 第一个参数默认 %c , 第二个参数默认当前时间
    print("默认参数", os.date())
end

do
    print("UTC 格式解析：")
    -- 北京时间 2022-10-12 09:03:58
    local timestamp = 1665536638
    print("!%H 24 小时制", os.date("!%H", timestamp))
    print("!%c 日期和时间", os.date("!%c", timestamp))
end

print("使用例子：")
do
    -- 北京时间 2022-10-12 09:03:58
    local timestamp = 1665536638
    print(os.date("%Y/%m/%d", timestamp))
    print(os.date("%Y-%m-%d %H:%M:%S", timestamp))
    print(os.date("%Y-%j", timestamp))
end

print("-------------------")
print("处理日期：")
do
    -- 北京时间 2022-10-12 09:03:58
    local timestamp = 1665536638
    print("原始时间", os.date("%Y/%m/%d", timestamp))
    local currentTable = os.date("*t", timestamp)
    -- 向前回退 40 天
    currentTable.day = currentTable.day - 40
    print("回退 40 天", os.date("%Y/%m/%d", os.time(currentTable)))
    -- 向后推进 6 个月
    currentTable = os.date("*t", timestamp)
    currentTable.month = currentTable.month + 6
    print("推进 6 个月", os.date("%Y/%m/%d", os.time(currentTable)))

    -- 这里的转换会有问题（由于日历机制导致）
    -- 3 月 31 号 + 1 个月 --> 4 月 31 号 --> 5 月 1 号
    -- 5 月 1 号 - 1 个月 --> 4 月 1 号
    local t = { year = 2022, month = 3, day = 31 }
    print("原始日期", os.date("%Y-%m-%d", os.time(t)))
    t.month = t.month + 1
    print("推进 1 个月",os.date("%Y-%m-%d", os.time(t)))
    t.month = t.month - 1
    print("后退 1 个月",os.date("%Y-%m-%d", os.time(t)))
end

print("-------------------")
print("计算时间差：")
do
    local start = os.time({ year = 2022, month = 1, day = 1 })
    local current = os.time()
    local diff = os.difftime(current, start)
    print(diff)
    local t = { year = 2023, month = 1, day = 1 }
    print(os.time(t))
    t.sec = diff
    print(os.time(t))
    print(os.date("%Y/%m/%d", os.time(t)))
end
