class Solution

=begin
    :type radius: Float
    :type x_center: Float
    :type y_center: Float
=end
    def initialize(radius, x_center, y_center)
      @r = radius
      @x = x_center
      @y = y_center
    end


=begin
    :rtype: Float[]
=end
    def rand_point()
      len= Math.sqrt(rand)*@r;
      deg= rand*2*Math::PI;
      x= @x+len*Math.cos(deg);
      y= @y+len*Math.sin(deg);
      [x, y]
    end


end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(radius, x_center, y_center)
# param_1 = obj.rand_point()
