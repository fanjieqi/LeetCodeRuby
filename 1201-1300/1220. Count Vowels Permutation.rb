MOD = 10**9 + 7
# @param {Integer} n
# @return {Integer}
def count_vowel_permutation(n)
  fa, fe, fi, fo, fu = [], [], [], [], []
  (0..n-1).each do |i|
    if i == 0 
      fa[i] = 1
      fe[i] = 1
      fi[i] = 1
      fo[i] = 1
      fu[i] = 1
    else
      fa[i] = fe[i-1] + fi[i-1] + fu[i-1]
      fe[i] = fa[i-1] + fi[i-1]
      fi[i] = fe[i-1] + fo[i-1]
      fo[i] = fi[i-1]
      fu[i] = fi[i-1] + fo[i-1]
    end
  end
  [fa[n-1], fe[n-1], fi[n-1], fo[n-1], fu[n-1]].sum % MOD
end
