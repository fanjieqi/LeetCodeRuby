# @param {Integer} target
# @return {Integer}
def racecar(target)
  queue = Queue.new
  queue << [0, 1, 0]
  mark = { 1 => {0 => true}, -1 => {} }
  while !queue.empty?
    pos, speed, count = queue.pop
    count += 1

    pos1, speed1 = pos+speed, speed * 2
    return count if pos1 == target
    queue << [pos1, speed1, count]

    pos2, speed2 = pos, speed.positive? ? -1 : 1
    if mark[speed2][pos2].nil?
      mark[speed2][pos2] = true
      queue << [pos2, speed2, count]
    end
  end
  -1
end
