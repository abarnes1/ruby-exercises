def merge_sort(array)
  #base case: array of 1 item can't be split and is sorted
  return array if array.length == 1

  #otherwise split into left/right
  left = array.slice!(0, array.length / 2)
  right = array

  left = merge_sort(left)
  right = merge_sort(right)

  sorted = []

  until left.length.zero? && right.length.zero?
    if right[0].nil?
      sorted << left.slice!(0)
    elsif left[0].nil?
      sorted << right.slice!(0)
    else
      lower = (left[0] < right[0]) ? left.slice!(0) : right.slice!(0)
      sorted << lower
    end
  end

  sorted
end