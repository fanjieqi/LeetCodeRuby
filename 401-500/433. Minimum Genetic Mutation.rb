# @param {String} start
# @param {String} end
# @param {String[]} bank
# @return {Integer}
def min_mutation(start_s, end_s, bank)
  return 0 if start_s == end_s
  bank.unshift(start_s)
  return -1 if (n = bank.index(end_s)).nil?

  map = []
  (0..bank.length-2).each do |i|
    map[i] = []
    (i+1..bank.length-1).each do |j|
      next if (0..7).inject(0) {|sum, k| sum += bank[i][k] != bank[j][k] ? 1 : 0} != 1
      map[i] << j
      map[j] ||= []
      map[j] << i
    end
  end

  queue = Queue.new
  queue << 0
  dis = [0]
  while !queue.empty? && dis[n].nil?
    i = queue.pop
    map[i].each do |j|
      tmp = dis[i] + 1
      if dis[j].nil? || tmp < dis[j]
        dis[j] = tmp
        queue << j
      end
    end
  end
  dis[n] || -1
end
