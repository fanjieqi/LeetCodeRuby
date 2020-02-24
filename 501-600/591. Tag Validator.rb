# @param {String} code
# @return {Boolean}
def is_valid(code)
  code.gsub!(/<!\[CDATA\[.*?\]\]>|t/, '-')
  prev = nil
  while code != prev
    prev = code
    code = code.gsub(/<([A-Z]{1,9})>[^<]*<\/\1>/, 't')
  end
  code == 't'
end
