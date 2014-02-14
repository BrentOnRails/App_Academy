# I use Ruby's `Set` class for collections I need to call `#include?`
# on; `#include?` is much faster on a `Set` than an `Array`. Don't
# worry, Arrays would work fine, too, just more slowly.
require 'set'

=begin
Man is born free, and everywhere he is in chains.
=end
class WordChainer
  def self.adjacent_words(word, candidates)
    # variable name *shadows* (hides) method name; references inside
    # `adjacent_words` to `adjacent_words` will refer to the variable,
    # not the method. This is common, because side-effect free methods
    # are often named after what they return.
    adjacent_words = []

    # NB: I gained a big speedup by checking to see if small
    # modifications to the word were in the dictionary, vs checking
    # every word in the dictionary to see if it was "one away" from
    # the word. Can you think about why?
    word.length.times do |i|
      ("a".."z").each do |letter|
        next if letter == word[i]

        new_word = word.dup
        new_word[i] = letter

        adjacent_words << new_word if candidates.include?(new_word)
      end
    end

    adjacent_words
  end

  def self.load(dictionary_file_name)
    dictionary = Set.new(
      File.readlines(dictionary_file_name).map(&:chomp)
    )

    self.new(dictionary)
  end

  def initialize(dictionary)
    @dictionary = dictionary

    @source, @target, @candidates, @words_to_expand, @parents =
      nil, nil, nil, nil, nil
  end

  def find_chain(source, target)
    return nil if source.length != target.length

    @source = source
    @target = target

    # winnow the dictionary to words of same length
    @candidates = Set.new(
      @dictionary.select { |word| word.length == source.length }
    )
    # do not revisit the source
    @candidates = @candidates.delete(source)

    # words we've reached in the previous round; we'll grow from these
    # each round. Start from the source.
    @words_to_expand = [source]
    # map each word to the word we found it from; `source` has no
    # parent
    @parents = { source => nil }

    # keep performing search steps until we find the target, or can't
    # find any new words
    until @words_to_expand.empty?
      return build_path_from_breadcrumbs if perform_search_step
    end

    nil
  end

  private
  def perform_search_step
    new_words_to_expand = []

    until @words_to_expand.empty?
      word_to_expand = @words_to_expand.pop

      adjacent_words =
        WordChainer.adjacent_words(word_to_expand, @candidates)
      adjacent_words.each do |adjacent_word|
        # don't revisit this word again
        @candidates.delete(adjacent_word)
        # expand this word in the future
        new_words_to_expand << adjacent_word
        # record where it came from
        @parents[adjacent_word] = word_to_expand

        # whoa! stop if we found the target word!
        return true if adjacent_word == @target
      end
    end

    # didn't find the target yet.
    @words_to_expand = new_words_to_expand
    false
  end

  def build_path_from_breadcrumbs
    current_word = @target
    path = []

    # will stop after `source`, which is the only word with `nil`
    # parent
    until current_word == nil
      path << current_word
      current_word = @parents[current_word]
    end

    path.reverse
  end
end

if __FILE__ == $PROGRAM_NAME
  p WordChainer.load("/Users/ruggeri/Downloads/dictionary.txt")
    .find_chain("duck", "ruby")
end
