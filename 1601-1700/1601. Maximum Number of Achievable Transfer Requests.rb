# @param {Integer} n
# @param {Integer[][]} requests
# @return {Integer}
def maximum_requests(n, requests)
  requests.size.downto(0) do |k|
    (0..requests.size-1).to_a.combination(k).each do |buildings|
      degree = [0] * n
      buildings.each do |i|
        degree[requests[i][0]] -= 1
        degree[requests[i][1]] += 1
      end
      return k if degree.all?(&:zero?)
    end
  end
  0
end
