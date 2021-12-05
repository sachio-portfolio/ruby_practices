def summation(num)
  sum = 0
  for i in 1..num
    sum = sum + i
  end
  return sum
end


# Best practice
# def summation(num)
#   (1..num).reduce(:+)
# end
#
# def summation(num)
#   num * (num + 1) / 2
# end
#
# def summation(num)
#   (1..num).sum
# end
