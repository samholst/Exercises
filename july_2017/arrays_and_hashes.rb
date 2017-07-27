y = Array.new
y[0] = 543

x = ["asdf", 3, 4, 12, "asdf", "b", true, 34, 2, 4, 4, 4]

# Delete all the 4's from the array
x.delete(4)

# Delete the 12 at array position 2
x.delete_at(2)

# Will delete the 4th spot and put it in the variable deleted_number
deleted_number = x.delete_at(4)

batting_averages = [0.3, 0.18, 0.22, 0.25]

# Delete if average is less than 0.24
batting_averages.delete_if { |average| average < 0.24}

teams = ["astros", "yankees", "rangers", "mets", "cardinals"]

# Pushing is when you add an element to the end of the array
teams.push("marlins")
teams.push("red sox", "blue jays")

# Popping is when you remove the last item from the array
teams.pop
z = teams.pop


# Most modern syntax
positions = {
              first_base: "Chris Carter",
              second_base: "Jose Altuve",
              short_stop: "Carlos Correa"
            }

positions = { "first_base" => "Chris Carter", 
              "second_base" => "Jose Altuve",  
              "short_stop" => "Carlos Correa" 
            }

positions = { :first_base => "Chris Carter", 
              :second_base => "Jose Altuve", 
              :short_stop => "Carlos Correa" 
            }
            
positions[:second_base]


people = { 
           jordan: 32, 
           tiffany: 27, 
           kristine: 10, 
           heather: 29 
         }

# Delete an element from a hash
people.delete(:kristine)

# Only iterates the keys
people.each_key do |key|
  puts key
end

# Only iterates the values
people.each_value do |value|
  puts value
end

# Add a new person to the hash
people[:leann] = 42


# Swap Keys and Values
people.invert

people_2 = people.invert

# Merging Hashes
people.merge(people_2)

# Convert a Hash into an Array (or people.to_a)
Array(people)

# Listing All Keys
people.keys

# Listing All Values
people.values

