### 文字列
name = 'Alice'
puts "Hello, #{name}!" #=> Hello, Alice! 式展開
puts 'Hello, ' + name + '!' #=> Hello, Alice! +演算子で文字列連結

# 機能を打ち消したい場合前にバックスラッシュ
puts "Hello, \#{name}!" #=> Hello, #{name}!
# シングルクウォートの中にシングルクウォート
puts 'He said, "Don\'t speak."'  #=> He said, "Don't speak."
# ダブルクウォートの中にダブルクウォート
puts "He said, \"Don't speak.\""  #=> He said, "Don't speak."

# 文字列中でバックスラッシュの後に記述する文字によっては特別な意味を持たせる事ができる
# \t #=> タブ \n #=> 改行 など
puts "シ\n"
puts "\tン\n"
puts "\t\tジ\n"
puts "\t\t\tラ\n"
puts "\t\t\t\tレ\n"
puts "\t\t\t\t\tナ\n"
puts "\t\t\t\t\t\t〜\n"
puts "\t\t\t\t\t\t\tイ"
# シ
#        ン
#                ジ
#                        ラ
#                                レ
#                                        ナ
#                                                〜
#                                                        イ

# 文字列の比較
puts 'ruby' == 'ruby' #=> true
puts 'ruby' == 'Ruby' #=> false
puts 'ruby' != 'perl' #=> true
puts 'ruby' != 'ruby' #=> false

# %記法で文字列を作る
# シングルクウォートやダブルクウォートをエスケープする必要がない
# 区切り文字は ! ? ^ など任意の記号も使える
# 区切り文字が < { ( [ の場合は終わりの区切り文字が対応するとじかっこ になる

# %q! ! はシングルクウォートと同じ
puts %q!He said , "Don't speak."! #=> He said , "Don't speak."
# %Q! ! はダブルクウォートと同じ
something = 'Hello.'
puts %Q!He said , "#{something}"! #=> He said , "Hello."
# %! ! はダブルクウォートと同じ
something = 'Bye.'
puts %!He said , "#{something}"! #=> He said , "Bye."
# ? を区切り文字として使う
puts %q?He said , "Don't speak."? #=> He said , "Don't speak."
# {} を区切り文字として使う
puts %q{He said , "Don't speak."} #=> He said , "Don't speak."

# ヒアドキュメント(行指向文字列リテラル)
# 複数行に渡る長い文字列を作成する場合
a = <<TEXT
#{name}さんへ
これはヒアドキュメントです。
複数行に渡る長い文字列を作成するのに便利です。
TEXT

puts a
#=> Aliceさんへ
#=> これはヒアドキュメントです。
#=> 複数行に渡る長い文字列を作成するのに便利です。

# 開始ラベルの <<識別子 は1つの式としてみなされるため
# メソッドの引数として渡したり、<<識別子 に対してメソッドを呼び出せる

a = 'Ruby'
a.prepend(<<TEXT)
Java
PHP
TEXT
puts a
#=> Java
#=> PHP
#=> Ruby


b = <<TEXT.upcase
Hello,
Good-bye,
TEXT
puts b
#=> HELLO,
#=> GOOD-BYE,

# フォーマットを指定して文字列を作成
# sprintf メソッド、もしくは
# "フォーマット文字列 % 表示したいオブジェクト" の形式で書く

# 例) 小数点第三位まで数字を表示する文字列を作成する
puts sprintf('%0.3f', 1.2) #=> 1.200
puts '%0.3f' % 1.2 #=> 1.200
puts sprintf('%0.3f + %0.3f', 1.2, 0.48) #=> 1.200 + 0.480
puts '%0.3f + %0.3f' % [1.2, 0.48] #=> 1.200 + 0.480

# そのほかの文字列作成方法
# 数値を文字列に変換
puts 123.to_s #=> 123
# 配列を連結して文字列にする
puts [10, 20, 30].join #=> 102030
# *演算子を使って文字列を繰り返す
puts 'Hi!' * 5 #=> Hi!Hi!Hi!Hi!Hi!
# String.newを使って新しい文字列を作る
puts String.new('hello') #=> hello
# ダブルクウォートと\uを組み合わせてUnicodeのコードポイントから文字列を作成
puts "\u3042\u3044\u3046" #=> あいう
