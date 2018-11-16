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

  def anagram?()
    test_from = (@word1.upcase.split("").sort()).join
    test_against = (@word2.upcase.split("").sort()).join
    if test_from == test_against
      return true
    else
      return false
    end
  end

  def antigram?()
    letters = @word1.split("")
    no_match = true
    letters.each do |letter|
      if @word2.include?(letter)
        no_match = false
      end
    end
    no_match
  end

  def letter_match()
    letters_match = false
    for_letters = @word1.split("").uniq
    contains = []

    for_letters.each do |for_letter|
      check_for_match = @word2.include?(for_letter)
      if check_for_match
        letters_match = true
        contains.push("#{for_letter}")
      end
    end
    if letters_match
      return contains
    else
      return false
    end
  end

  def palindrome?
  palindrome_attempt1 = @word1 + @word2
  success = []
  palindrome_attempt2 = @word2 + @word1
  if palindrome_attempt1 == palindrome_attempt1.reverse
    success.push(@word1 + " " + @word2)
  end
  if palindrome_attempt2 == palindrome_attempt2.reverse
    success.push(@word2 + " " + @word1)
  end
  if success.length > 0
    success
  else
    false
  end
end

end
