class Knight
  def initialize(position = [0, 0])
    @position = position
  end

  def possible_moves
    position_changes = generate_coord_changes if @possible_moves.nil?

    new_coords = position_changes.map do |change|
      # puts "change: #{change}"
      new_x = @position[0] + change[0]
      new_y = @position[1] + change[1]

      # puts " new coords: #{new_x}, #{new_y}"
      [new_x, new_y]
    end

    new_coords
  end

  def move_to(coord)
    @position = coord
  end

  private

  def generate_coord_changes
    direction_one = [-2, 2]
    direction_two = [-1, 1]

    if @position_changes.nil?
      @position_changes = direction_one.product(direction_two) + direction_two.product(direction_one)
    end

    @position_changes
  end
end
