# @param {Integer[]} a
# @return {Integer}
def max_score_sightseeing_pair(a)
  cur, ans = 0, 0
  a.each do |num|
    ans = [ans, cur + num].max
    cur = [cur, num].max - 1
  end
  ans
end
