require 'rspec'

# Write a method that translates a text to Pig Latin and back.
# English is translated to Pig Latin by taking the first letter of every word,
# moving it to the end of the word and adding 'ay'.
# The quick brown fox becomes "Hetay uickqay rownbay oxfay"

def transform_pig_latin sentence
  temp = sentence.downcase.split
  new_array = []

  temp.each do |word|
    word += word[0] << "ay"
    new_array << word.slice(1, word.length - 1)
  end
  new_array.join(' ').capitalize
end

sentence = 'The quick brown fox'
p transform_pig_latin(sentence)

describe 'PigLatin' do
  it 'takes the first letter of every word and moves it to the end of the word and adds ay' do
    sentence = 'The quick brown fox'
    expect(transform_pig_latin(sentence)).to eq('Hetay uickqay rownbay oxfay')
  end
end
