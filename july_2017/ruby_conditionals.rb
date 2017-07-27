x = 10
y = 5

if x == y
  puts "x is the same as "
else
  puts "x and y are not the same"
end

players = ["Correa", "Carter", "Altuve"]

unless players.empty?
  players.each { |player| puts player }
end

players.each { |player| puts player } unless players.empty?

x = 10
y = 100
z = 10

if x == y
  puts "x is equal to y"
elsif x > z
  puts "x is greater than y"
else
  puts "something else"
end

if x == y && x == z
  puts "from the if statement"
end