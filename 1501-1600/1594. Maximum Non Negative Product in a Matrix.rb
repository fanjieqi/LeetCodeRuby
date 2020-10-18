MOD = 10**9 + 7
# @param {Integer[][]} grid
# @return {Integer}
def max_product_path(grid)
  n, m, pos, neg = grid.size, grid[0].size, [], []
  (0..n-1).each do |i|
    pos[i], neg[i] = [], []
    (0..m-1).each do |j|
      if i == 0 && j == 0
        pos[i][j] = grid[i][j] if grid[i][j] >= 0
        neg[i][j] = grid[i][j] if grid[i][j] <= 0
      else
        t1 = i > 0 ? grid[i][j] * pos[i-1][j] : nil rescue nil
        t2 = i > 0 ? grid[i][j] * neg[i-1][j] : nil rescue nil
        l1 = j > 0 ? grid[i][j] * pos[i][j-1] : nil rescue nil
        l2 = j > 0 ? grid[i][j] * neg[i][j-1] : nil rescue nil

        pos[i][j] = t1 if i > 0 && t1 && t1 >= 0
        pos[i][j] = t2 if i > 0 && t2 && t2 >= 0 && (pos[i][j].nil? || t2 > pos[i][j])
        pos[i][j] = l1 if j > 0 && l1 && l1 >= 0 && (pos[i][j].nil? || l1 > pos[i][j])
        pos[i][j] = l2 if j > 0 && l2 && l2 >= 0 && (pos[i][j].nil? || l2 > pos[i][j])

        neg[i][j] = t1 if i > 0 && t1 && t1 <= 0
        neg[i][j] = t2 if i > 0 && t2 && t2 <= 0 && (neg[i][j].nil? || t2 < neg[i][j])
        neg[i][j] = l1 if j > 0 && l1 && l1 <= 0 && (neg[i][j].nil? || l1 < neg[i][j])
        neg[i][j] = l2 if j > 0 && l2 && l2 <= 0 && (neg[i][j].nil? || l2 < neg[i][j])
      end
    end
  end
  pos.dig(n-1, m-1) ? pos[n-1][m-1] % MOD : -1
end
