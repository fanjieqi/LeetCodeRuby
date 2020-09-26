# @param {String} s
# @param {Integer} k
# @return {Boolean}
def has_all_codes(s, k)
  hash, str = {}, ''
  (0..(1<<k)-1).each { |num| hash[num] = true }
  s.each_char do |char|
    str = str[1..-1] if str.size == k
    str << char
    hash.delete(str.to_i(2)) if str.size == k
  end
  hash.size == 0
end
