def build_sub_map(map, indexes, words_hash)
  words_hash.each do |k, words|
    next if words.length == 1
    (0..words.length-2).each do |ii|
      i = indexes[words[ii]]
      map[i] ||= []
      (ii+1..words.length-1).each do |jj|
        j = indexes[words[jj]]
        map[j] ||= []
        map[i] << j
        map[j] << i
      end
    end
  end
end

def build_map(word_list, len)
  map = []
  indexes = word_list.map.with_index{|word, i| [word,i]}.to_h

  words_hash = word_list.group_by.with_index{ |word| word[1..-1] }
  build_sub_map(map, indexes, words_hash)
  words_hash = word_list.group_by.with_index{ |word| word[0..-2] }
  build_sub_map(map, indexes, words_hash)

  (1..len-2).each do |i|
    words_hash = word_list.group_by.with_index{ |word| word[0..i-1] + word[i+1..-1] }
    build_sub_map(map, indexes, words_hash)
  end

  map
end

def bfs(map, source, destination)
  pathes = []
  pathes[source] = 1
  mark = []
  mark[source] = true
  queue = Queue.new
  queue << [source, 1]
  while !queue.empty?
    tmp, count = queue.pop
    next if pathes[tmp] && count > pathes[tmp]
    pathes[tmp] = count
    next if tmp == destination
    map[tmp].each do |j|
      next if mark[j]
      mark[j] = true
      queue << [j, count + 1]
      mark[j] = false
    end
  end

  pathes[destination].to_i
end

# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
  return 0 if begin_word == end_word || word_list.length == 0 || !word_list.include?(end_word)
  word_list << begin_word

  map = build_map(word_list, begin_word.length)
  source = word_list.length - 1
  destination = word_list.index(end_word)
  bfs(map, source, destination)
end
