# @param {Integer} amount
# @param {Integer[]} coins
# @return {Integer}
def change(amount, coins)
  coins.sort!
  f = [1]
  coins.each do |coin|
    (1..amount).each do |j|
      f[j] ||= 0
      f[j] += f[j-coin] if j >= coin
    end
  end
  f[amount].to_i
end
