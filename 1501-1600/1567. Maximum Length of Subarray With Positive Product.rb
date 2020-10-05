# @param {Integer[]} nums
# @return {Integer}
def get_max_len(nums)
  f = []
  nums.each_with_index do |num, i|
    f[i] = [nil, nil]
    if num.positive?
      f[i][0] = i == 0 || f[i-1][0].nil? ? 1 : f[i-1][0] + 1
      f[i][1] = i == 0 || f[i-1][1].nil? ? nil : f[i-1][1] + 1
    elsif num.negative?
      f[i][0] = i == 0 || f[i-1][1].nil? ? nil : f[i-1][1] + 1
      f[i][1] = i == 0 || f[i-1][0].nil? ? 1 : f[i-1][0] + 1
    end
  end
  f.map(&:first).compact.max.to_i
end
