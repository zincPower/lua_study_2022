---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/11/20 14:09
---

local cmdQueue = {}
local asyncLib = {}

function asyncLib.readLine(stream, callback)
    local nextCmd = function()
        callback(stream:read())
    end
    table.insert(cmdQueue, nextCmd)
end

function asyncLib.writeLine(stream, line, callback)
    local nextCmd = function()
        callback(stream:write(line))
    end
    table.insert(cmdQueue, nextCmd)
end

function asyncLib.stop()
    table.insert(cmdQueue, "stop")
end

function asyncLib.runLoop()
    while true do
        local nextCmd = table.remove(cmdQueue, 1)
        if nextCmd == "stop" then
            break
        else
            nextCmd()
        end
    end
end

print("=====================================================")
print("简单使用：")
do
    local t = {}
    local currentPath = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
    local file = io.open(currentPath .. "一件小事.txt")
    local outputFile = io.output(currentPath .. "一件小事——倒叙.txt")
    for line in file:lines() do
        t[#t + 1] = line
    end
    for i = #t, 1, -1 do
        outputFile:write(t[i], "\n")
    end
end

cmdQueue = {}

print("=====================================================")
print("事件驱动：")
do
    local currentPath = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
    local file = io.open(currentPath .. "一件小事.txt")
    local outputFile = io.output(currentPath .. "一件小事——倒叙(事件驱动).txt")
    local i = 0
    local t = {}
    local function putLine()
        i = i - 1
        if i == 0 then
            asyncLib.stop()
        else
            asyncLib.writeLine(outputFile, t[i] .. "\n", putLine)
        end
    end

    local function getLine(line)
        if line then
            t[#t + 1] = line
            asyncLib.readLine(file, getLine)
        else
            i = #t + 1
            putLine()
        end
    end

    asyncLib.readLine(file, getLine)
    asyncLib.runLoop()
end

cmdQueue = {}

print("=====================================================")
print("协程：")
do
    function run(code)
        local co = coroutine.wrap(function()
            code()
            asyncLib.stop()
        end)
        co()
        asyncLib.runLoop()
    end

    local function putLine(stream, line)
        local co = coroutine.running()
        local callback = (function()
            coroutine.resume(co)
        end)
        asyncLib.writeLine(stream, line, callback)
        coroutine.yield()
    end

    local function getLine(stream)
        local co = coroutine.running()
        local callback = (function(l)
            coroutine.resume(co, l)
        end)
        asyncLib.readLine(stream, callback)
        local line = coroutine.yield()
        return line
    end

    run(function()
        local t = {}
        local currentPath = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
        local file = io.open(currentPath .. "一件小事.txt")
        local outputFile = io.output(currentPath .. "一件小事——倒叙(协程).txt")

        while true do
            local line = getLine(file)
            if not line then
                break
            end
            t[#t + 1] = line
        end
        for i = #t, 1, -1 do
            putLine(outputFile, t[i] .. "\n")
        end
    end)
end