# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

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

########################

def describe(class_or_method)
	puts "describing #{class_or_method},"
	yield
end

def it(description)
	puts "if it works, it #{description}"
	yield
end

def expect(behavior)
 if behavior 
 	puts "and it does!"
 else 
 	puts "but something went wrong"
 	puts behavior
 end	
end

########################

describe Game do

	board = 	[[0,0,0],	#=> [1(d),1(d),0(d)]
		 				 [1,0,0],	#=> [1(a),0(d),1(d)]
		 				 [0,1,0],	#=> [3(d),3(a),3(d)]
		 				 [0,1,1],	#=> [4(d),4(a),3(a)]
		 				 [1,1,0]]	#=> [2(a),3(a),3(d)]

	next_turn_board =	[[0,0,0],
 				   					 [0,0,0],
 				   					 [1,1,1],
 				   					 [0,0,1],
 				   					 [1,1,1]]

 	subject = Game.new(board)
	# describe "#next_turn" do
	# 	it "returns the next board" do
	# 		expect(subject.next_turn == next_turn_board)
	# 	end
	# end

	describe "#number_of_living_neighbors" do
		live_cell_1_neighbor = [1,0] #=> dies
		live_cell_3_neighbors = [2,1] #=> lives
		live_cell_4_neighbors = [3,1] #=> dies
		dead_cell_3_neighbors = [2,0] #=> dies

		it "returns the correct number of living neighbors" do
			expect(subject.number_of_living_neighbors(live_cell_1_neighbor[0], live_cell_1_neighbor[1]) == 1)
			expect(subject.number_of_living_neighbors(live_cell_3_neighbors[0], live_cell_3_neighbors[1]) == 3)
			expect(subject.number_of_living_neighbors(live_cell_4_neighbors[0], live_cell_4_neighbors[1]) == 4)
			subject.visualize_board
			subject.visualize_neighbors(dead_cell_3_neighbors[0], dead_cell_3_neighbors[1])
			expect(subject.number_of_living_neighbors(dead_cell_3_neighbors[0], dead_cell_3_neighbors[1]) == 3)
		end
	end
end



