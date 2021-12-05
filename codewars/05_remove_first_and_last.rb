def remove_char(s)
  s[1..-2]　
end
# str[f..-1] は「f 文字目から文字列の最後まで」を表す慣用句

# # BestPractice
# def remove_char(s)
#   s[1...-1]
# end
# rangeオブジェクトが終端を含まない場合の書き方
