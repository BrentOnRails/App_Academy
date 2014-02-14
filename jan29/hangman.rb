#require "debugger"

class Hangman

  attr_reader :word

  def initialize
    @word = File.readlines('dictionary.txt').sample.chomp
    @display = "_" * @word.length
  end


  def evaluate_guess(user_guess)
    @user_guess = user_guess
   # debugger
   @found = false
  @word.each_char.with_index do |char, index|
      if user_guess == char
        update_display(index)
        @found = true
      end
    end
    @found
  end

  def update_display(index)
    @display[index] = @word[index]
  end

  def display
    @display.each_char {|char| print "#{char} "}
    puts

  end

  def win?
    @display == @word
  end

end

class Game


  def initialize
    @game = Hangman.new
  end

  def play
    misses = 0
    until misses == 10
      @game.display
      puts "Guess a letter:"
      user_guess = gets.chomp
      found = @game.evaluate_guess(user_guess)
      misses +=1 unless found
      if @game.win?
        puts "You win! The word was #{@game.word}!"
        return
      else
        puts "guess again: "
      end
      puts "Guesses remaining #{10 - misses}"
    end
    puts "you lose. the word was #{@game.word}"
  end

end

class Player
end

class ComputerPlayer < Player


game = Game.new
game.play