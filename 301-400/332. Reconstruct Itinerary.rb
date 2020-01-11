def dfs(from)
  while !@map[from].nil? && !@map[from].empty?
    dfs(@map[from].shift)
  end
  @ans.unshift(from)
end

# @param {String[][]} tickets
# @return {String[]}
def find_itinerary(tickets)
  @map = {}
  tickets.each do |ticket|
    @map[ticket[0]] ||= []
    @map[ticket[0]] << ticket[1]
  end
  @map.keys.each do |k|
    @map[k] = @map[k].sort
  end
  @ans = []
  dfs("JFK")
end
