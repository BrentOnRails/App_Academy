class Maze
  attr_reader :maze

  def initialize
    @maze = []
    @start = []
    read_maze
    find_start
    print_map
    puts

    @current_x, @current_y = @start
  end

  def print_map
    @maze.each do |row|
      p row.join("")
    end
  end

  def read_maze
    File.open('maze1.txt').each_line do |line|
      @maze << line.chomp.split('')
    end

  end

  def find_start
    @maze.each_with_index do |x, xdex|
        x.each_with_index do |y, ydex|
          @start = [xdex, ydex] if y == "S"
        end
      end
  end

  def mark_path
    @maze[@current_x][@current_y] = "x"
  end

  def current_value
    @maze[@current_x][@current_y]
  end

  def play
    until current_value == "E"
      mark_path
      move
    end

    print_map
  end

  def move
    [move_up, move_right, move_down, move_left].each do |pos|
      unless blocked?(pos)
        @current_x, @current_y = pos
        return
      end
    end
  end

  def move_up
    [@current_x - 1, @current_y]
  end

  def move_down
    [@current_x + 1, @current_y]
  end

  def move_right
    [@current_x, @current_y + 1]
  end

  def move_left
    [@current_x, @current_y - 1]
  end

  def blocked?(pos)
    @maze[pos[0]][pos[1]] == "*" || @maze[pos[0]][pos[1]] == "x"
  end



end


m = Maze.new
m.play
