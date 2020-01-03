def dfs(hash, input, l, r)
  hash[l] = {r => [input[l..r].to_i]}  if input[l..r][/^\d+$/]
  return hash[l][r] if hash[l] && hash[l][r]
  ans = []
  (l..r).each do |i|
    next if input[i][/\d/]
    lefts = dfs(hash, input, l, i-1)
    rights = dfs(hash, input, i+1, r)
    lefts.each do |left|
      rights.each do |right|
        case input[i]
        when "+" then ans << left + right
        when "-" then ans << left - right
        when "*" then ans << left * right
        end
      end
    end
  end
  hash[l] ||= {}
  hash[l][r] = ans
  ans
end

# @param {String} input
# @return {Integer[]}
def diff_ways_to_compute(input)
  hash = {}
  dfs(hash, input, 0, input.length - 1)
  hash[0][input.length-1]
end
