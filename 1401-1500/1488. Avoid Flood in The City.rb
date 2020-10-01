# @param {Integer[]} rains
# @return {Integer[]}
def avoid_flood(rains)
  indexes, overflow, ans = [], {}, []
  rains.each_with_index do |num, i|
    if num > 0
      if overflow[num].nil?
        overflow[num] = i
      else
        j = indexes.bsearch_index { |k| k >= overflow[num] }
        return [] if j.nil?
        ans[indexes.delete_at(j)] = num
      end
      overflow[num] = i
      ans[i] = -1
    elsif num == 0
      indexes << i
    end
  end
  ans[indexes.shift] = 1 while !indexes.empty?
  ans
end
