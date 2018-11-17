require('Grammable')

def for_each_grammable(input_word, *statements)
  # found 'reject(&:empty?)' logic on stack overflow by Matt Greer @https://stackoverflow.com/questions/5878697/how-do-i-remove-blank-elements-from-an-array
  for_word = input_word.split(/\W/).reject(&:empty?).join
  check_words = []
  statements.each do |statement|
    words = statement.split(" ").reject(&:empty?)
    words.each do |word|
      check_words.push(word.split(/\W/).reject(&:empty?).join)
    end
  end

  results = []
  check = Grammable.new(for_word)
  check_words.each do |check_word|
    check.change_second(check_word)
    if !check.words?
      results.push("not a word")
    elsif check.anagram?
      double_check = ["anagram"]
      if check.palindrome?
      double_check.push(", also words make palindrome: "+ check.palindrome?.join(" and "))
      end
      results.push(double_check.join)
    elsif check.antigram?
      results.push("antigram")
    elsif check.palindrome?
      results.push("words make palindrome: "+ check.palindrome?.join(" and "))
    else
      overlap = check.letter_match
      results.push("'#{for_word}' and '#{check_word}' aren't anagrams but #{overlap.length} letter(s) match: #{overlap.join(", ")}.")
    end
  end
  results


end
