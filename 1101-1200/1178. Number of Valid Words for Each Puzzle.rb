class WordDictionary

  attr_accessor :childs, :end_count

  def initialize()
    @childs, @end_count = {}, 0
  end

  def insert(word)
    iterator = self
    word.each_char do |char|
      iterator.childs[char] ||= WordDictionary.new
      iterator = iterator.childs[char]
    end
    iterator.end_count += 1
  end

  def find_satisfied(puzzle, capital)
    @@puzzle, @@capital = puzzle, capital
    @@count = 0
    self.find_rest(0)
    @@count
  end

  def find_rest(start_at, contain_capital = false)
    @@count += self.end_count if contain_capital && self.end_count.to_i > 0
    self.childs.each do |char, rest|
      i = @@puzzle.index(char, start_at)
      rest&.find_rest(i+1, contain_capital || char == @@capital ) if i
    end
  end
end

# @param {String[]} words
# @param {String[]} puzzles
# @return {Integer[]}
def find_num_of_valid_words(words, puzzles)
  dict = WordDictionary.new
  words = words.map { |word| word.chars.uniq.sort.join }
  words.each { |word| dict.insert(word) }

  capitals = puzzles.map { |puzzle| puzzle[0] }
  puzzles = puzzles.map { |puzzle| puzzle.chars.uniq.sort.join }
  (0..puzzles.size-1).map { |i| dict.find_satisfied(puzzles[i], capitals[i]) }
end
