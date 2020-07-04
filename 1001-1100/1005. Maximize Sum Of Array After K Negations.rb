# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def largest_sum_after_k_negations(a, k)
  positives = a.reject(&:negative?)
  negatives = a.select(&:negative?).sort
  while k > 0 && negatives.size > 0
    k -= 1
    positives << -negatives.shift
  end
  positives.sort!
  positives[0] = -positives[0] if k.odd?
  positives.sum + negatives.sum
end
