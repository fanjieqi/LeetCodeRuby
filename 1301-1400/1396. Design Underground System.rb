class UndergroundSystem
  def initialize()
    @checkin, @path = {}, {}
  end


=begin
  :type id: Integer
  :type station_name: String
  :type t: Integer
  :rtype: Void
=end
  def check_in(id, station_name, t)
    @checkin[id] = [station_name, t]
  end


=begin
  :type id: Integer
  :type station_name: String
  :type t: Integer
  :rtype: Void
=end
  def check_out(id, station_name, t)
    start_station, start_at = @checkin[id]
    key = "#{start_station},#{station_name}"
    @path[key] ||= [0, 0]
    @path[key][0] += t - start_at
    @path[key][1] += 1
  end


=begin
  :type start_station: String
  :type end_station: String
  :rtype: Float
=end
  def get_average_time(start_station, end_station)
    key = "#{start_station},#{end_station}"
    @path[key].nil? ? 0 : (@path[key][0] / @path[key][1].to_f)
  end


end

# Your UndergroundSystem object will be instantiated and called as such:
# obj = UndergroundSystem.new()
# obj.check_in(id, station_name, t)
# obj.check_out(id, station_name, t)
# param_3 = obj.get_average_time(start_station, end_station)
