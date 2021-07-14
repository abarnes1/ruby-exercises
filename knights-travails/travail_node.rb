require_relative 'position_translator'

class TravailNode
  include PositionTranslator

  attr_reader :position, :parent_node

  def initialize(position, parent_node = nil)
    @position = position
    @parent_node = parent_node
  end

  def moves
    moves = []
    moves << coord_to_algebraic(position)

    parent = parent_node

    until parent.nil?
      moves << coord_to_algebraic(parent.position)
      parent = parent.parent_node
    end

    moves.reverse
  end
end