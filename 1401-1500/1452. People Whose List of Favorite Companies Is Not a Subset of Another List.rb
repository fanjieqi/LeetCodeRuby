# @param {String[][]} favorite_companies
# @return {Integer[]}
def people_indexes(favorite_companies)
  hash = {}
  favorite_companies.flatten.uniq.each_with_index do |company, i|
    hash[company] = (1 << i)
  end
  nums = favorite_companies.map { |companies| companies.inject(0) { |res, company| res | hash[company] } }
  ans = {}
  (0..nums.size-1).each do |i|
    (0..nums.size-1).each do |j|
      break if ans[i]
      next if i == j
      ans[i] = true if nums[i] & nums[j] == nums[i]
    end
  end
  (0..nums.size-1).to_a - ans.keys
end
