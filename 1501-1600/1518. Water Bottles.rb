# @param {Integer} num_bottles
# @param {Integer} num_exchange
# @return {Integer}
def num_water_bottles(num_bottles, num_exchange)
  count = 0
  cur, rest = num_bottles, 0
  while cur + rest >= num_exchange
    count += cur
    rest += cur
    cur = rest / num_exchange
    rest %= num_exchange
  end
  count + cur
end
