# @param {String[]} words
# @return {String[]}
def find_words(words)
  rows = [
    %w(q w e r t y u i o p),
    %w(a s d f g h j k l),
    %w(z x c v b n m)
  ]
  hash = {}
  rows.each_with_index do |row,i|
    rows[i] += row.map(&:upcase)
    hash.merge!(rows[i].map {|key| [key, i]}.to_h)
  end

  words.select do |word|
    word.split("").map{|key| hash[key]}.uniq.length == 1
  end
end
