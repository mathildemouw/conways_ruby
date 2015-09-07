# Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overcrowding.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
require_relative "life"
require_relative "test_framework"
describe Game do

	board = 	[[0,0,0,0],	#=> [2(d),2(d),1(d),1(d)]
		 				 [1,0,0,0],	#=> [1(d),2(d),1(d),1(d)]
		 				 [0,1,0,0],	#=> [3(d),3(a),3(a),1(d)] 
		 				 [0,1,1,0],	#=> [4(d),4(d),3(a),2(d)] 
		 				 [1,1,0,0]]	#=> [2(a),3(a),3(a),2(d)]

	next_turn_board =	[[0,0,0,0],
 				   					 [0,0,0,0],
 				   					 [0,1,1,0],
 				   					 [0,0,1,0],
 				   					 [1,1,1,0]]

	live_cell_1_neighbor = [1,0] #=> dies
	live_cell_3_neighbors = [2,1] #=> stays alive
	live_cell_4_neighbors = [3,1] #=> dies
	dead_cell_3_neighbors = [2,0] #=> lives
	dead_cell_wrap_4_neighbors = [3,0] #=> stays dead

 	subject = Game.new(board)
	describe "#next_turn" do
		it "returns the next board" do
			expect(subject.next_turn == next_turn_board)
		end
	end

	describe "#transform_cell" do
		it "returns the correct aliveness status for the next turn" do
			expect(subject.transform_cell(1,1) == 0)
			expect(subject.transform_cell(1,3) == 1)
			expect(subject.transform_cell(1,4) == 0)
			expect(subject.transform_cell(0,3) == 1)
			expect(subject.transform_cell(0,5) == 0)
		end
	end

	describe "#number_of_living_neighbors" do
		it "returns the correct number of living neighbors" do
			expect(subject.number_of_living_neighbors(live_cell_1_neighbor[0], live_cell_1_neighbor[1]) == 1)
			expect(subject.number_of_living_neighbors(live_cell_3_neighbors[0], live_cell_3_neighbors[1]) == 3)
			expect(subject.number_of_living_neighbors(live_cell_4_neighbors[0], live_cell_4_neighbors[1]) == 4)
			expect(subject.number_of_living_neighbors(dead_cell_3_neighbors[0], dead_cell_3_neighbors[1]) == 3)
			expect(subject.number_of_living_neighbors(dead_cell_wrap_4_neighbors[0], dead_cell_wrap_4_neighbors[1]) == 4)
		end
	end
end