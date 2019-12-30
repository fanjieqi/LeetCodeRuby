# @param {String} s
# @return {String[][]}
def partition(s)
  return [] if s.length == 0
  return [[s]] if s.length == 1
  return [s.split("")] if s.length == 2 && s[0] != s[-1]
  return [s.split(""), [s]] if s.length == 2 && s[0] == s[-1]

  ans = []

  queue = Queue.new
  queue << s.split("")
  while !queue.empty?
    tmp = queue.pop
    ans << tmp
    (0..tmp.length-2).each do |i|
      if tmp[i] == tmp[i+1].reverse
        sub = tmp[i] + tmp[i+1]
        if i == 0
          ele = [sub] + tmp[i+2..-1]
        else
          ele = tmp[0..i-1] + [sub] + tmp[i+2..-1]
        end
        queue << ele      
      end
      if i > 0 && tmp[i-1] == tmp[i+1].reverse
        sub = tmp[i-1] + tmp[i] + tmp[i+1]
        if i == 1
          ele = [sub] + tmp[i+2..-1]
        else
          ele = tmp[0..i-2] + [sub] + tmp[i+2..-1]
        end
        queue << ele
      end
    end
  end
  ans.uniq
end
