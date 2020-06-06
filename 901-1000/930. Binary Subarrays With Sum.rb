def calculate(queue)
  tmp = queue.shift
  if queue.empty?
    (tmp + 1) * tmp / 2
  else
    (tmp + 1) * (queue[-1] + 1)
  end
end

# @param {Integer[]} a
# @param {Integer} s
# @return {Integer}
def num_subarrays_with_sum(a, s)
  sum, tmp, queue = 0, 0, []
  queue << 0 if a[0] == 1
  a.each_with_index do |ele, i|
    if ele == 0
      if queue.empty?
        queue << 1
      else
        queue[-1] += 1
      end
    else
      tmp += 1
      if tmp > s
        tmp -= 1
        sum += calculate(queue)
      end
      queue << 0
    end
  end
  sum += calculate(queue) if tmp == s
  sum
end
