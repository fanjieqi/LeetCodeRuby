# @param {String} s
# @return {String[]}
def restore_ip_addresses(s)
  count = []
  (0..s.length-4).each do |i|
    s1 = s[0..i].to_i
    next if s1 < 0 || s1 > 255 || s1.to_s != s[0..i]
    (i+1..s.length-3).each do |j|
      s2 = s[i+1..j].to_i
      next if s2 < 0 || s2 > 255 || s2.to_s !=  s[i+1..j]
      (j+1..s.length-2).each do |k|
        s3 = s[j+1..k].to_i
        s4 = s[k+1..-1].to_i
        next if s3 < 0 || s3 > 255 || s3.to_s != s[j+1..k]
        next if s4 < 0 || s4 > 255 || s4.to_s != s[k+1..-1]
        count << [s1, s2, s3, s4].join(".")
      end
    end
  end
  count
end

p restore_ip_addresses("010010")
