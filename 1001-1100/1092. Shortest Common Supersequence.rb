# @param {String} str1
# @param {String} str2
# @return {String}
def shortest_common_supersequence(str1, str2)
  l1, l2 = str1.size, str2.size
  f, pre = [], []
  (0..l1).each do |i|
    f[i] ||= []
    pre[i] ||= []
    (0..l2).each do |j|
      if str1[i] == str2[j]
        if i > 0 && j > 0
          f[i][j] = f[i-1][j-1] + 1
          pre[i][j] = [i-1, j-1]
        else
          f[i][j] = 1
          pre[i][j] = nil
        end
      else
        t1 = i > 0 ? f[i-1][j] : 0
        t2 = j > 0 ? f[i][j-1] : 0
        if t1 > t2
          f[i][j] = t1
          pre[i][j] = [i-1, j]
        elsif t2 > t1
          f[i][j] = t2
          pre[i][j] = [i, j-1]
        elsif t1.zero? && t2.zero?
          f[i][j] = 0
          pre[i][j] = nil
        elsif
          f[i][j] = t1
          pre[i][j] = [i-1, j]
        end
      end
    end
  end
  i, j = l1, l2
  array = []
  array.unshift([i, j]) if str1[i] == str2[j] while (i, j = pre[i][j])

  i, j, str = 0, 0, ""
  array.each do |x, y|
    str += str1[i..x-1] if i < x
    str += str2[j..y-1] if j < y
    str += str1[x]
    i, j = x+1, y+1
  end
  str += str1[i..l1-1] if i < l1
  str += str2[j..l2-1] if j < l2
  str
end
