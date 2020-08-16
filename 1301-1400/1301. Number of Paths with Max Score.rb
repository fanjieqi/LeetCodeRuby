MOD = 10**9 + 7
# @param {String[]} board
# @return {Integer[]}
def paths_with_max_score(board)
  n, m, f = board.size, board[0].size, []
  f[0] ||= []
  f[0][0] ||= [0, 1]
  (0..n-1).each do |i|
    f[i] ||= []
    (0..m-1).each do |j|
      next if board[i][j] == 'X'
      if i == 0 && j > 0 && f[i][j-1]
        f[i][j] = f[i][j-1].clone
      elsif j == 0 && i > 0 && f[i-1][j]
        f[i][j] = f[i-1][j].clone
      elsif i > 0 && j > 0
        f[i][j] = f[i-1][j-1].clone

        if f[i][j-1]
          if f[i][j].nil? || f[i][j-1][0] > f[i][j][0]
            f[i][j] = f[i][j-1].clone
          elsif f[i][j-1][0] == f[i][j][0]
            f[i][j][1] += f[i][j-1][1]
          end
        end

        if f[i-1][j]
          if f[i][j].nil? || f[i-1][j][0] > f[i][j][0]
            f[i][j] = f[i-1][j].clone
          elsif f[i-1][j][0] == f[i][j][0]
            f[i][j][1] += f[i-1][j][1]
          end
        end
      end
      f[i][j][0] += board[i][j].to_i if f[i][j]
      f[i][j][1] %= MOD if f[i][j]
    end
  end
  f[-1][-1] || [0, 0]
end
