# Local variables
10.times do |x|
  x = 10
  p x
end

# Global variables
10.times do |y|
  $y = 10
end

p $y

# Instance variables
@batting_average = 300

# Constants
TEAM = "Angels"
TEAM = "Cavs"

p TEAM

# Class variables
class MyClass
  @@teams = ["Cavs", "Lakers"]
end