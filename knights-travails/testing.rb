require_relative 'knight'
require_relative 'knights_travails'
start_square = [0, 0]
dir1 = [-2, 2]
dir2 = [-1, 1]

moves = [-2, -1, 1, 2]
p moves
p moves.permutation(2).to_a
puts "\n\n"

counter = 0
#  result = moves.permutation(2) do |c|
#   counter += 1
#   puts "counter: #{counter} | c: #{c}"
#  end
pos = [5, 5]
# method 1: permutation and reject
result = moves.permutation(2).reject { |move| move[0].abs == move[1].abs }
puts '-------'
p result.to_a


# method 2: product
result2 = dir1.product(dir2) + dir2.product(dir1)
puts '-------'
p result2.to_a

knight = Knight.new([5, 5])
p knight.possible_moves

test_travail = KnightsTravails.new([3, 3])
last_node = test_travail.travail
p "moves: #{last_node.moves}"

