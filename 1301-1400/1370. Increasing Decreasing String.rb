# @param {String} s
# @return {String}
def sort_string(s)
  chars = s.chars.group_by(&:itself).transform_values(&:count)
  ans = ""
  while !chars.empty?
    chars.keys.sort.each do |char|
      ans << char
      chars[char] -= 1
      chars.delete(char) if chars[char] == 0
    end
    chars.keys.sort.reverse.each do |char|
      ans << char
      chars[char] -= 1
      chars.delete(char) if chars[char] == 0
    end
  end
  ans
end
