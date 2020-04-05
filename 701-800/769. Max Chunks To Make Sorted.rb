# @param {Integer[]} arr
# @return {Integer}
def max_chunks_to_sorted(arr)
  count, l, r = 0, 0, 0
  array = arr.sort
  while l < arr.size
    r += 1 while r < arr.size && array[l..r] != arr[l..r].sort
    count += 1
    l = r + 1
    r = l
  end
  count
end
