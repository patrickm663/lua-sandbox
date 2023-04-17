local function is_prime(n)
  if n < 2 then
    return false
  elseif n == 2 then
    return true
  else
    for i=2, math.floor(math.sqrt(n)) do
      if n % i == 0 then
	print("First divisor:", i)
	return false
      end
    end
    return true
  end
end

local M = 997681
print("Is", M, "prime?", is_prime(M))
