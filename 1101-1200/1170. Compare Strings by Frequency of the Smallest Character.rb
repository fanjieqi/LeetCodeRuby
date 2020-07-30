def calculate(str)
  char = str.chars.uniq.sort.first
  str.scan(char).count
end

# @param {String[]} queries
# @param {String[]} words
# @return {Integer[]}
def num_smaller_by_frequency(queries, words)
  array = []
  words.each do |word|
    count = calculate(word)
    i = array.bsearch_index { |num| num >= count } || array.size
    array.insert(i, count)
  end

  queries.map do |query|
    count= calculate(query)
    i = array.bsearch_index { |num| num > count } || array.size
    array.size - i
  end
end
