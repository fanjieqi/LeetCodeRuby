# @param {Integer} n
# @return {Integer}
def integer_break(n)
  ans = [nil, nil, 1]
  (3..n).each do |i|
    ans[i] = 0
    (2..i-1).each do |j|
      ans[i] = [ans[i], (i-j)*ans[j], (i-j)*j].max
    end
  end
  ans[n]
end
