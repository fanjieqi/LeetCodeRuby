require 'date'

# @param {String} date
# @return {Integer}
def day_of_year(date)
  Date.parse(date).yday
end
