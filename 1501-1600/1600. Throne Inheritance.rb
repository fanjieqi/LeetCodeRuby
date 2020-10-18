class ThroneInheritance

=begin
  :type king_name: String
=end
  def initialize(king_name)
    @king_name = king_name
    @father, @children, @death = {}, {}, {}
  end


=begin
  :type parent_name: String
  :type child_name: String
  :rtype: Void
=end
  def birth(parent_name, child_name)
    @father[child_name] = parent_name
    @children[parent_name] ||= []
    @children[parent_name] << child_name
  end


=begin
  :type name: String
  :rtype: Void
=end
  def death(name)
    @death[name] = true
  end


=begin
  :rtype: String[]
=end
  def get_inheritance_order(name = nil, order = [])
    if name.nil?
      get_inheritance_order(@king_name)
    else
      order += @death[name] ? [] : [name]
      @children[name]&.each do |child_name|
        order = get_inheritance_order(child_name, order)
      end
      order
    end
  end


end

# Your ThroneInheritance object will be instantiated and called as such:
# obj = ThroneInheritance.new(king_name)
# obj.birth(parent_name, child_name)
# obj.death(name)
# param_3 = obj.get_inheritance_order()
