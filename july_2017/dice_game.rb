class DiceGame

  def initialize
    @dice_user = 0
    @dice_computer = 0
    @dice_tie = false
    @user_wins = 0
    @computer_wins = 0
    play_game
  end

  def roll_dice
    @dice_user = rand 1...6
    @dice_computer = rand 1...6
    puts "The computer rolled a '#{@dice_computer}'."
    puts "You rolled a '#{@dice_user}'."

    if @dice_user > @dice_computer
      @user_wins += 1
      @dice_tie = false
      puts "You: #{@user_wins} | Computer: #{@computer_wins}"
      puts ""
    elsif @dice_computer > @dice_user
      @computer_wins += 1
      @dice_tie = false
      puts "Computer: #{@computer_wins} | You: #{@user_wins}"
      puts ""
    else
      @dice_tie = true
    end

  end # Roll_Dice End

  def play_game
    while @user_wins != 5 && @computer_wins != 5 do
      roll_dice
      if @dice_tie
        puts "There was a tie. Type 'r' to roll the die again."
        roll_again_answer = gets.chomp!
        if roll_again_answer == "r"
          puts ""
        else
          puts "You failed to roll again, game terminated."
          break
        end
      end
    end # While Loop End

    if @user_wins == 5
      puts "You have won!"
      reset_game
    elsif @computer_wins == 5
      puts "The computer has won!"
      reset_game
    else
      puts "No one has won."
    end
  end # Play_Game End

  def reset_game
    puts ""
    puts "Do you want to play again? (y/n)"
    do_over = gets.chomp!
    if do_over == "y"
      @dice_user = 0
      @dice_computer = 0
      @dice_tie = false
      @user_wins = 0
      @computer_wins = 0
      play_game
    else
      puts "Hope to see you again soon!"
    end
  end # Reset_Game End

end # Class End

#-------------------------------------------#

puts "Would you like to roll the die? (y/n)"
user_answer = gets.chomp!

if user_answer == "y"
  play_dice = DiceGame.new
else
  puts "Game terminated."
end 