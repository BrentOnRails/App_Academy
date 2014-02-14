#!/usr/bin/env ruby
# coding: utf-8

require 'colorize'
require 'io/console'
require 'debugger'

class Piece
  attr_accessor :color, :position

  def initialize(color, position, board)
    @color, @position, @board  = color, position, board
  end

  def row
    self.position[0]
  end

  def col
    self.position[1]
  end

  def in_bound?(pos)
    pos.none? do |coord|
      coord > 7 || coord < 0
    end
  end

end

class SlidingPiece < Piece
  HORIZONTAL_DIRS = [[0,1],[0,-1],[-1,0],[1,0]]
  DIAGONAL_DIRS = [[1,1],[-1,-1],[1,-1],[-1,1]]

  def moves
    possible_moves = []

    move_dirs = self.move_dirs

    move_dirs.each do |move_dir|
      delta_row = move_dir[0]
      delta_col = move_dir[1]
      next_possible_move = [self.row, self.col]
      while true
        next_possible_move[0] += delta_row
        next_possible_move[1] += delta_col

        if self.in_bound?(next_possible_move)
          target_piece = @board[next_possible_move]
          if target_piece.nil?
            possible_moves << next_possible_move.dup
          elsif target_piece.color != self.color
            possible_moves << next_possible_move.dup
            break
          else
            break
          end
        else
          break
        end
      end
    end


    possible_moves
  end


end


class SteppingPiece < Piece

  def moves
    # Return an array of possible moves
    orig_row = self.row
    orig_col = self.col

    # Get all the move deltas
    generated_moves = self.move_steps
    # Apply deltas to original pos
    possible_moves = generated_moves.map do |new_pos|
      new_pos[0] += orig_row
      new_pos[1] += orig_col
      new_pos
    end

    in_bounds = possible_moves.select do |new_pos| # Remove all out bound positions
      self.in_bound?(new_pos)
    end

    in_bounds.reject! do |new_pos|
      target_piece = @board[new_pos]
      target_piece.color == self.color unless target_piece.nil?
    end


    in_bounds
  end
end

class Bishop < SlidingPiece
  def move_dirs
    SlidingPiece::DIAGONAL_DIRS
  end

  def to_s
    if self.color == :white
      '♗'
    else
      '♝'
    end
  end
end

class Queen < SlidingPiece
  def move_dirs
    SlidingPiece::HORIZONTAL_DIRS + SlidingPiece::DIAGONAL_DIRS
  end

  def to_s
    if self.color == :white
       '♕'
    else
      '♛'
    end
  end
end



class Rook < SlidingPiece
  def move_dirs
    SlidingPiece::HORIZONTAL_DIRS
  end

  def to_s
    if self.color == :white
      '♖'
    else
      '♜'
    end
  end
end

class King < SteppingPiece


  def move_steps
    [0, -1, -1, 1, 1].permutation(2).to_a.uniq
  end

  def to_s
    if self.color == :white
      '♔'
    else
      '♚'
    end
  end
end

class Knight < SteppingPiece
  def move_steps
    [-2, -1, 1, 2].permutation(2).to_a.select { |row, col| row.abs != col.abs }
  end

  def to_s
    if self.color == :white
      '♘'
    else
      '♞'
    end
  end
end

class Pawn < Piece
  def moves
    # Return an array of possible moves
    orig_row = self.row
    orig_col = self.col

    # Get all the move deltas
    generated_moves = self.move_steps

    # Apply deltas to original pos
    possible_moves = generated_moves.map do |new_pos|
      new_pos[0] += orig_row
      new_pos[1] += orig_col
      new_pos
    end.select do |new_pos| # Remove all out bound positions
      self.in_bound?(new_pos) && @board[new_pos].nil?
    end

    possible_moves += self.kill_steps
  end

  def move_steps
    moves = []
    if self.color == :black
      moves << [1,0]
      moves << [2,0] if self.row == 1
    else
      moves << [-1,0]
      moves << [-2,0] if self.row == 6
    end
    moves
  end

  def kill_steps

    moves = []

    if self.color == :black
      moves << [self.row + 1, self.col + 1]
      moves << [self.row + 1, self.col - 1]
    else
      moves << [self.row - 1, self.col + 1]
      moves << [self.row - 1, self.col - 1]
    end

    moves = moves.select do |pos|
      target_piece = @board[pos]
      target_piece && target_piece.color != self.color
    end

    moves
  end

  def to_s
    if self.color == :white
      '♙'
    else
      '♟'
    end
  end
