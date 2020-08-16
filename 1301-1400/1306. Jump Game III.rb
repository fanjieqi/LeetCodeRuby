# @param {Integer[]} arr
# @param {Integer} start
# @return {Boolean}
def can_reach(arr, start)
  queue = Queue.new
  queue << start
  while !queue.empty?
    i = queue.pop
    return true if arr[i] == 0
    next if arr[i].nil?
    queue << i + arr[i] if arr[i + arr[i]]
    queue << i - arr[i] if arr[i - arr[i]] && i >= arr[i]
    arr[i] = nil
  end
  false
end
