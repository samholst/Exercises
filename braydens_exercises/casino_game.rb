require 'byebug'

class Casino
  def initialize
    @@user_wallet = { "CASH" => 100, "WINS" => 0, "LOSSES" => 0 }
    start_menu
  end

  def wallet
    puts "\nYour balance is $#{@@user_wallet["CASH"]}."
    place_bet
  end

  def place_bet
    print "Place your bet: $"
    @@bet = gets.chomp.to_i
    if @@bet <= @@user_wallet["CASH"]
      @@user_wallet["CASH"] = @@user_wallet["CASH"] - @@bet
      puts "Your current balance is: $#{@@user_wallet["CASH"]}."
    else
      puts "\nYou're too poor for that bet. Don't be an idiot... We're gonna try that again."
      place_bet
    end
  end

  def start_menu
    puts "\nWelcome to Bottega Casino, prepare to lose your money. Do you want to play Blackjack or Slots?"
    puts "Enter 1 for Blackjack or 2 for Slots."
    user_input = gets.chomp.to_i
    if user_input == 1
      wallet
      start_blackjack
    elsif user_input == 2
      wallet
      start_slots
    else
      puts "That's not a vaild choice. Self destruct initiated"
      restart
    end
  end

  def start_blackjack
    Blackjack.new
  end

  def start_slots
    Slots.new
  end

  def win amount_won
    @@user_wallet["CASH"] += amount_won
    @@user_wallet["WINS"] += 1
    puts "Your new balance is: #{@@user_wallet["CASH"]}."
    puts "Do you want to play again? Y/N"
    user_input = gets.chomp.upcase
    if user_input == "Y"
      restart
    else
      puts "We'll get you next time!"
    end
  end

  def lose
    @@user_wallet["LOSSES"] += 1
    puts "Your new balance is: #{@@user_wallet["CASH"]}."
    puts "Do you want to play again? Y/N"
    user_input = gets.chomp.upcase
    if user_input == "Y"
      restart
    else
      puts "Thanks for the cash!"
    end
  end

  def restart
    start_menu
  end
end

class Slots < Casino
  def initialize
    play_game
  end

  # Logic of the game
  def play_game
    spin
    three_in_a_row
  end

  # generates the 3 numbers as well as check if 3 in a row
  def three_in_a_row
    wheel_1 = rand(1..9)
    wheel_2 = rand(wheel_1..9)
    wheel_3 = rand(wheel_2..9)

    puts "    | #{wheel_1} | #{wheel_2} | #{wheel_3} |"

    if (wheel_1 == wheel_2) && (wheel_2 == wheel_3)
      p "3 in a ROW!"
      if wheel_1 == 7
        p "TRIPLE 777 Jackpot!!!"
        win(@@bet * 5)
      else
        win(@@bet * 2)
      end
    else
      p "You lost"
      lose
    end
  end

  # Animation effect
  def spin
    6.times do
      puts "    | #{rand 1..9} | #{rand 1..9} | #{rand 1..9} |"
      sleep 0.3

      3.times do |x|
        print x == 0 ?  "    ." : "."
        sleep 0.05
      end

      puts ""
    end
    puts "#-----FINAL SPIN-----#"
  end

end

Casino.new
