# @param {Integer[][]} graph
# @return {Integer[][]}
def all_paths_source_target(graph)
  queue = Queue.new
  queue << [0]
  ans = []

  while !queue.empty?
    path = queue.pop
    if path.last == graph.size - 1
      ans << path.clone
      next
    end
    graph[path.last].each do |v|
      next if path.index(v)
      tmp = path.clone + [v]
      queue << tmp
    end
  end
  ans
end
