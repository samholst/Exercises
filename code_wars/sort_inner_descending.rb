require 'rspec'
# #Srot the inner ctnnoet in dsnnieedcg oredr

# You have to sort the inner content of every word of a string in descending order.
# The inner content is the content of a word without first and the last char.

# Some examples:

# "sort the inner content in descending order" -> "srot the inner ctonnet in dsnnieedcg oredr"
# "wait for me" -> "wiat for me"
# "this kata is easy" -> "tihs ktaa is esay"
# The string will never be null and will never be empty.
# It will contain only lowercase-letters and whitespaces.

# In C++ the string is always 0-terminated.

word = "sort the inner content in descending order"

def sort_the_inner_content word
  array_of_words = word.split(/ /)
  new_organized_array = []

  array_of_words.each do |word|
    word = word.split(//)
    first = word.delete_at(0)
    last = word.delete_at(-1)
    word.sort!.reverse!
    word.unshift(first).push(last)
    new_organized_array << word.flatten * ""
  end
  new_organized_array.join(" ")
end

p sort_the_inner_content word

p [1,2,3,4,5] - [1,3,4,5]

describe "kata tests" do
  it "example tests" do
    expect(sort_the_inner_content("sort the inner content in descending order")).to eq("srot the inner ctonnet in dsnnieedcg oredr")
    expect(sort_the_inner_content("wait for me")).to eq("wiat for me")
    expect(sort_the_inner_content("this kata is easy")).to eq("tihs ktaa is esay")
  end
end
