# @param {Integer[][]} clips
# @param {Integer} t
# @return {Integer}
def video_stitching(clips, t)
  clips.sort!
  return -1 if clips.dig(0, 0)!= 0
  array = []
  clips.each do |clip|
    if array.empty?
      array << clip
    else
      i = array.bsearch_index { |ele| ele[1] >= clip[0] } || array.size
      if array[i] && array[i][0] == clip[0]
        array[i][1] = clip[1]
        array.delete_at(i+1) while array[i+1] && array[i+1][1] <= clip[1]
      elsif array[i] && array[i][1] < clip[1]
        array.insert(i+1, clip)
        array.delete_at(i+2) while array[i+2] && array[i+2][1] <= clip[1]
      end
    end
    return array.size if array[-1][1] >= t
  end
  array.bsearch_index { |ele| ele[1] >= t } + 1 rescue -1
end
