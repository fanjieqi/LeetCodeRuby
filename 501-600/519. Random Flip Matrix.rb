class Solution

=begin
    :type n_rows: Integer
    :type n_cols: Integer
=end
    def initialize(n_rows, n_cols)
      @rows = n_rows
      @cols = n_cols
      @array = []
      @keys = n_cols.times.to_a
      reset
    end


=begin
    :rtype: Integer[]
=end
    def flip()
      row = rand(@rows)
      row = rand(@rows) while @array[row].keys.size == @cols
      col = (@keys - @array[row].keys).sample
      @array[row][col] = true
      [row, col]
    end


=begin
    :rtype: Void
=end
    def reset()
      @rows.times { |i| @array[i] = {} }
      nil
    end


end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(n_rows, n_cols)
# param_1 = obj.flip()
# obj.reset()
