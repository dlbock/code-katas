def chop(target, sorted_array)
  sorted_array.each_with_index do |item, i|
    return i if item == target
  end
  -1
end