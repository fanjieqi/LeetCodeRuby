# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def subarrays_with_k_distinct(a, k)
  subarray_swith_atmost_k_distinct(a, k) - subarray_swith_atmost_k_distinct(a, k-1)
end

def subarray_swith_atmost_k_distinct(s, k)
  hash = {}
  l, r, counter, count = 0, 0, 0, 0
  while r < s.size
    hash[s[r]] ||= 0
    hash[s[r]] += 1
    counter += 1 if hash[s[r]] == 1
    r += 1   
    while l < r and counter > k
      hash[s[l]] ||= 0
      hash[s[l]] -= 1
      counter -= 1 if hash[s[l]] == 0
      l += 1
    end
    count += r - l 
  end
  count
end
