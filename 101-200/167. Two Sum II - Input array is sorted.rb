# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  hash = {}
  numbers.each_with_index do |num, i|
    hash[num] ||= []
    hash[num] << i + 1
  end

  numbers.each do |num1|
    num2 = target - num1
    i = hash[num1] && hash[num1][0]
    j = hash[num2] && hash[num2][0]
    if num1 == num2 && j
      next if hash[num2].length == 1
      j = hash[num2][1]
    end
    return [i, j] if j
  end
end
