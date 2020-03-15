# @param {Integer} n
# @param {Integer} m
# @return {Integer}
def flip_lights(n, m)
  return 1 if m == 0

  hash = [{}]
  queue = Queue.new
  queue << [0, n.times.map { 1 }]
  while !queue.empty?
    index, status = queue.pop
    next if index > m

    return 8 if hash[index].keys.size >= 8
    hash[index+=1] ||= {}

    filp_all = status.map { |ele| (1-ele) }
    unless hash[index][filp_all.hash]
      queue << [index, filp_all]
      hash[index][filp_all.hash] = true
    end

    flip_odd = status.map.with_index { |ele, i| (i+1).odd? ? (1-ele) : ele }
    unless hash[index][flip_odd.hash]
      queue << [index, flip_odd]
      hash[index][flip_odd.hash] = true
    end

    flip_even = status.map.with_index { |ele, i| (i+1).even? ? (1-ele) : ele }
    unless hash[index][flip_even.hash]
      queue << [index, flip_even]
      hash[index][flip_even.hash] = true
    end

    flip_3 = status.map.with_index { |ele, i| (i % 3 == 0) ? (1-ele) : ele }
    unless hash[index][flip_3.hash]
      queue << [index, flip_3]
      hash[index][flip_3.hash] = true
    end
  end
  hash[m].size
end
