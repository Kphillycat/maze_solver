# require_relative '../lib/maze_solver.rb'
require_relative './spec_helper'
require_relative '../lib/piece'
require_relative '../lib/game'


describe "maze_solver" do
	let(:test_game) {Game.new}

	context "piece moving" do
		subject{Piece.new(test_game)}
		
		it "should start the piece at position [3][0]" do
			expect(subject.position).to eq([3,0])
		end

		it "should move to new location" do
			subject.move(3,1)
			expect(subject.position).to eq([3,1])
		end

		it "should be true if given position is a possible move" do			
			expect(subject.move?(3,1)).to eq(true)
		end

		it "should be false is given position is not a possible move" do
			expect(subject.move?(4,1)).to eq(false)
		end

		it "should have array of whether it can move left, right, up or down" do
			expect(subject.possible_moves).to eq([false,true,false,false])
		end
		
	end
end
