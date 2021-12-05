def accum(s)
	str = s.chars
  result = ""
  for i in 0..(str.size-1)
    result << (str[i].upcase) + (str[i].downcase * i ) + "-"
  end
  return result.chop
end
accum("abcd")


# BestPractices
# def accum(s)
#   s.chars.each_with_index.map{ |c, i| c.upcase + c.downcase * i }.join('-')
# end
#
# map/map!は、配列の要素の数だけブロック内の処理を実行し、作成された配列を返すメソッド
