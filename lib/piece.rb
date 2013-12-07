require 'debugger'

class Piece
	attr_accessor :moves, :col, :row, :game, :rows, :cols

	def initialize(game)
		@row = 3
		@col = 0
		@moves = Array.new(4)
		@game = game
		@maze = game.maze
		game.piece = self

		@rows = [3]
		@cols = [0]
	end

	def position
		[self.row,self.col]
	end

	def move_to(x_pos, y_pos)
		self.row = x_pos #using self to be explicit
		self.col = y_pos
		self.rows << x_pos
		self.cols << y_pos
		@maze[@row][@col] = "-"
	end

	def move?(x_pos, y_pos)
		@maze[x_pos][y_pos] == " "
	end

	def remove_from_board
		@removed = true
		#remove from rows array
		game.update_piece
		@maze[@rows.pop][@cols.pop] = "o"
		@row = @rows.last
		@col = @cols.last
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
		moves= []
		methods = [:move_left, :move_right, :move_up, :move_down]
		decision_fork = []
		deadend = false
		while position != [7,10]
			possible_moves.each_with_index do |choice, index|
				if choice
					moves << methods[index] #only possible moves to be executed are in moves
					decision_fork << position
				end
				# game.display
				# if choice			 
				# 	self.send(methods[index]) #moves left
				# 	@rows << row
				# 	@cols << col
				# 	game.update_piece
				# 	self.move unless self.row == 7 && self.col == 10 #possible_moves = [f,f,t,f]
				# 	return if self.row == 7 && self.col == 10
				# 	self.row = @rows.pop
				# 	self.col = @cols.pop
												
				# end 
			end
			
			
				self.send(moves.last)
				game.update_piece
				self.rows << row
				self.cols << col
				game.display
				break if position == [7,10] #maze solved
			
			if possible_moves.all? {|move| move == false}
				until position == decision_fork.last do
					remove_from_board
					moves.pop
				end
			end
			
			decision_fork.pop #Go back to last decision fork
		end
		
	end
	
end