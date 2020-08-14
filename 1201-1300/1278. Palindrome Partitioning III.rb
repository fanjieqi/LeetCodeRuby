# @param {String} s
# @param {Integer} k
# @return {Integer}
def palindrome_partition(s, k)
  n = s.size
  hash = { 1 => {} }
  (0..n-1).each do |i|
    hash[1][i] ||= {}
    hash[1][i][i] = 0
    (1..[i, n-i-1].min).each do |l|
      hash[1][i-l] ||= {}
      hash[1][i-l][i+l] = hash[1][i-l+1][i+l-1] + (s[i-l] == s[i+l] ? 0 : 1)
    end
    (0..[i, n-i-2].min).each do |l|
      hash[1][i-l] ||= {}
      hash[1][i-l][i+l+1] = hash[1].dig(i-l+1, i+l).to_i + (s[i-l] == s[i+l+1] ? 0 : 1)
    end
  end

  (2..k).each do |i|
    hash[i] = {}
    hash[i][0] ||= {}
    (i-2..n-2).each do |l|
      (l+1..n-1).each do |r|
        tmp = hash[i-1][0][l] + hash[1][l+1][r]
        hash[i][0][r] = tmp if hash[i][0][r].nil? || tmp < hash[i][0][r]
      end
    end
  end
  hash[k][0][n-1]
end
