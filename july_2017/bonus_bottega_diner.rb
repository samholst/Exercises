# Bottega Diner (nested hashes)
# You get one entree and two side choices at regular cost.
# - show them the entire menu (print out)
# - waitress suggests a chef’s special, which is a random mix of 1 entree and 2 side choices
# - User selects an entree.
# - “Waitress” makes a comment based on their selection (you ordered this? That’s gross)
# - comment can either be a comparison of the two items, or random comment pulled from a comment vault.
# - Tell them the price
# - repeat the above options for side choices (suggestion and a price, don’t repeat chef suggestion)
# - total up the cost
# Have a breakfast, lunch and dinner menu.  Breakfast has different items, lunch and dinner have the same items but are different prices.
# BONUS: Allow for item customization (how items are prepared, decide addtional cost implications)
# EXTRA BONUS: 3D print out actual food and eat it.
 
# meals = {}
# meals = Hash.new
# Hash.new(‘meals’)

# meals = {
#  :breakfast => {:burrito => 12, :eggs => 20},
#  :lunch => {},
#  :dinner => {}
# }
# p meals

meals = {
   "breakfast" => {"burrito" => 12.00, "eggs" => 20},
   "lunch" => {},
   "dinner" => {}
   }

p meals

p meals["breakfast"]["burrito"]

meals["breakfast"]["sandwich"] = 12.00

p meals