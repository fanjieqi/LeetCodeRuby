=begin
# Employee info
class Employee
    attr_accessor :id, :importance, :subordinates
    def initialize( id, importance, subordinates)
        # It's the unique id of each node.
        # unique id of this employee
        @id = id
        # the importance value of this employee
        @importance = importance
        # the id of direct subordinates
        @subordinates = subordinates
    end
end
=end
# @param {Employee} employees
# @param {Integer} id
# @return {Integer}
def get_importance(employees, id)
  employees = employees.group_by(&:id).transform_values(&:first)
  mark = {id => true}
  sum = 0
  queue = Queue.new
  queue << id
  while !queue.empty?
    employee_id = queue.pop
    sum += employees[employee_id].importance
    employees[employee_id].subordinates.each do |subordinate_id|
      next if mark[subordinate_id]
      mark[subordinate_id] = true
      queue << subordinate_id
    end
  end
  sum
end
