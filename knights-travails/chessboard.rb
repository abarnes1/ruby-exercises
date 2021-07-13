require_relative 'chess_square'

class Chessboard
  attr_accessor :squares

  def initialize
    @squares = Array.new(64) { ChessSquare.new }
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
    board = ''
    counter = 0
    @squares.each_with_index do |item, index|
      board += "#{8 - (index / 8)} " if counter.zero?
      counter += 1

      board += item.to_s

      if counter == 8
        counter = 0
        board += "\n"
      end
    end

    board += "  a b c d e f g h\n"

    puts board
  end

  def init_squares
    @squares.each_index do |index|
      if (index + (index / 8)).even?
        @squares[index].bg_color = Colors::BG_BROWN
      else
        @squares[index].bg_color = Colors::BG_BLUE
      end
    end
  end
end
