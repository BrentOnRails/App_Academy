class Code

  attr_accessor :secret_code

  def initialize
     @secret_code = self.random
     @exact_match_count = 0
     @near_match_count = 0
  end

  def random
    colors = %w[r g b y o p]
    secret_code = []
    4.times do |i|
      secret_code << colors.sample
    end
    secret_code
  end

  def exact_match
    match_count = 0
    @user_guess.each_with_index do |color, index|
      if color == @secret_code[index]
        match_count += 1
      end
    end
    match_count
  end

  def near_match
    near_match_count = 0
    computer_code_without_exacts = []
    human_code_without_exacts = []
    @user_guess.each_with_index do |color, index|
      unless color == @secret_code[index]
        human_code_without_exacts << color
        computer_code_without_exacts  << @secret_code[index]
      end
    end

    human_code_without_exacts.each do |color|
      if computer_code_without_exacts.include?(color)
        near_match_count +=1
      end
    end

    near_match_count
  end

  def display_counts
    @exact_match_count = self.exact_match
    @near_match_count = self.near_match
    puts "Exact match count: #{@exact_match_count}"
    puts "Near match count: #{@near_match_count}"
    self
  end

  def parse(user_guess)
    @user_guess = user_guess.split("")
  end


  def win?
    @exact_match_count == 4
  end

end

class Game

  def initialize
    @code = Code.new()
  end

  def play
    puts "Would you like to play a game?"
    #loop user guesses
    guesses = 0
    until @code.win? || guesses > 9
      guesses += 1
      puts "Guess: (r, g, b, y, o, p) "
      user_guess = gets.chomp
      @code.parse(user_guess)
      @code.display_counts
      puts "Guesses remaining: #{10-guesses}"
    end
    @code.win? ? (puts "You win! The code was #{@code.secret_code.join}") : (puts "You lose!")
  end

end

game = Game.new()
game.play


