# @param {Integer[][]} a
# @param {Integer[][]} b
# @return {Integer[][]}
def interval_intersection(a, b)
  i, j, ans = 0, 0, []
  while i < a.size && j < b.size
    l, r = [a[i][0], b[j][0]].max, [a[i][1], b[j][1]].min
    ans << [l, r] if l <= r
    i += 1 if a[i] && a[i][1] == r
    j += 1 if b[j] && b[j][1] == r
  end
  ans
end
