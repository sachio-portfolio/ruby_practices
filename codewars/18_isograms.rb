def is_isogram(string)
  string.chars.size == string.downcase.chars.uniq.size ? true : false
end

# BestPractices
# def is_isogram(string)
#   string.downcase.chars.uniq == string.downcase.chars
# end





1
