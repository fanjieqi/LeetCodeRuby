# @param {Integer[]} time
# @return {Integer}
def num_pairs_divisible_by60(time)
  hash = (0..time.size-1).group_by { |i| time[i] % 60 }
  sum = 0
  (0..time.size-1).each do |i|
    need = (60 - time[i] % 60) % 60
    k = hash[need].to_a.bsearch_index { |j| j > i }
    sum += k ? (hash[need].size - k) : 0
  end
  sum
end
