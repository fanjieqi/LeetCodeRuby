# @param {Integer} n
# @param {Integer} k
# @return {Integer[]}
def nums_same_consec_diff(n, k)
  hash = {}
  (0..9).each do |i|
    hash[i] ||= []
    hash[i] << i + k if i + k <= 9
    hash[i] << i - k if 0 <= i - k
  end

  ans = {}
  queue = Queue.new
  hash.each { |key, _| queue << [key, key, 1] if key > 0 || n == 1 }
  while !queue.empty?
    num, last, l = queue.pop
    ans[num] = true if l == n
    next if (l += 1) > n
    hash[last].each do |v|
      tmp = num * 10 + v
      queue << [tmp, v, l]
    end
  end
  ans.keys
end
