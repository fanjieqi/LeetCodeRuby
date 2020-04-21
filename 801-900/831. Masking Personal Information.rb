# @param {String} s
# @return {String}
def mask_pii(s)
  if s[/\w+@/]
    tmp = s[/^\w/] + "*****" + s[/\w(?=@)/]
    s.gsub(/\w+(?=@)/, tmp).downcase
  else
    digits = s.scan(/\d/)
    if digits.size == 10
      "***-***-" + digits.last(4).join
    else
      "+" + "*" * (digits.size - 10) + "-***-***-" + digits.last(4).join
    end
  end
end
