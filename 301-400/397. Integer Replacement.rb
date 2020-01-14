# @param {Integer} n
# @return {Integer}
def integer_replacement(n)
  return 0 if n == 1
  (n.even? ? integer_replacement(n/2) : [integer_replacement(n-1), integer_replacement(n+1)].min ) + 1
end
