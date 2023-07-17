class PolyTreeNode
    def initialize(value)
    @value = value
    @parent = nil
    @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end

    def parent=(node)
        if self.parent
            self.parent.children.delete(self)
        end
            @parent = node
            self.parent.children << self unless self.parent.nil?
        self
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        raise "No Parent" if !child_node.parent
        child_node.parent=(nil)
    end

    def dfs(target_value)
    if self.value == target_value
        return self
    end

    i = 0
    while i < self.children.length
        current = self.children[i]
        result = current.dfs(target_value)
        if result
            return result
        end
        i += 1
    end
    return nil
    end

    def bfs(target_value)
        array = []
        array << self

        while array.length > 0
            curr = array.shift
            if curr.value == target_value
                return curr
            else
                array += curr.children
            end
        end
        nil

    end


end



class KnightPathFinder
    def initialize(starting_position)
    self.root_node = starting_position 
    @considered_positions = starting_position 
    @current_position = starting position 
    end 

    # def build_move_tree 
    
    # end

    def self.valid_moves 
        x_coordinate = @current_position[0]
        y_coordinate = @current_position[1]
        holder_array = []
        potential_moves = [] 

        (x_coordinate-1..x_coordinate+1).each do |x_coordinates|
            (y_coordinate-1..y_coordinate+1).each do |y_coordinates|
                if [x_coordinates, y_coordinates] != @current_position
                    holder_array << [x_coordinates, y_coordinates]
                end 
            end 
        end 

        holder_array.each do |coordinate_pairs|
            if coordinate_pairs[0] >= 0 & coordinate_pairs[1] >= 0 
                potential_moves << coordinate_pairs  
            end 
        end 

        potential_moves.each do |moves|
            if !@considered_positions.include?(moves)
                @considered_positions << moves 
            end 
        end 

    end 

    def new_move_positions 
    potential_positions = [] 

    self.valid_moves.each do |move|
        if !considered_positions.include?(move)
            potential_positions << potential_positions 
        end 
    end 

    return potential_positions 

    end 
    
end 