MAX = 1 << 31

def subarraySum(nums, k)
  sum, result = 0, 0
  hash = {0 => 1}

  nums.each do |num|
    sum += num
    result += hash[sum-k].to_i
    hash[sum] = hash[sum].to_i + 1
  end

  result
end

# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Integer}
def num_submatrix_sum_target(matrix, target)
  m, n = matrix.size, matrix[0].size
  array, result = [], 0

  (0..n-1).each do |i|
    array = []
    (i..n-1).each do |j|
      (0..m-1).each do |k|
        array[k] = array[k].to_i + matrix[k][j]
      end
      result += subarraySum(array, target)
    end
  end

  result
end
