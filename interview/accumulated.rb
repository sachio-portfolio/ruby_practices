# 問題: 以下のRubyプログラムで、accumulateメソッドを利用して、与えられた配列の要素の平方和（それぞれの要素を二乗した値の合計）を計算するsum_of_squareメソッドを定義せよ。

def accumulate(init, list, &block)
  if list.empty?
    init
  else
    block.call(list[0], accumulate(init, list[1..-1], &block))
  end
end

# def sum_of_squares(list)
#   i = list.length
#   i.times do |n|
#     squares << accumulate(list, { |n| n ** 2 } )
#   end
#   squares.sum
# end

# def sum_of_squares(list)
#   accumulate(list, list.sum(0.0){ |e| e ** 2 } )
# end



puts sum_of_squares([1, 2, 3, 4, 5]) # 1 ** 2 + 2 ** 2 + ... = 55

# &blockという引数を宣言すると、ブロックがblock変数に代入される
# そして、block.callメソッドを呼ぶと、ブロックの処理が実行される

# 上記メソッドを使わない場合
# def sum_of_squares(list)
#   squares = list.map{|n| n ** 2}
#   squares.sum
# end

# def sum_of_squares(list)
#   list.sum(0){|n| n ** 2}
# end
