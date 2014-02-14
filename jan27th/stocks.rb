def stock_picker(prices)
	best_price = 0
	best_index = []
	(0...prices.length).each do |start|
		(start...prices.length).each do |finish|
			current = prices[finish] - prices[start]
			if current > best_price
				best_index = [start, finish]
				best_price = current
			end
		end
	end
	best_index
end

p stock_picker([5, 2, 3, 5, 3, 7, 2, 3, 4, 9, 4, 0])