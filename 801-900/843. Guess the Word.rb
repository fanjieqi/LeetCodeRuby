#    This is Master's API interface.
#    You should not implement it, or speculate about its implementation
#
# class Master
# =begin
#     :type word: String
#     :rtype: Integer
# =end
#     def guess(word)
#         ...
#     end
# end
#

def match(w1, w2)
  (0..5).inject(0) { |sum, i| sum += (w1[i] == w2[i] ? 1 : 0) }
end

# @param {String[]} wordlist
# @param {Master} master
# @return {Void}
def find_secret_word(wordlist, master)
  n = 0
  while n < 6
    count = (0..5).map { |i| wordlist.map { |w| w[i] }.group_by(&:itself).transform_values(&:count) }
    guess = wordlist.max_by { |w| (0..5).map { |i| count[i][w[i]] }.sum }
    n = master.guess(guess)
    wordlist = wordlist.select { |w| match(w, guess) == n }
  end
end
