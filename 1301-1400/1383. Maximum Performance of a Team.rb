MOD = 10**9 + 7

# @param {Integer} n
# @param {Integer[]} speed
# @param {Integer[]} efficiency
# @param {Integer} k
# @return {Integer}
def max_performance(n, speed, efficiency, k)
  array, max, sum = [], 0, 0
  efficiency.zip(speed).sort.reverse.each do |e, s|
    i = array.bsearch_index { |ele| ele >= s } || array.size
    array.insert(i, s)
    sum += s
    sum -= array.shift if array.size > k
    tmp = sum * e
    max = tmp if tmp > max
  end
  max % MOD
end
