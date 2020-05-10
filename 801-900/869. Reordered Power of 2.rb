POWER_OF2 = (0..30).map { |i| (1 << i).to_s.split("").sort.join }
# @param {Integer} n
# @return {Boolean}
def reordered_power_of2(n)
  POWER_OF2.include?(n.to_s.split("").sort.join)
end
