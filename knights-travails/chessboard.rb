require_relative 'chess_square'

class Chessboard
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

  def index_to_algebraic(index)
    row = 8 - (index / 8)
    col = (index % 8) + 97
    # puts "index: #{index} - #{col.chr}#{row}"
    "#{col.chr}#{row}"
  end

  def index_to_coord(index)
    row = index % 8
    col = index / 8
    # puts "index: #{[row, col]}"
    [row, col]
  end

  def algebraic_to_index(location)
    x_coord = location[0].ord - 97
    y_coord = (location[1].to_i - 8).abs
    index = coord_to_index([x_coord, y_coord])
    # puts "coord: #{location} is index #{index}"

    index
  end

  def coord_to_algebraic(coord)
    index_to_algebraic(coord_to_index(coord))
  end

  def coord_to_index(coord)
    index = coord[0] + (coord[1] * 8)
    # puts "#{coord[0]}, #{coord[1]} is index #{index}, obj id #{@squares[index].object_id}"
    index
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
