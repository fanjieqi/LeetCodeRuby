class SnapshotArray

=begin
    :type length: Integer
=end
    def initialize(length)
      @snap, @current, @snap_id = {}, {}, -1
    end


=begin
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
    def set(index, val)
      @current[index] = val
    end


=begin
    :rtype: Integer
=end
    def snap()
      @snap_id += 1
      @snap[@snap_id] = @current.clone
      @snap_id
    end


=begin
    :type index: Integer
    :type snap_id: Integer
    :rtype: Integer
=end
    def get(index, snap_id)
      @snap.dig(snap_id, index) || 0
    end


end

# Your SnapshotArray object will be instantiated and called as such:
# obj = SnapshotArray.new(length)
# obj.set(index, val)
# param_2 = obj.snap()
# param_3 = obj.get(index, snap_id)
