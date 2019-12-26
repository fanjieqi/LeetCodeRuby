# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  candidates = candidates.sort
  f = []
  candidates.each do |num|
    (1..target/num).each do |i|
      f[num*i] ||= []
      f[num*i] << [[num]*i].flatten
    end
  end

  (0..target).each do |num|
    f[num] ||= []
    (0..num-1).each do |i|
      f[i].each do |n1|
        f[num-i].each do |n2|
          next if (n1 & n2).length > 0
          f[num] << n1 + n2
        end
      end
    end
  end
  f[target].map(&:sort).uniq
end
