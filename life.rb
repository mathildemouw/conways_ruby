
class Game

	def initialize(rows*)
		@board = (Array.new << rows)
	end

	def next_turn(board)
		
	end
end


	
describe Game do

	board = 	[[0,0,0],
		 				 [c,0,0],
		 				 [0,c,0],
		 				 [0,c,c],
		 				 [c,c,0]]

	next_turn_board =	[[0,0,0],
 				   					 [0,0,0],
 				   					 [c,c,c],
 				   					 [0,0,c],
 				   					 [c,c,c]]

	describe "#next_turn" do
		it "returns the next board" do
			expect(Game.new(board).next_turn).to eq next_turn_board
		end
	end
# live_cell_with_fewer_than_two_neighbors = board[1][0] #=> dies
# live_cell_with_two_or_three_living_neighbors = board[2][1] #=> lives
# live_cell_with_more_than_three_neighbors = board[3][1] #=> dies
# dead_cell_with_three_live_neighbors = board[2][0] #=> dies
end


