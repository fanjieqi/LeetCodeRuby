MOD = 10**9 + 7

# @param {Integer[]} a
# @return {Integer}
def sum_subarray_mins(a)
  array, sum, size = [], 0, a.size
  a = a.map.with_index { |num, index| [num, index] }.sort_by(&:first)
  a.each do |num, index|
    if array.empty?
      array.insert(0, index)
      sum += num * (index + 1) * (size - index)
    else
      i = array.bsearch_index { |ele| ele >= index } || array.size
      array.insert(i, index)
      sum += num * (index - (i.zero? ? -1 : array[i-1])) * ((array[i+1] || size) - index)
    end
    sum %= MOD
  end
  sum
end
