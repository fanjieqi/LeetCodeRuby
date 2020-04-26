# @param {Integer[]} hand
# @param {Integer} w
# @return {Boolean}
def is_n_straight_hand(hand, w)
  return false if hand.size % w != 0
  hash = hand.group_by(&:itself).transform_values(&:count)
  (hand.size / w).times do
    num = hash.keys.min
    w.times do
      return false if hash[num].nil?
      hash[num] -= 1
      hash.delete(num) if hash[num].zero?
      num += 1
    end
  end
  true
end
