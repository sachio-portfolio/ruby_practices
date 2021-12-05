def even_or_odd(number)
  if number.to_i =~ /^[0-9]+$/
    if number.even?
      "Even"
    else
      "Odd"
    end
  end
end
even_or_odd(3)

<!-- Best practice
def even_or_odd(number)
  number.even? ? "Even" : "Odd"
end %> -->
