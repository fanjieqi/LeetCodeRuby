# @param {Integer} sx
# @param {Integer} sy
# @param {Integer} tx
# @param {Integer} ty
# @return {Boolean}
def reaching_points(sx, sy, tx, ty)
  while (sx < tx && sy < ty)
    if (tx < ty)
      ty %= tx
    else
      tx %= ty
    end
  end

  (sx == tx && sy <= ty && (ty - sy) % sx == 0) || (sy == ty && sx <= tx && (tx - sx) % sy == 0)
end
