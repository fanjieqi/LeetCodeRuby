# @param {Integer[]} cards
# @param {Integer} k
# @return {Integer}
def max_score(cards, k)
  n = cards.size
  sum, cur = cards.sum, cards[0..n-k-1].sum
  return sum if n == k
  max = sum - cur
  (0..k-1).each do |i|
    cur = cur-cards[i]+cards[i+n-k]
    tmp = sum - cur
    max = tmp if tmp > max
  end
  max
end
