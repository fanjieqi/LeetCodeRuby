class WordDictionary

  attr_accessor :childs, :isend

  def initialize()
    @childs, @isend = {}, false
  end

  def insert(dirs)
    iterator = self
    dirs.each do |dir|
      iterator.childs[dir] ||= WordDictionary.new
      iterator = iterator.childs[dir]
      return false if iterator.isend
    end
    iterator.isend = true
  end

end

# @param {String[]} folder
# @return {String[]}
def remove_subfolders(folder)
  folder.sort!
  dict = WordDictionary.new
  folder.map do |subfolder|
    dirs = subfolder.split('/')
    dict.insert(dirs) ? subfolder : nil
  end.compact
end
