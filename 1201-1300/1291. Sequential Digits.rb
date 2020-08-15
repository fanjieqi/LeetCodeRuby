# @param {Integer} low
# @param {Integer} high
# @return {Integer[]}
def sequential_digits(low, high)
  array = []
  (2..9).each do |l|
    (1..9-l+1).each do |i|
      num = (0..l-1).map { |j| i + j }
      array << num.join.to_i
    end
  end
  array.select { |num| low <= num && num <= high }
end
