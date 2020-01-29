# @param {String} ring
# @param {String} key
# @return {Integer}
def find_rotate_steps(ring, key)
  @ring = ring
  @map = {}
  @ring.split("").map.with_index do |k, i|
    @map[k] ||= []
    @map[k] << i
  end

  @dis = []
  queue = Queue.new
  queue << [0, 0]
  while !queue.empty?
    i, pos = queue.pop
    next if i >= key.length
    @map[key[i]].each do |d|
      @dis[i] ||= []
      dis = (i == 0 ? 0 : @dis[i-1][pos].to_i) + [@ring.length - (d-pos).abs, (d-pos).abs].min + 1
      if @dis[i][d].nil? || dis < @dis[i][d]
        @dis[i][d] = dis
        queue << [i+1, d]
      end
    end
  end
  @dis.last.compact.min
end
