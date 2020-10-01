# @param {Integer[]} arr
# @param {Integer} k
# @return {Boolean}
def can_arrange(arr, k)
  hash = {}
  arr.each do |num|
    tmp = num % k
    rest = k - tmp
    if hash[rest]
      hash[rest] -= 1
      hash.delete(rest) if hash[rest].zero?
    else
      hash[tmp] = hash[tmp].to_i + 1
    end
  end
  hash.delete(0).to_i.even? && hash.empty?
end
