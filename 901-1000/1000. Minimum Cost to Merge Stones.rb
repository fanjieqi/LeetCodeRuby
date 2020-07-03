def merge_stones(stones, k)
  n = stones.length
  return -1 if (n - 1) % (k - 1) > 0

  sum =[0]
  (0..n-1).each { |i| sum[i+1] = sum[i] + stones[i] }

  dp = []
  (k..n).each do |m|
    i = 0
    while i + m <= n
      j = i + m - 1
      dp[i] ||= []
      dp[i][j] = 1 << 31

      mid = i
      while mid < j
        tmp = dp.dig(i, mid).to_i + dp.dig(mid+1, j).to_i
        dp[i][j] = tmp if tmp < dp[i][j]
        mid += (k-1)
      end
      dp[i][j] += sum[j + 1] - sum[i] if (j - i) % (k - 1) == 0

      i += 1
    end
  end
  dp.dig(0, n-1).to_i
end
