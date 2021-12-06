# Simple, given a string of words, return the length of the shortest word(s).

# String will never be empty and you do not need to account for different data types.

# find_short("bitcoin take over the world maybe who knows perhaps"), 3
# find_short("turns out random test cases are easier than writing out basic ones"), 3
# find_short("lets talk about javascript the best language"), 3
# find_short("i want to travel the world writing code one day"), 1
# find_short("Lets all go on holiday somewhere very cold"), 2
# find_short("Let's travel abroad shall we"), 2


def find_short(s)
  words = s.split(' ').map{ |w| w.length }
  order = words.sort{ |a, b| a.to_i <=> b.to_i }
  l = order.shift
  return l
end

# split
# 第 1 引数 sep で指定されたセパレータによって文字列を limit 個まで分割し、結果を文字列の配列で返す

# map{ |item| ... }
# 各要素に対してブロックを評価した結果を全て含む配列を返す

# sort
# 配列の内容をソートする
# 要素同士の比較は <=> 演算子を使って行う
# 破壊的メソッド

# shift
# 配列の先頭の要素を取り除いてそれを返す


# BestPractices
# def find_short(s)
#   s.split.map(&:size).min
# end

# array.map(&:method)
# 配列の要素１つ１つに(&:メソッド名) で与えられたメソッドを呼んでいる
# Rubyが引数内で&を見つけるとその値をプロック(proc)として扱おうとし、その値(この場合:size)に対してto_procメソッドを呼ぶ

# min / min(n)
# 最小の要素、もしくは最小の n 要素が昇順で入った配列を返す
