# @param {Integer[][]} events
# @return {Integer}
def max_events(events)
  events.sort!
  cur, count = nil, 0
  events.each_with_index do |(l, r), i|
    if cur.nil?
      cur = l
    elsif l <=cur && cur < r
      events[i] = [cur+=1, r]
    end
  end
  events.sort!
  cur = nil
  while !events.empty?
    l, r = events.shift
    if cur.nil? || l > cur
      count += 1
      cur = l
    else
      l = cur + 1
      next if l > r
      i = events.bsearch_index { |ll, rr| ll > l || ll >= l && rr >= r } || events.size
      events.insert(i, [l, r])
    end
  end
  count
end
