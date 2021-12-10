### メソッドの定義
# Rubyは最後に評価された式がメソッドの戻り値になる
# return は不要
# return はメソッドを途中で脱出する場合に使うことが多い
def greeting(country)
  return 'countryを入力してください' if country.nil?
  if country == 'japan'
    'こんにちは'
  elsif country == 'us'
    'Hello'
  elsif country == 'italy'
    'ciao'
  else
    '???'
  end
end
puts greeting(nil)
puts greeting('japan')

# fizzbuzz問題
# ３で割り切れる数値のときは、"Fizz"と返す
# ５で割り切れる数値のときは、"Buzz"と返す
# １５で割り切れる数値のときは、"FizzBuzz"と返す
# それ以外の数値は、その数値を文字列で返す
def fizzbuzz(n)
  if n % 15 == 0
    'FizzBuzz'
  elsif n % 3 == 0
    'Fizz'
  elsif n % 5 == 0
    'Buzz'
  else
    "#{n}"
  end
end
puts fizzbuzz(1)
puts fizzbuzz(3)
puts fizzbuzz(5)
puts fizzbuzz(15)
puts fizzbuzz(20)


### デフォルト値付きの引数
def greeting(country)
  if country == 'japan'
    'こんにちは'
  else
    'hello!'
  end
end
# Rubyではメソッドを呼び出す際に引数の過不足があるとエラーになる
# 引数が少ない場合
# puts greeting #=> wrong number of arguments (given 0, expected 1) (ArgumentError)
# 引数が多い場合
# puts greeting('japan', 'us') #=> wrong number of arguments (given 2, expected 1) (ArgumentError)
# 引数にデフォルト値を設定すると引数なしで呼び出してもエラーにならない
def greeting(country = 'japan') # 引数なしの場合はcountryにjapanを設定する
  if country == 'japan'
    'こんにちは'
  else
    'hello!'
  end
end
puts greeting #=> 'こんにちは'

# デフォルト値ありとデフォルト値なしの引数を混在さ焦ることも可能
def default_args(a, b, c = 0, d = 0)
  "a=#{a}, b=#{b}, c=#{c}, d=#{d}"
end
puts default_args(1, 2) #=> a=1, b=2, c=0, d=0
puts default_args(1, 2, 3) #=> a=1, b=2, c=3, d=0
puts default_args(1, 2, 3, 4) #=> a=1, b=2, c=3, d=4

# デフォルト値は固定の値だけでなく、動的に変わるat値や他のメソッドの戻り値を指定することもできる
# 例) システム日時や他のメソッドの戻り値をデフォルト値に指定する
def foo(time = Time.now, message = bar)
  "time: #{time}, message: #{message}"
end
def bar
  'BAR'
end
puts foo #=> time: 2021-12-10 17:35:11 +0900, message: BAR

### ? で終わるメソッド
# 真偽値を返すメソッド
# 空文字であればtrue、そうでなければfalse
puts ''.empty? #=> true
puts 'abc'.empty? #=> false

# 引数の文字列が含まれていればtrue、そうでなければfalse
puts 'watch'.include?('at') #=> true
puts 'watch'.include?('in') #=> false

# 奇数ならtrue、偶数ならfalse
puts 1.odd? #=> true
puts 2.odd? #=> false

# 偶数ならtrue、奇数ならfalse
puts 1.even? #=> false
puts 2.even? #=> true

# オブジェクトがnilであればtrue、そうでなければfalse
puts nil.nil? #=> true
puts 'abc'.nil? #=> false

# ? でおわるメソッドは自分で定義することもできる
# 3 の倍数ならtrue、そうでないならfalse
def multiple_of_three?(num)
  num % 3 == 0
end
puts multiple_of_three?(4) #=> false
puts multiple_of_three?(5) #=> false
puts multiple_of_three?(6) #=> true

### ! で終わるメソッド
# 使用する際には注意が必要という意味でつける
# 破壊的メソッドの場合が多い
a = 'ruby'
puts a.upcase #=> RUBY
puts a #=> ruby
puts a.upcase! #=> RUBY
puts a #=> RUBY
# ! でおわるメソッドは自分で定義することもできる
# 引数で渡された文字列を逆順に並び替え大文字に変更する破壊的メソッド
def reverse_upcase!(str)
  str.reverse!.upcase!
end
puts reverse_upcase!('ruby') #=> YBUR
