CHARS = ('A'..'Z').to_a
# @param {Integer} n
# @return {String}
def convert_to_title(n)
  result = []
  while n > 0
    t = n % 26
    # p [t, n]
    result << CHARS[t-1]
    break if n <= 26
    n = (n- 1) / 26
  end
  result.reverse.join("")
end
