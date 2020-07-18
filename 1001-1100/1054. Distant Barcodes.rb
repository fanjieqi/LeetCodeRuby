# @param {Integer[]} barcodes
# @return {Integer[]}
def rearrange_barcodes(barcodes)
  counts = barcodes.group_by(&:itself).transform_values(&:count).sort_by(&:last).reverse
  a1, a2 = [], []
  counts.each do |num, count|
    if a1.size < (barcodes.size+1)/2
      rest = (barcodes.size+1)/2 - a1.size
      if count >= rest
        a1 += [num] * rest
        count -= rest
      else
        a1 += [num] * count
        count = 0
      end
    end
    if count > 0 && a2.size < barcodes.size/2
      rest = barcodes.size/2 - a2.size
      if count >= rest
        a2 += [num] * rest
        count -= rest
      else
        a2 += [num] * count
        count = 0
      end
    end
  end
  a1.zip(a2).flatten.compact
end
