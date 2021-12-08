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
