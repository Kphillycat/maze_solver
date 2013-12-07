require 'debugger'
require_relative './piece'

class Game
	attr_accessor :maze, :piece

	def initialize
		@maze = []
		@piece
		build_maze
	end

	def build_maze	
		File.open('./maze.txt') do |file|
		    file.each_line.with_index do |line,index|
		      	maze << []
		      	line.split("").each do |char|
		      		maze[index] << char unless char == "\n"
		      	end
			end
		end
	end

	def update_piece
		maze[self.piece.row][self.piece.col] = "-"  
		# if self.piece.removed?
		# 	maze[self.piece.row][self.piece.col] = " "
		# end
	end

	def display
		# update_piece
		maze.each do |row|
			row.each do |value|
				print value				
			end
			puts
		end
	end

end

# m = Game.new
# p = Piece.new(m)
# m.display



