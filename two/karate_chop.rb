#iterative version
# def chop(target, sorted_array)
#   sorted_array.each_with_index do |item, i|
#     return i if item == target
#   end
#   -1
# end

#binary search version
def chop(target, sorted_array)
  binary_search(target, sorted_array, 0, sorted_array.count - 1)
end

def binary_search(target, sorted_array, from, to)
  return -1 if to < 0
  return -1 if from > to && sorted_array[to] != target
  return to if from > to && sorted_array[to] == target

  mid = (from + to) / 2

  if target < sorted_array[mid]
    return binary_search(target, sorted_array, from, mid-1)
  elsif target > sorted_array[mid]
    return binary_search(target, sorted_array, mid+1, to)
  else
    return mid
  end
end