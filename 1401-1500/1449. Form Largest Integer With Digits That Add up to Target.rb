# @param {Integer[]} cost
# @param {Integer} target
# @return {String}
def largest_number(cost, target)
  nums = cost.zip((1..9).to_a).to_h
  hash = { 0 => [10.times.map{0}, ''] }
  (1..target).each do |sum|
    nums.each do |value, num|
      basic = sum - value
      next if hash[basic].nil?
      next if hash[sum] && hash[basic][1].size + 1 < hash[sum][1].size
      tmp = hash[basic][0].clone
      tmp[num] = tmp[num].to_i + 1
      str = (1..9).inject("") { |s, i| s.prepend(i.to_s * tmp[i].to_i) }
      hash[sum] = [tmp.clone, str] if hash[sum].nil? || str.size > hash[sum][1].size || str > hash[sum][1]
    end
  end
  hash.dig(target, 1) || '0'
end
