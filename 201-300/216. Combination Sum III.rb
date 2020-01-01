# @param {Integer} k
# @param {Integer} n
# @return {Integer[][]}
def combination_sum3(k, n)
  (1..9).to_a.combination(k).select {|nums| nums.sum == n}
end
