# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  father = {}
  map = {}
  prerequisites.each do |i, j|
    father[i] ||= []
    father[i] << j
    map[j] ||= []
    map[j] << i
  end
  starts = (0..num_courses-1).select { |i| father[i].nil? }
  return [] if starts.length == 0

  mark = {}
  queue = Queue.new
  starts.each do |start|
    mark[start] = 0
    queue << start
  end
  while !queue.empty?
    course = queue.pop
    map[course] && map[course].each do |ele|
      if !mark[ele] && father[ele].all? { |dad| mark[dad] }
        mark[ele] ||= mark[course] + 1
        queue << ele
      end
    end
  end
  (0..num_courses-1).all? { |i| mark[i] } ? mark.sort_by(&:last).map(&:first) : []
end
