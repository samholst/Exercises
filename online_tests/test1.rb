def oddNumbers(l, r)
    numbers = (l..r).to_a
    odd_array = []
    numbers.each do |number|
        if number % 2 == 1
            odd_array.push(number)
        end
    end

    odd_array
end


# p oddNumbers(3, 9)

# str = "A"
#
# if str =~ /[A-Z]/
#   puts "hi"
# else
#   puts "nope"
# end


# def doesCircleExist(commands)
#
#    command_array = commands[0].split(//)
#    same_values = false
#    axis_hash = {:x => 0,
#                 :y => 0
#                 }
#   final_answer = []
#
#     if command_array.length == 1
#       if command_array[0] == "G"
#         final_answer.push("NO")
#       elsif command_array[0] == "L"
#         final_answer.push("YES")
#       elsif command_array[0] == "R"
#         final_answer.push("YES")
#       else
#         final_answer.push("NO")
#       end
#     else
#       if command_array.uniq.length == 1
#         if command_array[0] != "G"
#           final_answer.push("YES")
#         else
#           final_answer.push("NO")
#         end
#       else
#         final_answer.push("CONTINUE")
#       end
#     end
#     final_answer
# end

# p doesCircleExist(["RRR"])










def doesCircleExist(commands)
  final_answer = []

  commands.each do |command|

    command_array = command.split
    same_values = false
    axis_hash = {:x => 0,
                 :y => 0
                 }

    if command_array.length == 1
      if command_array[0] == "G"
        final_answer.push("NO")
      elsif command_array[0] == "L"
        final_answer.push("YES")
      elsif command_array[0] == "R"
        final_answer.push("YES")
      else
        final_answer.push("NO")
      end
    else
      if command_array.uniq.length == 1
        if command_array[0] != "G"
          final_answer.push("YES")
        else
          final_answer.push("NO")
        end
      else
        if command =~ /GRGL/ || command =~ /GLGR/
          final_answer.push("NO A")
        else
          final_answer.push("YES")
        end
      end
    end

  end

  final_answer
end

# p doesCircleExist(["RRR", "G", "GRGL"])


# commands.each do |command|
#     if command =~ /[A-Z]/
#       answer_array.push("YES")
#     else
#       answer_array.push("NO")
#     end
# end


def stringSimilarity(inputs)
  original = inputs
  modified_string = inputs
  original_length = inputs.length
  similiarities = 0
  total = []

  original_length.times do
    if original =~ /#{modified_string}/
      similiarities += modified_string.length
      modified_string.slice!(1, modified_string.length - 1)
    else
      modified_string.slice!(1, modified_string.length - 1)
    end

  end

  total.push(similiarities)
  total
end

p stringSimilarity "abc"


def hi
if 0
  puts 'test'
end
end

hi
