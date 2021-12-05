# 問題: 標準入力から一行ずつ読み込み、奇数行だけを出力するプログラムを書け。

# 入力例:
# foo
# bar
# baz
# quux
# quuux

# 出力例:
# foo
# baz
# quuux

line = readlines
row = line.length
n = 0
while n < row
  if n.odd?
    n += 1
  else
    puts line[n].chomp
    n += 1
  end
end


# readlines
#   複数行を配列として読み取る
# ["foo", "bar", "baz", "quux", "quuux"]
# odd?
#   奇数であればTRUE 奇数でない場合FALSE
# chomp
#   改行コードを取り除いた文字列を返す
