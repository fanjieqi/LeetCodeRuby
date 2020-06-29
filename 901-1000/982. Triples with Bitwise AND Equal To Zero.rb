# @param {Integer[]} a
# @return {Integer}
def count_triplets(array)
  hash, total, n = {}, 0, (1<<16)
  array.repeated_permutation(2).each { |a, b| hash[a & b] ||= 0; hash[a & b]+=1 }
  array.each do |a|
    i = 0
    while i < n
      if a & i == 0
        total += hash[i].to_i
      else
        i += (a & i) - 1
      end
      i += 1
    end
  end
  total
end
