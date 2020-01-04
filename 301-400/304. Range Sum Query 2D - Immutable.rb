class NumMatrix

=begin
    :type matrix: Integer[][]
=end
    def initialize(matrix)
      @matrix = matrix
      @sum = []
      (0..@matrix.length-1).each do |i|
        @sum[i] = []
        (0..@matrix[0].length-1).each do |j|
          if i == 0 && j == 0
            @sum[i][j] = @matrix[i][j]
          elsif i == 0
            @sum[i][j] = @sum[i][j-1] + @matrix[i][j]
          elsif j == 0
            @sum[i][j] = @sum[i-1][j] + @matrix[i][j]
          else
            @sum[i][j] = @sum[i-1][j] + @sum[i][j-1] - @sum[i-1][j-1] + @matrix[i][j]
          end
        end
      end
    end


=begin
    :type row1: Integer
    :type col1: Integer
    :type row2: Integer
    :type col2: Integer
    :rtype: Integer
=end
    def sum_region(row1, col1, row2, col2)
      if row1 == 0 && col1 == 0
        @sum[row2][col2]
      elsif row1 == 0
        @sum[row2][col2] - @sum[row2][col1-1]
      elsif col1 == 0
        @sum[row2][col2] - @sum[row1-1][col2]
      else
        @sum[row2][col2] - @sum[row1-1][col2] - @sum[row2][col1-1] + @sum[row1-1][col1-1]
      end
    end


end

# Your NumMatrix object will be instantiated and called as such:
# obj = NumMatrix.new(matrix)
# param_1 = obj.sum_region(row1, col1, row2, col2)
