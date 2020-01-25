# @param {Integer} buckets
# @param {Integer} minutes_to_die
# @param {Integer} minutes_to_test
# @return {Integer}
def poor_pigs(buckets, minutes_to_die, minutes_to_test)
  ans = 0
  ans += 1 while (minutes_to_test / minutes_to_die + 1) ** ans < buckets
  ans
end
