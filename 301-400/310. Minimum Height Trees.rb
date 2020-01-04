def build_map(n, edges)
  @map = []
  @degree = [] 

  edges.each do |i, j|
    @map[i] ||= []
    @map[i] << j
    @map[j] ||= []
    @map[j] << i
    @degree[i] ||= 0
    @degree[i] += 1
    @degree[j] ||= 0
    @degree[j] += 1
  end
end

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def find_min_height_trees(n, edges)
  return (0..n-1).to_a if edges.length == 0 || n <= 2
  build_map(n, edges)

  queue = Queue.new
  count = 0
  (0..n-1).each do |i|
    next if @degree[i] > 1
    @degree[i] -= 1
    queue << i
    count += 1
  end

  ans = []
  loop do
    ans = []
    while !queue.empty?
      node = queue.pop
      @map[node].each do |i|
        @degree[i] -= 1
        ans << i if @degree[i] == 1
      end
    end
    break if count >= n-2
    count += ans.length
    ans.each {|i| queue << i}
  end
  ans
end
