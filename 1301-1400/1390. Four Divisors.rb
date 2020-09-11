require 'prime'

# @param {Integer[]} nums
# @return {Integer}
def sum_four_divisors(nums)
  nums.inject(0) do |sum, num|
    divisors = num.prime_division
    if divisors.size == 2 && divisors[0][1] == 1 && divisors[1][1] == 1
      sum += divisors[0][0] + divisors[1][0] + 1 + num
    elsif divisors.size == 1 && divisors[0][0] != num && divisors[0][1] == 3
      sum += divisors[0][0] + num / divisors[0][0] + 1 + num
    else
      sum
    end
  end
end
