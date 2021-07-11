require_relative 'knight'
require_relative 'travail_node'

class KnightsTravails
  def initialize(starting_position = [3, 3])
    @root = TravailNode.new(starting_position)
    @knight = Knight.new(starting_position)
    @final_position = [0, 0]
    @visited_positions = []
  end

  def travail(queue = [@root])
    # if out of queue items we can't find a path
    return nil if queue.length.zero?
    # base case is we are visiting the final position
    node = queue.shift

    parent_position = node.parent_node.nil? ? '' : node.parent_node.position
    puts "processing node: #{node.position} from parent #{parent_position}"
    
    if node.position == @final_position
      puts "PATH FOUND?!?! #{@root.position} to #{node.position}"
      return node
    end

    @visited_positions << node.position
    @knight.move_to(node.position)
    new_node_positions = @knight.possible_moves

    new_node_positions.each do |position|
      queue.push(TravailNode.new(position, node)) unless @visited_positions.include?(position)
    end
  
    travail(queue)
  end
end