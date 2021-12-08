### 真偽値と条件分岐
# Rubyの真偽値
# false または nil であれば 偽
# それ以外は全て 真
# 例) true 0 1 -1 'true' 'false' ''

# Rubyのif文
# if文が戻り値を返すので puts や return は不要
# 戻り値を変数に代入することもできる
country = 'italy'
greeting =
  if country == 'japan'
    'こんにちは'
  elsif country == 'us'
    'Hello'
  elsif country == 'italy'
    'ciao'
  else
    '???'
  end

puts greeting

# 後置if(if修飾子)
# 例) 1日であればポイント5倍
point = 7
day = 1
if day == 1
  point *= 5
end
puts point
point = 7
point *= 5 if day = 1 # 1行でかける
puts point

### && や || の戻り値と評価をs終了するタイミング
# && や || を使った場合、式全体の戻り値は必ずしも true または false とは限らない
# Rubyは式全体が真または偽であることが確定するまで左辺から順にしきを評価する
# 条件分岐のif文のように真または偽のどちらかでかまわなあいケースには有効
puts 1 && 2 && 3 #=> 3    全て評価する必要があったため、最後の式である3が戻り値
puts 1 && nil && 3 #=> nil    2つ目のnilの時点で式全体の真偽値が偽であることが確定したため、そこで評価を終えてnilを返している
puts 1 && false && 3 #=> false

puts nil || false #=> false
puts false || nil #=> nil
puts nil || false || 2 || 3 #=> 2    2を評価した時点で式全体の真偽値が真であることが確定したため2を返している

### 優先度が低い and、 or、 not
# &&  || と比べて優先度が低いため全く同じように扱えない
# 条件分岐ではなく、制御フローに使うのに適している

## and の使用例
# 下記は同じ意味『 正常なuserであればそのusermにmailを送る 』
# user.valid? && send_mail_to(user)
# user.valid? and send_mail_to user

## or の使用例
def greeting(country)
  country or return 'countryを入力してください'
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
