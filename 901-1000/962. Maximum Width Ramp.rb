class TreeNode
  attr_accessor :val, :index, :left, :right, :size

  def initialize(val, index)
    @val, @index, @size = val, index, 1
  end

  def self.find_min(root, val, index)
    if root.nil?
      index
    elsif val < root.val
      find_min(root.left, val, index)
    else
      [find_min(root.right, val, index), root.index].min
    end
  end

  def self.insert(root, val, index)
    if root.nil?
      root = TreeNode.new(val, index)
    elsif val < root.val
      root.size += 1
      root.left = insert(root.left, val, index)
    elsif val > root.val
      # root.size += 1
      # root.right = insert(root.right, val, index)
    end
    root = maintain(root, val >= root.val)
  end

  def self.left_rotate(root)
    return nil if root.nil?
    right = root.right
    root.right = right.left
    right.left = root
    right.size = root.size
    right.index = root.index if root.index < right.index
    root.size = root.left&.size.to_i + root.right&.size.to_i + 1
    right
  end

  def self.right_rotate(root)
    return nil if root.nil?
    left = root.left
    root.left = left.right
    left.right = root
    left.size = root.size
    root.size = root.left&.size.to_i + root.right&.size.to_i + 1
    left
  end

  def self.maintain(root, flag)
    if flag
      if root.left&.size.to_i < root.right&.left&.size.to_i
        root.right = right_rotate(root.right)
        root = left_rotate(root)
      elsif root.left&.size.to_i < root.right&.right&.size.to_i
        root = left_rotate(root)
      else
        return root
      end
    else
      if root.right&.size.to_i < root.left&.right&.size.to_i
        root.left = left_rotate(root.left)
        root = right_rotate(root)
      elsif root.right&.size.to_i < root.left&.left&.size.to_i
        root = right_rotate(root)
      else
        return root
      end
    end
    root.left = maintain(root.left, false)
    root.right = maintain(root.right, true)
    root = maintain(root, true)
    root = maintain(root, false)
    root
  end
end

# @param {Integer[]} a
# @return {Integer}
def max_width_ramp(a)
  root = TreeNode.new(a[0], 0)
  max = 0
  (1..a.size-1).each do |i|
    tmp = i - TreeNode.find_min(root, a[i], i)
    max = tmp if tmp > max
    root = TreeNode.insert(root, a[i], i)
  end
  max
end
