# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} target
# @param {Integer} k
# @return {Integer[]}
def distance_k(root, target, k)
  map = []
  queue = Queue.new
  queue << root
  while !queue.empty?
    u = queue.pop
    map[u.val] ||= []
    if u.left
      map[u.val] << u.left.val
      map[u.left.val] ||= []
      map[u.left.val] << u.val
      queue << u.left
    end
    if u.right
      map[u.val] << u.right.val
      map[u.right.val] ||= []
      map[u.right.val] << u.val
      queue << u.right
    end
  end
  queue << target.val
  dist = []
  dist[target.val] = 0
  while !queue.empty?
    u = queue.pop
    map[u].each do |v|
      if dist[v].nil? || dist[u] + 1 < dist[v]
        dist[v] = dist[u] + 1
        queue << v
      end
    end
  end
  dist.each_index.select { |v| dist[v] == k}
end
