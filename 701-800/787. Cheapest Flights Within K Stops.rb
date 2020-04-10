# @param {Integer} n
# @param {Integer[][]} flights
# @param {Integer} src
# @param {Integer} dst
# @param {Integer} k
# @return {Integer}
def find_cheapest_price(n, flights, src, dst, k)
  map = []
  flights.each { |u, v, w| map[u] ||= {}; map[u][v] = w }
  dist = [{src => 0}]
  queue = Queue.new
  queue << [src, 0]
  while !queue.empty?
    u, stops = queue.pop
    next if stops > k
    map[u].each do |v, w|
      dist[stops+1] ||= {}
      tmp = dist[stops][u] + w
      if dist[stops+1][v].nil? || tmp < dist[stops+1][v]
        dist[stops+1][v] = tmp
        queue << [v, stops+1]
      end
    end if map[u]
  end
  (0..k+1).map{|i| dist[i] && dist[i][dst]}.compact.min || -1
end
