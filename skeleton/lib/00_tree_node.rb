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

    def dfs(target_value)
        # debugger
        return self if self.value == target_value
        children.each do |child|
            results = child.dfs(target_value)
            return results if results != nil 
        end
        nil
    end

    def inspect
        "#{value}, #{children}"
    end

    def bfs(target_value)
        q = [self]
        until q.empty?
            node = q.shift
            return node if node.value == target_value
            node.children.each do |child|
                q.push(child)
            end
        end
        nil 
    end
end