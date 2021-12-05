# １〜３０までの数字を表示する
# ３で割り切れる数値のときは、"Fizz"と返す
# ５で割り切れる数値のときは、"Buzz"と返す
# １５で割り切れる数値のときは、"FizzBuzz"と返す
# それ以外の数値は、その数値を文字列で返す

(1..30).each do |n|
  if n % 15 == 0
    puts 'FizzBuzz'
  elsif n % 3 == 0
    puts 'Buzz'
  elsif n % 5 == 0
    puts 'Fizz'
  else
    puts n
  end
end
