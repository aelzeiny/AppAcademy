class PolyTreeNode
  attr_reader :parent, :children
  attr_accessor :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    @parent.children.delete(self) unless @parent.nil?

    @parent = new_parent
    @parent.children << self unless @parent.nil?
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    raise "Not yo' child" unless child?(child)
    child.parent = nil
  end

  def child?(adoptee)
    children.include?(adoptee)
  end

  def to_s
    @value.to_s
  end

end
