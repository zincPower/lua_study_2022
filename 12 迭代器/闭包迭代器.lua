---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/4/17 17:49
---

print("------------------------")
print("闭包遍历：")
do
    -- 创建迭代器的闭包工厂
    function values(t)
        local i = 0
        return function()
            i = i + 1
            local v = t[i]
            if (v == nil) then
                return nil, nil
            else
                return i, v
            end
        end
    end

    -- 遍历
    t = { 10, 20, 30, 40, 50 }
    for i, v in values(t) do
        print(i, "-->", v)
    end
end

print("------------------------")
print("遍历行：")
do
    function allwords(file)
        local line = file:read()
        local pos = 1
        return function()
            while line do
                local w, e = string.match(line, "(%w+)()", pos)
                if w then
                    pos = e
                    return w
                else
                    line = file:read()
                    pos = 1
                end
            end
            return nil
        end
    end

    local currentPath = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
    local file = io.open(currentPath .. "演讲稿.txt", "r")
    for item in allwords(file) do
        print(item)
    end
end

