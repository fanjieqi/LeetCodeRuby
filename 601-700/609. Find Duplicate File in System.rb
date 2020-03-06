# @param {String[]} paths
# @return {String[][]}
def find_duplicate(paths)
  hash = {}
  paths.each do |path|
    dir, files = path.split(" ", 2)
    files.split(" ").each do |file|
      content = file[/\(.+\)/]
      hash[content] ||= []
      hash[content] << dir + "/" + file.gsub(content, "")
    end
  end
  hash.values.select{|v| v.size > 1 }
end
