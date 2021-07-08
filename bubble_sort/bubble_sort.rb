# > bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]
numbers = [4,3,9,57,1,11,78,2,0,2,9]
words = ["pizza", "milk", "milkshake", "eyeballs", "pancakes"]

def bubble_sort(numbers)
  sorted = Array.new(numbers)

  max_passes = sorted.length - 1
  pass = 1

  until pass > max_passes do
    sorted[0..-pass].each_index do |index| #only deal with items not yet sorted

      unless index == sorted[0..-pass].length - 1 #stop on last item as nothing left to compare
        #switch items if left > right
        if sorted[index] > sorted[index + 1]
          temp = sorted[index]
          sorted[index] = sorted[index + 1]
          sorted[index + 1] = temp
        end
      end
    end

    pass += 1
  end

  sorted
end

puts "unsorted: #{numbers}"
puts "sorted: #{bubble_sort(numbers)}"
puts ""
puts "unsorted: #{words}"
puts "sorted: #{bubble_sort(words)}"


