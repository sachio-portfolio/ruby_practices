### 仕様
# 10進数を16進数に変換するto_hexメソッドを定義
#   3つの整数を受け取り、それぞれを16進数に変換した文字列を返す。
#   文字列の先頭には"#"をつける
# 16進数を10進数に変換するto_intsメソッドを定義
#   RGBカラーを表す16進数文字列を受け取り、R,G,Bのそれぞれを10進数に変換した値を配列として返す

### 実行例
# to_hex(0, 0, 0) #=> '#000000'
# to_hex(255, 255, 255) #=> '#ffffff'
# to_hex(4, 60, 120) #=> '#043c78'
# to_ints('#000000') #=> [0, 0, 0]
# to_ints('#ffffff') #=> [255, 255, 255]
# to_ints('#043c78') #=> [4, 60, 120]

## to_hexメソッド
# to_sメソッドで16進数に変換
# rjustメソッドで第1引数の桁分、第2引数の文字を埋めてくれる
def to_hex(r, g, b)
  '#' +
  r.to_s(16).rjust(2, '0') +
  g.to_s(16).rjust(2, '0') +
  b.to_s(16).rjust(2, '0')
end

# DRYでないのでリファクタリング
def to_hex(r, g, b)
  hex = '#'
  [r, g, b].each do |n|
    hex += n.to_s(16).rjust(2, '0')
  end
  hex
end

# 便利メソッドを使ってさらにリファクタリング
def to_hex(r, g, b)
  [r, g, b].inject('#') do |hex, n|
    hex + n.to_s(16).rjust(2, '0')
  end
end


## to_intsメソッド
# 範囲オブジェクトで引数の文字列から3つの16進数を抜き出す
# 3つの16進数を配列に入れ、ループを回しながらhexメソッドで10進数の整数に変換した値を別の配列に詰め込む
def to_ints(hex)
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]
  ints = []
  [r, g, b].each do |s|
    ints << s.hex
  end
  ints
end

# 便利メソッドmapを使ってさらにリファクタリング
def to_ints(hex)
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]
  [r, g, b].map do |s|
    s.hex
  end
end

# 多重代入でリファクタリング
def to_ints(hex)
  r, g, b = hex[1..2], hex[3..4], hex[5..6]
  [r, g, b].map do |s|
    s.hex
  end
end

# 正規表現でリファクタリング
def to_ints(hex)
  hex.scan(/\w\w/).map do |s|
    s.hex
  end
end

# &:メソッド名でリファクタリング
def to_ints(hex)
  hex.scan(/\w\w/).map(&:hex)
end
