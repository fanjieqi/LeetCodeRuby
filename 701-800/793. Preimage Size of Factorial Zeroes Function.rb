# @param {Integer} k
# @return {Integer}
def preimage_size_fzf(k)
  sum = [1]
  (1..12).each { |i| sum[i] = sum[i-1]*5+1 }
  12.downto(0) do |i|
    return 0 if (k == 5 * sum[i])
    k %= sum[i]
  end
  5
end
