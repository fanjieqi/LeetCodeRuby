require 'prime'
# @param {Integer} num
# @return {Boolean}
def check_perfect_number(num)
  return false if num <= 1
  hash = {1 => true}
  tmp = num
  Prime.each(Math.sqrt(tmp)).each do |k|
    next if num % k != 0
    while (tmp/k != 1) && (tmp%k == 0)
      hash.keys.each do |k2|
        k3 = k2 * k
        hash[k3] = true if k3 != num && num % k3 == 0
      end
      tmp /= k
    end
  end
  hash.keys.each do |k|
    next if k == 1 || num % k != 0
    hash[num / k] = true
  end
  hash.keys.sum == num
end
