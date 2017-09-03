# To solve the issue, compare the x,y axis's to eachother and see if they match,
# if they do, then it is a circle/square and it will pass.

def doesCircleExist(commands)
  final_answer = []

  commands.each do |command|
    command_array = command.split(//)
    same_values = false
    axis_hash = {:x => 0,
                 :y => 0
                 }

      if command_array.uniq.length == 1
        if command_array[0] != "G"
          final_answer.push("YES")
        else
          final_answer.push("NO")
        end
      else
        final_answer.push("UF")
      end
  end

  final_answer
end


describe 'encapsulate circle' do
  describe 'creates infinite cirlces' do
    it 'creates an infinite circle' do
      inputs = ["L", "R", "RR", "LL", "GLGLGLGL", "GRGRGRGR"]
      yes_amount = ["YES"] * inputs.length
      expect(doesCircleExist inputs).to eq(yes_amount)
    end
  end

  describe 'creates infinite cirlces' do
    it 'does not create an infinite circle' do
      inputs = ["G", "GLGR", "GLGRGLGRGLGR", "GGGGRRRRGGGGGLLLLL"]
      no_amount = ["NO"] * inputs.length
      expect(doesCircleExist inputs).to eq(no_amount)
    end
  end
end







# def doesCircleExist(commands)
#   final_answer = []
#
#   commands.each do |command|
#
#     command_array = command.split(//)
#     same_values = false
#     axis_hash = {:x => 0,
#                  :y => 0
#                  }
#
#     if command_array.length == 1
#
#       if command_array[0] == "G"
#         final_answer.push("NO")
#       elsif command_array[0] == "L"
#         final_answer.push("YES")
#       elsif command_array[0] == "R"
#         final_answer.push("YES")
#       else
#         final_answer.push("NOT AN ACCEPTED INPUT")
#       end
#
#     else
#       if command_array.uniq.length == 1
#         if command_array[0] != "G"
#           final_answer.push("YES")
#         else
#           final_answer.push("NO")
#         end
#       else
#
#
#         if command =~ /GRGL/ || command =~ /GLGR/
#           final_answer.push("NO")
#         else
#           final_answer.push("UNFINISHED")
#         end
#
#
#       end
#     end
#
#   end
#
#   final_answer
# end
