# @param {Integer[]} a
# @return {Boolean}
def split_array_same_average(a)
  total = a.sort!.sum
  need = (1..a.size-1).inject({}) {|result, i| result.merge!({i => i * total / a.size.to_f}) }
  half = a.size / 2

  hash = {[0, 0] => true}
  a.each_with_index do |num, i|
    hash.keys.each do |j, v1|
      j+=1
      v1 += num

      hash[[j, v1]] = true if j < half && v1 < need[j]
      return true if need[j] == v1
    end
  end
  false
end
