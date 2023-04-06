local n = 20

function factorial_rec(n)
  if n == 0 then
    return 1
  end
  return n * factorial_rec(n-1)
end

print(factorial_rec(n))
