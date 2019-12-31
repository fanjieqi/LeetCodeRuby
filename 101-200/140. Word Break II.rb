def get_intervals(ans, s)
  result = []
  queue = Queue.new
  ans[s.length - 1].each { |ele| queue << ele }
  while !queue.empty?
    ele = queue.pop
    before = ele.last
    if before == 0
      result << ele
    else
      ans[before].each {|tmp|
       queue << ele + tmp
      }
    end
  end
  result
end

# @param {String} s
# @param {String[]} word_dict
# @return {String[]}
def word_break(s, word_dict)
  return [] if word_dict.length == 0
  return [] if (s.split("").uniq - word_dict.join("").split("").uniq).length > 0
  f = [true]
  ans = []
  s = "_" + s
  (1..s.length).each do |i|
    ans[i] ||= []
    (0..word_dict.length - 1).each do |j|
      l = word_dict[j].length
      next if i < l || s[i-l+1..i] != word_dict[j] || !f[i-l]
      f[i] = f[i-l]
      if i-l == 0
        ans[i] << [0]
      else
        ans[i] << [i-l]
      end
    end
  end
  return [] if ans[s.length-1].length == 0

  result = get_intervals(ans, s)

  s = s[1..-1]
  result.map do |ele|
    tmp = s.clone
    ele[0..-2].each {|i| tmp.insert(i, " ") }
    tmp
  end
end
