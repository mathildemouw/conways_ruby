class Game

	def initialize(board)
		@board = board
	end
 	
	def next_turn
		new_board = []
		@board.each_with_index do |row, r_index|
			new_row = []
			row.each_with_index do |cell, c_index|
				n = number_of_living_neighbors(r_index, c_index)
				new_cell = transform_aliveness(cell, n)
				new_row << new_cell
				p "#{c_index}, #{r_index}, #{cell}, #{new_cell}"
			end
			new_board << new_row
		end
		new_board
	end

	def transform_aliveness(cell_value, living_neighbors)
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

	def number_of_living_neighbors(r, c)
		@board[r - 1][c - 1] 		+ @board[r - 1][c] 	+ (@board[r - 1][c + 1] || @board[r - 1][c]) +
		@board[r][c - 1] 													 	+ (@board[r][c + 1] || @board[r][c])				 +
		(@board[r + 1][c - 1]) 	+ @board[r + 1][c] 	+ (@board[r + 1][c + 1] || @board[r + 1][c])
	end

	def visualize_board
		@board.each do |row|
			p row
		end
	end

	def visualize_neighbors(r, c)
		puts "#{@board[r - 1][c - 1]} , #{(@board[r - 1][c + 1] || @board[r - 1][c])}"
		puts "#{@board[r][c - 1]}, c, #{ (@board[r][c + 1] || @board[r][c])}"
		puts "#{@board[r + 1][c - 1]}, #{@board[r + 1][c]}, #{(@board[r + 1][c + 1] || @board[r + 1][c])}"

		puts "position is row: #{r} , column #{c}"
		puts "current value is #{@board[r][c]}"
		puts "*" *30
	end
end


