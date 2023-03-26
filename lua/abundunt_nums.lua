function is_abundant(n)
  if n < 12 then return false end
  local sum = 0
  for i = 2, math.floor(n/2) do
    if n % i == 0 then
      sum = sum + i
      if sum > n then
	return true
      end
    end
  end
  return sum > n
end

function table.find(t, v)
  for i = 1, #t do
    if t[i] == v then
      return true
    end
    if t[i] > v then
      return false
    end
  end
  return false
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

function abundant_numbers(m)
  local list_of_abundant = {}
  for i = 2, m do
    if is_abundant(i) then
      table.insert(list_of_abundant, i)
    end
  end
  return list_of_abundant
end

local max = 1234

print("List of abundant numbets less than", max)
print(unpack(abundant_numbers(max)))
