def dfs(num, val)
  return true if num.length == 0
  (0..num.length-2).any? do |i|
    next if i > 0 && num[0] == "0"
    sum = val + num[0..i].to_i
    next if !num[i+1..-1].start_with?(sum.to_s)
    num[i+1..-1] == sum.to_s || dfs(num[i+1..-1], num[0..i].to_i)
  end
end

# @param {String} num
# @return {Boolean}
def is_additive_number(num)
  (0..num.length-3).any? do |i|
    next if i > 0 && num[0] == "0"
    dfs(num[i+1..-1], num[0..i].to_i)
  end
end
