# @param {String} word
# @return {Boolean}
def detect_capital_use(word)
  !!word[/^[A-Z]+$/]  || !!word[/^[a-z]+$/] || !!word[/^[A-Z][a-z]+$/]
end
