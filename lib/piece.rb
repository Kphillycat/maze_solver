require 'debugger'

class Piece
	attr_accessor :moves

	def initialize(game)
		@row = 3
		@col = 0
		@moves = Array.new(4) #0 - left, 1 - right, 2 - up, 3 - down
		@maze = game.maze
	end

	def position
		[@row,@col]
	end

	def move(x_pos, y_pos)
		@row = x_pos
		@col = y_pos
		@maze[@row][@col] = "-"
	end

	def move?(x_pos, y_pos)
		@maze[x_pos][y_pos] == " "
	end

	def possible_moves
		if @maze[@row][@col-1] == " " #check if can move left on the board
			moves[0] = true
		else
			moves[0] = false
		end
		if @maze[@row][@col+1] == " " #check if can move right on the board
			moves[1] = true
		else
			moves[1] = false
		end
		if @maze[@row-1][@col] == " " #check if can move up on the board
			moves[2] = true
		else
			moves[2] = false
		end
		if @maze[@row+1][@col] == " " #check if can move down on the board
			moves[3] = true
		else
			moves[3] = false
		end
		moves
	end

	
end