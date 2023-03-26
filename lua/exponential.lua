local f = io.open('exponential.txt')
local num1 = 0
local num2 = 0
local max = 0
local count = 0
local c = 0

for str in f:lines() do
				local commaIndex = string.find(str, ",")
				num1 = tonumber(string.sub(str, 1, commaIndex - 1))
				num2 = tonumber(string.sub(str, commaIndex + 1))
				local result = num2*math.log(num1)
				c = c + 1
				if result > max then
								max = result
								count = c
				end
end
print("Line is: ", count)
print("Numbers are: ", num1, " and ", num2)
print("Result is: ", max)
f:close()
