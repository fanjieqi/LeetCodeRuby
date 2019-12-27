class Nqueens

  attr_reader :ans

  def initialize
    @ans = []
    @current = []
    @col = []
    @left = []
    @right_g = []
    @right_l = []
  end

  def set_mark(i, k, flag)
    @col[i] = flag
    @left[i+k] = flag
    @right_g[k-i] = flag if k >= i
    @right_l[i-k] = flag if k < i
  end

  def dfs(n, k)
    if k >= n
      @ans += [@current.map(&:clone)]
      return
    end
    (0..n-1).each do |i|
      next if @col[i] || @left[i+k] || (k >= i) && @right_g[k-i] || (k < i) && @right_l[i-k]
      @current[k] ||= '.' * n
      @current[k][i] = 'Q'
      set_mark(i, k, true)

      dfs(n, k+1)

      @current[k][i] = '.'
      set_mark(i, k, false)
    end
  end
end

# @param {Integer} n
# @return {String[][]}
def solve_n_queens(n)
  nqueens = Nqueens.new
  nqueens.dfs(n, 0)
  nqueens.ans
end
