NUMS = {
  0 => "zero",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
}

HASH = {
  g: 8,
  u: 4,
  w: 2,
  x: 6,
  z: 0,

  f: 5,
  h: 3,
  s: 7,
  o: 1,

  i: 9,
}

# @param {String} s
# @return {String}
def original_digits(s)
  hash = s.split("").group_by(&:itself).transform_values(&:count)
  ans = []
  [%i(g u w x z), %i(f h s o), %i(i)].each do |arr|
    arr.each do |c|
      count = hash[c.to_s]
      if count.to_i > 0
        NUMS[HASH[c]].split("").each { |c1| hash[c1] -= count }
        ans += [HASH[c]] * count
      end
    end
  end
  ans.sort.map(&:to_s).join
end
