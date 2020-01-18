# @param {String} s
# @return {Integer}
def strong_password_checker(s)
  missing_type = 3
  missing_type -= 1 if s[/[a-z]/]
  missing_type -= 1 if s[/[A-Z]/]
  missing_type -= 1 if s[/\d/]

  change, one, two = 0, 0, 0
  i = 2
  while i < s.length
    if s[i] == s[i-1] && s[i-1] == s[i-2]
      length = 2
      while i < s.length && s[i] == s[i-1]
        length += 1
        i += 1
      end

      change += length / 3
      if length % 3 == 0
        one += 1
      elsif length % 3 == 1
        two += 1
      end
    else
      i += 1
    end
  end
  if s.length < 6
    [missing_type, 6 - s.length].max
  elsif s.length <= 20
    [missing_type, change].max
  else
    delete = s.length - 20
    change -= [delete, one].min
    change -= [[delete - one, 0].max, two * 2].min / 2
    change -= [delete - one - 2 * two, 0].max / 3

    delete + [missing_type, change].max
  end
end
