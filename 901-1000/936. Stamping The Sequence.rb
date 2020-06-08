# @param {String} stamp
# @param {String} target
# @return {Integer[]}
def moves_to_stamp(stamp, target)
  n, indexes = stamp.size, []
  n.downto(1) do |l|
    (n-l).downto(0) do |i|
      indexes << "*" * (i-0) + stamp[i, l] + "*" * (n - i - l)
    end
  end
  ans, rep = [], "*" * n
  (n * 10).times do
    flag = true
    indexes.each do |str|
      while tmp = target.index(str)
        flag = false
        ans << tmp
        target.sub!(str, rep)
      end
    end
    break if flag
  end
  target[/[a-z]/] ? [] : ans.reverse
end
