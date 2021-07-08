class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def <=>(other_node)
    @data <=> other_node.data
  end

  def to_s
    output = "node: #{data}"

    output += left.nil? ? ' | left: nil' : " | left: #{left.data}"
    output += right.nil? ? ' | right: nil' : " | right: #{right.data}"

    output
  end
end
