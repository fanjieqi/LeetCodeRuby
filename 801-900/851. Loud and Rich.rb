# @param {Integer[][]} richer
# @param {Integer[]} quiet
# @return {Integer[]}
def loud_and_rich(richer, quiet)
  map = []
  richer.each do |x, y|
    map[x] ||= []
    map[x] << y
  end

  ans = []
  queue = Queue.new
  (0..quiet.size-1).each { |x| queue << x }
  while !queue.empty?
    x = queue.pop
    ans[x] ||= x
    ans[x] = x if quiet[x] < quiet[ans[x]]
    next if map[x].nil?
    map[x].each do |y|
      if ans[y].nil? || quiet[ans[x]] < quiet[ans[y]]
        ans[y] = ans[x]
        queue << y
      end
    end
  end
  ans
end
