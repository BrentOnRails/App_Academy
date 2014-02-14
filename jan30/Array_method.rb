class Array
  def my_each(&blk)
    i = 0
    until i == self.length
      blk.call(self[i])
      i += 1
    end
  end

  def my_map(&blk)
    new_array = []

    self.my_each do |n|
      new_array << blk.call(n)
    end

    new_array
  end

  def my_select(&blk)
    new_arr = []

    self.my_each do |n|
      new_arr << n if blk.call(n)
    end

    new_arr
  end

  def my_inject(&blk)
    first_el = self[0]

    self.drop(1).my_each do |n|
      first_el = blk.call(first_el, n)
    end

    first_el
  end

  def my_sort!(&blk)
    unsorted = true
    while unsorted
      unsorted = false

      (0...self.length-1).each do |i|
        value = blk.call(self[i], self[i+1])
        if value == 1
          self[i], self[i+1] = self[i+1] , self[i]
          unsorted = true
        end
      end
    end
    self
  end
end

def eval_block(*args, &blk)
  if blk.nil?
    puts "NO BLOCK GIVEN!"
    return
  end

  blk.call(*args)
end


blk = Proc.new { |a,b,c,d,e| p a+b+c+d+e }
eval_block(1,2,3,4,5,&blk)


