starting_sentence = "Hi from matching land"
senetence_array = starting_sentence.split("").map(&:downcase)
accurate_count = senetence_array - [" "]
final_sentence = starting_sentence.gsub(/[a-zA-Z]/, "_").split("")
guessed_letters = []
guess_count = 0

while senetence_array.count("") < accurate_count.count
  puts "Guess a letter:"
  guess = gets.downcase.chomp
  guessed_letters.push(guess) unless guessed_letters.include?(guess)
  guess_count += 1
  if senetence_array.include?(guess)

    while senetence_array.include?(guess)
      letter_index = senetence_array.find_index(guess)
      senetence_array[letter_index] = ""
      final_sentence[letter_index] = guess
    end

    puts "\n\nCorrect! The sentence is now: #{final_sentence.join}"
    puts "Guessed letters: #{guessed_letters.join(", ")}\n\n"
  else
    puts "\n\nSorry, that letter isn't the right answer, please try again."
    puts "Guessed letters: #{guessed_letters.join(", ")}"
    puts "#{final_sentence.join}\n\n"
  end
end

puts "Total guesses it took you to guess sentence.... #{guess_count}!"

# while senetence_array.count("") < accurate_count.count
#   puts "Guess a letter:"
#   guess = gets.downcase.chomp
#
#   if senetence_array.include?(guess)
#     letter_index = senetence_array.find_index(guess)
#     senetence_array[letter_index] = ""
#     final_sentence[letter_index] = guess
#     puts "\n\nCorrect! The sentence is now: #{final_sentence.join}\n\n"
#   else
#     puts "\n\nSorry, that letter isn't the right answer, please try again.\n\n"
#   end
# end
