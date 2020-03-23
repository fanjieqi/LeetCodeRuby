# @param {Integer[]} bits
# @return {Boolean}
def is_one_bit_character(bits)
  return bits[0] == 0 if bits.size == 1
  f = []
  bits.each_with_index do |bit, i|
    if i == 0
      f[i] = true if bit == 0
    elsif bit == 0
      f[i] = bits[i-1] == 1 && (i == 1 || f[i-2]) || f[i-1]
    elsif bit == 1
      f[i] = bits[i-1] == 1 && (i == 1 || f[i-2])
    end
  end
  !!f[-2]
end
