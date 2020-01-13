MAX = "11110111".to_i(2)
BYTES = ["11110000".to_i(2), "11100000".to_i(2), "11000000".to_i(2)]
BYTE = "10000000".to_i(2)
B1 ="00000000".to_i(2)

# @param {Integer[]} data
# @return {Boolean}
def valid_utf8(data)
  mark = []
  data.each_with_index do |num, i|
    next if mark[i]
    return false if num > MAX
    BYTES.each_with_index do |byte, j|
      if num & byte == byte
        mark[i] = true
        (1..(3-j)).each do |k|
          return false if data[i+k].nil? || (data[i+k] & BYTE != BYTE)
          mark[i+k] = true
        end
        break
      end
    end
    if !mark[i]
      return false if num & BYTE == BYTE
      mark[i] = true if num & B1 == B1
    end
  end
  mark.all? {|ele| ele}
end
