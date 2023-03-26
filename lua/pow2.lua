local a = 2
local b = 100
local arr = {}

for i=a, b do
  for j=a, b do
    table.insert(arr, i^j)
  end
end

function count_unique(t)
  local count = 1
  table.sort(t)
  for i=1, (#t-1) do
    if t[i] ~= t[i+1] then
      count = count + 1
    end
  end
  return count
end

print(count_unique(arr))
