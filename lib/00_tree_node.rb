require 'byebug'

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

  def dfs(target_value)
    return self if value == target_value
    children.each do |child|
      searched = child.dfs(target_value)
      return searched unless searched.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      curr_node = queue.shift
      return curr_node if curr_node.value == target_value
      queue.concat(curr_node.children)
    end

    nil
  end

  def to_s
    @value.to_s
  end

end
