require_relative 'linked_list'

my_list = LinkedList.new

puts '---- append ----'
puts my_list.to_s
my_list.append(1)
puts my_list.to_s
my_list.append(2)
puts my_list.to_s
my_list.append(3)
my_list.append(4)
my_list.append(5)
puts my_list.to_s

puts ''
puts '---- prepend ----'
my_list.prepend(6)

my_list = LinkedList.new
my_list.prepend('c')
my_list.prepend('b')
my_list.prepend('a')
my_list.append('d')
my_list.prepend('first!')
puts my_list.to_s

puts '---- pop ----'
puts "popped: #{my_list.pop.value}"
puts 'remaining:'
puts my_list.to_s

puts ''
puts '---- contains ----'
puts "contains 'b': #{my_list.contains?('b')}"
puts "contains 'pizza': #{my_list.contains?('pizza')}"
puts ''

puts '---- find ----'
puts "find 'c': #{my_list.find('c')}"
puts "find 'pizza': #{my_list.find('pizza')}"

puts '---- to_s ----'
puts my_list.to_s
puts ''

puts '---- pop ----'
puts "popped: #{my_list.pop.value}"
puts 'remaining:'
puts my_list.to_s

puts "popped: #{my_list.pop.value}"
puts 'remaining:'
puts my_list.to_s

puts "popped: #{my_list.pop.value}"
puts 'remaining:'
puts my_list.to_s

puts my_list.head.value
puts my_list.tail.value
puts "popped: #{my_list.pop.value}"
puts 'remaining:'
puts my_list.to_s

nil_node = my_list.pop
puts "no node, popped nil" if nil_node.nil?
puts 'remaining:'
puts my_list.to_s

puts '---- insert_at ----'
my_list.append('c')
my_list.append('e')

puts my_list.to_s
puts "\ninserting 'a' at index 0"
my_list.insert_at('a', 0)
puts my_list.to_s

puts "\ninserting 'b' at index 1"
my_list.insert_at('b', 1)
puts my_list.to_s

puts "\ninserting 'd' at index 3"
my_list.insert_at('d', 3)
puts my_list.to_s

puts "\ninserting 'f' at index 5"
my_list.insert_at('f', 5)
puts my_list.to_s

puts "\ninserting 'y' at index -25"
my_list.insert_at('y', -25)
puts my_list.to_s

puts "\ninserting 'z' at index 50"
my_list.insert_at('z', 50)
puts my_list.to_s

puts '---- remove_at ----'
puts my_list.to_s

deleted_node = my_list.remove_at(5)
puts "\nremoved at index 5: #{deleted_node.value}" unless deleted_node.nil?
puts my_list.to_s

deleted_node = my_list.remove_at(1)
puts "\nremoved at index 1: #{deleted_node.value}" unless deleted_node.nil?
puts my_list.to_s

deleted_node = my_list.remove_at(0)
puts "\nremoved at index 0: #{deleted_node.value}" unless deleted_node.nil?
puts my_list.to_s

deleted_node = my_list.remove_at(50)
if deleted_node.nil?
  puts "\nnothing removed at index 50"
  puts my_list.to_s
end

deleted_node = my_list.remove_at(-25)
if deleted_node.nil?
  puts "\nnothing removed at index -25"
  puts my_list.to_s
end

# puts ''
# puts '---- head ----'
# puts my_list.head.value

# puts ''
# puts '---- tail ----'
# puts my_list.tail.value

# puts ''
# puts '---- at ----'
# puts "at 2: #{my_list.at(2).value}"
# high_index = my_list.at(1000)
# puts "index 1000 is nil" if my_list.at(1000).nil?


# my_list.debug_print