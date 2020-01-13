# @param {Integer} n
# @return {Integer}
def last_remaining(n)
  n == 1 ? 1 : 2 * (1 + n / 2 - last_remaining(n / 2))
end
