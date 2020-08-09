# @param {String} s
# @return {Integer}
def balanced_string(s)
  n, hq, hw, he, hr = s.size, [0], [0], [0], [0]
  (0..n-1).each do |i|
    hq[i+1] = hq[i].to_i + (s[i] == 'Q' ? 1 : 0)
    hw[i+1] = hw[i].to_i + (s[i] == 'W' ? 1 : 0)
    he[i+1] = he[i].to_i + (s[i] == 'E' ? 1 : 0)
    hr[i+1] = hr[i].to_i + (s[i] == 'R' ? 1 : 0)
  end

  l, r, count = 0, n-1, n/4
  while l < r
    mid = (l + r) / 2
    result = (0..n-mid).any? { |i| 
      tq = hq[n] - (hq[i+mid]-hq[i])
      tw = hw[n] - (hw[i+mid]-hw[i])
      te = he[n] - (he[i+mid]-he[i])
      tr = hr[n] - (hr[i+mid]-hr[i])
      (tq - count).abs + (tw - count).abs + (te - count).abs + (tr - count).abs == mid
    }
    if result
      r = mid
    else
      l = mid+1
    end
  end
  l
end
