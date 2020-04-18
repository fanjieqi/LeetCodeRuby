MAX = 1 << 31
# @param {Integer[][]} routes
# @param {Integer} s
# @param {Integer} t
# @return {Integer}
def num_buses_to_destination(routes, s, t)
  return 0 if s == t
  lines = {}
  routes.each_with_index do |route, i|
    return 1 if route.include?(s) && route.include?(t)
    route.each do |station|
      lines[station] ||= {}
      lines[station][i] = true
    end
  end

  map = {}
  lines.each do |station, buses|
    buses.keys.each do |bus1|
      buses.keys.each do |bus2|
        next if bus1 == bus2
        map[bus1] ||= {}
        map[bus2] ||= {}
        map[bus1][bus2] = true
        map[bus2][bus1] = true
      end
    end
  end

  queue = Queue.new
  dist = []
  lines[s].keys.each do |bus|
    queue << bus
    dist[bus] = 1
  end

  min = MAX
  while !queue.empty?
    bus1 = queue.pop
    next if dist[bus1] >= min || map[bus1].nil?
    map[bus1].keys.each do |bus2|
      tmp = dist[bus1] + 1
      if dist[bus2].nil? || tmp < dist[bus2]
        dist[bus2] = tmp
        queue << bus2
        min = tmp if lines.dig(t, bus2) && tmp < min
      end
    end
  end
  min == MAX ? -1 : min
end
