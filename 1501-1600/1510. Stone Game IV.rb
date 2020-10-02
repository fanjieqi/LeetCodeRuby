# @param {Integer} n
# @return {Boolean}
def winner_square_game(n)
  hash = { 0 => false, 1 => true }
  (2..n).each do |i|
    tmp = (1..Math.sqrt(i)).any? { |j| hash[i-(j**2)] == false }
    hash[i] = tmp
  end
  hash[n]
end
