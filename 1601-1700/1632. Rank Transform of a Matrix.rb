def get_father(i)
  (@father[i].nil? || @father[i] == i) ? i : @father[i] = get_father(@father[i])
end

# @param {Integer[][]} matrix
# @return {Integer[][]}
def matrix_rank_transform(matrix)
  n, m, indexes, @father, rowf, colf = matrix.size, matrix[0].size, {}, [], [], []
  (0..n-1).each do |i|
    (0..m-1).each do |j|
      indexes[matrix[i][j]] ||= []
      indexes[matrix[i][j]] << [i, j]
      rowf[i] ||= {}
      colf[j] ||= {}
      fu = get_father(i * m + j)
      @father[get_father(rowf[i][matrix[i][j]])] = fu if rowf[i][matrix[i][j]]
      rowf[i][matrix[i][j]] = fu
      @father[get_father(colf[j][matrix[i][j]])] = fu if colf[j][matrix[i][j]]
      colf[j][matrix[i][j]] = fu
    end
  end
  nums = matrix.flatten.uniq.sort

  row, col, ans = [], [], []
  nums.each do |num|
    indexes[num].group_by { |i, j| get_father(i*m + j) }.each do |father, array|
      rank = nil
      array.each do |i, j|
        row[i] ||= [nil, 1]
        col[j] ||= [nil, 1]

        row_rank = row[i][1] - (row[i][0] == matrix[i][j] ? 1 : 0)
        rank = row_rank if rank.nil? || row_rank > rank
        col_rank = col[j][1] - (col[j][0] == matrix[i][j] ? 1 : 0)
        rank = col_rank if rank.nil? || col_rank > rank
      end
      array.each do |i, j|
        ans[i] ||= []
        ans[i][j] = rank
        row[i][0] = matrix[i][j]
        row[i][1] = rank + 1
        col[j][0] = matrix[i][j]
        col[j][1] = rank + 1
      end
    end
  end
  ans
end
