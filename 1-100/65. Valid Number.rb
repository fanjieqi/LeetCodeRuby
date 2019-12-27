# @param {String} s
# @return {Boolean}
def is_number(s)
  !!s.strip[/^[\+\-]{0,1}((\d+(\.\d+){0,1})|(\.\d+)|\d+\.)(e[\+\-]{0,1}(\d+)){0,1}$/]
end
