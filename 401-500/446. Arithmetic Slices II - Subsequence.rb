# @param {Integer[]} a
# @return {Integer}
def number_of_arithmetic_slices(a)
  ans = 0
  f = []
  a.length.times do |i|
    f[i] ||= {}
    i.times do |j|
      f[i][a[i] - a[j]] ||= 0
      f[i][a[i] - a[j]] += 1
      if f[j][a[i]-a[j]]
        f[i][a[i] - a[j]] += f[j][a[i]-a[j]]
        ans += f[j][a[i]-a[j]]
      end
    end
  end
  ans
end
