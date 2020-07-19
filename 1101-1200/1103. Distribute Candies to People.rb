# @param {Integer} candies
# @param {Integer} num_people
# @return {Integer[]}
def distribute_candies(candies, num_people)
  ans = (0..num_people-1).map { 0 }
  i = 0
  while candies > 0
    (0..num_people-1).each do |j|
      tmp = i * num_people + j + 1
      if tmp < candies
        ans[j] += tmp
        candies -= tmp
      else
        ans[j] += candies
        candies = 0
      end
    end
    i += 1
  end
  ans
end
