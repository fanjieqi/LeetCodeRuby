# @param {String} s
# @return {Boolean}
def check_valid_string(s)
  s.gsub!("()","") while s["()"]
  queue = Queue.new
  queue << [0, 0]
  while !queue.empty?
    count, i = queue.pop
    return true if count.zero? && i >= s.size
    next if count > (s.size-i)
    if s[i] == "("
      queue << [count+1, i+1] if count+1 <= (s.size-i-1)
    elsif s[i] == ")"
      queue << [count-1, i+1] if count > 0
    elsif s[i] == "*"
      queue << [count, i+1] if count <= (s.size-i-1)
      queue << [count+1, i+1] if count+1 <= (s.size-i-1)
      queue << [count-1, i+1] if count > 0
    end
  end
  false
end
