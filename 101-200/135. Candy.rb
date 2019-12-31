# @param {Integer[]} ratings
# @return {Integer}
def candy(ratings)
  num = 1
  f = ratings.length.times.map {1}
  flag = true
  while flag
    flag = false
    (1..ratings.length - 1).each do |i|
      if ratings[i] > ratings[i-1] && f[i] <= f[i-1]
        f[i] = f[i-1] + num
        flag = true
      end
    end
    (ratings.length-2).downto(0).each do |i|
      if ratings[i] > ratings[i+1] && f[i] <= f[i+1]
        f[i] = f[i+1] + num
        flag = true
      end
    end
  end
  f.sum
end
