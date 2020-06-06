class RecentCounter
    def initialize()
      @queue = []
    end


=begin
    :type t: Integer
    :rtype: Integer
=end
    def ping(t)
      @queue << t
      @queue.shift while !@queue.empty? && t - 3000 > @queue[0]
      @queue.size
    end


end

# Your RecentCounter object will be instantiated and called as such:
# obj = RecentCounter.new()
# param_1 = obj.ping(t)
