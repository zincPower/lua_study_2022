---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/11/20 12:00
---

print("================================")
print("直接调用：")
do
    local function printResult(a)
        for i = 1, #a do
            io.write(a[i], " ")
        end
        io.write("\n")
    end

    local function permgen(a, n)
        n = n or #a
        if n <= 1 then
            printResult(a)
        else
            for i = 1, n do
                -- 把第 i 个元素当作最后一个
                a[n], a[i] = a[i], a[n]

                -- 生成剩余元素的所有排列
                permgen(a, n - 1)

                -- 恢复第 i 个元素
                a[n], a[i] = a[i], a[n]
            end
        end
    end

    permgen({ 1, 2, 3 })
end

print("================================")
print("迭代器：")
do
    local function permgen(a, n)
        n = n or #a
        if n <= 1 then
            coroutine.yield(a)
        else
            for i = 1, n do
                -- 把第 i 个元素当作最后一个
                a[n], a[i] = a[i], a[n]

                -- 生成剩余元素的所有排列
                permgen(a, n - 1)

                -- 恢复第 i 个元素
                a[n], a[i] = a[i], a[n]
            end
        end
    end

    local function permutations(a)
        local co = coroutine.create(function()
            permgen(a)
        end)
        -- 迭代函数，两种方式创建：
        -- 第一种：
        --return function()
        --    local code, res = coroutine.resume(co)
        --    return res
        --end
        -- 第二种：
        return coroutine.wrap(function()
            permgen(a)
        end)
    end

    local function printResult(a)
        for i = 1, #a do
            io.write(a[i], " ")
        end
        io.write("\n")
    end

    for p in permutations { "a", "b", "c" } do
        printResult(p)
    end
end