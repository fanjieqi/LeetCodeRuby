# @param {Integer[]} nums
# @return {String}
def optimal_division(nums)
  nums = nums.map(&:to_f)
  max, min = [], []
  nums.each_with_index do |num, i|
    max[i] ||= []
    min[i] ||= []
    max[i][i] = nums[i].to_s
    min[i][i] = nums[i].to_s
  end
  n = nums.size
  
  (1..n-1).each do |m|
    (0..n-m-1).each do |i|
      j = i+m
      (i..j-1).each do |k|
        tmp = [
          [max[i][k], max[k+1][j]],
          [max[i][k], min[k+1][j]],
          [min[i][k], max[k+1][j]],
          [min[i][k], min[k+1][j]],
        ]
        tmp.each do |t|
          dividend, divisor = t
          expr = dividend + "/" + (k+1 == j ? divisor : "(#{divisor})")
          max[i][j] = expr if max[i][j].nil? || eval(expr) > eval(max[i][j])
          min[i][j] = expr if min[i][j].nil? || eval(expr) < eval(min[i][j])
        end
      end
    end
  end
  max[0][n-1].gsub(".0", "")
end
