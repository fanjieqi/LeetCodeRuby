# @param {Integer} hour
# @param {Integer} minutes
# @return {Float}
def angle_clock(hour, minutes)
  num = (minutes*6 - minutes/2.0 - (hour%12)*30).abs
  num > 180 ? 360 - num : num
end
