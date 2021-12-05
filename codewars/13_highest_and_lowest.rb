def high_and_low(numbers)
  i = numbers.split.map!(&:to_i)
  i.max.to_s + " " + i.min.to_s
end

# BestPractices
# def high_and_low(numbers)
#   numbers.split.map(&:to_i).minmax.reverse.join(' ')
# end
