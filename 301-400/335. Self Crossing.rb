DIRECTION = [
  [0, 1],
  [-1,0],
  [0,-1],
  [1, 0]
]

def check(p1, p2, q1, q2)
  if p1[0] == p2[0] 
    if q1[0] == q2[0]
      p1[0] == q1[0] && (
        [p1[1], p2[1]].min <= q1[1] && q1[1] <= [p1[1], p2[1]].max ||
        [p1[1], p2[1]].min <= q2[1] && q2[1] <= [p1[1], p2[1]].max
      )
    else
      [q1[0], q2[0]].min <= p1[0] && p1[0] <= [q1[0], q2[0]].max &&
      [p1[1], p2[1]].min <= q1[1] && q1[1] <= [p1[1], p2[1]].max
    end
  elsif p1[1] == p2[1]
    if q1[1] == q2[1]
      p1[1] == q1[1] && (
        [p1[0], p2[0]].min <= q1[0] && q1[0] <= [p1[0], p2[0]].max ||
        [p1[0], p2[0]].min <= q2[0] && q2[0] <= [p1[0], p2[0]].max
      )
    else
      [p1[0], p2[0]].min <= q1[0] && q1[0] <= [p1[0], p2[0]].max &&
      [q1[1], q2[1]].min <= p1[1] && p1[1] <= [q1[1], q2[1]].max
    end
  end
end

# @param {Integer[]} x
# @return {Boolean}
def is_self_crossing(x)
  points = [[0, 0]]

  dir = 0
  x.each do |len|
    xx, yy = points.last
    points << [xx + len * DIRECTION[dir][0], yy + len * DIRECTION[dir][1]]
    dir = (dir + 1) % 4
  end

  (0..points.length-3).each do |i|
    p1 = points[i]
    p2 = points[i+1]
    (i+2..points.length-2).each do |j|
      q1 = points[j]
      q2 = points[j+1]
      return true if check(p1, p2, q1, q2)
    end
  end

  false
end
