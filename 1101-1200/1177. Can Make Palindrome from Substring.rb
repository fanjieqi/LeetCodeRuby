# @param {String} s
# @param {Integer[][]} queries
# @return {Boolean[]}
def can_make_pali_queries(s, queries)
  sum = [{}]
  s.each_char.with_index do |char, i|
    sum[i+1] = sum[i].clone
    sum[i+1][char] = sum[i+1][char].to_i + 1
  end
  ans = {}
  queries.map do |l, r, k|
    if ans.dig(l, r).nil?
      hash = {}
      sum[r+1].each do |char, count|
        tmp = count - sum[l][char].to_i
        hash[char] = tmp if tmp > 0
      end
      ans[l] ||= {}
      ans[l][r] = hash.values.select(&:odd?).size / 2
    end
    ans[l][r] <= k
  end
end
