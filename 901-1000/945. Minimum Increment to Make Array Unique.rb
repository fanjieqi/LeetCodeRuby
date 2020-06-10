# @param {Integer[]} a
# @return {Integer}
def min_increment_for_unique(a)
  a.sort!
  hash, max, sum = {}, a[0], 0
  a.each do |num|
    if hash[num].nil?
      hash[num] = true
      max = num
    else
      max += 1
      hash[max] = true
      sum += max - num
    end
  end
  sum
end
