# @param {Integer[]} nums
# @return {Integer}
def find_number_of_lis(nums)
  map = {}
  hash = {}
  array = []
  nums.each_with_index do |num, i|
    j = array.bsearch_index {|ele| ele[0] >= num} || array.size
    max = j == 0 ? 1 : array[0..j-1].map { |ele,ii, k| k }.max.to_i + 1

    map[i] ||= []
    array[0..j-1].each do |ele, ii, k| 
      map[i] << ii if k == max-1
    end

    hash[max] ||= 0
    hash[max] += 1
    array.insert(j, [num, i, max])
  end
  max = array.map(&:last).max

  queue = Queue.new
  array.each { |num, ii, k| queue << [1, ii] if k == max }
  count = 0
  while !queue.empty?
    k, num = queue.pop
    count += 1 if map[num].empty? && k == max
    map[num].each { |ele| queue << [k+1, ele] }
  end
  count
end
