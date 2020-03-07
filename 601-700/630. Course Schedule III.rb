# @param {Integer[][]} courses
# @return {Integer}
def schedule_course(courses)
  courses = courses.sort_by(&:last)
  array = []

  time=0
  courses.each do |duration, closed_at|
    time += duration
    k = array.bsearch_index{|ele| ele <= duration} || -1
    array.insert(k, duration)

    time -= array.shift if time > closed_at
  end

  array.size
end
