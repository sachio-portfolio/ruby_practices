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

## 添え字付きの繰り返し処理
# each_with_indexメソッドはブロック引数の第2引数に添え字を渡す
fruits = ['apple', 'orange', 'melon']
fruits.each_with_index { |fruit, i| puts "#{i}: #{fruit}" }
#=> 0: apple
#=> 1: melon
#=> 2: orange

## with_indexメソッドを使った添え字付き繰り返し処理
# mapメソッドで繰り返し処理をしつつ添字も同時に取得
fruits.map.with_index { |fruit, i| puts "#{i}: #{fruit}" }
#=> 0: apple
#=> 1: melon
#=> 2: orange

# delete_ifメソッドとの組み合わせ
fruits.delete_if.with_index { |fruit, i| fruit.include?('a') && i.odd? } #=> ["apple", "melon"]

## 添え字を0以外の数値から開始させる
# with_indexメソッドに引数を渡すと引数で渡した数値から開始される
fruits = ['apple', 'orange', 'melon']
fruits.each.with_index(1) { |fruit, i| puts "#{i}: #{fruit}" }
#=> 1: apple
#=> 2: orange
#=> 3: melon
p fruits.map.with_index(10) { |fruit, i| "#{i}: #{fruit}" }
#=> ["10: apple", "11: orange", "12: melon"]
# each_with_indexには引数を渡せないので注意

## 配列がブロック引数に渡される場合
# 配列の配列に対して繰り返し処理を実行すると、ブロック引数に配列が渡ってくる
# 例) 縦の長さと横の長さを配列に格納し、それを複数用意した配列で面積を求める
dimensions = [[10, 20], [30, 40], [50, 60],]
areas = []
# ブロック引数が1つの場合、ブロック引数の値が配列になる
dimensions.each do |dimension|
  length = dimension[0]
  width = dimension[1]
  areas << length * width
end
p areas #=> [200, 1200, 3000]

# 配列の要素分だけブロック引数を用意すると、各要素の値が別々の変数に格納される
areas = []
dimensions.each do |length, width|
  areas << length * width
end
p areas #=> [200, 1200, 3000]

# ブロック引数が多すぎる場合、はみ出しているブロック引数はnilになる
areas = []
dimensions.each do |length, width, foo, bar|
  p [length, width, foo, bar]
end
#=> [10, 20, nil, nil]
#=> [30, 40, nil, nil]
#=> [50, 60, nil, nil]

# 配列の要素が3個あるのに、ブロック引数が2個しかない場合は3つ目は切り捨て
dimensions = [[10, 20, 100], [30, 40, 200], [50, 60, 300],]
areas = []
dimensions.each do |length, width|
  p [length, width]
end
#=> [10, 20]
#=> [30, 40]
#=> [50, 60]

# ブロック引数に*をつけると、そのブロック引数に余った分が全て配列として格納される
areas = []
dimensions.each do |length, *width|
  p [length, width]
end
#=> [30, [40, 200]]
#=> [50, [60, 300]]
#=> [10, [20, 100]]

# each_with_indexのように元からブロック引数を2つ受け取る場合
# ブロック引数を()で囲むと、配列の要素を別々の引数として受け取ることができる
dimensions = [[10, 20], [30, 40], [50, 60],]
areas = []
dimensions.each_with_index do | (length, width), i |
  puts "length: #{length}, width: #{width}, i: #{i}"
end
#=> length: 10, width: 20, i: 0
#=> length: 30, width: 40, i: 1
#=> length: 50, width: 60, i: 2

## ブロックローカル変数
# ブロック引数を;で区切り、続けて変数を宣言すると、ブロック内でのみ有効な独立したローカル変数を宣言することができる
numbers = [1, 2, 3, 4]
sum = 0
# ブロックの外にあるsumとは別物の変数sumを用意する
numbers.each do | n; sum |
  sum = 10
  sum += n
  puts sum #=> 11  12  13  14
end
# ブロックに中で使っていたsumは別物なので、ブロックの外のsumには変化がない
p sum #=> 0

## 繰り返し処理以外でも使用されるブロック
# テキストファイルに文字列を書き込むなど
# 例) sample.txtを開いて文字列を書き込む
File.open("./sample.txt", "w") do |file|
  file.puts("1行目のテキストです。")
  file.puts("2行目のテキストです。")
  file.puts("3行目のテキストです。")
end
# Rubyの File.openメソッドとブロックを組み合わせると、オープンするだけでなく、「必ずクローズする」という処理までFile.openメソッドがやってくれる

## do...endと{}の結合度の違い
# 例) 配列のdeleteメソッドにはブロックを渡すと引数で指定した値が見つからない場合の戻り値を指定できる
a = [1, 2, 3]
a.delete(100) #=> nil
a.delete(100) do
  'NG'
end #=> "NG"
# 引数の()を外して記述した場合
a.delete 100 do
  'NG'
end #=> "NG"  これは動く
# a.delete 100 { 'NG' }
#=> syntax error, unexpected '{', expecting end-of-input
# エラーになる 100 { "NG" } と解釈されるため
a.delete (100) { 'NG' } #=> "NG"  引数を()で囲めば動く

## ブロックの後ろに別のメソッドを続けて書く(メソッドチェーン)
# 例) 名前の配列をmapメソッドで全部「さん付け」にし、最後に「と」で連結
names = ['田中', '鈴木', '佐藤']
san_names = names.map { |name| name + 'さん'}
san_names.join('と')
p san_names #=> ["田中さん", "鈴木さん", "佐藤さん"]
# ブロックの後ろに.をかけば、mapの戻り値に対して直接joinメソッドを呼び出せる
san_names = names.map { |name| name + 'さん'}.join('と')
p san_names #=> "田中さんと鈴木さんと佐藤さん"
# endの後ろに.をつけてメソッドを呼び出すこともできる
san_names = names.map do |name|
  "#{name}さん"
end.join('と')
p san_names #=> "田中さんと鈴木さんと佐藤さん"
