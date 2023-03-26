-- Initialise variables
local alphabet_table = {
  A = 1,
  B = 2,
  C = 3,
  D = 4,
  E = 5,
  F = 6,
  G = 7,
  H = 8,
  I = 9,
  J = 10,
  K = 11,
  L = 12,
  M = 13,
  N = 14,
  O = 15,
  P = 16,
  Q = 17,
  R = 18,
  S = 19,
  T = 20,
  U = 21,
  V = 22,
  W = 23,
  X = 24,
  Y = 25,
  Z = 26
}

local f = io.open("names.txt")
local c = 0
local sum = 0
local score = 0 
local names = {}

-- Add names to table
for line in f:lines() do
				for name in string.gmatch(line, "[^,]+") do
								local n = tostring(string.gsub(name, '"', ''))
								table.insert(names, n)
				end
end
f:close()

-- Sort table alphabetically
table.sort(names, function(a, b) return a < b end)

-- Loop through the names, retrieve its letter score, and multiply by position. Sum all values
for i = 1, #names do
				local n = names[i]
				for i = 1, string.len(n) do
								local letter = tostring(string.sub(n, i, i))
								local letter_score = alphabet_table[letter] 
								score = score + letter_score
				end
				c = c + 1
				sum = sum + c*score
				score = 0
end

print("Result: ", sum)
