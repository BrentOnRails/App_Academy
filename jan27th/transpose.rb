class Array
  def my_transpose
    arr = []
    self.first.length.times { arr << [] }
    self.each_with_index do |x, xdex|
      x.each_with_index do |y, ydex|
        arr[ydex][xdex] = y
      end
    end
    arr
  end
end

p [[1,2,3],[4,5,6],[7,8,9]].my_transpose
