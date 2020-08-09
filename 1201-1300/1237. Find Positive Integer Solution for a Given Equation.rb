# 	This is the custom function interface.
#	You should not implement it, or speculate about its implementation
#	class CustomFunction:
#		def f(self, x, y):
# 			Returns f(x, y) for any given positive integers x and y.
# 			Note that f(x, y) is increasing with respect to both x and y.
# 			i.e. f(x, y) < f(x + 1, y), f(x, y) < f(x, y + 1)
# 		end
# 	end
# 

# @param {CustomFunction} customfunction
# @param {Integer} z
# @return {List[List[Integer]]}
def findSolution(customfunction, z)
  ans = []
  (1..1000).each do |i|
    (1..1000).each do |j|
      tmp = customfunction.f(i, j)
      if tmp == z
        ans << [i, j]
      elsif tmp > z
        break
      end
    end
  end
  ans
end
