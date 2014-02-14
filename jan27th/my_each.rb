class Array

  def my_each
    arr = self.dup
    until arr.empty?
      yield arr.shift
    end
    self
  end

end


[1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end