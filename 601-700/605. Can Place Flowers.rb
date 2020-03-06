# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
def can_place_flowers(flowerbed, n)
  flowerbed.each_with_index do |mark, i|
    flowerbed[i] = (n -= 1) if mark == 0 && (i == 0 || flowerbed[i-1] == 0) && (i == flowerbed.length - 1 || flowerbed[i+1] == 0)
  end
  n <= 0
end
