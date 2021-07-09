require_relative 'node'
require_relative 'tree'

# a = Node.new(1)
# b = Node.new(2)
# c = Node.new(1)

# puts a.data
# puts b.data
# puts "1 < 2: #{a < b}"
# puts "1 > 2: #{a > b}"
# puts "1 == 1: #{a == c}"

# tree_data = Array.new(15) { rand(1..100) }

# left = tree_data.slice!(0, tree_data.size / 2)
# p left
# right = tree_data
# p right

#arr1 = [1, 2, 3, 4, 5]
# p "mid: #{arr1[arr1.size / 2]}"
# p "left: #{arr1.slice(0, arr1.size / 2)}"
# p "right: #{arr1.slice(((arr1.size / 2) + 1)..-1)}"

arr2 = [5, 7, 10, 17, 25, 40, 45, 60, 61, 62, 63, 77]
p arr2
# p "mid: #{arr2[arr2.size / 2]}"
# p "left: #{arr2.slice(0, arr2.size / 2)}"
# p "right: #{arr2.slice(((arr2.size / 2) + 1)..-1)}"

test_tree = Tree.new(arr2)
new_node = test_tree.insert(2)
# p new_node
test_tree.pretty_print
test_tree.delete(61)
test_tree.pretty_print

found_node = test_tree.find(7)
puts "looked for 7 and found: #{found_node}"

found_node = test_tree.find(45)
puts "looked for 45 and found: #{found_node}"

found_node = test_tree.find(40)
puts "looked for 40 and found: #{found_node}"

found_node = test_tree.find(5000)
puts "looked for 5000 and found: #{found_node}"

puts 'level order'
p test_tree.level_order
puts 'preorder'
p test_tree.preorder
puts 'inorder'
p test_tree.inorder
puts 'postorder'
p test_tree.postorder

puts "height: #{test_tree.height}"
puts "depth of 45: #{test_tree.depth(45)}"
puts "depth of 5000: #{test_tree.depth(5000)}"

puts "balanced: #{test_tree.balanced?}"

test_tree.insert(100)
test_tree.insert(101)
test_tree.insert(102)

test_tree.pretty_print
puts "balanced: #{test_tree.balanced?}"
puts "rebalancing"
test_tree.rebalance
test_tree.pretty_print
puts "balanced: #{test_tree.balanced?}"

# test_tree.delete(25)
# test_tree.pretty_print

# test_tree = Tree.new(arr2)
# test_tree.pretty_print

# arr2 = Array.new(15) { rand(1..100) }
# test_tree = Tree.new(arr2.uniq!.sort)
# test_tree.pretty_print