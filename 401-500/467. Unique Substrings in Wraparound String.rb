# @param {String} p
# @return {Integer}
def find_substring_in_wrapround_string(pat)
  pat = pat.split("")
  hash = pat.uniq.map{|c| [c, 1]}.to_h
  l = 1
  pat[0..-2].zip(pat[1..-1].to_a).each do |i, j|
    l = (j.ord - i.ord) % 26 == 1 ? l + 1 : 1
    hash[j] = [hash[j], l].max
  end
  hash.values().sum
end
