class Grammable
  def initialize (word1="live", word2="evil")
    @word1 = word1
    @word2 = word2
  end

  def change_first(new_word)
    @word1 = new_word
  end

  def change_second(new_word)
    @word2 = new_word
  end

  def display_words()
    "'#{@word1}' and '#{@word2}'"
  end

  def anagram?()
    test_from = (@word1.upcase.split("").sort()).join
    test_against = (@word2.upcase.split("").sort()).join
    if test_from == test_against
      return true
    else
      return false
    end
  end

  def word?()
    vowels = ["a","e","i","o","u","y"]
    first_is_word = false
    second_is_word = false
    vowels.each do |vowel|
      if @word1.include?(vowel)
        first_is_word = true
      end
      if @word2.include?(vowel)
        second_is_word = true
      end
      if first_is_word & second_is_word
        return true
      end
    end
    false
  end


end
