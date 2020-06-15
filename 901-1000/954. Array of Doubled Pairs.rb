# @param {Integer[]} a
# @return {Boolean}
def can_reorder_doubled(a)
  hash = a.group_by(&:itself).transform_values(&:count)
  [a.select(&:negative?).sort.reverse, a.select(&:positive?).sort, a.select(&:zero?)].each do |array|
    array.each_with_index do |num, i|
      next if hash[num].zero?
      return false if hash[num * 2].to_i.zero?
      hash[num] -= 1
      hash[num * 2] -= 1
    end
  end
  hash.values.all?(&:zero?)
end
