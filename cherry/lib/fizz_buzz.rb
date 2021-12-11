### FizzBuzz問題
# ３で割り切れる数値のときは、"Fizz"と返す
# ５で割り切れる数値のときは、"Buzz"と返す
# １５で割り切れる数値のときは、"FizzBuzz"と返す
# それ以外の数値は、その数値を文字列で返す

# １〜３０までの数字を表示する場合
# (1..30).each do |n|
#   if n % 15 == 0
#     puts 'FizzBuzz'
#   elsif n % 3 == 0
#     puts 'Fizz'
#   elsif n % 5 == 0
#     puts 'Buzz'
#   else
#     puts n
#   end
# end

def fizz_buzz(n)
  if n % 15 == 0
    'FizzBuzz'
  elsif n % 3 == 0
    'Fizz'
  elsif n % 5 == 0
    'Buzz'
  else
    n.to_s
  end
end
# puts fizzbuzz(1)
# puts fizzbuzz(3)
# puts fizzbuzz(5)
# puts fizzbuzz(15)
# puts fizzbuzz(20)
