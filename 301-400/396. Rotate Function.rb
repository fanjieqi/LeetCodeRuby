# @param {Integer[]} a
# @return {Integer}
def max_rotate_function(a)
  return 0 if a.length <=1
  sum = a.sum
  basic = a.each_with_index.inject(0) { |sum, (num, i)| sum += num * i }
  a.map.with_index do |num, i|
    if i == 0
      basic
    else
      rest = sum - a[i-1]
      p [:rest, sum, num, rest]
      basic = basic - rest + a[i-1] * (a.length - 1)
    end
  end.max
end
