# @param {Integer[][]} dungeon
# @return {Integer}
def calculate_minimum_hp(dungeon)
  m = dungeon.length
  n = dungeon[0].length
  f = []
  f[m-1] ||= []
  f[m-1][n-1] = [1 - dungeon[m-1][n-1], 1].max

  (m-1).downto(0) do |i|
    f[i] ||= []
    (n-1).downto(0) do |j|
      next if i == m-1 && j == n-1
      if i == m-1
        f[i][j] = [f[i][j+1] - dungeon[i][j], 1].max
      elsif j == n-1
        f[i][j] = [f[i+1][j] - dungeon[i][j], 1].max
      else
        f[i][j] = [[f[i+1][j] - dungeon[i][j], f[i][j+1] - dungeon[i][j]].min, 1].max
      end
    end
  end
  f[0][0]
end
