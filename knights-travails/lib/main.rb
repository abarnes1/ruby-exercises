require_relative 'knights_travails'
require_relative 'player_input'
require_relative 'chess/chessboard'

play_again = 'y'

while play_again == 'y'
  puts "Welcome to Knight's Travails!\n"
  puts "Pick two squares to see the shortest route between them...\n\n"

  board = Chessboard.new
  puts "#{board}\n"

  starting_position = PlayerInput.start_square
  ending_position = PlayerInput.ending_square

  travails = KnightsTravails.new
  puts "\ntraversing from #{starting_position} to #{ending_position}"
  positions = travails.knights_moves(starting_position, ending_position)

  puts "positions: #{positions.join(', ')}"

  positions.each_with_index do |position, index|
    square = board.square(position)

    square.color = Colors::RED
    square.piece = if index == (positions.size - 1)
                     Pieces::KNIGHT_SOLID
                   else
                     index
                   end
  end

  puts "\n#{board}"
  puts "\nPlay again? Y / N"

  play_again = gets.chomp.downcase
end
