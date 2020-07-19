# @param {Integer[]} count
# @return {Float[]}
def sample_stats(count)
  samples = (0..count.size-1).select { |i| count[i].positive? }

  min = count.index(&:positive?)
  max = count.rindex(&:positive?)
  sum = (0..count.size-1).inject(0) { |sum, i| sum += i * count[i] }
  size = count.sum

  mode = (0..count.size-1).inject(0) { |tmp, i| tmp = (count[i] > count[tmp] ? i : tmp) }

  l, r, mean = 0, samples.size-1, nil
  counts = count.clone
  while l < r
    if count[samples[l]] == count[samples[r]]
      if l == r-1
        mean = (samples[l] + samples[r])/2.0
        break
      end
      l += 1
      r -= 1
    elsif count[samples[l]] < count[samples[r]]
      count[samples[r]] -= count[samples[l]]
      l += 1
    elsif count[samples[l]] > count[samples[r]]
      count[samples[l]] -= count[samples[r]]
      r -= 1
    end
  end

  [min.to_f, max.to_f, sum/ size.to_f, mean || samples[l].to_f, mode.to_f ]
end
