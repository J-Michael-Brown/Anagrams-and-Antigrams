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

  puts "check '#{for_word}' against #{check_words}"
  results = []
  check = Grammable.new(for_word)
  check_words.each do |check_word|
    check.change_second(check_word)
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
