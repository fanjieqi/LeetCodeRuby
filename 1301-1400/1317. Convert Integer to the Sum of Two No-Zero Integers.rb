# @param {Integer} n
# @return {Integer[]}
def get_no_zero_integers(n)
  (1..n/2).each do |i|
    next if i.to_s[/0/]
    j = n - i
    next if j.to_s[/0/]
    return [i, j]
  end
end
