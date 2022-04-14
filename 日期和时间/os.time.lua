---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/4/14 14:11
---

-- 时间戳
print(os.time())

-- 自行转换
do
    local day2year = 365.242
    local sec2hour = 60 * 60
    local sec2day = sec2hour * 24
    local sec2year = sec2day * day2year
    function getYear(timestamp)
        -- 时间戳是从 Jan 01,1970,0:00 UTC 开始
        return timestamp // sec2year + 1970
    end
    function getHour(timestamp)
        return timestamp % sec2day // sec2hour
    end
    function getMinute(timestamp)
        return timestamp % sec2hour // 60
    end
    function getSecond(timestamp)
        return timestamp % 60
    end
end

timestamp = 1439653520--os.time()
print("")
print("timestamp", timestamp)
print("year", getYear(timestamp))
print("hour", getHour(timestamp))
print("minute", getMinute(timestamp))
print("second", getSecond(timestamp))

print("")
print(os.time({
    -- 必填项 year、month、day
    year = 2022,
    month = 4,
    day = 14,
    -- 选填项 hour、minute、second ，不填默认为 12:00:00
    hour = 13,
    min = 10,
    sec = 10,
    -- wday、yday 填了也会被忽略
}))
