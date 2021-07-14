require_relative 'chess_square'
require_relative 'position_translator'

class Chessboard
  include PositionTranslator

  attr_accessor :squares

  def initialize
    @squares = Array.new(64) { ChessSquare.new }
    init_squares
  end

  def inbounds?(location)
    if location.instance_of?(Array)
      return false unless (0..7).include?(location[0]) && (0..7).include?(location[1])
    elsif location.instance_of?(String)
      return false unless ('a'..'h').include?(location[0].downcase) && (1..8).include?(location[1].to_i)
    else
      return nil # can't identify the location
    end

    true
  end

  def square(location)
    square = nil

    if location.instance_of?(Array)
      # puts 'loc is array'
      square = @squares[coord_to_index(location)]
    elsif location.instance_of?(String)
      square = @squares[algebraic_to_index(location)]
    end

    square
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
        @squares[index].bg_color = Colors::BG_GRAY
      else
        @squares[index].bg_color = Colors::BG_BLUE
      end
    end
  end
end
