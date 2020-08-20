# @param {String} s
# @return {String[]}
def print_vertically(s)
  words = s.split(" ")
  length = words.map(&:length).max
  ans = []
  words.each_with_index do |word, i|
    (0..length-1).each do |j|
      ans[j] ||= []
      ans[j][i] = word[j] || " "
    end
  end
  ans.map { |word| word.join.rstrip }
end
