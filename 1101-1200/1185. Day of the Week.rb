require 'date'

WEEKDAYS = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

# @param {Integer} day
# @param {Integer} month
# @param {Integer} year
# @return {String}
def day_of_the_week(day, month, year)
  WEEKDAYS[Date.parse("#{year}-#{month}-#{day}").wday]
end
