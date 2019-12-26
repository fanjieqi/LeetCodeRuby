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

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  roman = build_roman
  ans = 0
  roman.sort_by(&:first).reverse.each do |key, value|
    while s[/^#{value}/]
      ans += key
      s.gsub!(/^#{value}/, '')
    end
  end
  ans
end
