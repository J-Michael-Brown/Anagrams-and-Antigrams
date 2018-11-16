require ('rspec')
require ('pry')
require ('Grammable')


describe('Grammable') do

  it('tests a two words to tell if they are an anagram to each other (contain the same number of the same letters)') do
    test = Grammable.new("evil","live")
    expect(test.anagram?()).to(eq(true))
  end

  it('if the two words are not anagrms, the method should return false') do
    test = Grammable.new("evil","good")
    expect(test.anagram?()).to(eq(false))
  end

  it('tests a two words to tell if they are anagrams even if they do not have the same cases') do
    test = Grammable.new("evil","LiVe")
    expect(test.anagram?()).to(eq(true))
  end

  it('if at least one of the words is not considered a real potentia word, it is not an anagram because it is not a real word') do
    test = Grammable.new("evil","lvei")
    expect(test.anagram?()).to(eq("not a real word"))
  end

end
