# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @param {Integer} d
# @param {Integer} e
# @param {Integer} f
# @param {Integer} g
# @param {Integer} h
# @return {Integer}
def compute_area(a, b, c, d, e, f, g, h)
  (c-a)*(d-b)+(g-e)*(h-f)-[[g,c].min - [a,e].max, 0].max * [[d,h].min - [b,f].max, 0].max
end
