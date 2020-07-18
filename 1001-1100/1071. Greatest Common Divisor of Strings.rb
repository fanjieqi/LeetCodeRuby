# @param {String} str1
# @param {String} str2
# @return {String}
def gcd_of_strings(str1, str2)
  str1, str2 = str2, str1 if str1.size < str2.size
  k = str2.size.downto(1).find { |l| str1.size % l == 0 && str2.size % l == 0 && str1[/^(#{str2[0,l]})+$/] }
  k ? str2[0, k] : ""
end
