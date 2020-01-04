class TreeNode
  attr_accessor :val, :left, :right, :size

  def initialize(val)
    @val = val
    @left, @right = nil, nil
    @size = 1
  end

  def insert(val)
    if val <= @val
      if @left.nil?
        @left = TreeNode.new(val)
      else
        @left.insert(val)
      end
      @size  += 1
    elsif @right.nil?
      @right = TreeNode.new(val)
    else
      @right.insert(val)
    end
  end

  def rank(val)
    if val <= @val
      @left.nil? ? 0 : @left.rank(val)
    else
      @size + @right.rank(val)
    end
  end
end

# @param {Integer[]} nums
# @return {Integer[]}
def count_smaller(nums)
  return [] if nums.length == 0
  nums = nums.reverse
  root = TreeNode.new(nums[0])
  ans = [0]
  (1..nums.length-1).each do |i|
    root.insert(nums[i])
    ans[i] = root.rank(nums[i])
  end
  ans.reverse
end
