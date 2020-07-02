# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def min_k_bit_flips(a, k)
  cur, ans = 0, 0
  (0..a.size-1).each do |i|
    cur -= 1 if i >= k && a[i-k] == 2
    if (cur % 2) == a[i]
      return -1 if i + k > a.size
      a[i] = 2
      cur += 1
      ans += 1
    end
  end
  ans
end
