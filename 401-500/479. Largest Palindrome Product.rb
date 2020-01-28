# @param {Integer} n
# @return {Integer}
def largest_palindrome(n)
  return 9 if n==1
  return 987 if n==2
  (2..9*10**(n-1)).each do |i|
    hi=(10**n)-i
    lo= hi.to_s.reverse.to_i
    next if i**2-4*lo < 0
    return (lo+10**n*(10**n-i))%1337 if (i**2-4*lo)**0.5 == ((i**2-4*lo)**0.5).to_i
  end
end
