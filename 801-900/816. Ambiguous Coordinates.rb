require 'bigdecimal'

# @param {String} s
# @return {String[]}
def ambiguous_coordinates(s)
  s = s[1..-2]
  array = []
  (0..s.size-2).each do |i|
    left, right = s[0..i], s[i+1..-1]
    (0..left.size-1).each do |j|
      (0..right.size-1).each do |k|
        t1 = left[0..j] + (left[j+1..-1].empty? ? "" : ("."+left[j+1..-1]))
        t2 = right[0..k] + (right[k+1..-1].empty? ? "" : ("."+right[k+1..-1]))
        if (t1[/\.0+$/].nil? && BigDecimal(t1).to_s("F") == t1 || t1["."].nil? && t1.to_i.to_s == t1) && (t2[/\.0+$/].nil? && BigDecimal(t2).to_s("F") == t2 || t2["."].nil? && t2.to_i.to_s == t2)
          array << "(#{t1}, #{t2})"
        end
      end
    end
  end
  array
end
