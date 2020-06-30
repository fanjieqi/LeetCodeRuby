# @param {Integer[]} a
# @param {Integer[][]} queries
# @return {Integer[]}
def sum_even_after_queries(a, queries)
  sum = a.select(&:even?).sum
  queries.map do |val, i|
    if a[i].odd? && val.odd?
      sum += a[i] + val
    elsif a[i].even? && val.even?
      sum += val
    elsif a[i].even? && val.odd?
      sum -= a[i]
    end
    a[i] += val
    sum
  end
end
