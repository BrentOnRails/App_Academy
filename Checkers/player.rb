class Player

  attr_accessor :color, :name

  def initialize(color, name, game)
    @color, @name, @game = color, name, game
  end



end


class Human < Player

  def play_turn
    valid_keys         = ['w', 'a', 's', 'd', 'q','c',' ', 'c', 'r']
    input              = nil
    @selected          = nil
    @destination       = nil
    cursor_x, cursor_y = @game.cursor_location
    chain_arr = []
    msg = false

    while true
      until valid_keys.include?(input)
        input = STDIN.getch.downcase
      end
      if input == 'q'
        return :quit
      elsif input == 'w' && cursor_x > 0
        cursor_x -= 1
      elsif input == 'a' && cursor_y > 0
        cursor_y -= 1
      elsif input == 's' && cursor_x < 7
        cursor_x += 1
      elsif input == 'd' && cursor_y < 7
        cursor_y += 1
      elsif input == 'c'
        if @selected.nil?
          @selected = [cursor_x, cursor_y]
        else
          chain_arr << [cursor_x, cursor_y]
        end
        msg = "keep using C to add to chain, R to run"
        msg = "chained moves updated to: \n Start: #{@selected} \n Chain: #{chain_arr}"
        input = nil
      elsif input == 'r'
        msg = false
        return [@selected, chain_arr]
      elsif input == ' '
        if @selected.nil?
          xy = [cursor_x, cursor_y]
          piece = @game.board[xy]
          if piece.nil?
            puts "there is no piece at that location. Please pick again"
            input = nil
            next
          elsif piece.color != self.color
            puts "that's not your piece!"
            input = nil
            next
          end
          @selected = xy
        else
          @destination = [cursor_x, cursor_y]
          @game.cursor_location = @destination
          return [@selected, @destination]
        end
      end

      input = nil
      @game.cursor_location = [cursor_x, cursor_y]
      @game.board.display(msg)

    end
  end


end
