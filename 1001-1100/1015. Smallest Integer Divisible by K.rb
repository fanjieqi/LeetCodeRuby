# @param {Integer} k
# @return {Integer}
def smallest_repunit_div_by_k(k)
  return -1 unless [1, 3, 7, 9].include?(k % 10)
  mod, hash = 0, {}
  (1..k).each do |l|
    p l
    mod = (10 * mod + 1) % k
    return l if mod == 0
    return -1 if hash[mod]
    hash[mod] = true
  end
  -1
end
