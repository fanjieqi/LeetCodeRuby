# @param {Integer} num
# @return {String}
def to_hex(num)
  num >= 0 ? num.to_s(16) : (num + (1 << 32)).to_s(16)
end
