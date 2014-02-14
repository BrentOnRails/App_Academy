class Hangman

  attr_accessor :word
  attr_reader :display

  def initialize (word, length)
    @word = word
    @length = length.to_i
    @display = "_" * length.to_i
  end

  def display_board
    @display.each_char {|char| print "#{char} "}
    puts
  end

  def update_display(index)
    @display[index] = @word[index]
  end

  def win?
    @display == @word && ! @display.include?('_')
  end


end


class Game

  def initialize(guessing_player, checking_player)
    if guessing_player == 'h'
      @guessing_player = HumanPlayer.new
    else
      @guessing_player = ComputerPlayer.new
    end

    if checking_player == 'h'
      @checking_player = HumanPlayer.new
    else
      @checking_player = ComputerPlayer.new
    end

  end

  def play

    checking_player_chooses_word
    # loop
    #   guess

    misses = 0
    until misses == 10
      @game.display_board

      player_guess = @guessing_player.guess(@game)

      found = @checking_player.check(player_guess, @game)
      puts player_guess

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





  def checking_player_chooses_word

    if @checking_player.class == HumanPlayer
      puts "How long is your word?"

      word_length = gets.chomp
      @game = Hangman.new("", word_length)

    elsif @checking_player.class == ComputerPlayer

      word = File.readlines('dictionary.txt').sample.chomp
      @game = Hangman.new(word, word.length)

    else
      raise "You didn't pick a valid player type"
    end

  end

end


class HumanPlayer

  def check(computer_guess, game)
    @game = game
    @game.word = @game.display
    puts "The computer guessed #{computer_guess}"
    puts "Does this letter exist in your word? (y/n)"
    appear = gets.chomp
    @found = false
    if appear == "y"
      puts "Where does it it appear? (use spaces for multiples)"
      response = gets.chomp


      response.split(" ").each do |index|
       @game.word[index.to_i] = computer_guess
        @game.update_display(index.to_i)
      end
      @found = true
    end
    @found
  end

  def guess(game)
      puts "Guess a letter:"
      user_guess = gets.chomp
  end

end

class ComputerPlayer


  def initialize
    @alphabet = ("a".."z").to_a
    @guessed_letters = []
  end

  def check(user_guess, game)
    @game = game
    @user_guess = user_guess
    @found = false
    @game.word.each_char.with_index do |char, index|
        if user_guess == char
          @game.update_display(index)
          @found = true
        end
      end
      @found
  end

  def guess(game)
    @game = game

    # #length filter
    dictionary = File.readlines("dictionary.txt").map(&:chomp)

    filtered_dictionary = dictionary.find_all do |word|
        word.length == @game.display.length
    end


    #filter by known letters
    (0...@game.display.length).each do |i|
      filtered_dictionary.reject! do |word|
        word[i] != @game.display[i] unless (@game.display[i] == "_")
      end
    end



    missed_letters = @guessed_letters.reject do |l|
      @game.display.include?(l)
    end


     filtered_dictionary.reject! do |word|
       missed_letters.any? do |letter|
         word.include?(letter)
       end
     end

 # filter out letters we already tried




    #looks for most common letter in remaining dictionary
   best_letter_count = 0
   guess_letter = ''

   (@alphabet - @guessed_letters).each do |letter|
     letter_count = filtered_dictionary.join.count(letter)
     if letter_count > best_letter_count
       best_letter_count = letter_count
       guess_letter = letter
     end
   end


   @guessed_letters << guess_letter
   guess_letter


  end

end

puts "is player1 (guessing player) a computer or human? (c or h)"
player1 = gets.chomp
puts "is player2 (checking player) a computer or human? (c or h)"
player2 = gets.chomp
game = Game.new(player1, player2)
game.play