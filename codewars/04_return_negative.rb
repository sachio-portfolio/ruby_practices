def makeNegative(num)
  if num.positive?
    -num
  else
    num
  end
end

# Best Practices
# def makeNegative(num)
#   -num.abs
# end

# .abs は整数を取得するメソッド
