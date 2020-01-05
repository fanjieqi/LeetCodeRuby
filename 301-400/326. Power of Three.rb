# @param {Integer} n
# @return {Boolean}
def is_power_of_three(n)
  return true if n == 1
  i = 1
  while i < n
    i *= 3
    return true if i == n
  end
  false
end
