### 配列
# 異なるデータ型を格納することもできる
a = [1, 'apple', 2, 'orange', 3, 'melon']
# 配列の中に配列を含めることもできる
a = [[10, 20, 30],[40, 50, 60],[70, 80, 90]]

## 要素の変更、追加、削除
# 添え字を指定して値を代入すると要素を変更できる
a = [1, 2, 3]
p a[1] #=> 2
a[1] = 20
p a #=> [1, 20, 3]
# 存在しない要素を否定してもエラーにならずnilが返る
a = [1, 2, 3]
p a[4] #=> nil
# 元の大きさよりも大きい添字をすると、間の値がnilで埋められる
a[4] = 50
p a #=> [1, 2, 3, nil, 50]
# << を使うと配列の最後に要素を追加できる
a = []
a << 1
a << 2
a << 3
p a #=> [1, 2, 3]
# 配列の特定の位置にある要素を削除したい場合はdelete_atメソッドを使う
a.delete_at(1)
p a #=> [1, 3]
# 存在しない添え字を指定するとnilが返る
a.delete_at(100)
p a #=> [1, 3]

## 配列を使った変数への多重代入
# 多重代入
a, b = 1, 2
puts a #=> 1
puts b #=> 2
# 右辺に配列を使って多重代入
a, b = [1, 2]
puts a #=> 1
puts b #=> 2
# 右辺の数が少ない場合nilが入る
c, d = [10]
puts c #=> 10
puts d #=> nil
# 右辺の数が多い場合ははみだした値が切り捨てられる
e, f = [100, 200, 300]
puts e #=> 100
puts f #=> 200
# divmodメソッドは商と余りを配列で返す
p 14.divmod(3) #=> [4,2]
# 戻り値を配列のまま受け取る
quo_rem = 14.divmod(3)
puts "商=#{quo_rem[0]}, 余り=#{quo_rem[1]}"
  #=> 商=4, 余り=2
# 多重代入で別ベルの変数をして受け取る
quotient, remainder = 14.divmod(3)
puts "商=#{quotient}, 余り=#{remainder}"
  #=> 商=4, 余り=2


### ブロック
# ブロックはメソッドの引数として渡すことができる処理のかたまり
# ブロック内で記述した処理は必要に応じてメソッドから呼び出される

## Rubyの繰り返し処理
# 他言語のFor文の動きはeachメソッドで配列自身に繰り返しを命令する
# 配列の要素を順番に取り出す作業はeachメソッドで行い、
# その要素をどう扱うかはブロックに記述する
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum += n
end
puts sum #=> 10
# n はブロック引数と呼ばれ、eachメソッドから渡された配列の要素が入る
# ブロック引数はに自由に設定できる(i, number, element… )
# ブロック引数を使わない場合はブロック引数自体を省略できる

# Rubyでは「要件を問わず共通する処理」はメソッド自身に、
# 「要件によって異なる処理」はブロックにそれぞれ分担させて1つの処理を完了させるメソッドが数多くある
# 例) 配列の要素を削除する条件を自由に指定
# 指定した値に一致する配列の要素を削除するdeketeメソッド
a = [1, 2, 3, 1, 2, 3]
a.delete(2)
p a #=> [1, 3, 1, 3]
# 奇数だけ削除するを実現させるにはdelete_if
a = [1, 2, 3, 1, 2, 3]
a.delete_if do |n|
  n.odd?
end
p a #=> [2, 2]
# delete_ifメソッドで「配列の要素を順番に取り出す」と
# 「ブロックの戻り値が真であれば要素を削除する」と言いう共通処理を行う
# 「どの要素を削除したいのか」はブロックに処理を委ねる

# ブロック内では自由にRubyのコードが書ける
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n
  sum += sum_value
end
puts sum #=> 64
# ブロック内で定義した変数のスコープはブロック内部のみとなる
# puts sum_value #=> undefined local variable or method `sum_value' for main:Object (NameError)

# ブロック引数をブロックの外にある変数と同じ名前にすると、
# ブロック内ではブロック引数の値が優先して参照される(シャドーイング)
numbers = [1, 2, 3, 4]
sum = 0
sum_value = 100
numbers.each do |sum_value|
  sum += sum_value
