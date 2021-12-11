### RSpecの場合
require_relative '../cherry/lib/fizz_buzz'

RSpec.describe 'Fizz Buzz' do
  example 'fizz_buzz' do
    expect(fizz_buzz(1)).to eq '1'
    expect(fizz_buzz(2)).to eq '2'
    expect(fizz_buzz(3)).to eq 'Fizz'
    expect(fizz_buzz(4)).to eq '4'
    expect(fizz_buzz(5)).to eq 'Buzz'
    expect(fizz_buzz(15)).to eq 'FizzBuzz'
  end
end

# 実行結果
# $ bundle exec rspec

# Randomized with seed 45473

# Fizz Buzz
#   fizz_buzz

# Top 1 slowest examples (0.00244 seconds, 33.9% of total time):
#   Fizz Buzz fizz_buzz
#     0.00244 seconds ./spec/fizz_buzz_spec.rb:5

# Finished in 0.00721 seconds (files took 0.11938 seconds to load)
# 1 example, 0 failures

# Randomized with seed 45473
