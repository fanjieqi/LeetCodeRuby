# @param {String} s
# @return {String}
def shortest_palindrome(s)
  n = s.length
  rev = s.reverse
  s_new = s+"#"+rev
  n_new = s_new.length
  f = [0]*n_new
  t, i = 0, 1
  while i < n_new
    if s_new[i] == s_new[t]
      f[i]=t+1
      t+=1
      i+=1
    else
      if t>0
        t = f[t-1]
      else
        f[i]=0
        i+=1
      end
    end
  end
  return rev[0..n-f[-1]-1]+s
end
