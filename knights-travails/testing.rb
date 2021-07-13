require_relative 'knight'
require_relative 'knights_travails'
require_relative 'chessboard'
# start_square = [0, 0]
# dir1 = [-2, 2]
# dir2 = [-1, 1]

# moves = [-2, -1, 1, 2]
# p moves
# p moves.permutation(2).to_a
# puts "\n\n"

counter = 0
#  result = moves.permutation(2) do |c|
#   counter += 1
#   puts "counter: #{counter} | c: #{c}"
#  end
pos = [5, 5]
# # method 1: permutation and reject
# result = moves.permutation(2).reject { |move| move[0].abs == move[1].abs }
# puts '-------'
# p result.to_a


# # method 2: product
# result2 = dir1.product(dir2) + dir2.product(dir1)
# puts '-------'
# p result2.to_a

puts 'knights travails'
start = [0, 0]
final = [3, 3]

knight = Knight.new(start)
# p knight.possible_moves

puts "finding route from #{start} to #{final}"
test_travail = KnightsTravails.new(start, final)

last_node = test_travail.travail
puts "positions: #{last_node.moves.inspect}"

cell1 = ' '.bg_cyan
cell2 = ' '.bg_gray
puts "#{cell1}#{cell2}#{cell1}"
puts '123'.bg_cyan
puts 'abc'.blink

puts "\u2659 ".bg_cyan.black
puts "\u265F ".bg_cyan.black

puts "\u2659 ".bg_gray.black
puts "\u265F ".bg_gray.black