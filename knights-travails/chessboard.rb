require_relative 'colors'
require_relative 'pieces'

class Chessboard
  attr_accessor :squares

  def initialize
    @squares = Array.new(64) { {} }
    init_squares
    # @x = x_size
    # @y = y_size
  end

  def square(x, y, data)
    index = x + (y * 8)
    puts "#{x}, #{y} is index #{index}, obj id #{@squares[index].object_id}"
    @squares[index][:piece] = data
  end

  def console_print
    big_long_string = ''
    counter = 0
    @squares.each_with_index do |item, index|
      big_long_string += "#{8 - (index / 8)} " if counter == 0
      # p index
      counter += 1
      puts @squares[index]
      big_long_string += square_as_string(index)

      if counter == 8
        counter = 0
        big_long_string += "\n"
      end
    end

    big_long_string += "  a b c d e f g h\n"

    puts big_long_string
  end

  def init_squares
    @squares.each_index do |index|
      if (index + (index / 8)).even?
        # @squares[index][:background] = "\e[40m|$|\e[0m" # black bg
        @squares[index][:background] = "|$|".bg_brown # black bg
        @squares[index][:piece] = '  '
      else
        # @squares[index][:background] = "\e[47m|$|\e[0m" # gray bg
        @squares[index][:background] = "|$|".bg_blue # black bg
        @squares[index][:piece] = '  '
      end
    end
  end

  def square_as_string(index)
    @squares[index][:background].sub('|$|', @squares[index][:piece])
  end
end

test = Chessboard.new
test.console_print
# test_sq = test.square(2, 3, Pieces.code('white pawn'))
# test_sq = test.square(2, 2, Pieces.code('white pawn').gray)
# test_sq = test.square(3, 2, Pieces.code('white pawn').fore_test)

# test_sq = test.square(2, 3, Pieces.code('white pawn').black)
# test_sq = test.square(3, 3, Pieces.code('white pawn').black)


test_sq = test.square(2, 4, Pieces.code('black pawn').gray)
test_sq = test.square(2, 5, Pieces.code('black pawn').black)
puts test_sq.object_id
puts test_sq.class
puts test_sq.object_id
test.console_print