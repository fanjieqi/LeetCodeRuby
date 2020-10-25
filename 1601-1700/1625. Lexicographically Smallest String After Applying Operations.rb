# @param {String} s
# @param {Integer} a
# @param {Integer} b
# @return {String}
def find_lex_smallest_string(s, a, b)
  queue = Queue.new
  hash, min, n = {}, nil, s.size
  queue << s
  while !queue.empty?
    str = queue.pop
    min = str if min.nil? || str < min
    mov = str[-b..-1] + str[0..-b-1]
    if hash[mov].nil?
      queue << mov
      hash[mov] = true
    end

    add = ""
    (0..n-1).each { |i| add[i] = i.odd? ? ((str[i].to_i + a) % 10).to_s : str[i] }
    if hash[add].nil?
      queue << add
      hash[add] = true
    end
  end
  min
end
