# @param {String[]} queries
# @param {String} pattern
# @return {Boolean[]}
def camel_match(queries, pattern)
  pats = pattern.split("").map { |char| char + '[a-z]*' }.join
  uppers = pattern.scan(/[A-Z]/)
  queries.map { |query| query.scan(/[A-Z]/) == uppers && !query[/#{pats}/].nil? }
end
