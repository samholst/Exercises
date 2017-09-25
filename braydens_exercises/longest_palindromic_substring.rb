require 'rspec'

def find_substring_palindrome sentence
  test_sentence = sentence
  test_length = test_sentence.length
  palindrome_list = []

  return sentence if test_sentence == sentence.reverse

  test_length.times do |index_1|
    palindrome = ""

    (test_length - 1).times do |index_2|
      check_indexes = test_sentence.slice(index_1, (index_2))
      if check_indexes == check_indexes.reverse
        palindrome = check_indexes
      end
    end

    !palindrome.nil? ? palindrome_list << palindrome : ""
  end

  palindrome_list.sort_by{|word| word.length}.last
end

p find_substring_palindrome "adracecarbye"

describe 'palindromic substring' do
  it 'finds the longest palindrome in a string' do
    sentence = "adracecarbye"
    expect(find_substring_palindrome sentence).to eq("racecar")
  end

  it 'finds the longest palindrome in a string' do
    sentence = "adracecarbyetattarrattat"
    expect(find_substring_palindrome sentence).to eq("tattarrattat")
  end
end
