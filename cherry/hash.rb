### ハッシュ
# キーと値を組み合わせてデータを管理するオブジェクトのこと
# 他の言語では、連想配列やディクショナリ(辞書)、マップと呼ばれたりする
# { キー1: 値1, キー2: 値2}

## 要素の追加・変更・削除

# 後から新しいキーと値を追加する場合
# 例) ハッシュ['キー'] = 値
currensies = {'japan' => 'yen', 'us' => 'dollar'}
# イタリアを追加する
currensies['italy'] = 'euro'
puts currensies #=> {"japan"=>"yen", "us"=>"dollar", "italy"=>"euro"}

# すでにキーが存在する場合は、値が上書きされる
currensies['japan'] = '円'
puts currensies #=> {"japan"=>"円", "us"=>"dollar", "italy"=>"euro"}

# ハッシュから値を取り出す場合
# 例) ハッシュ['キー']
# アメリカの値を取得
p currensies['us'] #=> "dollar"
# 存在しないキーを指定するとnilが返却される
p currensies['india'] #=> nil


## ハッシュを使った繰り返し処理
# eachメソッドを使うと、キーと値の組み合わせを順に取り出すことができる
# ブロック引数がキーと値で2個になることに注意
currensies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
currensies.each do |key, value|
  puts "#{key} : #{value}"
end
#=> japan : yen
#   us : dollar
#   india : rupee

# ブロック引数を1つにするとキーと値が配列に格納される
currensies.each do |key_value|
  key = key_value[0]
  value = key_value[1]
  p key_value
  puts "#{key} : #{value}"
end
#=> ["japan", "yen"]
#   japan : yen
#   ["us", "dollar"]
#   us : dollar
#   ["india", "rupee"]
#   india : rupee

## ハッシュの同値比較、要素数の取得、要素の削除
# == でハッシュ同士を比較すると、同じハッシュかチェックできる
# このとき全てのキーと値が同じであればtrueが返却される
a = { 'x' => 1, 'y' => 2, 'z' => 3}
b = { 'x' => 1, 'y' => 2, 'z' => 3}
puts a == b # => true

# 並び順が異なっていてもキーと値が全て同じならtrue
c = { 'z' => 3, 'y' => 2, 'x' => 1 }
puts a == c # => true

# キー'x'の値が異なるのでfalse
d = { 'x' => 10, 'y' => 2, 'z' => 3}
puts a == d # => false

## 要素数の取得
# sizeメソッド、またはlengthメソッドで要素の数を取得できる
currensies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
puts currensies.size #=> 3

## 要素の削除
# deleteメソッドを使うと指定したキーに対応する要素を削除できる
# この時戻り値は削除された要素の値
puts currensies.delete('japan') #=> yen
puts currensies #=> {"us"=>"dollar", "india"=>"rupee"}
# deleteメソッドでは指定したキーがない場合nilが返却される
p currensies.delete('italy') #=> nil


### シンボル
## シンボルはコロンに続けて任意の名前を定義する(シンボルリテラル)
# 例) :シンボルの名前

## シンボルと文字列の違い
:japan.class #=> Symbol シンボルはSymbolクラス
'japan'.class #=> String 文字列はStringクラス

# シンボルはRubyの内部で整数として管理される
# そのため2つの値が同じかどうか調べる場合、文字列よりも高速に処理できる
'apple' == 'apple'
:apple == :apple

# シンボルは「同じシンボルであれば全く同じオブジェクトである」
# このため「大量の同じ文字列」と「大量の同じシンボル」を作成した場合、
# シンボルの方がメモリの使用効率が良い
puts 'apple'.object_id #=> 60
puts 'apple'.object_id #=> 80
puts 'apple'.object_id #=> 100

puts :apple.object_id  #=> 1044188
puts :apple.object_id  #=> 1044188
puts :apple.object_id  #=> 1044188

# シンボルはイミュータブルなオブジェクト
# 破壊的な変更はできないため、誰かによって勝手に変更されては困る名前という用途に向いている
string = 'apple'
puts string.upcase! #=> APPLE

symbol = :apple
# puts symbol.upcase! #=> undefined method `upcase!' for :apple:Symbol (NoMethodError)

## シンボルの特徴
# 表面上は文字列っぽいので、プログラマにとって理解しやすい
# 内部的には整数なので、コンピュータは高速に値を比較できる
# 同じシンボルが同じオブジェクトであるため、メモリの使用効率が良い
# イミュータブルなので、勝手に値が変えられる心配がない

## シンボルのおもな用途
# シンボルがよく使われるのは、ソースコード上では名前を識別できるようにしたいが、
# その名前が必ずしも文字列である必要のない場合
# 例) ハッシュのキー (文字列よりも高速に値を取り出せる)
currensies = { japan: 'yen', us: 'dollar', india: 'rupee' }
puts currensies #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}
