def square_digits num
  num.digits.reverse.map{ |n| n ** 2 }.join.to_i
end


# ダメだった方法
# def square_digits num
  # num.to_s.map(&:to_i){ |n| n ** 2 }.join.to_i
# end

# ↓↓ これならこうする
# def square_digits num
  # num.to_s.map{ |n| n.to_i ** 2 }.join.to_i
# end
