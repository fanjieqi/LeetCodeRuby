# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def can_partition_k_subsets(nums, k)
  return false if nums.sum % k != 0
  mid = nums.sum / k
  nums = nums.sort.reverse
  return false if nums.first > mid

  root = [mid] * k
  queue = Queue.new
  queue << [root, 0]
  hash = {root.hash => true}
  while !queue.empty?
    rest, i = queue.pop
    return true if rest.all?(&:zero?) && i >= nums.size

    (0..rest.size-1).each do |j|
      next if rest[j] < nums[i]
      tmp = rest.clone
      tmp[j] -= nums[i]
      tmp.sort!
      if hash[tmp.hash].nil?
        hash[tmp.hash] = true
        queue << [tmp, i+1]
      end
    end
  end
  false
end
