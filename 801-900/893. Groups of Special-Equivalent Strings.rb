# @param {String[]} a
# @return {Integer}
def num_special_equiv_groups(a)
  hash = {}
  a.each do |word|
    w1, w2 = [], []
    word.each_char.with_index do |char, i|
      if i.odd?
        w1 << char
      else
        w2 << char
      end
    end
    key = w1.sort.join + "_" + w2.sort.join
    hash[key] = true
  end
  hash.size
end
