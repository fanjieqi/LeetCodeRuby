# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  m, n = word1.length, word2.length
  f = []
  (0..m).each do |i|
    f[i] = []
    (0..n).each do |j|
      if i == 0
        f[i][j] = j
      elsif j == 0
        f[i][j] = i
      elsif word1[i-1] == word2[j-1]
        f[i][j] = f[i - 1][j - 1]
      else
        f[i][j] = [f[i - 1][j - 1] + 2, f[i - 1][j] + 1, f[i][j - 1] + 1].min
      end
    end
  end
  f[m][n]
end
