# @param {String} s
# @param {Character} c
# @return {Integer[]}
def shortest_to_char(s, c)
  s = s.split("")
  pos = s.each_index.select{ |i| s[i] == c }
  s.map.with_index do |ele, i|
    k = pos.bsearch_index { |j| j >= i }
    if k.nil?
      i - pos.last
    elsif k == 0
      pos[k]-i
    else
      [i-pos[k-1], pos[k]-i].min
    end
  end
end
