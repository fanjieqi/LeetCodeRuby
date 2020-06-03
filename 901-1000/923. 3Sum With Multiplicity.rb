MOD = 10**9 + 7
# @param {Integer[]} a
# @param {Integer} target
# @return {Integer}
def three_sum_multi(a, target)
  hash = a.inject({}) { |tmp, num| tmp[num] ||= 0; tmp[num] += 1; tmp }
  sum = 0
  keys = hash.keys.sort
  (0..keys.size-1).each do |i|
    n1 = keys[i]
    hash[n1] -= 1
    (i..keys.size-1).each do |j|
      n2 = keys[j]
      if hash[n2].to_i > 0 && n2 >= n1
        hash[n2] -= 1
        n3 = target - n1 - n2
        if hash[n3].to_i > 0 && n3 >= n2
          hash[n3] -= 1
          if n1 == n2 && n2 == n3
            sum += (hash[n1] + 1) * (hash[n2] + 2) * (hash[n3] + 3) / 3 / 2
          elsif n1 == n2
            sum += (hash[n1] + 1) * (hash[n2] + 2) * (hash[n3] + 1) / 2
          elsif n2 == n3
            sum += (hash[n1] + 1) * (hash[n2] + 1) * (hash[n3] + 2) / 2
          else
            sum += (hash[n1] + 1) * (hash[n2] + 1) * (hash[n3] + 1)
          end
          sum %= MOD
          hash[n3] += 1
        end
        hash[n2] += 1
      end
    end
    hash[n1] += 1
  end
  sum % MOD
end
