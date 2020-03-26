# @param {Integer} left
# @param {Integer} right
# @return {Integer[]}
def self_dividing_numbers(left, right)
  (left..right).select { |num| !num.to_s[/0/] && num.to_s.split("").map(&:to_i).all? { |i| num % i == 0} }
end
