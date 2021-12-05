def positive_sum(arr)
  arr.each_with_object([]) { |num, posi| posi << num if num.positive? }.sum
end
