require ('rspec')
require ('pry')
require ('Grammable')


describe('Grammable') do

  it('Tests a two words to tell if they are an anagram to each other (contain the same number of the same letters)') do
    test = Grammable.new("evil","live")
    expect(test.anagram?()).to(eq(true))
  end

  it('If the two words are not anagrms, the method should return false') do
    test = Grammable.new("evil","good")
    expect(test.anagram?()).to(eq(false))
  end

  it('Tests a two words to tell if they are anagrams even if they do not have the same cases') do
    test = Grammable.new("evil","LiVe")
    expect(test.anagram?()).to(eq(true))
  end

  it('If at least one of the words is not considered a real potentia word, it is not an anagram because it is not a real word; only accounts for a lack of vowels (including "y").') do
    test = Grammable.new("evil","prts")
    expect(test.anagram?()).to(eq("not a real word"))
  end

  it("If phrases aren't anagrams, the method should check whether they are actually 'antigrams.'") do
    test = Grammable.new("evil","good")
    expect(test.anagram?()).to(eq("antigram"))
  end

  it("Account for multiple words being 'anagrams' or 'antigrams.'") do
    test = Grammable.new("evil","veil")
    expect(test.anagram?()).to(eq("anagram"))
    next_test = Grammable.new("evil","")
    expect(test.anagram?()).to(eq("antigram"))
  end

end
