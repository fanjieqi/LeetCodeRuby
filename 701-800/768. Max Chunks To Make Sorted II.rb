# @param {Integer[]} arr
# @return {Integer}
def max_chunks_to_sorted(arr)
  tmp = arr.sort
  count, i, hash = 0, 0, {}
  while i < arr.size
    hash[tmp[i]] ||= 0
    hash[tmp[i]] += 1
    hash[arr[i]] ||= 0
    hash[arr[i]] -= 1
    hash.delete(tmp[i]) if hash[tmp[i]] && hash[tmp[i]].zero?
    hash.delete(arr[i]) if hash[arr[i]] && hash[arr[i]].zero?
    while i < arr.size && !hash.empty?
      i += 1
      hash[tmp[i]] ||= 0
      hash[tmp[i]] += 1
      hash[arr[i]] ||= 0
      hash[arr[i]] -= 1
      hash.delete(tmp[i]) if hash[tmp[i]] && hash[tmp[i]].zero?
      hash.delete(arr[i]) if hash[arr[i]] && hash[arr[i]].zero?
    end
    i += 1
    count += 1
  end
  count
end
