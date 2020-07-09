# @param {String} s
# @param {Integer} n
# @return {Boolean}
def query_string(s, n)
  ns = n.to_s(2)
  hash = {}
  (1..ns.size).each do |l|
    hash = {}
    min = (1 << l-1)
    (0..s.size-l).each do |i|
      num = s[i,l].to_i(2)
      next if num > n || num < min || hash[num]
      hash[num] = true
      break if hash.size == min
    end
    return false if l < ns.size && hash.size != min
  end
  min = (1 << ns.size-1)
  !hash[min].nil? && hash.size == n-min+1
end
