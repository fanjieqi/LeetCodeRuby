# @param {String} s1
# @param {String} s2
# @return {Integer}
def minimum_delete_sum(s1, s2)
  f = (s1.size+1).times.map { [0] }

  (1..s2.size).each do |j|
    f[0][j] = f[0][j-1] + s2[j-1].ord
  end

  (1..s1.size).each do |i|
    f[i][0] = f[i-1][0] + s1[i-1].ord
    (1..s2.size).each do |j|
      if s1[i-1] == s2[j-1]
        f[i][j] = f[i-1][j-1]
      else 
        f[i][j] = [f[i-1][j] + s1[i-1].ord, f[i][j-1] + s2[j-1].ord].min
      end
    end
  end
  f[s1.size][s2.size]
end
