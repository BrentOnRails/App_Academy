class Towers

  def initialize
    @tower1 = [3,2,1]
    @tower2 = []
    @tower3 = []
    @towers = [@tower1, @tower2, @tower3]
  end

  def move(start, finish)
    if finish.empty? || start.last < finish.last
      finish << start.pop
    else
      raise_exception
    end

  end

  def play
    until win?
      show_towers
      prompt_move
    end
    puts "You Win!!!"
  end

  def show_towers
    puts "Tower1: #{@tower1}"
    puts "Tower2: #{@tower2}"
    puts "Tower3: #{@tower3}"
  end

  def prompt_move
    puts "Tower to take from (1, 2, or 3)"
    start = gets.chomp.to_i - 1
    puts "Tower to place on (1, 2, or 3)"
    finish = gets.chomp.to_i - 1
    move(@towers[start], @towers[finish])
  end

  def win?
    @tower3 == [3, 2, 1]
  end


end

t = Towers.new
t.play