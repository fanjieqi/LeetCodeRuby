# @param {Integer} low
# @param {Integer} high
# @return {Integer}
def count_odds(low, high)
  tmp = high - low
  tmp / 2 + (low.odd? || tmp.odd? ? 1 : 0)
end
