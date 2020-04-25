# @param {Integer[][]} rooms
# @return {Boolean}
def can_visit_all_rooms(rooms)
  mark = (0..rooms.size-1).map{false}
  queue  = Queue.new
  queue << 0
  mark[0] = true
  while !queue.empty?
    u = queue.pop
    rooms[u].each do |v|
      next if mark[v]
      mark[v] = true
      queue << v
    end
  end
  mark.all?
end
