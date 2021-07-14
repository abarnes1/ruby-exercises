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
final = [2, 3]

knight = Knight.new(start)
# p knight.possible_moves

puts "finding route from #{start} to #{final}"
test_travail = KnightsTravails.new(start, final)

last_node = test_travail.travail
coord_positions = last_node.moves

board = Chessboard.new

puts "coordinate positions: #{coord_positions}"
algebraic_positions = coord_positions.map { |e| board.coord_to_algebraic(e) }
puts "algebraic positions: #{algebraic_positions}"

coord_positions.each_with_index do |position, index|
  square = board.square(position)

  square.color = Colors::RED
  square.piece = if index == (coord_positions.size - 1)
                   Pieces::KNIGHT_SOLID
                 else
                   index
                 end
end
# board.console_print
# puts "\n\n"
# square = board.square([0, 0])
# square = board.square('a8')
# square.piece = '0'
# square.color = Colors::RED

# square = board.square([2, 1])
# square = board.square('c7')
# square.piece = '1'
# square.color = Colors::RED


# square = board.square([4, 2])
# square = board.square('e6')
# square.piece = '2'
# square.color = Colors::RED

# square = board.square([5, 4])
# square = board.square('f4')
# square.piece = Pieces::KNIGHT_SOLID
# square.color = Colors::RED



puts ''
board.console_print