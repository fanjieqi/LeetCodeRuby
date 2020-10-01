# @param {Integer[]} salary
# @return {Float}
def average(salary)
  (salary.sum - salary.max - salary.min) / (salary.size-2).to_f
end
