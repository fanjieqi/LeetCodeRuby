# @param {Integer} n
# @return {String}
def count_and_say(n)
  return "1" if n == 1
  preceding = count_and_say(n-1)
  ans = ""
  while preceding.length > 0
    first = preceding[/^\d/]
    count = preceding[/^#{first}+/].length
    preceding.gsub!(/^#{first}+/, '')
    ans += count.to_s + first
  end
  ans
end
