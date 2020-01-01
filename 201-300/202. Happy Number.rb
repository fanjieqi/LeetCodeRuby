# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  hash = {}
  loop do
    return false if hash[n]
    hash[n] = true
    n = n.to_s.split("").map(&:to_i).inject(0) {|sum, i| sum += i**2}
    return true if n == 1
  end
end
