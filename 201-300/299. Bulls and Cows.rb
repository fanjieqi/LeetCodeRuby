# @param {String} secret
# @param {String} guess
# @return {String}
def get_hint(secret, guess)
  n = secret.length
  count_a = (0..n-1).inject(0) {|sum, i| sum += (secret[i] == guess[i]) ? 1 : 0}
  hash_s = {}
  hash_g = {}
  (0..n-1).each do |i|
    next if secret[i] == guess[i]
    hash_s[secret[i]] ||= 0
    hash_s[secret[i]] += 1
    hash_g[guess[i]] ||= 0
    hash_g[guess[i]] += 1
  end
  count_b = 0
  hash_g.each do |k, v|
    count_b += [v, hash_s[k].to_i].min
  end
  "#{count_a}A#{count_b}B"
end
