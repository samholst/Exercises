print "Name an animal: "
animal = gets.chomp

print "Name a noun: "
noun = gets.chomp

p "The quick #{animal} jumped over the lazy #{noun}"

p "Astros".upcase
p "Astros".downcase
p "Astros".swapcase
p "Astros".reverse

str = "The quick brown fox jumped over the quick dog"

# Replaces first instance of quick with slow
p str.sub "quick", "slow"

# Replaces all instances of quick with slow 
p str.gsub "quick", "slow" 

string = " The quick brown fox jumped over the quick dog"

# Removes any extra spacing
string.strip 

# Convert the string into an array with each space creating a divide
string.split

# Gives us the size of the array
string.size  

# Count all of the characters
string.split(//).size


