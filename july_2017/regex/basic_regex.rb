string = "The quick 12 brown foxes jumped over 10 lazy dogs"

# Does the string contain a letter o?
p string =~ /o/

# Turnary Operator
p string =~ /z/ ? "Valid" : "Invalid"

# Case insensitive search
p string =~ /Z/i ? "Valid" : "Invalid"

# Search for only integers and return them
p string.to_enum(:scan, /\d+/).map { Regexp.last_match }
