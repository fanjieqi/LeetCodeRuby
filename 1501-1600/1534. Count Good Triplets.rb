# @param {Integer[]} arr
# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {Integer}
def count_good_triplets(arr, a, b, c)
  n, count = arr.size, 0
  (0..n-3).each do |i|
    (i+1..n-2).each do |j|
      next if (arr[i] - arr[j]).abs > a
      (j+1..n-1).each do |k|
        next if (arr[j] - arr[k]).abs > b
        next if (arr[i] - arr[k]).abs > c
        count += 1
      end
    end
  end
  count
end
