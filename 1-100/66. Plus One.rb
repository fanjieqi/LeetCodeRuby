# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  (digits.map(&:to_s).join("").to_i + 1).to_s.split("").map(&:to_i)
end
