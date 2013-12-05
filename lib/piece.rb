require 'debugger'

class Piece
	attr_accessor :moves, :col, :row, :game

	def initialize(game)
		@row = 3
		@col = 0
		@moves = Array.new(4) #0 - left, 1 - right, 2 - up, 3 - down
		@game = game
		@maze = game.maze
		game.piece = self
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

	def remove_from_board
		puts "removing #{@row}, #{@col}"
		@removed = true
		@maze[@row][@col] = " "
	end

	def removed?
		@removed
	end

	def move_left
		puts "moving left"
		self.col -= 1
	end

	def move_right
		puts "moving right"
		self.col += 1
	end

	def move_down
		puts "moving down"
		self.row += 1
	end

	def move_up
		puts "moving up"
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
			#choice = false if @maze[@row][@col] == "-"
			game.display
			#debugger
			if choice				 
				self.send(methods[index])
				game.update_piece
				#break
				#debugger if self.row == 6 && self.col == 3
				self.move unless self.row == 7 && self.col == 10					
			end 
			#remove_from_board if index == 3
		end
		remove_from_board
	end

	
end