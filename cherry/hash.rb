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
currensies = { :japan => 'yen', :us => 'dollar', :india => 'rupee' }
puts currensies #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

## ハッシュのキーにシンボルを使う場合、=> を使わずに "シンボル: 値" という記法でハッシュを作成できる
currensies = { japan: 'yen', us: 'dollar', india: 'rupee' }
puts currensies #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}
# 値を取り出すときは同じ
puts currensies[:us] #=> dollar

# キーも値もシンボルの場合
currensies = { japan: :yen, us: :dollar, india: :rupee }
# 上のハッシュは下のハッシュと同じ意味
currensies = { :japan => :yen, :us => :dollar, :india => :rupee }

## シンボルを作成する様々な方法
# コロン(:)に続けて、変数名やクラス名、メソッド名の識別子として有効な文字列を書く
# 例)
:apple
:Apple
:ruby_is_fun
:okay?
:welcome!
:_secret
:$dollar
:@at_mark
# 識別子として無効な文字を使うとエラーになる
# 但し、下記の場合もシングルクウォートで囲むとシンボルとして有効
# :12345 # 数値
# :ruby-is-fun # ハイフン
# :ruby is fun # スペース
# :() # 記号
# ダブルクウォートを使うと式展開を使うことができる
name = 'Alice'
:"#{name.upcase}"

# %記法でシンボルやシンボルの配列を作る
# シンボルを作成する場合は%s
p %s!ruby is fun! #=> :"ruby is fun"
p %s(ruby is fun) #=> :"ruby is fun"
# シンボルの配列を作成する場合には%iを使う
p %i(apple orange melon) #=> [:apple, :orange, :melon]

# 改行を含めたり式展開する場合は%Iを使う
p %I(hello\ngood-by #{name.upcase}) #=> [:"hello\ngood-by", :ALICE]

## シンボルと文字列の関係
# シンボルと文字列は見た目は似ていても別物
'apple' == :apple #=> false
# 但し、to_symメソッド(internメソッド)を使うと文字列をシンボルに変換できる
p 'apple'.to_sym #=> :apple
# 反対にto_sメソッド(id2name)でシンボルを文字列に変換できる
p :apple.to_s #=> "apple"

# メソッドによっては文字列とシンボルを同等に扱うものもある
# 例) respond_to?メソッド
# オブジェクトに対して、文字列またはシンボルで指定した名前のメソッドを呼びさせるかどうかを調べることができる
puts 'apple'.respond_to?('include?') #=> true
puts 'apple'.respond_to?(:include?) #=> true
# しかし、一般的には同等に扱わないケースの方が多い
puts 'apple'.include?('pp') #=> true
puts 'apple'.include?(:pp) #=> `include?': no implicit conversion of Symbol into String (TypeError)

# ハッシュに格納する値は異なるデータ型が混在するケースもよくある
person = {
  name: 'Alice', # 値が文字列
  age: 20, # 値が数値
  friends: ['Bob', 'Carol'], # 値が配列
  phones: { home: '1234-0000', mobile: '5678-0000'}  # 値がハッシュ
}
p person[:name] #=> "Alice"
p person[:age] #=> 20
p person[:friends] #=> ["Bob", "Carol"]
p person[:phones] #=> {:home=>"1234-0000", :mobile=>"5678-0000"}

## メソッドのキーワード引数とハッシュ
# メソッドに引数を渡す場合、どの引数がどんな意味を持つのかが分かりづらい時がある
# そういうケースではメソッドのキーワード引数を使うと可読性が上がる
# 例)
# def メソッド名(キーワード引数1: デフォルト値1)
#   メソッドの処理
# end
def buy_burger(menu, drink: true, potato: true)
  if drink && potato
    puts "#{menu}バーガーとドリンクとポテトを購入"
  elsif drink
    puts "#{menu}バーガーとドリンクを購入"
  elsif potato
    puts "#{menu}バーガーとポテトを購入"
  end
end
# キーワード引数を使う場合
buy_burger('cheese', drink: true, potato: true) #=> cheeseバーガーとドリンクとポテトを購入
buy_burger('fish', drink: false, potato: true) #=> fishバーガーとポテトを購入
buy_burger('ebi', drink: true, potato: false) #=> ebiバーガーとドリンクを購入
# キーワード引数にはデフォルト値が設定されているので、引数を省略できる
buy_burger('cheese') #=> cheeseバーガーとドリンクとポテトを購入
# キーワード引数は呼び出し時に自由に順番を入れ替えできる
buy_burger('fish', potato: false, drink: true) #=> fishバーガーとドリンクを購入
# 存在しないキーワードを呼び出した場合はエラーになる
# buy_burger('ebi', salada: true, potato: false) #=> `buy_burger': unknown keyword: :salada (ArgumentError)
# キーワード引数のデフォルト値は省略することもできる
# その場合、呼び出し時に省略できない
# def buy_burger(menu, drink:, potato:)
#   # 省略
# end
# buy_burger('ebi', potato: false) #=> `buy_burger': missing keywords: :drink, :potato (ArgumentError)

### ハッシュで使用頻度の高いメソッド
## keys
# keysメソッドはハッシュのキーを配列として返す
currencies = { japan: 'yen', us: 'dollar', india: 'rupee'}
p currencies.keys #=> [:japan, :us, :india]

## values
# valuesメソッドはハッシュの値を配列として返す
p currencies.values #=> ["yen", "dollar", "rupee"]

## has_key? / key? / include? / member?
# これらのメソッドはハッシュの中に指定されたキーが存在するかどうか確認するメソッド
p currencies.has_key?(:japan) #=> true

## **ででハッシュを展開できる
h = { us: 'dollar', india: 'rupee'}
h2 = { japan: 'yen', **h }
p h2 #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}
# mergeメソッドでも同じ結果になる
h2 = { japan: 'yen' }.merge(h)
p h2 #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

## 擬似キーワード引数のコード例
# 昔から引き継いでいるコードはこういう書き方になっているかも
# def buy_burger(menu, options = {})
#   drink = options[:drink]
#   potato = options[:potato]
#   # 省略
# end
# buy_burger('cheese', drink: true, potato: true) #=> cheeseバーガーとドリンクとポテトを購入

## 任意のキーワードを受け取る
# **をつけた引数を最後に用意する
# **をつけた引数にはキーワード引数で指定されたいないキーワードがハッシュとして格納れる
def buy_burger(menu, drink: true, potato: true, **others)
  puts others
end
buy_burger('fish', drink: true, potato: false, salada: true, chicken: false) #=> {:salada=>true, :chicken=>false}

## 最後の引数がハッシュであればハッシュリテラルの{}を省略できる
# 上記のように。。。

## ハッシュから配列、配列からハッシュ
# ハッシュに対してto_a メソッドを使うと配列に変換できる
# キーと値が1つの配列に入り、さらにそれが複数並ぶ多次元配列になる
currencies = { japan: 'yen', us: 'dollar', india: 'rupee'}
p currencies.to_a #=> [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]

# 配列に対してto_hメソッドを使うとハッシュに変換できる
p [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]].to_h #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

