# @param {Integer[][]} grid
# @return {Boolean}
def is_printable(grid)
  n, m, nums, bigger, l, r, t, b = grid.size, grid[0].size, {}, {}, {}, {}, {}, {}
  (0..n-1).each do |i|
    (0..m-1).each do |j|
      num = grid[i][j]
      nums[num] = true
      l[num] = j if l[num].nil? || j < l[num]
      r[num] = j if r[num].nil? || j > r[num]
      t[num] = i if t[num].nil? || i < t[num]
      b[num] = i if b[num].nil? || i > b[num]
    end
  end
  nums = nums.keys.sort
  (0..n-1).each do |i|
    (0..m-1).each do |j|
      num = grid[i][j]
      bigger[num] ||= {}
      nums.each do |ele|
        next if j < l[ele] || j > r[ele] || i < t[ele] || i > b[ele] || ele == num
        return false if bigger[num][ele] == false
        bigger[num][ele] = true
        bigger[ele] ||= {}
        return false if bigger[ele][num] == true
        bigger[ele][num] = false
      end
    end
  end
  nums.each do |k|
    nums.each do |i|
      nums.each do |j|
        if bigger[i][k] == true && bigger[k][j] == true
          return false if bigger[i][j] == false || bigger[j][i] == true
          bigger[i][j] = true
          bigger[j][i] = false
        elsif bigger[i][k] == false && bigger[k][j] == false
          return false if bigger[i][j] == true || bigger[j][i] == false
          bigger[i][j] = false
          bigger[j][i] = true
        end
      end
    end
  end

  true
end
