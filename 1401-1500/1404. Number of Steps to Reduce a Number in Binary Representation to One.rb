# @param {String} s
# @return {Integer}
def num_steps(s)
  num = s.to_i(2) 
  count = 0
  while num > 1
    if num.even?
      num >>= 1
    else
      num += 1
    end
    count += 1
  end
  count
end
