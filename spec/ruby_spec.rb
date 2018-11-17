require ('rspec')
require ('pry')
require ('Grammable')
require ('seporite_methods.rb')


describe('Grammable') do

  it('the anagram?() method tests two words to tell if they are an anagram to each other (contain the same number of the same letters)') do
    test = Grammable.new("evil","vile")
    expect(test.anagram?()).to(eq(true))
  end

  it('If the two words in the anagram?() method are not anagrms, the method should return false') do
    test = Grammable.new("evil","bad")
    expect(test.anagram?()).to(eq(false))
  end

  it('the anagram?() method tests two words to tell if they are anagrams even if they do not have the same cases') do
    test = Grammable.new("evil","LiVe")
    expect(test.anagram?()).to(eq(true))
  end

  it('For the words?() method: if at least one of the words is not considered a real potential word, it is not an anagram because it is not a real word; only accounts for a lack of vowels (including "y").') do
    test = Grammable.new("evil","prts")
    expect(test.words?()).to(eq(false))
    next_test = Grammable.new("evil","parts")
    expect(next_test.words?()).to(eq(true))
  end

  it('For the words?() method should also check for a string of letters at least three long, as no word in the englis language has that') do
    test = Grammable.new("eeeviiil")
    expect(test.words?()).to(eq(false))
  end

  it("If phrases aren't anagrams, the antigram?() method should check whether they are actually 'antigrams.'") do
    test = Grammable.new("kind","Cthulu")
    expect(test.antigram?()).to(eq(true))
  end

  it("The letter_match() method finds return the number of matching letters in the word") do
    test = Grammable.new("have","togethor")
    expect(test.letter_match()).to(eq(["h","e"]))
  end

  it("The palindrome?() method finds return the number of matching letters in the word") do
    test = Grammable.new("eve","ever")
    expect(test.palindrome?()).to(eq(["ever eve"]))
    next_test = Grammable.new("evil","live")
    expect(next_test.palindrome?()).to(eq(["evil live","live evil"]))
  end


end

describe('for_each_grammable') do

  it("Account for multiple words being 'anagrams' or 'antigrams.'") do
    expect(for_each_grammable("evil","veil","good")).to(eq(["anagram","antigram"]))
  end

  it("Account for multiple words being inputed") do
    expect(for_each_grammable("evil","veil good")).to(eq(["anagram","antigram"]))
  end

  it("Account for punctuation not mattering") do
    expect(for_each_grammable("@it's","si%t!")).to(eq(["anagram"]))
  end

  it("If two phrases aren't anagrams, return how many letters from the argument are actual matches with the receiver.") do
    expect(for_each_grammable("cat","batty") ).to(eq(["'cat' and 'batty' aren't anagrams but 2 letter(s) match: a, t."]))
  end

  it("Should handle any combination of inputs to special type.") do
    expect(for_each_grammable("word", "big", "row", "feather", "drow")).to(eq(["antigram", "words make palindrome: word row", "'word' and 'feather' aren't anagrams but 1 letter(s) match: r.", "anagram, also words make palindrome: word drow and drow word"]))
  end


end
