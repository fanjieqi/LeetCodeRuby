# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  father = {}
  map = {}
  prerequisites.each do |i, j|
    father[i] ||= []
    father[i] << j
    map[j] ||= []
    map[j] << i
  end
  starts = (0..num_courses-1).select { |i| father[i].nil? }
  return false if starts.length == 0

  mark = {}
  queue = Queue.new
  starts.each { |start| queue << start }
  while !queue.empty?
    course = queue.pop
    mark[course] = true
    map[course] && map[course].each do |ele|
      queue << ele if !mark[ele] && father[ele].all? { |dad| mark[dad] }
    end
  end
  (0..num_courses-1).all? { |i| mark[i] }
end
