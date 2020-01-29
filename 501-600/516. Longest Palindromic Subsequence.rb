# @param {String} s
# @return {Integer}
def longest_palindrome_subseq(s)
  dp = [1] * s.length
  (1..s.length-1).each do |j|
    pre = dp[j]
    (j-1).downto(0) do |i|
      tmp = dp[i]
      if s[i] == s[j]
        dp[i] = (i + 1 <= j - 1) ? (2 + pre) : 2
      else
        dp[i] = [dp[i + 1], dp[i]].max
      end
      pre = tmp
    end
  end
  dp[0]
end
