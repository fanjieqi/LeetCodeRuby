require 'date'
# @param {String} date1
# @param {String} date2
# @return {Integer}
def days_between_dates(date1, date2)
  (Date.parse(date1) - Date.parse(date2)).abs.to_i
end
