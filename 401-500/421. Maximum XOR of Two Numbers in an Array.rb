# @param {Integer[]} nums
# @return {Integer}
def find_maximum_xor(nums)
  max = 0
  mask = 0
  31.downto(0) do |i|
    mask = mask | (1 << i)
    hash = nums.map { |num| [num & mask, true] }.to_h
    tmp = max | (1 << i)
    hash.each do |prefix, v|
      if hash[tmp ^ prefix]
        max = tmp
        break
      end
    end
  end
  max
end
