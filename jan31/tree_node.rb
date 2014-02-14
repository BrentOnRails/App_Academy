class Tree_Node
  attr_accessor :parent, :children, :value

  def initialize(value, parent= [], children = [])
    @value = value
    @parent = parent
    @children = children
  end

  def remove_child(child)
    child.parent = nil
    @children.delete(child) || nil
  end

  def dup
    return Tree_Node.new(self.value) if self.children.empty?
    new_tree = Tree_Node.new(self.value)
    self.children.each do |child|
      new_tree.add_child(child.dup)
    end
    new_tree
  end

  def sum
    self.value + self.children.map(&:sum).inject(:+)
  end

  def add_child(child)
    child.parent.remove_child(child) unless child.parent.empty?
    child.parent = self
    @children << child
    child
  end

  def dfs(search_value)
    return self if self.value == search_value

    @children.each do |child|
      val = child.dfs(search_value)
      return val unless val.nil?
    end
    nil
  end

  def bfs (search_value)
    queue = [self]

    until queue.empty?
      current_node = queue.shift
      return current_node if search_value == current_node.value
      queue += current_node.children
    end
    nil
  end

end


class KnightPathFinder
  attr_reader :new_tree

  def initialize(start_position)
    @start_position = start_position
    @new_tree = Tree_Node.new(@start_position)
    build_move_tree(@new_tree)
  end

  def find_path(end_position)
    #use breadth-first search to recursively find the shortest path        #and print it
    get_path(@new_tree.bfs(end_position)).each do |step|
      p step.value
    end
  end

  def build_move_tree(node, generated_moves=[])

    children = create_move(node)
    return if children.nil?

    children.each do |child_cords|
      next if generated_moves.include?(child_cords)
      generated_moves << child_cords
      node.add_child(Tree_Node.new(child_cords))
    end

    node.children.each do |child|
        build_move_tree(child, generated_moves)
    end
    nil
  end

  def get_path(end_node)
    path = []
    until end_node == []
      path << end_node
      end_node = end_node.parent
    end
    path.reverse
  end

  def create_move(position)
    possible_moves = []
    possible_move_coords = [
      [1, 2], [2, 1], [-1, -2], [-2, -1],
      [1, -2], [2, -1], [-1, 2], [-2, 1]
    ]

    possible_move_coords.map do |coords|
      x, y = coords
      px, py, = position.value
      possible_moves << [px+x, py+y] unless invalid_move?([px+x, py+y])
    end
    possible_moves
  end

  def invalid_move?(position)
    position.any? {|cord| cord > 7 || cord < 0 }
  end

end

# kp.find_path([7, 7])
# kp = KnightPathFinder.new([0,0])

root = Tree_Node.new(1)
root.add_child(Tree_Node.new(2)).add_child(Tree_Node.new(5))
root.add_child(Tree_Node.new(3)).add_child(Tree_Node.new(4))

root.sum

