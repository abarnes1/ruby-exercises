def fibs(count)
  output = []
  count += 1 #add one more because fibs(0) = 0
  count.times do |index|
    if index < 2
      output << index
    else
      output << output[index - 2] + output[index - 1]
    end
  end

  output
end

def fib_get_nums(count)
  return [0] if count.zero?
  return [0, 1] if count == 1

  output = fib_get_nums(count - 1)
  output << output[count-1] + output[count-2]
end