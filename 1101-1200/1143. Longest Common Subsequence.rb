# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
  f = []
  (0..text1.size-1).each do |i|
    f[i] = []
    (0..text2.size-1).each do |j|
      if text1[i] == text2[j]
        f[i][j] = (i > 0 && j > 0 ? f[i-1][j-1] : 0) + 1
      else
        f[i][j] = [i > 0 ? f[i-1][j] : 0, j > 0 ? f[i][j-1] : 0].max
      end
    end
  end
  f[-1][-1]
end
