# @param {Integer[]} a
# @return {Integer}
def len_longest_fib_subseq(a)
  hash = []
  max = 2
  (0..a.size-3).each do |i|
    hash[i] = {}
    (i+1..a.size-max).each do |j|
      next if hash[i][j] || a.size-j + 1 < max
      ii, jj, count = i, j, 2
      loop do
        tmp = a[ii] + a[jj]
        k = a.bsearch_index { |ele| ele >= tmp }
        if k && a[k] == tmp
          count += 1
          max = count if count > max
          hash[ii] ||= {}
          hash[ii][jj] = true
          ii, jj = jj, k
        else
          break
        end
      end
    end
  end
  max == 2 ? 0 : max
end