# ハッシュとして解析不能な配列に対してto_hメソッドを使うとエラーになる
# p [1, 2, 3, 4].to_h #=> `to_h': wrong element type Integer at 0 (expected array) (TypeError)

# キーが重複した場合は最後に登場した配列の要素がハッシュの値に変換される
p [[:japan, 'yen'], [:japan, '円']].to_h #=> {:japan=>"円"}

## Hash[array]で作成する
# Ruby2.1より前はキーと値のペアの配列をHash[]に渡していた
array = [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
p Hash[array] #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

# キーと値が交互に並ぶフラットな配列をsplat展開しても良い
array = [:japan, "yen", :us, "dollar", :india, "rupee"]
p Hash[*array] #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

## ハッシュの初期値を理解する
# ハッシュに対して存在しないキーを指定するとnilが返却される
h = {}
p h[:foo] #=> nil
# nil以外の値を返したい時は、Hash.newでハッシュを作成し、引数に初期値となる値を指定する
h = Hash.new('hello')
p h[:foo] #=> "hello"
# 配列の初期値と同様、newの引数として初期値を設定した場合、初期値として毎回同じオブジェクトが返却される
# 初期値に破壊的な変更を適用すると、他の要素の値も一緒に変わってしまう
h = Hash.new('hello')
a = h[:foo] #=> "hello"
b = h[:bar] #=> "hello"
# aとbは同一オブジェクト
puts a.object_id #=> 120
puts b.object_id #=> 120
puts a.equal?(b) #=> true

# 変数aに破壊的な変更を適用すると、変数bの値も変わってしまう
a.upcase!
puts a #=> HELLO
puts b #=> HELLO
# ちなみにハッシュ自身は空のまま
puts h #=> {}

# 文字列や配列など、ミュータブルなオブジェクトを初期値として返す場合
# Hash.newとブロックを組み合わせて初期値を返すと全て違うオブジェクトになる
h = Hash.new { 'hello' }
a = h[:foo] #=> "hello"
b = h[:bar] #=> "hello"
# aとbは異なるオブジェクト
puts a.object_id #=> 140
puts b.object_id #=> 160
puts a.equal?(b) #=> false
# 変数aに破壊的な変更を適用しても、変数bの値は変化しない
a.upcase!
puts a #=> HELLO
puts b #=> hello
# ちなみにハッシュ自身は空のまま
puts h #=> {}

# Hash.newにブロックを与えると、ブロック引数としてハッシュ自身と見つからなかったキーが渡される
# このブロックを使って、ハッシュにキーと初期値も同時に設定するコードもよく使われる
h = Hash.new { |hash, key| hash[key] = 'hello' }
p h[:foo] #=> "hello"
p h[:bar] #=> "hello"
# ハッシュにキーと値が追加されている
p h #=> {:foo=>"hello", :bar=>"hello"}
