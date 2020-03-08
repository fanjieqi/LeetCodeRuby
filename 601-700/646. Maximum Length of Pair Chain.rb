# @param {Integer[][]} pairs
# @return {Integer}
def find_longest_chain(pairs)
  pairs.sort_by!(&:first)
  f = pairs.map{1}
  pairs.each_with_index do |(left, right), i|
    (i+1..pairs.size-1).each do |j|
      f[j] = f[i] + 1 if right < pairs[j][0] && f[i] + 1 > f[j]
    end
  end
  f.max
end
