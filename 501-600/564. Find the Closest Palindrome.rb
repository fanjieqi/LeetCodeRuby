def delta(x)
  (@n.to_i - x.to_i).abs
end

# @param {String} n
# @return {String}
def nearest_palindromic(n)
  @n = n
  length = @n.length
  candidates = []
  [length-1, length].each do |k|
    [-1, 1].each do |d|
      candidates << (10**k + d).to_s
    end
  end

  prefix = @n[0..(length-1)/2].to_i
  [prefix-1, prefix, prefix+1].map(&:to_s).each do |start|
    candidates << start + (length % 2 != 0 ? start[0..-2] : start).reverse
  end
  
  ans = nil
  candidates.each do |cand|
    ans = cand if cand != @n && !cand[/^00/] && (ans.nil? || delta(cand) < delta(ans) || delta(cand) == delta(ans) && cand.to_i < ans.to_i)
  end
  ans
end
