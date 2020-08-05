MOD = 10**9 + 7

# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def k_concatenation_max_sum(arr, k)
  a_sum, m_sum, n = 0, 0, arr.size()
  sum = 0
  (0..[2, k].min*n-1).each do |i|
    sum = [sum + arr[i % n], arr[i % n]].max
    m_sum = sum if sum > m_sum
    a_sum += arr[i] if (i < n)
  end
  m_sum = (m_sum + a_sum) % MOD while a_sum > 0 && (k-=1) >= 2
  m_sum
end
