---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jiangpengyong.
--- DateTime: 2022/4/2 5:15 PM
---


print("Hello world.")

function fact(number)
    if number == 0 then
        return 1
    end
    return number * fact(number - 1)
end

print("Please enter a number:")

a = io.read("*n")
print(fact(a))

-- -i 可以在执行完后进入交互
-- lua -i hello.lua

-- 合法，但不好读
number1 = 1 number2 = 3
print("number1:"..number1)
print("number2:"..number2)
