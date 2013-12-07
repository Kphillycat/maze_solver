# require_relative '../lib/maze_solver.rb'
require_relative './spec_helper'
require_relative '../lib/piece'
require_relative '../lib/game'


describe "maze_solver" do
	let(:test_game) {Game.new}

	context "piece tests" do
		subject{Piece.new(test_game)}
		
		it "should start the piece at position [3][0]" do
			expect(subject.position).to eq([3,0])
		end

		it "should move to new location" do
			subject.move_to(3,1)
			expect(subject.position).to eq([3,1])
		end

		it "should be true if given position is a possible move" do			
			expect(subject.move?(3,1)).to eq(true)
		end

		it "should be false is given position is not a possible move" do
			expect(subject.move?(4,1)).to eq(false)
		end

		it "should return array of whether it can move left, right, up or down" do
			expect(subject.possible_moves).to eq([false,true,false,false])
		end

		it "should move left" do
			subject.move_to(1,2)
			subject.move_left
			expect(subject.position).to eq([1,1])
		end

		it "should move right" do
			subject.move_to(1,2)
			subject.move_right
			expect(subject.position).to eq([1,3])
		end

		it "should move up" do
			subject.move_to(2,9)
			subject.move_up
			expect(subject.position).to eq([1,9])
		end
		
		it "should move down" do
			subject.move_to(1,9)
			subject.move_down
			expect(subject.position).to eq([2,9])
		end
		
		# it "should move based on possible moves returned array" do
		# 	subject.move
		# 	expect(subject.position).to eq([3,1])
		# end

		it "should move based on possible moves returned array until it reaches exit [7][10]" do
			subject.move
			expect(subject.position).to eq([7,10])
		end
	end

	
	context "display tests" do
		let(:test_game2) {Game.new}
		test_game = Game.new
		subject{Piece.new(test_game2)}

		it "should remove current piece from board" do
			test_game2.display
			subject.remove_from_board
			test_game2.display
			expect(test_game2.maze[3][0]).to eq("o")
		end	
		
		it "should have piece on board" do
			subject
			test_game2.update_piece
			expect(test_game2.maze[3][0]).to eq("-")
		end
		
		it "should show marked path on board" do
			subject
			test_game2.update_piece
			subject.move_to(3,1)
			expect(test_game2.maze[3][0]).to eq("-")
		end



	end
end
