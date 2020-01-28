# @param {String} n
# @return {String}
def smallest_good_base(n)
  n = n.to_i
  max_m = Math.log(n,2).to_i
  max_m.downto(1) do |m|
    k = (n**m**-1).to_i
    return k.to_s if (k**(m+1)-1)/(k-1) == n
  end
  (n-1).to_s
end
