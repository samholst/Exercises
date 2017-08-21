puts "Input a number"
input = gets.chomp.to_i
secret = input

r = (1..25)
turns = 0

puts "Guess a number between #{r.min} and #{r.max}"
r.bsearch do |guess|
  print "Guessing #{guess} "
  turns += 1
  low_high = secret <=> guess
  puts ["Computer found the number in #{turns} turns", "too low", "too high"][low_high]
  low_high
end
