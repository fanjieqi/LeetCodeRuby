# @param {Integer} n
# @return {Boolean}
def has_alternating_bits(n)
  n <= 1 || !n.to_s(2)[/^(10)+1{0,1}$/].to_s.empty?
end
