# @param {Integer[]} tree
# @return {Integer}
def total_fruit(tree)
  x, y, count, basic, max, flag = nil, nil, 0, 0, 0, true
  tree.each do |ele|
    if x.nil?
      x, count, basic, flag = ele, count + 1, 1, true
    elsif x == ele
      count += 1
      basic = flag ? basic + 1 : 1
      flag = true
    elsif y.nil?
      y, count, basic, flag = ele, count + 1, 1, false
    elsif y == ele
      count += 1
      basic = flag ? 1 : basic + 1
      flag = false
    elsif flag
      y, count, basic, flag = ele, basic + 1, 1, false
    else
      x, count, basic, flag = ele, basic + 1, 1, true
    end
    max = count if count > max
  end
  max
end
