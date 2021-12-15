### 範囲(Range)
# 範囲オブジェクトはRangeクラスのオブジェクト
# 最初の値..最後の値(最後の値を含む)
# 最初の値...最後の値(最後の値を含まない)
(1..5).class #=> Range
(1...5).class #=> Range
# ..と...の違いは最後の値を含むかどうか
puts (1..5).include?(4.999) #=> true
puts (1..5).include?(5) #=> true
puts (1...5).include?(4.9999) #=> true
puts (1...5).include?(5) #=> false

## 範囲オブジェクトの使用例
# 添え字の代わりに範囲オブジェクトを渡すと、指定した範囲の配列や文字列の一部を抜き出すことができる
a = [1, 2, 3, 4, 5]
p a[1..3] #=> [2, 3, 4]
a = 'abcde'
p a[1..3] #=> "bcd"

# n以上m以下、n以上m未満の判定をする
# <や>=のような記号よりも範囲オブジェクトを使う方がシンプルに書ける
# 例) 0度以上100度未満であれば液体、と判定する
# 不等号を使う場合
def liquid?(temperature)
  0 <= temperature && temperature < 100
end
puts liquid?(-1) #=> false
puts liquid?(0) #=> true
puts liquid?(99) #=> true
puts liquid?(100) #=> false
# 範囲オブジェクトを使う場合
def liquid?(temperature)
  (0...100).include?(temperature)
end
puts liquid?(-1) #=> false
puts liquid?(0) #=> true
puts liquid?(99) #=> true
puts liquid?(100) #=> false

# case文と組み合わせる
# 例) 年齢に応じて料金を判定する
def charge(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..18
    600
  else
    1000
  end
end
puts charge(3) #=> 0
puts charge(12) #=> 300
puts charge(16) #=> 060
puts charge(25) #=> 1000

## 値が連続する配列を作成する
p (1..5).to_a #=> [1, 2, 3, 4, 5]
p (1...5).to_a #=> [1, 2, 3, 4]
p ('a'..'e').to_a #=> ["a", "b", "c", "d", "e"]
p ('a'...'e').to_a #=> ["a", "b", "c", "d"]
p ('bad'..'bag').to_a #=> ["bad", "bae", "baf", "bag"]
p ('bad'...'bag').to_a #=> ["bad", "bae", "baf"]
# []の中に*を書いて配列を作成することもできる(splat展開)
p [*1..5] #=> [1, 2, 3, 4, 5]
p [*1...5] #=> [1, 2, 3, 4]

## 繰りし処理を行う
# 範囲オブジェクトを配列に変換すれば、配列として繰り返し処理を行うことができる
numbers = (1..4).to_a
sum = 0
numbers.each { |n| sum += n }
p sum #=> 10
# 配列に変換しなくても簡易オブジェクトに直接eachメソッドを呼び出すこともできる
sum = 0
(1..4).each { |n| sum += n }
p sum #=> 10
# stepメソッドを呼び出すと、値を増やす間隔を指定できる
numbers = []
(1..10).step(2) { |n| numbers << n }
p numbers #=> [1, 3, 5, 7, 9]
