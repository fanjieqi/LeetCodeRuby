# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  return word1.length + word2.length if word1.length == 0 || word2.length == 0
  word1 = "_" + word1
  word2 = "_" + word2
  m = word1.length
  n = word2.length
  ans = [[]]

  (0..m).each { |i| ans[0][i] = i}
  (0..n).each { |i| ans[i] ||= []; ans[i][0] = i}
  
  (1..m).each do |i|
    (1..n).each do |j|
      if word2[j] == word1[i]
        ans[j][i] = ans[j-1][i-1]
      else
        ans[j][i] = 1 + [ans[j][i-1] , ans[j-1][i] , ans[j-1][i-1]].min
      end
    end
  end
  ans[n][m]
end
