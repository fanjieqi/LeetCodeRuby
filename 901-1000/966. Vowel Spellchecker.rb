# @param {String[]} wordlist
# @param {String[]} queries
# @return {String[]}
def spellchecker(wordlist, queries)
  sensitive = wordlist.inject({}) { |tmp, word| tmp[word] ||= word; tmp }
  insensitive = wordlist.inject({}) { |tmp, word| key = word.downcase; tmp[key] ||= word; tmp }
  vowel_errors = insensitive.inject({}) { |tmp, (word, value)| key = word.gsub(/[aeiou]/,'_'); tmp[key] ||= value; tmp }
  queries.map { |query| sensitive[query] || insensitive[query.downcase] || vowel_errors[query.downcase.gsub(/[aeiou]/,'_')] || "" }
end