end


class Board

  # attr_reader :grid
  def initialize(game)
    @grid = Array.new(8) { Array.new(8) }
    @game = game
    self.reset_board
    # self.colorize
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def count
    8
  end

  def display
    system "clear"
    puts " a b c d e f g h".blue

    @grid.each_with_index do |row, r_index|
      str = "#{(r_index-8).abs}".blue
      row.each_with_index do |piece, p_index|

        if piece.nil?
          if (r_index == @game.cursor_x && p_index == @game.cursor_y)
            str += "  ".on_red
          else
            str += "  ".on_blue
          end
        else
          if (r_index == @game.cursor_x && p_index == @game.cursor_y)
            if piece.color == :white
              str+="#{piece} ".white.on_red
            else
              str += "#{piece} ".on_red
            end
          else
            str += "#{piece} ".on_blue
          end
        end
      end

      puts str
    end

  end

  def move(start, finish)
    piece = self[start]
    unless piece
      raise Exception.new("No piece at start position!")
    end

    possible_moves = piece.moves

    unless possible_moves.include?(finish)
      raise Exception.new("This is not a possible move with this piece")
    end

    # self.[]=(start, nil)
    self[start] = nil
    self[finish] = piece
    piece.position = finish
    # p piece.position

    # Raise exception for invalid destination
  end


  def reset_board

    @grid[0][0] = Rook.new(:black, [0,0], self)
    @grid[0][1] = Knight.new(:black, [0,1], self)
    @grid[0][2] = Bishop.new(:black, [0,2], self)
    @grid[0][3] = Queen.new(:black, [0,3], self)
    @grid[0][4] = King.new(:black, [0,4], self)
    @grid[0][5] = Bishop.new(:black, [0,5], self)
    @grid[0][6] = Knight.new(:black, [0,6], self)
    @grid[0][7] = Rook.new(:black,[0,7],self)

    (0..7).each do |idx|
      @grid[1][idx] = Pawn.new(:black, [1, idx], self)
      @grid[6][idx] = Pawn.new(:white, [6, idx], self)
    end

    @grid[7][0] = Rook.new(:white, [7,0], self)
    @grid[7][1] = Knight.new(:white, [7,1], self)
    @grid[7][2] = Bishop.new(:white, [7,2], self)
    @grid[7][3] = Queen.new(:white, [7,3], self)
    @grid[7][4] = King.new(:white, [7,4], self)
    @grid[7][5] = Bishop.new(:white, [7,5], self)
    @grid[7][6] = Knight.new(:white, [7,6], self)
    @grid[7][7] = Rook.new(:white,[7,7],self)

  end

end

class Game
  attr_reader :board, :cursor_x, :cursor_y, :selected
  def initialize
    @board = Board.new(self)
    @cursor_x = 0
    @cursor_y = 0
    @selected = nil
  end


  def play
    valid_keys = ["w", "a", "s", "d", "q", " "]
    input = nil
    @board.display
    puts "Use WASD keys to move. space to play select"
    while true
      until valid_keys.include?(input)
        input = STDIN.getch
      end
      # if input == "`"
#           return self.save
      if input == "q"
        puts "quitting"
        return
      elsif input == "w" && @cursor_x > 0
        @cursor_x -= 1
      elsif input == "a" && @cursor_y > 0
        @cursor_y -= 1
      elsif input == "s" && @cursor_x < 7
        @cursor_x += 1
      elsif input == "d" && @cursor_y < 7
        @cursor_y += 1
      elsif input == " "
        if @selected.nil?
          @selected = [@cursor_x, @cursor_y]
          # p @selected
        else
          @destination = [@cursor_x, @cursor_y]
          begin
            @board.move(@selected, @destination)
          rescue Exception
            @selected = nil
            @destination = nil
            input = nil
            puts "Invalid Move, Try Again"
            next
          end
          @selected, @destination = nil
        end
      end
      input = nil
      @board.display
      puts "Use WASD keys to move. space to play select"
    end
  end

end


class Player
end

class HumanPlayer
end

if $PROGRAM_NAME == __FILE__
  chess = Game.new
  chess.play
  # pos = [2,3]
  # p chess.board[pos].moves
end