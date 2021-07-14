require_relative 'knight'
require_relative 'travail_node'
require_relative 'position_translator'

class KnightsTravails
  include PositionTranslator

  def initialize; end

  def knights_moves(starting_position, ending_position)
    @root = TravailNode.new(algebraic_to_coord(starting_position))
    @knight = Knight.new(starting_position)
    @final_position = algebraic_to_coord(ending_position)
    @visited_positions = []

    last_node = travail()
    return nil if last_node.nil?

    last_node.moves
  end

  def travail(queue = [@root])
    # if out of queue items we can't find a path
    return nil if queue.length.zero?

    # base case is we are visiting the final position
    node = queue.shift

    if node.position == @final_position
      # puts "PATH FOUND?!?! #{@root.position} to #{node.position}"
      # puts 'we have travailed?!?!'
      return node
    end

    @visited_positions << node.position
    @knight.move_to(node.position)
    new_node_positions = @knight.possible_moves

    new_node_positions.each do |position|
      unless @visited_positions.include?(position) || out_of_bounds?(position)
        queue.push(TravailNode.new(position, node))
      end
    end

    travail(queue)
  end

  def out_of_bounds?(position)
    return false if (0..7).include?(position[0]) && (0..7).include?(position[1])

    true
  end
end