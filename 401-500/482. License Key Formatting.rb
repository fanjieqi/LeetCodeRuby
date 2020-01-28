# @param {String} s
# @param {Integer} k
# @return {String}
def license_key_formatting(s, k)
  s.gsub("-","").split("").reverse.each_slice(k).map(&:reverse).map(&:join).map(&:upcase).reverse.join("-")
end
