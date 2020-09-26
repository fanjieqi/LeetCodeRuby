# @param {String} s
# @param {Integer} k
# @return {Integer}
def max_vowels(s, k)
  max, cur, arr = 0, 0, []
  s.each_char do |char|
    cur -= 1 if arr.size == k && arr.shift[/[aeiou]/]
    arr << char
    cur += 1 if char[/[aeiou]/]
    max = cur if cur > max
  end
  max
end
