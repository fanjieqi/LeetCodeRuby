HASH = {
  0 => [""],
}

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  return HASH[n] if HASH[n]
  ans = []
  (0..n-1).each do |i|
    generate_parenthesis(i).each do |l|
      generate_parenthesis(n-i-1).each do |r|
        ans << "(#{l})#{r}"
      end
    end
  end
  HASH[n] = ans.sort.uniq
  HASH[n]
end
