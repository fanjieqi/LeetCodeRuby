def dfs(i, j, k)
  return 0 if i > j
  @mark[i] ||= []
  @mark[i][j] ||= []
 
  if @mark[i][j][k].nil?
    m = i
    m += 1 while m+1 <= j && @boxes[m+1] == @boxes[i]
    i, k = m, k + m - i
    ans = dfs(i+1, j, 0).to_i + (k+1)**2
    (i+1..j+1).each do |m|
      ans = [ans, dfs(i+1, m-1, 0) + dfs(m, j, k+1)].max if @boxes[i] == @boxes[m]
    end
    @mark[i] ||= []
    @mark[i][j] ||= []
    @mark[i][j][k] = ans
  end
  @mark[i][j][k]
end

# @param {Integer[]} boxes
# @return {Integer}
def remove_boxes(boxes)
  @boxes = boxes
  @mark = []
  dfs(0, @boxes.length-1, 0)
end
