# @param {String} input
# @return {Integer}
def length_longest_path(input)
  return 0 if input.length == 0
  dirs = input.split("\n")
  longest = ""
  tmp = []
  dirs.each do |dir|
    deepth = dir[/^[\t]+/].to_s.length
    tmp[deepth] = dir[/[^\t]+$/]
    tmp = tmp[0..deepth]
    path = tmp.join("/")
    longest = path if path["."] && path.length > longest.length
  end
  longest.length
end
