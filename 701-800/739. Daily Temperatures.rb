# @param {Integer[]} t
# @return {Integer[]}
def daily_temperatures(t)
  array = []
  ans = t.size.times.map {0}
  t.each_with_index do |num, i|
    if array.empty?
      array << [num, i]
    else
      k = array.bsearch_index { |ele, j| ele >= num } || -1
      while !array.empty? && array.first[0] < num
        ele, j = array.shift
        ans[j] = i-j
      end
      array.unshift([num, i])
    end
  end
  ans
end
