# @param {Integer[]} answers
# @return {Integer}
def num_rabbits(answers)
  count = 0
  answers.sort!
  while !answers.empty?
    num = answers.shift
    count += (num+1)
    num.times { answers.shift if answers.first == num }
  end
  count
end
