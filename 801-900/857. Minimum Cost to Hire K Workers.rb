# @param {Integer[]} quality
# @param {Integer[]} wage
# @param {Integer} k
# @return {Float}
def mincost_to_hire_workers(quality, wage, k)
  workers = (0..quality.size-1).map { |i| [wage[i] / quality[i].to_f, quality[i]] }.sort
  res = 1 << 31
  qsum = 0
  array = []
  workers.each do |r, q|
    i = array.bsearch_index { |ele| ele >= -q } || -1
    array.insert(i, -q)
    qsum += q
    qsum += array.shift if array.size > k
    tmp = qsum * r
    res = tmp if array.size == k && tmp < res
  end
  res
end
