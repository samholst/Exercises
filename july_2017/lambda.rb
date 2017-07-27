first_name = lambda { |first, last| first + " " + last }
p first_name["Sam", "Holst"]
p first_name.call("Sam", "Holst")

# Stabby linda syntax
first_name2 = ->(first, last) { first + " " + last }
p first_name2["Sam", "Holst"]
p first_name2.call("Sam", "Holst")

# Argument Count (lambda will say it got 3 but expected 2)
full_name3 = lambda { |first, last| first + " " + last }
p first_name3["Sam", "Holst"]
p first_name3["Sam", "Woolley", "Holst"]

# Return Behavior (Proc will just ignore the third arguement)
full_name4 = Proc.new { |first, last| first + " " + last }
p first_name4["Sam", "Holst"]
p first_name4["Sam", "Woolley", "Holst"]

# Lambda when used in a method with x = lambda { return } will exit out of lamdba but continue on with the rest of the method, Proc will not, it will just return nil.