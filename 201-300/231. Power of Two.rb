# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  !!n.to_s(2)[/^10{0,}$/]
end
