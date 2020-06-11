# @param {Integer[]} tokens
# @param {Integer} p
# @return {Integer}
def bag_of_tokens_score(tokens, power)
  tokens.sort!
  points = 0
  (0..tokens.size-1).each do |i|
    break if tokens[i].nil?
    if tokens[i] > power && i != tokens.size-1 && points > 0
      power += tokens.pop
      points -= 1
    end
    if tokens[i] <= power
      power -= tokens[i]
      points += 1
    else
      break
    end
  end
  points
end
