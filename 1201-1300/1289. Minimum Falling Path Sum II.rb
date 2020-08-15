MAX = 1 << 31
# @param {Integer[][]} arr
# @return {Integer}
def min_falling_path_sum(arr)
  n, m = arr.size, arr[0].size
  (1..n-1).each do |i|
    (0..m-1).each do |j|
      min = MAX
      (0..m-1).each do |k|
        min = arr[i-1][k] if k != j && arr[i-1][k] < min
      end
      arr[i][j] += min
    end
  end
  arr[-1].min
end
