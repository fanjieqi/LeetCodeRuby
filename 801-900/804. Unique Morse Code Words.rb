MAP = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
# @param {String[]} words
# @return {Integer}
def unique_morse_representations(words)
  words.map { |word| word.split("").map{|c| MAP[c.ord-'a'.ord] }.join }.uniq.size
end
