puts "Enter your sentence for wheel of fortune:"
starting_sentence = gets.chomp
puts "\n\n" * 20

sentence_array = starting_sentence.split("").map(&:downcase)
final_sentence = starting_sentence.gsub(/[a-zA-Z]/, "_").split("")
# accurate_count = starting_sentence.scan(/[a-zA-Z]/).count
accurate_count = final_sentence.count("_")
guessed_letters = []
guess_count = 0

while sentence_array.count("") < accurate_count
  puts "#{final_sentence.join}\n\n"
  puts "Guess a letter:"
  guess = gets.downcase.chomp
  guessed_letters.push(guess) unless guessed_letters.include?(guess)
  guess_count += 1
  if sentence_array.include?(guess)

    while sentence_array.include?(guess)
      letter_index = sentence_array.find_index(guess)
      sentence_array[letter_index] = ""
      final_sentence[letter_index] = guess
    end

    puts "\n\nGood Job! You got one!"
    puts "Guessed letters: #{guessed_letters.join(", ")}\n\n"
  else
    puts "\n\nSorry, that letter isn't the right answer, please try again."
    puts "Guessed letters: #{guessed_letters.join(", ")}\n\n"
  end
end

puts "Total guesses it took you to guess sentence.... #{guess_count}!\n"
puts "=" * 50
puts "\n\n#{final_sentence.join}\n\n"
puts "=" * 50
puts "\n\n"

# while sentence_array.count("") < accurate_count.count
#   puts "Guess a letter:"
#   guess = gets.downcase.chomp
#
#   if sentence_array.include?(guess)
#     letter_index = sentence_array.find_index(guess)
#     sentence_array[letter_index] = ""
#     final_sentence[letter_index] = guess
#     puts "\n\nCorrect! The sentence is now: #{final_sentence.join}\n\n"
#   else
#     puts "\n\nSorry, that letter isn't the right answer, please try again.\n\n"
#   end
# end
