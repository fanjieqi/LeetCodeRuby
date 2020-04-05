# @param {Integer[]} a
# @return {Boolean}
def is_ideal_permutation(a)
  l_count = (0..a.size-2).inject(0) { |sum, i| sum += (a[i] > a[i+1] ? 1 : 0) }
  g_count, array = 0, []
  a.each do |num|
    i = array.bsearch_index { |ele| ele >= num } || array.size
    g_count += array.size - i
    array.insert(i, num)
  end
  g_count == l_count
end
