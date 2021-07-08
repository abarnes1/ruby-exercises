require_relative 'node'

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      new_tail = Node.new(value)
      @tail.next_node = new_tail
      @tail = new_tail
    end

    @size += 1
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      old_head = @head
      @head = Node.new(value)
      @head.next_node = old_head
    end

    @size += 1
  end

  def size
    @size
  end

  def at(index)
    return nil if @head.nil?

    current_node = @head
    counter = 0

    until counter == index
      return nil if current_node.next_node.nil?
      current_node = current_node.next_node
      counter += 1
    end

    return current_node
  end

  def pop
    return nil if @tail.nil?

    popped_node = @tail
    @tail = at(@size - 2)
    @tail.next_node = nil unless @tail.nil?

    @size -= 1

    if @size.zero?
      @head = nil
      @tail = nil
    end

    popped_node
  end

  def contains?(value)
    node = @head

    until node.nil?
      return true if node.value == value
      node = node.next_node
    end

    false
  end

  def find(value)
    index = -1
    node = @head

    until node.nil?
      index += 1 unless node.nil?
      return index if node.value == value
      node = node.next_node
    end

    nil
  end

  def insert_at(value, index)
    return nil if index.negative? || index > @size
    new_node = Node.new(value)

    #traverses twice, could be once if done here
    node_before = at(index - 1)
    node_after = at(index)

    if node_before.nil?
      new_node.next_node = @head
      @head = new_node
    elsif node_after.nil?
      node_before.next_node = new_node
      @tail = new_node
    else
      node_before.next_node = new_node
      new_node.next_node = node_after
    end

    puts "tail: #{@tail.value}" 

    @size += 1
    new_node
  end

  def remove_at(index)
    return nil if index.negative? || index > (@size - 1)
    deleted_node = nil

    #traverses twice, could be once if done here
    node_before = at(index - 1)
    node_after = at(index + 1)

    if node_before.nil?
      deleted_node = @head
      @head = @head.next_node
    elsif node_after.nil?
      deleted_node = @tail
      node_before.next_node = nil
      @tail = node_before
    else
      deleted_node = node_before.next_node
      node_before.next_node = node_after
    end

    @size -= 1
    deleted_node
  end

  def to_s
    return nil if @head.nil?

    node = @head
    output = ''
    until node.nil?
      output += "( #{node.value } ) -> "
      node = node.next_node
    end

    output += 'nil'
  end
end