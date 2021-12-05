def get_middle(s)
  arr = s.chars
  arr.length.to_i.even? ? (arr[(arr.length / 2) -1 ] + arr[(arr.length / 2) ]) : arr[(arr.length / 2).ceil]
end

# 下記のif分を三項演算子に
# def get_middle(s)
#   arr = s.chars
#   if arr.length.to_i.even?
#     (arr[(arr.length / 2) -1 ] + arr[(arr.length / 2) ])
#   else
#    arr[(arr.length / 2).ceil]
#   end
# end

# Best Practices
# def get_middle(s)
#   s[(s.size-1)/2..s.size/2]
# end
