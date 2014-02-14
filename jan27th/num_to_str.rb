def num_to_s(num, base)
  str = ''
  nums = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
  pow = 0
  until num / (base ** pow) == 0
    str << nums[(num / (base ** pow) % base)]
    pow += 1
  end
  str.reverse
end


p num_to_s(234, 10) #=> "234"
p num_to_s(234, 2)  #=> "11101010"
p num_to_s(234, 16) #=> "EA"