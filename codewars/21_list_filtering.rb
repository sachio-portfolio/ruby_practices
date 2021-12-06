# In this kata you will create a function that takes a list of non-negative integers and strings and returns a new list with the strings filtered out.

# Sample
# filter_list([1,2,'a','b']) == [1,2]
# filter_list([1,'a','b',0,15]) == [1,0,15]
# filter_list([1,2,'aasf','1','123',123]) == [1,2,123]

def filter_list(l)
  l.select {|n| n.is_a?(Integer) }
end

# is_a?(mod)
# オブジェクトが指定されたクラス mod か
# そのサブクラスのインスタンスであるとき真を返す


# BestPractices
# def filter_list(l)
#   l.reject { |x| x.is_a? String }
# end

# def filter_list(l)
#   l.grep(Numeric)
# end

# Numericは数値を表す抽象クラス。
# IntegerやFloatはNumericのサブクラス
