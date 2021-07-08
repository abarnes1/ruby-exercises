require_relative 'merge_sort'

a = [4, 3, 5, 1, 2]
merge_sort(a)

b = []
20.times {b << rand(1..100)}
p b
p merge_sort(b)