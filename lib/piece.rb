require 'debugger'

class Piece
	attr_accessor :moves, :col, :row

	def initialize(game)
		@row = 3
		@col = 0
		@moves = Array.new(4) #0 - left, 1 - right, 2 - up, 3 - down
		@maze = game.maze
	end

	def position
		[self.row,self.col]
	end

	def move_to(x_pos, y_pos)
		self.row = x_pos #using self to be explicit
		self.col = y_pos
		@maze[@row][@col] = "-"
	end

	def move?(x_pos, y_pos)
		@maze[x_pos][y_pos] == " "
	end

	def move_left
		self.col -= 1
	end

	def move_right
		self.col += 1
	end

	def move_down
		self.row += 1
	end

	def move_up
		self.row -= 1
	end

	def possible_moves
		if @maze[row][col-1] == " " #check if can move left on the board
			moves[0] = true
		else
			moves[0] = false
		end
		if @maze[row][col+1] == " " #check if can move right on the board
			moves[1] = true
		else
			moves[1] = false
		end
		if @maze[row-1][col] == " " #check if can move up on the board
			moves[2] = true
		else
			moves[2] = false
		end
		if @maze[row+1][col] == " " #check if can move down on the board
			moves[3] = true
		else
			moves[3] = false
		end
		moves
	end

	def move
		methods = [:move_left, :move_right, :move_up, :move_down]
		possible_moves.each_with_index do |choice,index|
			if choice
				self.send(methods[index])
				break
			end 
		end
	end

	
end