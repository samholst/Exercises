def interval time, text, loop
  loop.times do
    puts text
    sleep time
  end
end

interval 2, "hey there", 10




# def interval seconds
#   loop do
#     yield
#     sleep seconds
#   end
# end
#
# interval 2 do
#   puts "hey there"
# end
