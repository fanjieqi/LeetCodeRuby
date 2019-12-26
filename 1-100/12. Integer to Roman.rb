def build_roman
  roman  = {
    1 => "I",
    5 => "V",
    10 => "X",
    50 => "L",
    100 => "C",
    500 => "D",
    1000 => "M"
  }
  keys = roman.keys.sort
  [1, 10, 100].each do |key|
    i = keys.find_index(key)
    t1 = keys[i+1]
    new_key = t1 - key
    roman.merge!(new_key => roman[key] + roman[t1]) unless roman[new_key]

    t2 = keys[i+2]
    new_key = t2 - key
    roman.merge!(new_key => roman[key] + roman[t2]) unless roman[new_key]
  end
  roman
end

# @param {Integer} num
# @return {String}
def int_to_roman(num)
  roman = build_roman

  ans = ""
  keys = roman.keys.sort.reverse
  keys.map do |key|
    while num >= key
      ans += roman[key]
      num -= key
    end
  end
  ans
end
