# @param {Character[]} letters
# @param {Character} target
# @return {Character}
def next_greatest_letter(letters, target)
  letters = letters.uniq.sort
  letters.find{|letter| letter > target} || letters.min
end
