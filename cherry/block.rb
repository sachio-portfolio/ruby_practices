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
# ブロックの第一引数のresultには初回のみinjectメソッドの引数０が入る
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
