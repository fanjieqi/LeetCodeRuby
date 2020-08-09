# @param {Integer[]} nums
# @return {Integer}
def max_equal_freq(nums)
  hash, counts = {}, {}
  max = -1
  nums.each_with_index do |num, i|
    if counts[hash[num]]
      counts[hash[num]] -= 1
      counts.delete(hash[num]) if counts[hash[num]].zero?
    end
    hash[num] = hash[num].to_i + 1
    counts[hash[num]] = counts[hash[num]].to_i + 1
    if counts.size == 2
      c1, c2 = counts.keys.sort
      max = i if counts[c1] == 1 && c1 == 1 || (c2 - c1) == 1 && counts[c2] == 1
    elsif counts.size == 1 && (counts.keys.first == 1 || counts.values.first == 1)
      max = i
    end
  end
  max + 1
end
