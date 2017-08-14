# While Loop
i = 0

while i < 10
  puts "Hey there"
  i += 1
end

puts "While Loop Done"
puts ""

# Each Loop
arr = [23, 26, 20, 1, 2, 3, 4]

arr.each do |i|
  p i
end

puts "Each Loop Done"
puts ""

arr.each { |i| p i }

puts "Each Loop Short Done"
puts ""

# For Loop
numbers = [45, 45, 55, 12, 234, 123, 4]

for i in 0...numbers.length
  p numbers[i]
end

puts "For Loop Done"
puts ""

# Looping Over a Hash in Ruby
teams = {
      "Houston Astros" => {
          "first base" => "AJ Reed",
          "second base" => "Jose Altuve",
          "shortstop" => "Carlos Correa"
        },
      "Texas Rangers" => {
          "first base" => "Prince Fielder",
          "second base" => "R. Odor",
          "shortstop" => "Elvis Andrus"
        }
    }

teams.each do |team, players|
  puts team
  players.each do |position, player|
     p "#{player} starts at #{position}"
   end
 end

puts "Nested Hash Loop Done"
puts ""

# Select Method
(1..10).to_a.select { |x| x.even? }

# Short hand for doing the select
(1..10).to_a.select(&:even?)

# New syntax to convert the sentence into an array and then select
arr_words = %w(The quick brown fox jumped over the lazy dog)
arr_words.select { |x| x.length > 5}

# Select only the vowels using a regular expression pattern
%w(a b c d e f g).select { |v| v =~ /[aeiou]/ }

puts "Select Method Done"
puts ""

# Map Method
["1", "23.0", "0", "4"].map { |x| x.to_i }
["1", "23.0", "0", "4"].map(&:to_i)

# Will provide two of each letter
("a".."g").to_a.map { |i| i * 2 }

Hash[[1, 2.1, 3.33, 0.9].map { |x| [x, x.to_i]}]
# {1=>1, 2.1=>2, 3.33=>3, 0.9=>0}

# Map Part #2
Hash[%w(A dynamic open source programming language.map).map {|x| [x, x.length]}]
# {"A"=>1, "dynamic"=>7, "open"=>4, "source"=>6, "programming"=>11, "language.map"=>12}

{:a => "foo", :b => "bar"}.map { |a, b| "#{a}=#{b}" }.join('&')
# "a=foo&b=bar"


# Inject Method
total = 0

[3, 2, 4, 53, 5, 3, 23343, 4342, 12, 3].each do |i|
  total += i
end

puts total


[3, 2, 4, 53, 5, 3, 23343, 4342, 12, 3].inject(&:+)
# 27770

[3, 2, 4, 53, 5, 3, 23343, 4342, 12, 3].inject(&:*)
# 69618932585280
