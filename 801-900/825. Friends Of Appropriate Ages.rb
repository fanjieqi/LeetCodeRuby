# @param {Integer[]} ages
# @return {Integer}
def num_friend_requests(ages)
  ages.sort!
  count = 0
  ages.each_with_index do |a, i|
    left = a*0.5+7
    li = ages.bsearch_index { |b| b > left && (a >= 100 || b <=100) } || i
    ri = ages.bsearch_index { |b| b >= a+1 } || ages.size
    count += ri-1-li if ri > li
  end
  count
end
