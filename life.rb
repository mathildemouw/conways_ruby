class Game

	def initialize(board)
		@board = board
	end
 	
	def next_turn

	end

	def transform_cell(cell_value, living_neighbors)
		if living_neighbors > 3
			return 0
		elsif living_neighbors < 2
			return 0
		elsif living_neighbors == 3
			return 1
		else
			return cell_value
		end
	end

	def number_of_living_neighbors(row, column)
		@board[row - 1][column - 1] 	+ @board[row - 1][column] 	+ (@board[row - 1][column + 1] || @board[row - 1][column]) +
		@board[row][column - 1] 													 			  + (@board[row][column + 1] || @board[row][column])				 +
		@board[row + 1][column - 1] 	+ @board[row + 1][column] 	+ (@board[row + 1][column + 1] || @board[row + 1][column])
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



