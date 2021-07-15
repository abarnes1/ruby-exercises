require_relative 'lib/knights_travails'
require_relative 'lib/chess/chessboard'
require_relative 'lib/chess/chess_square'

puts 'knights travails'
start = 'b1'
final = 'h8'

test_travail = KnightsTravails.new
puts "finding route from #{start} to #{final}"

algebraic_positions = test_travail.knights_moves(start, final)

board = Chessboard.new

puts "positions: #{algebraic_positions.join(', ')}"

algebraic_positions.each_with_index do |position, index|
  square = board.square(position)

  square.color = Colors::RED
  square.piece = if index == (algebraic_positions.size - 1)
                   Pieces::KNIGHT_SOLID
                 else
                   index
                 end
end

puts ''
board.console_print

knight = Knight.new('a0')

