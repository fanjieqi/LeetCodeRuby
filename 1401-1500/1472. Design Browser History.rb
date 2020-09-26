class BrowserHistory

=begin
    :type homepage: String
=end
    def initialize(homepage)
      @histories = [homepage]
      @index = 0
    end


=begin
    :type url: String
    :rtype: Void
=end
    def visit(url)
      @histories[@index+=1] = url
      @histories = @histories[0..@index]
    end


=begin
    :type steps: Integer
    :rtype: String
=end
    def back(steps)
      @index -= steps
      @index = 0 if @index < 0
      @histories[@index]
    end


=begin
    :type steps: Integer
    :rtype: String
=end
    def forward(steps)
      @index += steps
      @index = @histories.size-1 if @index >= @histories.size
      @histories[@index]
    end


end

# Your BrowserHistory object will be instantiated and called as such:
# obj = BrowserHistory.new(homepage)
# obj.visit(url)
# param_2 = obj.back(steps)
# param_3 = obj.forward(steps)
