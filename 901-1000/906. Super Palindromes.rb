# @param {String} l
# @param {String} r
# @return {Integer}
def superpalindromes_in_range(l, r)
  l, r = l.to_i, r.to_i
  hash = {1 => true, 4 => true, 9 => true}
  [1, 2].each do |head|
    (0..8).each do |len|
      [0,1,2].repeated_permutation(len).each do |arr|
        next if arr != arr.reverse
        arr.unshift(head)
        arr << head
        n = arr.join.to_i
        sqr = n**2
        sqrs = sqr.to_s
        next if sqrs != sqrs.reverse
        hash[sqr] = true
      end
    end
  end
  hash.keys.select { |key| l <= key && key <= r}.size
end
