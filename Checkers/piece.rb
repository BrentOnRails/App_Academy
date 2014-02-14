# coding: utf-8

class Piece

  attr_reader :color

  def initialize(color, board)
    @color = color
    @board = board
  end


  def moves!(pick, drops)
    if drops[0].is_a?(Array)
      until drops[0].is_a?(Array)
        move(pick,drops.shift)
        gets
      end
      move(pick, drops)
    else
      move(pick, drops)
    end
  end

  def move(pick, drop)
    #possible_moves

      possible_moves = moves(pick)
      p possible_moves
      gets

      if possible_moves.empty?
        raise "This piece has no available moves!"
      elsif !possible_moves.include?(drop)
        raise "This is not a valid move for this piece"
      end

      @board[pick] = nil
      if drop[0] == 0 || drop[0] == 7
        puts "trying to make a king"
        @board[drop] = King.new(self.color, @board)
      else
        @board[drop] = self
      end

      @board.display

      row_change = (pick[0]- drop[0])
      jumped_piece_pos = []
      if row_change.abs > 1 #if row changed more than one
        jumped_piece_pos = [ ((pick[0] + drop[0]) / 2) , ((pick[1] + drop[1]) / 2) ]
        @board[jumped_piece_pos] = nil
      end

      @board.display


  end

  def enemy?(pos)
    @board[pos].color != self.color
  end

end

class Man < Piece


  def symbol
    if color == :red
      ' ✪ '.red
    else
      ' ✪ '.black
    end
  end

  def moves(pos)
    directions = [[1,1], [1,-1]] if self.color == :black
    directions = [[-1,-1], [-1,1]] if self.color == :red

    pos_moves = []

    directions.each do |direction|
      row, col = (pos[0] + direction[0]), (pos[1] + direction[1])
      next if (row < 0 || col < 0)
      pos_moves << [row, col] if (row < 8 && col < 8)
    end



    unblocked_moves = []
    pos_moves.each do |move|
      if @board[move].nil?
        unblocked_moves << move
      elsif self.enemy?(move)
        unblocked_moves += self.build_jump(move)
      end
    end

    unblocked_moves
  end

  def build_jump(pos)
    directions = [[1,1], [1,-1]] if self.color == :black
    directions = [[-1,-1], [-1,1]] if self.color == :red

    pos_moves = []

    directions.each do |direction|
      row, col = (pos[0] + direction[0]), (pos[1] + direction[1])
      next if (row < 0 || col < 0)
      if (row < 8 && col < 8)
        pos_moves << [row, col] unless @board[[row, col]] != nil
      end
    end


    pos_moves
  end
end

class King < Piece

  def symbol
    if color == :red
      ' ♚ '.red
    else
      ' ♔ '.black
    end
  end

  def moves(pos)
    directions = [[1,1], [1,-1],[-1,-1], [-1,1]]
    pos_moves = []

    directions.each do |direction|
      row, col = (pos[0] + direction[0]), (pos[1] + direction[1])
      next if (row < 0 || col < 0)
      pos_moves << [row, col] if (row < 8 && col < 8)
    end



    unblocked_moves = []
    pos_moves.each do |move|
      if @board[move].nil?
        unblocked_moves << move
      elsif self.enemy?(move)
        unblocked_moves += self.build_jump(move)
      end
    end

    unblocked_moves
  end

  def build_jump(pos)
    directions = [[1,1], [1,-1],[-1,-1], [-1,1]]

    pos_moves = []

    directions.each do |direction|
      row, col = (pos[0] + direction[0]), (pos[1] + direction[1])
      next if (row < 0 || col < 0)
      if (row < 8 && col < 8)
        pos_moves << [row, col] unless @board[[row, col]] != nil
      end
    end


    pos_moves
  end

end
