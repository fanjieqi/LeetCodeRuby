# @param {Integer[]} scores
# @param {Integer[]} ages
# @return {Integer}
def best_team_score(scores, ages)
  indexes = (0..scores.size-1).sort_by { |i| [-ages[i], -scores[i]] }
  max, f = 0, []
  indexes.each_with_index do |i, k|
    f[k] = scores[i]
    (0..k-1).each_with_index do |j|
      tmp = f[j].to_i + scores[i]
      f[k] = tmp if scores[indexes[j]] >= scores[i] && tmp > f[k]
    end
    max = f[k] if f[k] > max
  end
  max
end
