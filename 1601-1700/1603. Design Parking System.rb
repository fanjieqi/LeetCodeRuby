class ParkingSystem

=begin
  :type big: Integer
  :type medium: Integer
  :type small: Integer
=end
  def initialize(big, medium, small)
    @big, @medium, @small = big, medium, small
  end


=begin
  :type car_type: Integer
  :rtype: Boolean
=end
  def add_car(car_type)
    case car_type
    when 1 then (@big -= 1) && @big >= 0
    when 2 then (@medium -= 1) && @medium >= 0
    when 3 then (@small -= 1) && @small >= 0
    end
  end


end

# Your ParkingSystem object will be instantiated and called as such:
# obj = ParkingSystem.new(big, medium, small)
# param_1 = obj.add_car(car_type)
