local pyramid = {1, 2, 3, 4}
local cubic = {1, 2, 3, 4, 5, 6}
local N = 100000

function dice_sum(d, n)
				local sum = 0
				for i = 1, n do
								sum = sum + dice_roll(d)
				end
				return sum
end

function dice_roll(d)
				return d[math.random(#d)] 
end

function play_game(dice1, dice2, duration)
				local wins = 0	
				for i = 1, duration do
								local p = dice_sum(dice1, 9)
								local c = dice_sum(dice2, 6)
								if p > c then
												wins = wins + 1
								end
				end
				return wins/duration
end

print(play_game(pyramid, cubic, N))
