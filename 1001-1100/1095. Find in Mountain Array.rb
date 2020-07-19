# This is MountainArray's API interface.
# You should not implement it, or speculate about its implementation
# class MountainArray

#    def get(index)
#    end

#    def length()
# 	 end
# end

def search(l, r, asc = true)
  while l <= r
    mid = (l + r) / 2
    v = @mountain_arr.get(mid)
    if v == @target
      return mid
    elsif v > @target == asc
      r = mid - 1
    elsif v < @target == asc
      l = mid + 1
    end
  end
  nil
end

# @param {int} int
# @param {MountainArray} mountain_arr
# @return {int}
def findInMountainArray(target, mountain_arr)
  @target, @mountain_arr = target, mountain_arr
  l, r = 0, mountain_arr.length-1
  mini = nil

  while l <= r
    mid = (l + r) / 2
    vm = mountain_arr.get(mid)
    if vm == @target
      min = mid if min.nil? || mid < min
    end

    if mid > 0
      vl = mountain_arr.get(mid-1)
      if vl < vm 
        if @target <= vl
          k = search(l, mid-1, true)
          min = k if k && (min.nil? || k < min)
        end
        l = mid + 1
      else
        if vm >= @target
          k = search(mid+1, r, false)
          min = k if k && (min.nil? || k < min)
        end
        r = mid - 1
      end
    else
      l = mid + 1
    end

    if mid < r
      vr = mountain_arr.get(mid+1)
      if vm > vr
        if vr >= @target
          k = search(mid+1, r, false)
          min = k if k && (min.nil? || k < min)
        end
        r = mid - 1
      else
        if @target <= vm
          k = search(l, mid-1, false)
          min = k if k && (min.nil? || k < min)
        end
        l = mid + 1
      end
    else
      r = mid - 1
    end
  end
  min || -1
end
