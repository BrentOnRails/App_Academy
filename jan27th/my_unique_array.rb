class Array
  def my_unique
    arr = []
    self.each do |x|
      arr << x unless arr.include?(x)
    end
    arr
  end

  def two_sum
    sums = []
    self.each_with_index do |x, xdex|
      self[xdex..-1].each_with_index do |y, ydex|
        sums << [xdex, ydex + xdex] if (x + y == 0)
      end
    end
    sums
  end
end

