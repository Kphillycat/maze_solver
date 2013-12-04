require 'debugger'

maze = []
File.open('../maze.txt') do |file|
    file.each_line.with_index do |line,index|
      	maze << []
      	maze[index] << line.split("\n")[0]
	end
end

# puts "display maze"

# maze.each do |row|
# 	row.each do |col|
# 		print col
# 	end
# 	puts
# end

