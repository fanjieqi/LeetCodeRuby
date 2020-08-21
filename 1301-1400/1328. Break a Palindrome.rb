# @param {String} palindrome
# @return {String}
def break_palindrome(palindrome)
  return "" if palindrome.size == 1
  n = palindrome.size
  if palindrome[0, n/2][/^a+$/] && palindrome[-(n/2)..-1][/^a+$/]
    palindrome.sub(/[a]$/, 'b')
  else
    palindrome.sub(/[^a]/, 'a')
  end
end
