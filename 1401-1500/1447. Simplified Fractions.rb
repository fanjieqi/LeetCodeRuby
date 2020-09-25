# @param {Integer} n
# @return {String[]}
def simplified_fractions(n)
  ans = {}
  (1..n-1).each do |i|
    (i+1..n).each do |j|
      ans[i.to_r / j.to_r] = true
    end
  end
  ans.keys.map(&:to_s)
end
