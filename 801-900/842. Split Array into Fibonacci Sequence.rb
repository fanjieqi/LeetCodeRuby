MAX= (2<<31) - 1

def dfs(num1, num2, s)
  sum = (num1.to_i + num2.to_i).to_s
  return [] if sum.to_i >= MAX
  return [num1.to_i, num2.to_i] if s.size.zero?
  return [] unless s.start_with?(sum)
  result = dfs(num2, sum, s[sum.size..-1])
  return [num1.to_i] + result unless result.empty?
  []
end

# @param {String} s
# @return {Integer[]}
def split_into_fibonacci(s)
  (1..s.size/2).each do |i|
    next if s[0] == "0" && i > 1
    (1..(s.size-i)/2).each do |j|
      next if s[i] == "0" && j > 1 
      result = dfs(s[0,i], s[i,j], s[i+j..-1])
      return result if !result.empty? && result.join == s
    end
  end
  []
end
