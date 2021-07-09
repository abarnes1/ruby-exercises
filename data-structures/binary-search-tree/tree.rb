# frozen_string_literal: true
AllowedMethods: ['some_method']

require_relative 'node'

class Tree
  def initialize(array)
    array = array.sort.uniq
    @root = build_tree(array, 0, array.size - 1) unless array.nil? || array.size.zero?
  end

  def insert(value)
    tree_insert(@root, value)
  end

  def delete(value)
    tree_delete(@root, value)
  end

  def pretty_print(node = @root, prefix = '', is_left: = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def find(value)
    tree_find(@root, value)
  end

  def level_order(queue = [@root], values = [])
    return values if queue.size.zero?

    node = queue.shift
    values << node.data

    queue.push(node.left) unless node.left.nil?
    queue.push(node.right) unless node.right.nil?

    level_order(queue, values)

    values
  end

  def preorder(node = @root, values = [])
    return nil if node.nil?

    # root, left, right
    values << node.data
    preorder(node.left, values) unless node.left.nil?
    preorder(node.right, values) unless node.right.nil?

    values
  end

  def inorder(node = @root, values = [])
    return nil if node.nil?

    # left, root, right
    inorder(node.left, values) unless node.left.nil?
    values << node.data
    inorder(node.right, values) unless node.right.nil?

    values
  end

  def postorder(node = @root, values = [])
    return nil if node.nil?

    # left, right, root
    postorder(node.right, values) unless node.right.nil?
    postorder(node.left, values) unless node.left.nil?
    values << node.data

    values
  end

  def height(node = @root)
    return -1 if node.nil?

    left = 1 + height(node.left)
    right = 1 + height(node.right)

    left > right ? left : right
  end

  def depth(end_node, current_node = @root)
    return nil if current_node.nil?

    if end_node < current_node.data
      lower_depth = depth(end_node, current_node.left)
      lower_depth.nil? ? nil : 1 + lower_depth
    elsif end_node > current_node.data
      lower_depth = depth(end_node, current_node.right)
      lower_depth.nil? ? nil : 1 + lower_depth
    else
      0
    end
  end

  def balanced?
    left = height(@root.left)
    right = height(@root.right)

    return false if (left - right).abs > 1

    true
  end

  def rebalance
    values = level_order
    @root = build_tree(values, 0, values.size - 1)
  end

  private

  def tree_insert(node, value)
    return Node.new(value) if node.nil?

    if value < node.data # left
      node.left = tree_insert(node.left, value)
    else
      node.right = tree_insert(node.right, value)
    end

    node
  end

  def tree_delete(node, value)
    return node if node.nil? # if never found then we're at leaf level so return

    if value < node.data
      node.left = tree_delete(node.left, value)
    elsif value > node.data
      node.right = tree_delete(node.right, value)
    else # is a match
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      # has left and right
      # find next largest to replace deleted

      # go right once then all lefts
      replacement = next_highest_node(node, true)
      node.data = replacement.data
      tree_delete(node.right, node.data)
    end

    node
  end

  def next_highest_node(node, go_right = false)
    # terminal condition: going left and can go no further
    return node if !go_right && node.left.nil?

    if go_right
      next_highest_node(node.right)
    else
      next_highest_node(node.left)
    end
  end

  def tree_find(node, value)
    return nil if node.nil?

    if value < node.data
      tree_find(node.left, value)
    elsif value > node.data
      tree_find(node.right, value)
    else
      node
    end
  end

  def build_tree(array, first, last)
    return nil if first > last

    mid = (first + last) / 2

    node = Node.new(array[mid])
    node.left = build_tree(array, first, mid - 1)
    node.right = build_tree(array, mid + 1, last)

    node
  end
end
