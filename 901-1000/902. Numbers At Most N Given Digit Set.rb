# @param {String[]} d
# @param {Integer} n
# @return {Integer}
def at_most_n_given_digit_set(d, n)
  n = n.to_s
  sum = (1..n.size-1).inject(0) { |sum1, l| sum1 += d.size**l }
  i = 0
  while i < n.size
    sum += d.select{ |c| c < n[i] }.count * (d.size ** (n.size - i - 1))
    break unless d.include?(n[i])
    i += 1
  end
  sum + (i == n.size ? 1 : 0)
end
