# 予約語
BEGIN	class	ensure	nil	self	when
END	def	false	not	super	while
alias	defined?	for	or	then	yield
and	do	if	redo	true	__LINE__
begin	else	in	rescue	undef	__FILE__
break	elsif	module	retry	unless	__ENCODING__
case	end	next	return	until

クラス名、変数名には使えない
ただし$ @ @@といった接頭辞がついたものは予約語としてみなされない
defのあとやメソッド呼びだしのピリオドなど、メソッド名であることが明白である場所ではメソッド名として使える


# 同じ動作をするメソッド
* Array
slice []
  指定したインデックスの要素を返す。
length size
  要素の数を返します。
map collect
  要素の数だけ繰り返しブロックを実行し、ブロックの戻り値を集めた配列を作成
find detect
  ブロックを評価して、最初に真となる要素を返す。
find_all select
  与えられたブロックを評価した結果の配列を返す。
delete_if reject!
  ブロックに要素を渡し、その評価が真になった要素を全て取り除き、自分自身を返す。


* Hash
merge! update
  自分自身と引数で指定されたハッシュを統合する。
length size
  要素の数を返します。
has_key? include? key? member?
  ハッシュが key をキーとして持つ時真を返します。
has_value? value?
  ハッシュが value を値として持つ時真を返します。値の一致判定は == で行われます。
each each_pair
  ハッシュのキーと値を引数としてブロックを評価します。
delete_if reject!
  ブロックを評価した結果が、真になる値を取り除く。


# ！のつかない破壊的メソッド
* String
<<
  文字列の末尾に引数で指定された要素を追加します。
[]=
  []内で指定した位置の要素を右辺で置き換えます。
clear
  文字列を空文字列に変えます。
concat
  文字列の末尾に引数で指定された要素を追加します。
prepend
  文字列の先頭に引数で指定された要素を追加します。
insert
  第一引数で指定した場所に第二引数で指定した要素を加えます。
replace
  引数で指定した要素と置き換えます。
setbyte
  第一引数で指定されたインデックスにある要素のバイト数を置き換える。

* Array
<<
  要素を末尾に追加します。
[]=
  []内で指定した位置の要素を右辺で置き換えます。
clear
  array内から全ての要素を削除します。
concat
  引数で指定した配列を末尾に連結します。
delete
  引数で指定した要素をarray内から削除します。
delete_at
  引数で指定したインデックスに該当する要素をarray内から削除します。
delete_if
  ブロックで渡した条件に該当する要素をarray内から削除します。
fill
  arrayを引数で指定した要素で埋め尽くします。
insert
  第一引数で指定したインデックス番号の要素の前に第二引数で指定した要素を挿入します。インデックス番号が負の場合は直後に挿入。
keep_if
  要素の数だけ繰り返しブロックを実行し、ブロックの戻り値が真になった要素を残し、偽になった要素を削除します。
pop
    arrayの末尾の要素を削除します。
push
  要素を末尾に追加します。
replace
  引数で指定したarrayと置き換えます
shift
  arrayの先頭の要素を削除します。
unshift
  arrayの先頭に要素を追加します。

* Hash
[]=
  ハッシュにキーkeyと値valのペアを追加します。keyのキーがすでにあれば、そのキーの値をvalに変更します。
clear
  キーと値をすべて削除し、ハッシュを空にします。
delete
  ハッシュから引数keyと同じキーを探して、キーと値を削除します。
delete_if
  与えられたブロックの戻り値が真になったキーと値を削除します。(ブロック引数key、valにはキーと値が入ります。)
replace
  ハッシュの内容を引数で与えられたhashと置き換えます。
store
  ハッシュにキーkeyと値valのペアを追加します。keyのキーがすでにあれば、そのキーの値をvalに変更します。(Hash#[]=のエイリアス)
update
  レシーバhashの末尾に引数で与えられたhashの内容を加えます。
keep_if
  繰り返しブロックを実行し、ブロックの戻り値が真になったキーと値を残し、偽になったものを削除します。
shift
  ハッシュの先頭からキーと値を1組削除します。(削除したキーと値を配列にして返します。)
