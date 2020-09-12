# @param {Integer[]} rating
# @return {Integer}
def num_teams(rating)
  n, count = rating.size, 0
  (0..n-3).each do |i|
    (i+1..n-2).each do |j|
      (j+1..n-1).each do |k|
        count += 1 if rating[i] > rating[j] && rating[j] > rating[k] || rating[i] < rating[j] && rating[j] < rating[k]
      end
    end
  end
  count
end
