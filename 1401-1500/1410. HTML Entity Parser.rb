# @param {String} text
# @return {String}
def entity_parser(text)
  text.gsub('&quot;', '"').gsub('&apos;', "\'").gsub('&gt;', '>').gsub('&lt;', '<').gsub('&frasl;', '/').gsub('&amp;', '&')
end
