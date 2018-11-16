class Grammable
  def initialize(word1="live", word2="evil")
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
end
