# Sum some numbers
p (5..10).reduce(:+)                            #=> 45

# Sum some numbers
p (5..10).reduce(:+)                            #=> 45

# Same using a block and inject
p (5..10).inject {|sum, n| sum + n }            #=> 45

# Multiply some numbers
p (5..10).reduce(1, :*)                         #=> 151200

# Same using a block
p (5..10).inject(1) {|product, n| product * n } #=> 151200

# find the longest word
longest = %w{ cat sheep bear }.inject do |memo,word|
   memo.length > word.length ? memo : word
end
p longest


#==========================================================#

# Words stored in a variable
words = "My amazing document full of words"

# Convert words into an array, output is:
# ["My", "amazing", "document", "full", "of", "words"]
words_array = words.split

# Or use join, which would make more sense in this occasion
p words_array.inject {|sum, n| sum + " " + n }

#==========================================================#
