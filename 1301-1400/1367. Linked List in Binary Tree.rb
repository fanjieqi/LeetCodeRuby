# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next, :sum
  def initialize(val = 0, _next = nil)
      @val = val
      @next = _next
  end
end
# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right, :sum
  def initialize(val = 0, left = nil, right = nil)
      @val = val
      @left = left
      @right = right
  end
end

def list_sum(head)
  return 0 if head.nil?
  head.sum = list_sum(head.next) + head.val
end

def tree_sum(root)
  return 0 if root.nil?
  root.sum = [tree_sum(root.left), tree_sum(root.right)].max + root.val
end

def dfs(head, root)
  return true if head.nil?
  return false if root.nil?
  root.val == head.val && root.sum >= head.sum && (dfs(head.next, root.left) || dfs(head.next, root.right))
end

def try(root)
  return false if root.nil?
  root.val == @head.val && dfs(@head, root) || try(root.left) || try(root.right)
end

# @param {ListNode} head
# @param {TreeNode} root
# @return {Boolean}
def is_sub_path(head, root)
  @head = head
  list_sum(head)
  tree_sum(root)
  try(root) || false
end
