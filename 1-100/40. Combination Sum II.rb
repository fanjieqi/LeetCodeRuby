# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  candidates = candidates.sort
  f = []
  indexes = candidates.group_by(&:itself).transform_values(&:count)
  indexes.each do |num, count|
    (1..count).each do |i|
      f[i*num] ||= []
      f[i*num] << [[num]*i].flatten
    end
  end

  (0..target).each do |num|
    f[num] ||= []
    (0..num-1).each do |i|
      f[i].each do |n1|
        f[num-i].each do |n2|
          result = n1 + n2
          next if result.group_by(&:itself).transform_values(&:count).any?{|num, count| count > indexes[num]}
          f[num] << result
        end
      end
    end
  end
  f[target].map(&:sort).uniq
end
