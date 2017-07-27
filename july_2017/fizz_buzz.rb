# Replace multiples of 3 with fizz, 5 with buzz, 15 with fizzbuzz

# 1.upto(100).each do |x|
#   if x % 15 == 0
#     puts "fizzbuzz"
#   elsif x % 5 == 0
#     puts "buzz"
#   elsif x % 3 == 0
#     puts "fizz"
#   else 
#     puts x
#   end
# end


def fizz_buzz numbers
  numbers.each do |y| 
    if y % 15 == 0
      puts "fizzbuzz"
    elsif y % 5 == 0
      puts "buzz"
    elsif y % 3 == 0
      puts "fizz"
    else 
      puts y
    end
  end
end

numbers = Array.new(100) { |i| i += 1 } 
fizz_buzz numbers


git remote add origin https://github.com/samholst/portfolio.git