# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer}
def min_domino_rotations(a, b)
  min = nil
  (1..6).each do |num|
    counta, countb, flag = 0, 0, true
    (0..a.size-1).each do |i|
      if a[i] == num && b[i] != num
        counta += 1
      elsif a[i] != num && b[i] == num
        countb += 1
      elsif a[i] != num && b[i] != num
        flag = false
        break
      end
    end
    min = counta if flag && (min.nil? || counta < min)
    min = countb if flag && (min.nil? || countb < min)
  end
  min || -1
end
