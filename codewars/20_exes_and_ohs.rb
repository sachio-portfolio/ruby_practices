def XO(str)
  str = str.downcase
  x = str.scan('x').length
  o = str.scan('o').length
  if (x - o) == 0
    true
  else
    false
  end
end


# Best Practices
# def XO(str)
#   str.downcase.count('x') == str.downcase.count('o')
# end

# def XO(str)
#   str.count('Xx') == str.count('oO')
# end
