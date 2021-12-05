def is_square(x)
  x > -1 && (Math.sqrt(x) % 1).zero?
end

# Math.sqrt(n) は引数の平方根を返す


# Best practices
# def is_square(x)
#   x < 0 ? false : Math.sqrt(x) % 1 == 0
# end
