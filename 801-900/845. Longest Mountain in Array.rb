# @param {Integer[]} a
# @return {Integer}
def longest_mountain(a)
  f1, f2 = [], []
  (0..a.size-1).each { |i| i != 0 && a[i-1] < a[i] ? f1[i] = f1[i-1]+1 : f1[i] = 0 }
  (a.size-1).downto(0) { |i| i != a.size-1 && a[i+1] < a[i] ? f2[i] = f2[i+1]+1 : f2[i] = 0 }
  (0..a.size-1).map {|i| f1[i] > 0 && f2[i]> 0 ? f1[i] + f2[i] + 1 : 0}.max || 0
end
