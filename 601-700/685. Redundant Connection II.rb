def check_mark(edges, root)
  queue = Queue.new
  queue << root
  mark = (1..edges.flatten.max).map { false }
  mark[root] = true
  while !queue.empty?
    node = queue.pop
    edges.each do |p1, p2|
      if p1 == node && !mark[p2]
        mark[p2] = true
        queue << p2
      end
    end
  end
  mark[1..-1].all?(&:itself)
end

# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_directed_connection(edges)
  edges.reverse.find { |edge|
    tmp = edges - [edge]
    leaves = tmp.map(&:last).uniq
    root = (tmp.map(&:first) - leaves).uniq
    leaves.size == edges.size-1 && root.size == 1 && check_mark(tmp, root.first)
  }
end
