# @param {String} s
# @param {Integer[]} shifts
# @return {String}
def shifting_letters(s, shifts)
  (shifts.size-2).downto(0) do |i|
    shifts[i] += shifts[i+1]
    shifts[i] %= 26
  end
  (0..s.size-1).map { |i| ('a'.ord + (s[i].ord - 'a'.ord + shifts[i]) % 26).chr }.join
end
