# @param {Integer[][]} a
# @param {Integer[][]} b
# @return {Integer[][]}
def interval_intersection(a, b)
  hash = {}
  a.each do |l1, r1|
    b.each do |l2, r2|
      l, r = [l1, l2].max, [r1, r2].min
      hash[[l, r]] = true if l <= r
    end
  end
  hash.keys.sort
end
