# @param {Integer[]} a
# @return {Integer}
def longest_arith_seq_length(a)
  hash, max = [], 0
  (1..a.size-1).each do |i|
    hash[i] ||= {}
    (0..i-1).each do |j|
      diff = a[i] - a[j]
      hash[i][diff] = hash.dig(j, diff).to_i + 1
      max = hash[i][diff] if hash[i][diff] > max
    end
  end
  max + 1
end
