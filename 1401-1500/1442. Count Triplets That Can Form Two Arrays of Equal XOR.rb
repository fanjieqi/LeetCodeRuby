# @param {Integer[]} arr
# @return {Integer}
def count_triplets(arr)
  n, count = arr.size, 0
  (0..n-2).each do |i|
    a = 0
    (i+1..n-1).each do |j|
      a ^= arr[j-1]
      b = 0
      (j+1..n).each do |k|
        b ^= arr[k-1]
        count += 1 if a == b
      end
    end
  end
  count
end
