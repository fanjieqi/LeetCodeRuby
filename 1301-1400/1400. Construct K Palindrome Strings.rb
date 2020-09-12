# @param {String} s
# @param {Integer} k
# @return {Boolean}
def can_construct(s, k)
  hash = {}
  s.each_char do |char|
    hash[char] = hash[char].to_i + 1
  end
  hash.keys.each do |key|
    if hash[key].odd?
      hash.delete(key) if hash[key] == 1
      k -= 1
      return false if k < 0
    end
  end
  hash.values.sum >= k
end
