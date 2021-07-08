require_relative 'tree'
values = Array.new(14) { rand(1..100) }
p "initial values: #{values}"
tree = Tree.new(values)

tree.pretty_print
puts "balanced?: #{tree.balanced?}"

puts 'level order'
p tree.level_order
puts 'preorder'
p tree.preorder
puts 'inorder'
p tree.inorder
puts 'postorder'
p tree.postorder

puts "inserting 101, 110, 125, 150"
tree.insert(101)
tree.insert(110)
tree.insert(125)
tree.insert(150)

tree.pretty_print

puts "balanced?: #{tree.balanced?}"
puts 'rebalancing...'
tree.rebalance
puts "balanced?: #{tree.balanced?}"

tree.pretty_print

puts 'level order'
p tree.level_order
puts 'preorder'
p tree.preorder
puts 'inorder'
p tree.inorder
puts 'postorder'
p tree.postorder