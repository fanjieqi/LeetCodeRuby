# @param {Integer[]} candies
# @return {Integer}
def distribute_candies(candies)
  [candies.uniq.count, candies.length/2].min
end
