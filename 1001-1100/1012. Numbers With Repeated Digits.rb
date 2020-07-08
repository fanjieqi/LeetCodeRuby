def permutation(m, n)
  n == 0 ? 1  : permutation(m, n - 1) * (m - n + 1)
end

# @param {Integer} n
# @return {Integer}
def num_dup_digits_at_most_n(n)
  num = (n + 1).to_s.split("").map(&:to_i)
  count = (1..num.size-1).inject(0) { |sum, i| sum += 9 * permutation(9, i - 1) }

  hash = {}
  num.each_with_index do |x, i|
    ((i>0 ? 0 : 1)..x-1).each do |y|
      count += permutation(9 - i, num.size - i - 1) if hash[y].nil?
    end
    break if hash[x]
    hash[x] = true
  end
  n - count
end
