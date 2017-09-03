require 'rspec'

def suffix_counter w
  word = w.split(//)
  word_length = word.length
  final_count = 0

  word_length.times do |i|
    suffix = word.slice(i, word_length)

    (suffix.length).times do |x|
      if word[x] == suffix[x]
        final_count += 1
      else
        break
      end
    end
  end
  final_count
end

p suffix_counter "ababaa"

describe 'suffix test' do
  it 'counts the amout of times a suffix is in the front of the word' do
    w = "ababaa"
    expect(suffix_counter w).to eq(11)
  end
end
