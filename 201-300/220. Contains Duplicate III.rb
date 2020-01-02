# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} t
# @return {Boolean}
def contains_nearby_almost_duplicate(nums, k, t)
  return false if nums.length == 0
  
  hash = {}
  nums.each_with_index do |num, i|
    hash[num] ||= []
    hash[num] << i
  end
  hash.transform_values(&:sort)

  if t == 0
    hash.each do |num, v|
      next if v.count <= 1
      (1..v.length-1).each do |i|
        return true if (v[i-1] - v[i]).abs <= k
      end
    end
  else
    hash.each do |num1, v1|
      hash.each do |num2, v2|
        next if (num2 - num1).abs > t
        v1.each do |i|
          v2.each do |j|
            return true if i != j && (i - j).abs <= k
          end
        end
      end
    end
  end
  false
end
