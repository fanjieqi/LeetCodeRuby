# @param {Integer} k
# @param {Integer[]} arrival
# @param {Integer[]} load
# @return {Integer[]}
def busiest_servers(k, arrival, load)
  array, backup, ready, count = [], (0..k-1).to_a, [], []
  arrival.each_with_index do |arrive_at, i|
    server_id = i % k
		ready, backup = backup, [] if server_id == 0

    while !array.empty? && array[0][0] <= arrive_at
      tmp_id = array.shift[1]
      if tmp_id < server_id 
        j = backup.bsearch_index { |ele| ele > tmp_id } || backup.size
        backup.insert(j, tmp_id)
      else 
        j = ready.bsearch_index { |ele| ele > tmp_id } || ready.size
        ready.insert(j, tmp_id)
      end
    end

    use_queue = !ready.empty? ? ready : backup
		next if use_queue.empty?
    tmp_id = use_queue.shift
		count[tmp_id] = count[tmp_id].to_i + 1
    end_at = arrive_at + load[i]
    j = array.bsearch_index { |ele| ele[0] > end_at || ele[0] == end_at && ele[1] >= tmp_id } || array.size
    array.insert(j, [end_at, tmp_id])
  end
  max = count.max
  (0..k-1).select { |i| count[i] == max }
end
