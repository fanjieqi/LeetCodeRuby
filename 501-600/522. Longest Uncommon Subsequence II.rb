def check(s1, s2)
  tmp = -1
  s1.split("").each do |char|
    s2 = s2[tmp+1..-1]
    tmp = s2.index(char)
    return false if tmp.nil?
  end
  true
end

# @param {String[]} strs
# @return {Integer}
def find_lu_slength(strs)
  arr = []
  strs.each_with_index do |s1, i|
    flag = true
    strs.each_with_index do |s2, j|
      if i != j && tmp = check(s1,s2)
        flag = false
        break
      end
    end
    arr << s1 if flag
  end
  arr.size == 0 ? -1 : arr.map(&:size).max
end
