require('Grammable')

def for_each_grammable(input_word, *words)
  for_word = input_word
  check_words = words
  puts "checking '#{for_word}' against #{check_words}"
  results = []
  check_words.each do |check_word|
    check = Grammable.new(for_word,check_word)
    if !check.word?
      results.push("not a word")
    elsif check.anagram?
      results.push("anagram")
    elsif check.antigram?
      results.push("antigram")
    else
      results.push("nothing special")
    end
  end
  results


end
