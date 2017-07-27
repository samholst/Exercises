class OddsEven
  def initialize(type)
    @random_number =  random_choice
    @computer_number =  random_choice
    @play_again = false
    @user_type = type
    print "Choose 1 or 2: "
    @user_number = gets.chomp!.downcase.to_i
    play_game
  end

  def play_game
    if (@computer_number + @user_number) % 2 == 0
      if @user_type == "evens"
        output_won
      else
        output_lost
      end
    else
      if @user_type == "odds"
        output_won
      else
        output_lost
      end
    end
  end

  def random_choice
    rand 1...2
  end

  def try_again
    puts "Would you like to play again? (y/n)"
    play_again = gets.chomp!
    if play_again == "y"
      play_game
    else
      puts "Bye Bye"
    end
  end

  def output_won
    puts ""
    puts "Computer: #{@computer_number} | You: #{@user_number}"
    puts "You won!"
  end

  def output_lost
    puts ""
    puts "Computer: #{@computer_number} | You: #{@user_number}"
    puts "You Lost!"
  end
end

#------------------------------------------------------#

print "Please choose whether you can odds or evens: "
type = gets.chomp!

if type
  start_game = OddsEven.new type
else
  puts "You did not enter a type. Start again."
end