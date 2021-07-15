# frozen_string_literal: true

require_relative 'chess_square'
require_relative 'position_helpers'

class Chessboard
  include PositionHelpers

  attr_accessor :squares

  def initialize
    @squares = Array.new(64) { ChessSquare.new }
    init_squares
  end

  def square(location)
    return nil unless inbounds?(location)

    @squares[algebraic_to_index(location)]
  end

  def to_s
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
  end

  def init_squares
    @squares.each_index do |index|
      if (index + (index / 8)).even?
        @squares[index].bg_color = Colors::BG_GRAY
      else
        @squares[index].bg_color = Colors::BG_BLACK
      end
    end
  end
end
