MAX = 1 << 31
# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def shortest_subarray(a, k)
  array, index, sum, min = [], [], 0, MAX
  a.each_with_index do |ele, i|
    sum += ele
    j = array.bsearch_index { |ele| ele >= sum } || array.size
    array.insert(j, sum)
    index.insert(j, i)
    (j..index.size-1).each { |l| index[l] = i}

    min = i+1 if i+1 < min && sum >= k

    rest = sum - k
    j = array.bsearch_index { |ele| ele >= rest }
    if j == 0
      next if array[j] > rest
      count = i - index[0]
      min = count if count < min
    elsif j > 0
      j -= 1 if array[j] > rest
      count = i - index[j]
      min = count if count < min
    end
  end
  min == MAX ? -1 : min
end
