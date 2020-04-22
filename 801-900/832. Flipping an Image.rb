# @param {Integer[][]} a
# @return {Integer[][]}
def flip_and_invert_image(a)
  a.map{ |row| row.reverse.map{|i| 1-i } }
end
