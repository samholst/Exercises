# first_array = ["Matz", "Guido"]

# second_array = Array.new(first_array)
#=> ["Matz", "Guido"]

# p first_array.equal? second_array
#=> false


# arr = [1,3,7,6,5,4,99,88,7,6,56,43,23]
# p arr.sort!
# p arr[-2]







# HIREVU coding quiz, return the largest word in the sentence, and if it is repeated, return the first largest word
["some line with text\n", "another line\n"].each do |line|

    arr = line.gsub("\n",'').split(/ /)
    new_hash = Hash.new("")

    arr.each do |word|
        new_hash[word.length] += word + " "
    end

    new_hash
    puts new_hash.max[1].split(/ /).first

end

# p new_arr = arr.sort { |word1, word2| word1.length <=> word2.length }
# p arr.max
