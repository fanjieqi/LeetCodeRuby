# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def subarrays_div_by_k(a, k)
  hash, sum = {}, 0
  a.each do |num|
    sum += num
    key = sum % k
    hash[key] ||= 0
    hash[key] += 1
  end

  f = {2 => 1}
  (3..hash.values.max).each { |i| f[i] = f[i-1] + i-1 }

  hash.inject(0) { |sum, (num, count)| sum += count > 1 ? f[count] : 0 } + hash[0].to_i
end
