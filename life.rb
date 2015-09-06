class Game

	def initialize(board)
		@board = board
	end
 	
	def next_turn
		i = 0
		j = 0
		# @board.each do |row|
		# 	# row.each do |cell|
		# 	# 	cell_row = i
		# 	# 	cell_col = j 
		# 	# 	living_neighbors = number_of_living_neighbors(cell_row, cell_col)
		# 	# 	j++
		# 	# end
		# 	i++
		# end
	end

	def number_of_living_neighbors(row, column)
		@board[row - 1][column - 1] 	+ @board[row - 1][column] 	+ @board[row - 1][column + 1] +
		@board[row][column - 1] 													 			+ @board[row][column + 1] +
		@board[row + 1][column - 1] 	+ @board[row + 1][column] 	+ @board[row + 1][column + 1]
	end

	def visualize_board
		@board.each do |row|
			p row
		end
	end

	def visualize_neighbors(row, column)
		puts "#{@board[row - 1][column - 1]} , #{@board[row - 1][column]}, #{@board[row - 1][column + 1]}"
		puts "#{@board[row][column - 1]}, c, #{ @board[row][column + 1]}"
		puts "#{@board[row + 1][column - 1]}, #{@board[row + 1][column]}, #{@board[row + 1][column + 1]}"

		puts "position is row: #{row} , column #{column}"
		puts "current value is #{@board[row][column]}"
		puts "*" *30
	end
end



