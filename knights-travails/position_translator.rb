module PositionTranslator
  def index_to_algebraic(index)
    row = 8 - (index / 8)
    col = (index % 8) + 97
    "#{col.chr}#{row}"
  end

  def index_to_coord(index)
    row = index % 8
    col = index / 8
    [row, col]
  end

  def algebraic_to_index(location)
    x_coord = location[0].downcase.ord - 97
    y_coord = (location[1].to_i - 8).abs
    coord_to_index([x_coord, y_coord])
  end

  def algebraic_to_coord(location)
    index_to_coord(algebraic_to_index(location))
  end

  def coord_to_algebraic(coord)
    index_to_algebraic(coord_to_index(coord))
  end

  def coord_to_index(coord)
    coord[0] + (coord[1] * 8)
  end
end