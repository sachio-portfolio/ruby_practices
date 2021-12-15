### 配列

# 異なるデータ型を格納することもできる
a = [1, 'apple', 2, 'orange', 3, 'melon']
# 配列の中に配列を含めることもできる
a = [[10, 20, 30],[40, 50, 60],[70, 80, 90]]

## 要素の変更、追加、削除
# 添え字を指定して値を代入すると要素を変更できる
a = [1, 2, 3]
p a[1] #=> 2
a[1] = 20
p a #=> [1, 20, 3]
# 存在しない要素を否定してもエラーにならずnilが返る
a = [1, 2, 3]
p a[4] #=> nil
# 元の大きさよりも大きい添字をすると、間の値がnilで埋められる
a[4] = 50
p a #=> [1, 2, 3, nil, 50]
# << を使うと配列の最後に要素を追加できる
a = []
a << 1
a << 2
a << 3
p a #=> [1, 2, 3]
# 配列の特定の位置にある要素を削除したい場合はdelete_atメソッドを使う
a.delete_at(1)
p a #=> [1, 3]
# 存在しない添え字を指定するとnilが返る
a.delete_at(100)
p a #=> [1, 3]

## 配列を使った変数への多重代入
# 多重代入
a, b = 1, 2
puts a #=> 1
puts b #=> 2
# 右辺に配列を使って多重代入
a, b = [1, 2]
puts a #=> 1
puts b #=> 2
# 右辺の数が少ない場合nilが入る
c, d = [10]
puts c #=> 10
puts d #=> nil
# 右辺の数が多い場合ははみだした値が切り捨てられる
e, f = [100, 200, 300]
puts e #=> 100
puts f #=> 200
# divmodメソッドは商と余りを配列で返す
p 14.divmod(3) #=> [4,2]
# 戻り値を配列のまま受け取る
quo_rem = 14.divmod(3)
puts "商=#{quo_rem[0]}, 余り=#{quo_rem[1]}"
  #=> 商=4, 余り=2
# 多重代入で別ベルの変数をして受け取る
quotient, remainder = 14.divmod(3)
puts "商=#{quotient}, 余り=#{remainder}"
  #=> 商=4, 余り=2

## 添え字を2つ使うと添え字の位置と取得する長さを指定することができる
