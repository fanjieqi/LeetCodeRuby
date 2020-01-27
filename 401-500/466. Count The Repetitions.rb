# @param {String} s1
# @param {Integer} n1
# @param {String} s2
# @param {Integer} n2
# @return {Integer}
def get_max_repetitions(s1, n1, s2, n2)
  d, l1, l2, i1, i2 = {}, s1.length, s2.length, 0, 0
  total = l1 * n1

  while i1 < total
    if s1[i1 % l1] == s2[i2 % l2]
      if d[[i1 % l1, i2 % l2]]
        prev1, prev2 = d[[i1 % l1, i2 % l2]]
        cir1, cir2 = i1 - prev1, i2 - prev2
        count = (total - i1) / cir1
        i1 += count * cir1
        i2 += count * cir2
        break if i1 >= total
      else
        d[[i1 % l1, i2 % l2]] = [i1, i2]
      end
      i2 += 1
    end
    i1 += 1
  end

  i2 / l2 / n2
end
