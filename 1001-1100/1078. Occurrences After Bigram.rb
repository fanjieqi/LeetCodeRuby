# @param {String} text
# @param {String} first
# @param {String} second
# @return {String[]}
def find_ocurrences(text, first, second)
  ans = []
  ans << text[/^\w+/] while text = text.split(/(?<!\w)#{first} #{second} /, 2)[1]
  ans
end
