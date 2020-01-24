# @param {Integer[]} a
# @param {Integer[]} b
# @param {Integer[]} c
# @param {Integer[]} d
# @return {Integer}
def four_sum_count(a, b, c, d)
  h1 = {}
  a.each do |n1|
    h1[n1] ||= 0
    h1[n1] += 1
  end

  h2 = {}
  h1.keys.each do |n1|
    b.each do |n2|
      h2[n1+n2] ||= 0
      h2[n1+n2] += h1[n1]
    end
  end

  h3 = {}
  c.each do |n3|
    h3[n3] ||= 0
    h3[n3] += 1
  end

  h4 = {}
  h3.keys.each do |n3|
    d.each do |n4|
      h4[n3+n4] ||= 0
      h4[n3+n4] += h3[n3]
    end
  end

  ans = 0
  h2.each do |n2, c|
    if h4[-n2]
      ans += (c * h4[-n2])
    end
  end
  ans
end
