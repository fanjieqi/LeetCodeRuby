# @param {Integer[]} nums
# @return {Integer}
def total_hamming_distance(nums)
  nums = nums.map{|num| num.to_s(2).rjust(32, "0")}
  (0..31).inject do |sum, i|
    c0 = nums.inject(0){|s2, num| s2 += num[i] == "0" ? 1 : 0}
    c1 = nums.inject(0){|s3, num| s3 += num[i] == "1" ? 1 : 0}
    sum += c0 * c1
  end
end
