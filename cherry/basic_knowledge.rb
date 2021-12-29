### ガベージコレクション(GC)
# Rubyは使用されなくなったオブジェクトを回収し、自動的にメモリを解放する
# このためメモリ管理をする必要がない

### エイリアスメソッド
# Rubyには全く同じメソッドに複数の名前がついている場合がある。
# 好みでしっくりくる方を選んで良い
# 例) Stringクラスの lengthメソッドと、sizeメソッド
# どちらも文字数を返す
puts 'hello'.length #=> 5
puts 'hello'.size #=> 5

### 式(Expression)と文(Statement)
# 式 = 値を返し、結果を変数に代入できるもの
# 文 = 値を返さず、変数に代入しようとすると構文エラーになるもの

### 擬似変数
# nil 、 true 、 false
# self オブジェクト自身
# __FILE__ 現在のソースファイル名
# __LIME__ 現在のソースファイル中の行番号
# __ENCODING__ 現在のソースファイルのスクリプトエンコーディング
# 擬似編集は文法上、変数のように見えますが、代入できない
# puts true = 1 #=> Can't assign to true

### 参照の概念
# Rubyの変数はオブジェクトそのものではなく、オブジェクトへの参照が格納されている。
# 変数をほかの変数に代入したり、メソッドの引数として渡すと、新しい変数のメソッドの引数は元の変数と同じオブジェクトを参照する
# aとbはどちらも同じ文字列だが、オブジェクトとしては別物
a = 'hello'
b = 'hello'
puts a.object_id #=> 60
puts b.object_id #=> 80
# cにbを代入すると、bとcはどちらも同じオブジェクト
c = b
puts c.object_id #=> 80
# メソッドの引数にcを渡すと、引数として受け取ったdはb、cと同じオブジェクト
def m(d)
  d.object_id
end
puts m(c) #=> 80
# equal?メソッドを使って同じオブジェクトかどうか確認しても良い(trueなら同じオブジェクト)
puts a.equal?(b) #=> false
puts b.equal?(c) #=> true
# 同じオブジェクトを参照している場合、オブジェクトの状態が変更されると、その変更がそのまま各変数に影響する
def m!(d)
  d.upcase!
end
puts m!(b)
puts b
puts c
# aは別のオブジェクトなので大文字にならない
puts a

### loadでのライブラリやファイルの読み込み
# require はセキュリティ上の脆弱性につながるためNG
# loadは毎回無条件に指定したファイルを読み込む
# load './sample' #=> true
# load './sample' #=> true

### require_relativeでのファイル読み込み
# 自分のファイルが存在するディレクトリパスの起点になる(相対パス)

### putsメソッド、 printメソッド、 pメソッド
# putsメソッドは改行を加えて変数の内容やメソッドの戻り値を出力
# putsメソッド自身の戻り値は nil になる
irb(main):001:0> puts 123
123
=> nil
# printメソッドは改行を加えない
irb(main):002:0> print 123
123=> nil
# pメソッドはputsメソッドと同じように改行を加えて出力
# ただし文字列を出力するとダブルクウォートで囲まれる
# pメソッドの戻り値は引数で渡されたオブジェクトそのもの
irb(main):003:0> p 123
123
=> 123
# 改行文字をそれぞれのメソッドに渡した場合
irb(main):004:0> s = "abc\ndef"
=> "abc\ndef"
irb(main):005:0> puts s
abc
def
=> nil
irb(main):006:0> print s
abc
def=> nil
irb(main):007:0> p s
"abc\ndef"
=> "abc\ndef"
# 配列を渡した場合
irb(main):008:0> a = [1, 2, 3]
=> [1, 2, 3]
irb(main):009:0> puts a
1
2
3
=> nil
irb(main):010:0> print a
[1, 2, 3]=> nil
irb(main):011:0> p a
[1, 2, 3]
=> [1, 2, 3]
# ハッシュを渡した場合
irb(main):011:0> h = {a: 1, b: 2, c: 3}
=> {:a=>1, :b=>2, :c=>3}
irb(main):012:0> puts h
{:a=>1, :b=>2, :c=>3}
=> nil
irb(main):013:0> print h
{:a=>1, :b=>2, :c=>3}=> nil
irb(main):014:0> p h
{:a=>1, :b=>2, :c=>3}
=> {:a=>1, :b=>2, :c=>3}


### よく使われるイディオム

## メソッド定義時の引数の順番
# メソッドの引数にはたくさんの種類があるが、これらを組み合わせてメソッドを定義する場合、その種類ごとに並ぶ順番が決まっているので注意
・通常の引数
・デフォルト値付きの引数
・可変長引数(1つだけ)
・通常の引数
・キーワード引数
・**を使った任意キーワード引数(1つだけ)
・&を使ったブロックを受け取る引数(1つだけ)

## 条件分岐で変数に代入 / &.演算子(ぼっち演算子)
# 変数への代入と条件分岐を同時に実現するイディオム
# 例) 国名に応じて通貨を大文字にして返す(該当する通貨がなければnil)
def find_currency(country)
  currencies = { japan: 'yen', us: 'dollar', india: 'rupee'}
  currencies[country]
end
def show_currency(country)
  currency = find_currency(country)
  if currency
    currency.upcase
  end
end
puts show_currency(:japan) #=> YEN
puts show_currency(:brazil) #=> nil
# ↓ ↓ ↓
# Rubyでは変数への代入自体が戻り値を持つため、次のようにif文の中で直接変数に代入することも可能
def show_currency_2(country)
  currency = find_currency(country)
  # 条件分岐で直接変数に代入(値が取得できれば真、できなければ偽)
  if currency = find_currency(country)
    currency.upcase
  end
end
# ↓ ↓ ↓
# nilかもしれないオブジェクトに対して安全にメッソッドを呼び出したい場合、Ruby2.3から登場した&.(ぼっち演算子)を使うこともできる
# &.を使ってメソッドを呼び出すと、メソッドを呼び出されたオブジェクトがnilでない場合はその結果を、nilだった場合はnilを返却する
def show_currency_2(country)
  currency = find_currency(country)
  # currencyがnilの場合を考慮して、&.演算子でメソッドを呼び出す
  currency&.upcase
end

## ||= を使った自己代入
# Rubyでは以下のようなコードをよく見かける
limit ||= 10
# このコードは変数limitがnilかfalseであれば、10を代入する
# それ以外はlimitの値をそのまま使うという意味
limit = nil
limit ||= 10
limit #=> 10
limit = 20
limit ||= 10
limit #=> 20
# なぜ上記のようになるか展開するとよくわかる
limit = limit || 10

## !!を使った真偽値の型変換
# 確実にtrueまたはfalseを返すイディオム
# Rubyではnilまたはfalseであれば偽、それ以外は真
# 自分で?で終わるメソッドを定義する際に、確実にtrueまたはfalseだけを返すようにしたいと思った場
# 例) データベースなどからユーザを探す(なければnil)
def userr_exists?
  user = find_user
  if user
    true
  else
    false
  end
end
# ↓ ↓ ↓
# 上記のコードをコンパクトに書くと...
def userr_exists?
  !!find_user
end
# !は否定の演算子
# falseにつけるとtrueに、trueにつけるとfalseになる
irb(main):008:0> !false
=> true
irb(main):009:0> !true
=> false
# 否定演算子を2つつけると元のオブジェクトに対する真偽値を得ることができる
irb(main):001:0> !!true
=> true
irb(main):002:0> !!1
=> true
irb(main):003:0> !!false
=> false
irb(main):004:0> !!nil
=> false
irb(main):005:0> !!'a'
=> true
