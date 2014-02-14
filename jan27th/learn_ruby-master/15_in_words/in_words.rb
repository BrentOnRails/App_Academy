class Integer

  def in_words
    return "zero" if self == 0
    left = self

    trillions = (left / 1000000000000).add_words("trillion") if (left / 1000000000000) > 0
    left = left % 1000000000000

    billions = (left / 1000000000).add_words("billion") if (left / 1000000000) > 0
    left = left % 1000000000

    millions = (left / 1000000).add_words("million") if (left / 1000000) > 0
    left = left % 1000000

    thousands = (left / 1000).add_words("thousand") if (left / 1000) > 0
    left = left % 1000

    hundreds = (left / 100).add_words("hundred") if (left / 100) > 0
    left = left % 100

    tens = left.under_hundred
    "#{trillions} #{billions} #{millions} #{thousands} #{hundreds} #{tens}".split(" ").join(" ")
  end

  def under_hundred
    ones = [nil, "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    teens = %W(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
    tens = %W(zero ten twenty thirty forty fifty sixty seventy eighty ninety)

    if self < 10
      ones[self]
    elsif self < 20
      teens[self % 10]
    else
      if self % 10 == 0
        tens[self / 10]
      else
        tens[self / 10] + " " + (self % 10).in_words
      end
    end
  end

  def add_words(word)
    self.in_words + " #{word}"
  end
end

