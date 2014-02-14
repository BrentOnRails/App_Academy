# coding: utf-8

require 'colorize'
require 'io/console'
require 'debugger'
require './piece.rb'
require './board.rb'
require './player.rb'
require 'debugger'





class Game
  attr_accessor :board, :cursor_location, :current_player

  def initialize
    @board           = Board.new(true, self)
    @cursor_location = [0,0]
    @black           = Human.new(:black, "Brent", self)
    @red             = Human.new(:red, "other guy", self)
    @current_player  = @black
  end

  def play
    pick_up, drop = nil
    @board.display
    until won?(@current_player.color) #until opponent has no pieces


      pick, drop = @current_player.play_turn
      return if pick == :quit

      piece = @board[pick]
      begin
        piece.moves!(pick, drop)
      rescue Exception => e
        @board.display
        puts e
        next
      end

      #flip player after each play
      @current_player.color == :black ? @current_player = @red : @current_player = @black
    end
    puts "#{@current_player.name} wins!"
    return
  end

  def won?(color)
    color == :black ? opponent = :red : opponent = :black

    @board.grid.each do |row|
      row.each do |piece|
        next if piece.nil?

        return false if piece.color == opponent
      end
    end

    true
  end

end






if $PROGRAM_NAME == __FILE__
  game = Game.new
  game.play
end

#
# def play_turn(board)
#     begin
#       puts board.render
#       puts "Current player: #{color}"
#
#       from_pos = get_pos("From pos:")
#       to_pos = get_pos("To pos:")
#       board.move_piece(color, from_pos, to_pos)
#     rescue StandardError => e
#       puts "Error: #{e.message}"
#       retry
#     end
#   end
