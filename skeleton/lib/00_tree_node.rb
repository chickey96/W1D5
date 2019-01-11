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
end