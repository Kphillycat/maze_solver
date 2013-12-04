require 'debugger'

class Game
	attr_accessor :maze

	def initialize
		@maze = []
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

	def display
		maze.each do |row|
			row.each do |value|
				print value				
			end
			puts
		end
	end

end

# m = Game.new
# m.display



