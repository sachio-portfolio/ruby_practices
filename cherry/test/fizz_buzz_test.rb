### Minitestの場合
require 'minitest/autorun'
require_relative '../lib/fizz_buzz'

class FizzbuzzTest < Minitest::Test
  def test_fizz_buzz
    assert_equal '1', fizz_buzz(1)
    assert_equal '2', fizz_buzz(2)
    assert_equal 'Fizz', fizz_buzz(3)
    assert_equal '4', fizz_buzz(4)
    assert_equal 'Buzz', fizz_buzz(5)
    assert_equal 'Fizz', fizz_buzz(6)
    assert_equal 'FizzBuzz', fizz_buzz(15)
  end
end

# 実行結果
# Run options: --seed 47701

# # Running:

# .

# Finished in 0.001185s, 843.8819 runs/s, 5907.1730 assertions/s.

# 1 runs, 7 assertions, 0 failures, 0 errors, 0 skips



### test-unitの場合
require 'test/unit'
require_relative '../lib/fizz_buzz'

class FizzbuzzTest < Test::Unit::TestCase
  def test_fizz_buzz
    assert_equal '1', fizz_buzz(1)
    assert_equal '2', fizz_buzz(2)
    assert_equal 'Fizz', fizz_buzz(3)
    assert_equal '4', fizz_buzz(4)
    assert_equal 'Buzz', fizz_buzz(5)
    assert_equal 'Fizz', fizz_buzz(6)
    assert_equal 'FizzBuzz', fizz_buzz(15)
  end
end

# 実行結果
# Loaded suite test/fizz_buzz_test
# Started
# .
# Finished in 0.000736 seconds.
# ------------------------------------------------------------------------------------------------------------------------------------------------------------
# 1 tests, 7 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
# 100% passed
# ------------------------------------------------------------------------------------------------------------------------------------------------------------
# 1358.70 tests/s, 9510.87 assertions/s
