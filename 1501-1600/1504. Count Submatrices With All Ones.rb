# @param {Integer[][]} mat
# @return {Integer}
def num_submat(mat)
  n, m, count = mat.size, mat[0].size, 0
  (0..n-1).each do |i|
    (0..m-1).each do |j|
      t = m-1
      (i..n-1).each do |k|
        break if t == j-1
        (j..t).each do |l|
          if mat[k][l] == 1
            count += 1
          else
            t = l-1
            break
          end
        end
      end
    end
  end
  count
end
