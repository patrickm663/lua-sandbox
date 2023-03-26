function gcd(a, b)
				if a == 1 or b == 1 then
								return 1
				end
				if a == 0 or b == 0 then
								return 0
				end
				local m = math.min(a, b)
				for i = 2, m do
								if a % i == 0 and b % i == 0 then
												return 0
								end
				end
				return 1
end

function table.unique(t)
				local t_new = {}
				local hash = {}
				table.sort(t)
				for _, i in ipairs(t) do
								if not hash[i] then
												t_new[#t_new+1] = i
												hash[i] = true
								end
				end
				return t_new
end

local d = 12000
local p = 1/3
local q = 1/2
local c = 0

for i = 2, d do
				for j = math.floor(i*p), math.floor(i*q) do
								if gcd(i, j) == 1 and (j/i > p and j/i < q) then
												--print(j, '/', i, '=', j/i)
												c = c + 1
								end
				end
				print(c)
				print(i)
end

print(c)
--print(unpack(t))
