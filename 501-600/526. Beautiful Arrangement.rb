def count(i, hash)
  return 1 if i == 1
  sum = 0
  hash.keys.each do |k|
    tmp = hash.clone
    tmp.delete(k)
    sum += count(i - 1, tmp) if k % i == 0 || i % k == 0
  end
  sum
end

# @param {Integer} n
# @return {Integer}
def count_arrangement(n)
  hash = (1..n).map{|k| [k, true]}.to_h
  count(n, hash)
end
