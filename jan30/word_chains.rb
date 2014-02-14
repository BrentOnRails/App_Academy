# def adjacent_words(word, dictionary)
#
#   #pull in dictionary
#
#   #filter to only words with same length
#   candidate_words = []
#   dictionary.each do |dict_word|
#     next if word.length != dict_word
#
#     word.length.times do |idx|
#       if idx == 0
#         word[0,word.length-1] == dict_word[0,word.length-1]
#       end
#       if (word[0,idx-1] == dict_word[0,idx-1]) and (word[idx+1,word.length-1] == word[idx+1,word.length-1])
#         candidate_words << dict_word
#       end
#     end
#   end
# end



class WordChains
  def initialize(source)
    @words_to_expand = Set.new[source]
    @candidate_words = self.adjacent_words(source, dictionary)
    @all_reachable_words = Set.new[source]
  end

  def explore_words(source, dictionary)

  end

  def adjacent_words(word, dictionary)
    candidate_words = Set.new
    dictionary.each do |dict_word|
      next if word.length != dict_word

      letters_not_in_common = dict_word.split("").zip(word.split("")).select { |x, y| x != y }.count
      candidate_words << dict_word if letters_not_in_common == 1
    end

    candidate_words
  end
end