MOD = 10**9 + 7

class Fancy
  def initialize()
    @array, @add, @mul = [], [0], [1]
  end


=begin
  :type val: Integer
  :rtype: Void
=end
  def append(val)
    @array << val
    @add << @add[-1]
    @mul << @mul[-1]
  end


=begin
  :type inc: Integer
  :rtype: Void
=end
  def add_all(inc)
    @add[-1] += inc
  end


=begin
  :type m: Integer
  :rtype: Void
=end
  def mult_all(m)
    @add[-1] = @add[-1] * m % MOD
    @mul[-1] = @mul[-1] * m % MOD
  end


=begin
  :type idx: Integer
  :rtype: Integer
=end
  def get_index(idx)
    return -1 if idx >= @array.size
    m = @mul[-1] * @mul[idx].pow(MOD-2, MOD)
    inc = @add[-1] - @add[idx] * m
    (@array[idx] * m + inc) % MOD
  end


end

# Your Fancy object will be instantiated and called as such:
# obj = Fancy.new()
# obj.append(val)
# obj.add_all(inc)
# obj.mult_all(m)
# param_4 = obj.get_index(idx)
