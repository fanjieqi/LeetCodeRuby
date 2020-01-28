MAX = 1 << 31

def dfs(s, c)
  return 0 if s.length == 0
  res, i = MAX, 0
  while i < s.length
    j = i + 1
    j += 1 while j < s.length && s[i] == s[j]
    incr = 3 - (j - i)
    if c[s[i]].to_i >= incr
      incr = incr < 0 ? 0 : incr
      c[s[i]] ||= 0
      c[s[i]] -= incr
      tep = dfs(s[0,i] + s[j..-1], c)
      res = [res, tep + incr].min if tep >= 0
      c[s[i]] += incr
    end
    i = j
  end
  res != MAX ? res : -1
end

# @param {String} board
# @param {String} hand
# @return {Integer}
def find_min_step(board, hand)
  dfs(board, hand.split("").group_by(&:itself).transform_values(&:count))
end
