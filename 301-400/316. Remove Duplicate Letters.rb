# @param {String} s
# @return {String}
def remove_duplicate_letters(s)
  return s if s.length <= 1
  hash = {}
  s.split("").each_with_index do |char, i|
    hash[char] ||= []
    hash[char] << i
  end
  hash = hash.transform_values(&:sort)
  return s if hash.all? {|k,v| v.count == 1}
  keys = hash.keys.sort
  keys.each do |key|
    i = hash[key].first
    if i == 0 || (0..i-1).all? { |j| hash[s[j]].any? {|k| k > i} }
      return s[i] + remove_duplicate_letters(s[i+1..-1].gsub(key, ""))
    end
  end
end
