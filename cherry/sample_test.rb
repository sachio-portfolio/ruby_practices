### Minitestを使ったテスト自動化

## 検証メソッド
# aがbと等しければパス
# assert_equal b, a
# aが真であればパス
# assert a
# aが偽であればパス
# refute a

require 'minitest/autorun'

# class SampleTest < Minitest::Test
#   def test_sample_01
#     assert_equal 'RUBY', 'ruby'.upcase
#   end
# end
# testがパスした場合の実行結果
# $ ruby sample_test.rb
# Run options: --seed 20446

# # Running:

# .

# Finished in 0.001828s, 547.0460 runs/s, 547.0460 assertions/s.

# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

# class SampleTest < Minitest::Test
#   def test_sample_02
#     assert_equal 'RUBY', 'ruby'.capitalize
#   end
# end
# testが失敗した場合の実行結果
# $ ruby sample_test.rb                                                                                             [21/12/11 12:21]
# Run options: --seed 33738

# # Running:

# F

# Finished in 0.001402s, 713.2668 runs/s, 713.2668 assertions/s.

#   1) Failure:
# SampleTest#test_sample [sample_test.rb:15]:
# Expected: "RUBY"
#   Actual: "Ruby"

# 1 runs, 1 assertions, 1 failures, 0 errors, 0 skips

class SampleTest < Minitest::Test
  def test_sample_03
    assert_equal 'RUBY', nil.upcase
  end
end
# 実行中にエラーが発生し検証できなかった場合の実行結果
# $ ruby sample_test.rb                                                                                             [21/12/11 12:25]
# Run options: --seed 34884

# # Running:

# E

# Finished in 0.001050s, 952.3810 runs/s, 0.0000 assertions/s.

#   1) Error:
# SampleTest#test_sample_03:
# NoMethodError: undefined method `upcase' for nil:NilClass
#     sample_test.rb:54:in `test_sample_03'

# 1 runs, 0 assertions, 0 failures, 1 errors, 0 skips
