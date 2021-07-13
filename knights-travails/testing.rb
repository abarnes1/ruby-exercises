require_relative 'knight'
require_relative 'knights_travails'
require_relative 'chessboard'
require_relative 'chess_square'
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

board = Chessboard.new
# board.console_print
puts "\n\n"
square = board.square(0, 0)
square.piece = '0'
square.color = Colors::RED

square = board.square(2, 1)
square.piece = '1'
square.color = Colors::RED

square = board.square(3, 3)
square.piece = Pieces::KNIGHT_SOLID
square.color = Colors::RED

board.console_print