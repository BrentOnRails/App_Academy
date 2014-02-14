class Array
  def median
    sorted = self.sort
    mid = sorted.length / 2

    if sorted.length.odd?
      sorted[mid].to_f
    else
      (sorted[mid] + sorted[mid - 1]) / 2.0
    end
  end
end

p [2, 4, 6, 8, 10].median