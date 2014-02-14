def concat(arr)
  arr.inject(:+)
end

p concat(["this ", "is ", "a ", "sentence."])