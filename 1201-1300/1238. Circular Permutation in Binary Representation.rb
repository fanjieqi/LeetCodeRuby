# @param {Integer} n
# @param {Integer} start
# @return {Integer[]}
def circular_permutation(n, start)
  @n, @size, @mark, @ans = n, 2**n, {}, []
  stack = [[start, -1]]
  while stack.size < @size
    u, i = stack[-1]
    @mark[u] = true
    flag = true
    (i+1..n-1).each do |j|
      stack[-1][1] = j
      l = 1 << j
      if l & u == l
        v = u - l
      else
        v = u + l
      end
      next if @mark[v]
      stack << [v, -1]
      flag = false
      break
    end
    if flag
      @mark[u] = false
      stack.pop
    end
  end
  stack.map(&:first)
end
