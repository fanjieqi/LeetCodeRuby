MAX = 1 << 31
# @param {Integer} n
# @return {Integer}
def next_greater_element(n)
  s = n.to_s
  min = nil
  (s.length-1).downto(1) do |i|
    (i-1).downto(0) do |j|
      if s[i] > s[j]
        tmp = ((j == 0 ? "" : s[0..j-1]) + s[i] + (s[j..i-1] + s[i+1..-1]).split("").sort.join ).to_i
        min = tmp if (min.nil? || tmp < min) && tmp < MAX
      end
    end
  end
  min || -1
end
