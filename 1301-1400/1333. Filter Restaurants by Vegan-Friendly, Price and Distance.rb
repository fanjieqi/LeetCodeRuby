# @param {Integer[][]} restaurants
# @param {Integer} vegan_friendly
# @param {Integer} max_price
# @param {Integer} max_distance
# @return {Integer[]}
def filter_restaurants(restaurants, vegan_friendly, max_price, max_distance)
  restaurants.select { |id, rating, veganFriendly, price, distance| (vegan_friendly == 0 || veganFriendly == vegan_friendly) && price <= max_price && distance <= max_distance }
             .sort_by { |id, rating, veganFriendly, price, distance| [-rating, -id] }.map(&:first)
end
