require 'rspec'
require 'byebug'
# Write a method that translates a text to Pig Latin and back.
# English is translated to Pig Latin by taking the first letter of every word,
# moving it to the end of the word and adding 'ay'.
# The quick brown fox becomes "Hetay uickqay rownbay oxfay"

def transform_pig_latin sentence
  temp = sentence.downcase.split(/ /)
  new_array = []

  temp.each do |word|

    if word[0] =~ /[aeiou]/
      word += "ay"
      new_array << word
    else
      word += word[0] << "ay"
      new_array << word.slice(1, word.length)
    end
  end

  new_array.join(' ').capitalize
end




sentence = 'The quick brown is a fox'
p transform_pig_latin(sentence)





describe 'PigLatin' do
  it 'takes the first letter of every word and moves it to the end of the word and adds ay' do
    sentence = 'The quick brown is a fox'
    expect(transform_pig_latin(sentence)).to eq('Hetay uickqay rownbay isay aay oxfay')
  end
end
