class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss, subbordinates=[])
    super
    @subbordinates = subbordinates
  end

  def bonus(multiplier)
    @subbordinates.inject(0) { |sum, sub| sum += sub.salary} * multiplier
  end

end