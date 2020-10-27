# Below is the interface for Iterator, which is already defined for you.
#
# class Iterator
# 	def initialize(v)
#   
#   end
#
#   def hasNext()
#		Returns true if the iteration has more elements.
#   end
#
#   def next()
#   	Returns the next element in the iteration.
#   end
# end

class PeekingIterator
  # @param {Iterator} iter
  def initialize(iter)
    @iter = []
    @iter << iter.next while iter.hasNext
  end
  
  # Returns true if the iteration has more elements.
  # @return {boolean}
  def hasNext()
    !@iter.empty?
  end
  
  # Returns the next element in the iteration.
  # @return {integer}
  def next()
    @iter.shift
  end
  
  # Returns the next element in the iteration without advancing the iterator.
  # @return {integer}
  def peek()
    @iter[0]
  end
end
