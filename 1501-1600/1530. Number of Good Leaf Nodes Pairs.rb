# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def dfs(node)
  return {} if node.nil?
  lhash = dfs(node.left).transform_keys { |k| k + 1 }
  rhash = dfs(node.right).transform_keys { |k| k + 1 }

  if lhash.empty? && rhash.empty?
    { 0 => 1 }
  elsif lhash.empty?
    rhash
  elsif rhash.empty?
    lhash
  else
    lhash.each do |lkey, lcount|
      rhash.each do |rkey, rcount|
        @count += lcount * rcount if lkey + rkey <= @distance
      end
    end
    hash = {}
    (lhash.keys | rhash.keys).each do|key|
      hash[key] = lhash[key].to_i + rhash[key].to_i
    end
    hash
  end
end

# @param {TreeNode} root
# @param {Integer} distance
# @return {Integer}
def count_pairs(root, distance)
  @distance, @hash, @count = distance, {}, 0
  dfs(root)
  @count
end
