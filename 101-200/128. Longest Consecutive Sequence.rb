# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  hash = nums.zip(nums).to_h

  max = 0
  nums.each_with_index do |num, index|
    next if hash[num - 1]
    count = 0
    while hash[num]
      count += 1
      num += 1
    end
    max = [max, count].max
  end
  max
end
