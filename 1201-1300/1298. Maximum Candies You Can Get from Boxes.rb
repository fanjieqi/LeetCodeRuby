# @param {Integer[]} status
# @param {Integer[]} candies
# @param {Integer[][]} keys
# @param {Integer[][]} contained_boxes
# @param {Integer[]} initial_boxes
# @return {Integer}
def max_candies(status, candies, keys, contained_boxes, initial_boxes)
  queue = Queue.new
  get_keys, touched, count = {}, {}, 0
  initial_boxes.each do |box|
    touched[box] = true
    queue << box if status[box] == 1
  end

  while !queue.empty?
    u = queue.pop

    next if candies[u].nil? || touched[u].nil? || (get_keys[u].nil? && status[u] == 0) 
    count += candies[u]
    candies[u] = nil
    keys[u].each do |v|
      get_keys[v] = true
      queue << v
    end
    contained_boxes[u].each do |v|
      touched[v] = true
      queue << v
    end
  end

  count
end
