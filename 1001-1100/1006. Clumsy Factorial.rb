# @param {Integer} n
# @return {Integer}
def clumsy(n)
  ans, positive, tmp = 0, true, nil
  n.downto(1).with_index do |num, i|
    case i % 4
    when 0 then
      tmp = num
    when 1 then
      tmp = tmp * num
    when 2 then
      tmp = (tmp / num.to_f).floor
      ans += (i == 2 ? tmp : -tmp)
      tmp = nil
    when 3 then
      ans += num
    end
  end
  ans + (n > 3 ? -tmp.to_i : tmp.to_i)
end
