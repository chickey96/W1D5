require 'byebug'
class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end
    
    def parent=(node)
        # debugger
        if parent != nil 
            parent.children.delete(self)
        end
        @parent = node 
        node.children << self unless node.nil?
    end

    def add_child(child_node)
        child_node.parent = self 
    end

    def remove_child(child_node)
        raise "Not a child" unless @children.include?(child_node)
        @children.delete(child_node)
        child_node.parent = nil 
    end
end