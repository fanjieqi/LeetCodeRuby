# @param {Integer} num
# @return {Integer}
def number_of_steps (num)
  count = 0
  while num > 0
    if num.odd?
      num -= 1
    else
      num >>= 1
    end
    count += 1
  end
  count
end
