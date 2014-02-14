

def caesar(word, shift)
  word.split(" ").map do |x|
    encode_word(x, shift)
  end.join(" ")
end


def encode_word(word, shift)
  word.split("").map do |x|
    ((x.ord - 97 + shift) % 26 + 97).chr
  end.join("")
end

p caesar("hello world", 26) # => "khoor"