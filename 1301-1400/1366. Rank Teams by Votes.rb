# @param {String[]} votes
# @return {String}
def rank_teams(votes)
  chars = {}
  votes.each do |vote|
    (0..vote.size-1).each do |i|
      char = vote[i]
      chars[char] ||= (0..25).map{0}
      chars[char][i] -= 1
    end
  end
  chars.keys.sort_by { |char| chars[char] + [char] }.join
end