end
puts sum #=> 10
# 読み手が混乱するので避ける

## do ... end と {}
# Rubyは文法上改行しなくてもブロックはあ動作する
# 例) numbers.each do |n| sum += n end
# しかし読みにくいのでその場合{}で囲む
# 例) numbers.each { |n| sum += n }

# ・改行を含む長いブロックを書くときは do ... end
# ・1行でコンパクトに書きたいときは {}


### ブロックを使う配列のメソッド

## map/collect
# map/collectメソッドは各要素に対してブロックを評価した結果を新しい配列にして返却
# 例) 配列の各要素を10倍した新しい配列を作る
numbers = [1, 2, 3, 4, 5]
new_numbers = []
numbers.each { |n| new_numbers << n * 10 }
p new_numbers #=> [10, 20, 30, 40, 50]
# mapメソッドで置き換え
new_numbers = numbers.map { |n| n * 10 }
p new_numbers #=> [10, 20, 30, 40, 50]
# 空の配列を用意して、他の配列をループ処理した結果を空の配列につmけ込んでいくような処理のた大半はmapメソッドに置き換えることができる

## select/find_all/reject
# select/find_allメソッドは各要素に対してブロックを評価し、その戻り値が真の要素を集めた配列を返却
# 例) 偶数の数値だけ集めた配列を新たに作成
numbers = [1, 2, 3, 4, 5, 6]
even_numbers = numbers.select { |n| n.even? }
p even_numbers #=> [2, 4, 6]

# rejectメソッドはselectメソッドの反対
# 各要素に対してブロックを評価し、その戻り値が真の要素を除外した配列を返却
odd_numbers = numbers.reject { |n| n.even? }
p odd_numbers #=> [1, 3, 5]

## find/detect
# find/detectメソッドはブロックの戻り値が真になった最初の要素を返却
even_numbers = numbers.find { |n| n.even? }
p even_numbers #=> 2

## inject/reduce
# inject/reduceメソッドは畳み込み演算を行う
# 例) 1から4までの値を変数sumに加算
numbers = [1, 2, 3, 4]
sum = 0
numbers.each { |n| sum += n }
puts sum
# injectメソッドで置き換え
numbers = [1, 2, 3, 4]
sum = numbers.inject(0) { |result, n| result + n }
puts sum
# ブロックの第一引数のresultmには初回のみinjectメソッドの引数０が入る
# 2回目以降は前回のブロックの戻り値が入る
# 繰り返し処理が最後まで終わると、ブロックの戻り値がinjectメソッドの戻り値になる
# 例2) 文字列に対してinjectメソッドを使った場合
string = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
week =string.inject('Sun') { |result, s| result + s}
puts week #=> SunMonTueWedThuFriSat

### & とシンボルを使ってもっと簡潔に書く
# メソッドにブロックの代わりに 「 &:メソッド名 」という引数を渡すことで簡潔にできる
# 条件① ブロック引数が1こだけ
# 条件② ブロックの中で呼び出すメソッドには引数がない
# 条件③ ブロックの中では、ブロック引数に対してメソッドを一回呼び出す以外の処理がない
# 例1)
p ['ruby', 'java', 'perl'].map {|s| s.upcase } #=> ["RUBY", "JAVA", "PERL"]
# &:メソッドに置き換え
p ['ruby', 'java', 'perl'].map(&:upcase) #=> ["RUBY", "JAVA", "PERL"]

# 例2)
p [1, 2, 3, 4, 5, 6].select { |n| n.odd? } #=> [1, 3, 5]
# &:メソッドに置き換え
p [1, 2, 3, 4, 5, 6].select(&:odd?) #=> [1, 3, 5]

# 以下の場合&:メソッド名は使えない
# ブロックの中でメソッドではなく演算子を使っている
p [1, 2, 3, 4, 5, 6].select { |n| n % 3 == 0} #=> [3, 6]
# ブロックの中のメソッドで引数を渡している
p [9, 10, 11, 12].map { |n| n.to_s(16) } #=> ["9", "a", "b", "c"]
# ブロックの中で複数の処理を実行している
string = [1, 2, 3, 4].map do |n|
  m = n * 4
  m.to_s
end
p string #=> ["4", "8", "12", "16"]


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
