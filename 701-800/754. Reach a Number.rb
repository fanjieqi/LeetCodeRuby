# @param {Integer} target
# @return {Integer}
def reach_number(target)
  t, step, sum = target.abs, 0, 0
  sum += (step+=1) while sum < t
  sum += (step+=1) while (sum-t).abs % 2 > 0
  step
end
