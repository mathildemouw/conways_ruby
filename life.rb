
class Game

	def initialize(board)
		@board = board
	end

	def next_turn
		
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
 end	
end
########################
describe Game do

	board = 	[[0,0,0],
		 				 [1,0,0],
		 				 [0,1,0],
		 				 [0,1,1],
		 				 [1,1,0]]

	next_turn_board =	[[0,0,0],
 				   					 [0,0,0],
 				   					 [1,1,1],
 				   					 [0,0,1],
 				   					 [1,1,1]]

	describe "#next_turn" do
		it "returns the next board" do
			expect(Game.new(board).next_turn == next_turn_board)
		end
	end
# live_cell_with_fewer_than_two_neighbors = board[1][0] #=> dies
# live_cell_with_two_or_three_living_neighbors = board[2][1] #=> lives
# live_cell_with_more_than_three_neighbors = board[3][1] #=> dies
# dead_cell_with_three_live_neighbors = board[2][0] #=> dies
end



