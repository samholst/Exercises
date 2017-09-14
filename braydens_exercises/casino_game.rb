def blink v
  6.times do
    printf("\r #{v}")
    sleep 0.3
    printf("\r                                 \r")
    sleep 0.1
  end
end

class Casino
  def initialize
    @@user_wallet = { "CASH" => 100, "WINS" => 0, "LOSSES" => 0 }
    start_menu
  end

  def wallet
    puts "\nYour balance is $ #{@@user_wallet["CASH"]}, Wins: #{@@user_wallet["WINS"]}, Losses: #{@@user_wallet["LOSSES"]}."
    place_bet
  end

  def place_bet
    print "Place your bet: $"
    @@bet = gets.chomp.to_i
    get_bet
  end

  def get_bet
    if @@bet <= @@user_wallet["CASH"]
      @@user_wallet["CASH"] = @@user_wallet["CASH"] - @@bet
      puts "Your current balance is: $#{@@user_wallet["CASH"]}."
    else
      puts "\nYou're too poor for that bet. Don't be an idiot... We're gonna try that again."
      place_bet
    end
  end

  def start_menu
    system('clear')

    puts "\nWelcome to Bottega Casino, prepare to lose your money. Do you want to play Blackjack or Slots?"
    puts "\nYour current balance is: $#{@@user_wallet["CASH"]}."
    puts "Enter 1 for Blackjack or 2 for Slots. 3 to EXIT"
    @@user_input = gets.chomp.to_i
    menu
  end

  def menu
    @@user_input
    if @@user_input == 1
      wallet
      BlackJack.new
      elsif @@user_input == 2
      wallet
      Slots.new
    elsif @@user_input == 3
      end_game
    else
      puts "That's not a vaild choice. Self destruct initiated"
      restart
    end
  end

  def win amount_won
    @@user_wallet["CASH"] += amount_won
    @@user_wallet["WINS"] += 1
    puts "\n Your new balance is: $ #{@@user_wallet["CASH"]}, Wins: #{@@user_wallet["WINS"]}, Losses: #{@@user_wallet["LOSSES"]}."

  end

  def lose
    @@user_wallet["LOSSES"] += 1
    puts "\n Your new balance is: $ #{@@user_wallet["CASH"]}, Wins: #{@@user_wallet["WINS"]}, Losses: #{@@user_wallet["LOSSES"]}."
  end

  def play_again
    puts "\n Press ENTER to REPLAY same bet of #{@@bet}\n      Y to change BET\n      N to return to menu"
    restart_input = gets.chomp.upcase
    if restart_input == "N"
      start_menu
    elsif restart_input == "Y"
      menu
    else
      get_bet
      game_restart
    end
  end

  def game_restart
    if @@user_input == 1

      BlackJack.new
    else @@user_input == 2

      Slots.new
    end
  end

  def restart
    start_menu
  end

  def end_game
  end
end

class Slots < Casino
  def initialize
    system('clear')
    play_slots
  end

  # Logic of the game
  def play_slots
    spin
    three_in_a_row
    play_again
  end

  # generates the 3 numbers as well as check if 3 in a row
  def three_in_a_row
    wheel_1 = rand(1..9)
    wheel_2 = rand(wheel_1..9)
    wheel_3 = rand(wheel_2..9)

    puts "    | #{wheel_1} | #{wheel_2} | #{wheel_3} |"

    if (wheel_1 == wheel_2) && (wheel_2 == wheel_3)

      blink("3 IN A ROW")

      if wheel_1 == 7
        blink("TRIPLE 777 Jackpot!!!")
        win(@@bet * 5)
      else
        win(@@bet * 2)
      end
    else
      blink("--- YOU LOST!!!! ---")
      lose
    end
  end

  # Animation effect
  def spin
    puts "    | - | - | - |"
    puts "    | - | - | - |"
    6.times do
      printf("\r    | #{rand 1..9} | #{rand 1..9} | #{rand 1..9} |")
      sleep 0.3
    end

    puts ""
    puts "#-----FINAL SPIN-----#"
  end
end

class BlackJack < Casino
  @@DECK = {
          "Spades" =>
          ["Ace", "2","3","4","5","6","7","8","9","Jack","Queen","King"],
          "Hearts" =>
          ["Ace", "2","3","4","5","6","7","8","9","Jack","Queen","King"],
          "Clubs" =>
          ["Ace", "2","3","4","5","6","7","8","9","Jack","Queen","King"],
          "Diamonds" =>
          ["Ace", "2","3","4","5","6","7","8","9","Jack","Queen","King"],
    }

  def initialize
    @deck = @@DECK
    @player_hand = []
    @player_hand_value = 0
    @dealer_hand = []
    @dealer_hand_value = 0
    play_blackjack
  end

  def play_blackjack
    system('clear')
    player_new_hand
    dealer_new_hand
    player_choice = ""
    puts "Player hand is #{@player_hand}\nvalues #{@player_hand_value}"
      player_hit
    puts "Player current hand #{@player_hand}\nvalues at #{@player_hand_value}"
    dealer_hit
    compare
  end

  def value_of_card(value, card)
    @hand_value = 0
      case card
      when "Ace"
        @hand_value += 11
      when "Jack"
        @hand_value += 10
      when "Queen"
        @hand_value += 10
      when "King"
        @hand_value += 10
      else
        @hand_value += card.to_i
    end
  end

  def player_new_hand
    @hand = []
    while @hand.count < 2
      suit = @deck.keys.sample
      card = @deck[suit].sample
      @hand << "#{card} of #{suit}"
      @deck[suit].delete(card)
      value_of_card(@player_hand_value, card)
      @player_hand_value += @hand_value
    end
    @player_hand = @hand
  end

  def dealer_new_hand
    @hand = []
    while @hand.count < 2
      suit = @deck.keys.sample
      card = @deck[suit].sample
      @hand << "#{card} of #{suit}"
      @deck[suit].delete(card)
      value_of_card(@dealer_hand_value, card)
      @dealer_hand_value += @hand_value
    end
  end

  def player_hit
    p "Hit or Stay?"
    player_choice = gets.chomp!
    if player_choice.downcase == "hit"
      @hand = []
      suit = @deck.keys.sample
      card = @deck[suit].sample
      @player_hand << "#{card} of #{suit}"
      @deck[suit].delete(card)
      value_of_card(@player_hand_value, card)
      @player_hand_value += @hand_value
      p "Player was dealt a #{card} of #{suit}. Hand now values #{@player_hand_value}."
      if @player_hand_value == 21
        p "You got 21, you should stay. I'll go ahead and call 'Stay' for you"
        sleep 2
      elsif @player_hand_value < 22
        player_hit
      elsif @player_hand_value > 21 && @player_hand.include?(/Ace.*/)
        @player_hand_value -= 10
      else
        p "You bust, sorry. House wins!"
        lose
        play_again
      end
    else
    end
  end

  def dealer_hit
    if @dealer_hand_value > 21
      blink("Dealer Busts, you WIN!")

      win(@@bet * 2)
      play_again
    elsif @dealer_hand_value > 16
      p "Dealer stays"
    else
      @hand = []
      suit = @deck.keys.sample
      card = @deck[suit].sample
      @dealer_hand << "#{card} of #{suit}"
      @deck[suit].delete(card)
      value_of_card(@dealer_hand_value, card)
      @dealer_hand_value += @hand_value
      puts "Dealer was dealt a #{card} of #{suit}. \nHand now values #{@dealer_hand_value}."
      dealer_hit
    end
  end

  def compare
    sleep 2
    puts "\n Dealer has #{@dealer_hand_value}"
    sleep 1
    puts "\n Player has #{@player_hand_value}"
    sleep 2
    if @player_hand_value == @dealer_hand_value
      blink("Push!")
      win(@@bet)
      play_again
    elsif @player_hand_value > @dealer_hand_value
      blink("Player wins!")
      win(@@bet * 2)
      play_again
    else
      blink("House wins!")
      lose
      play_again
    end
  end

end

Casino.new









# require 'byebug'
#
# class Casino
#   def initialize
#     @@user_wallet = { "CASH" => 100, "WINS" => 0, "LOSSES" => 0 }
#     start_menu
#   end
#
#   def wallet
#     puts "\nYour balance is $#{@@user_wallet["CASH"]}."
#     place_bet
#   end
#
#   def place_bet
#     print "Place your bet: $"
#     @@bet = gets.chomp.to_i
#     if @@bet <= @@user_wallet["CASH"]
#       @@user_wallet["CASH"] = @@user_wallet["CASH"] - @@bet
#       puts "Your current balance is: $#{@@user_wallet["CASH"]}."
#     else
#       puts "\nYou're too poor for that bet. Don't be an idiot... We're gonna try that again."
#       place_bet
#     end
#   end
#
#   def start_menu
#     puts "\nWelcome to Bottega Casino, prepare to lose your money. Do you want to play Blackjack or Slots?"
#     puts "Enter 1 for Blackjack or 2 for Slots."
#     user_input = gets.chomp.to_i
#     if user_input == 1
#       wallet
#       start_blackjack
#     elsif user_input == 2
#       wallet
#       start_slots
#     else
#       puts "That's not a vaild choice. Self destruct initiated"
#       restart
#     end
#   end
#
#   def start_blackjack
#     Blackjack.new
#   end
#
#   def start_slots
#     Slots.new
#   end
#
#   def win amount_won
#     @@user_wallet["CASH"] += amount_won
#     @@user_wallet["WINS"] += 1
#     puts "Your new balance is: #{@@user_wallet["CASH"]}."
#     puts "Do you want to play again? Y/N"
#     user_input = gets.chomp.upcase
#     if user_input == "Y"
#       restart
#     else
#       puts "We'll get you next time!"
#     end
#   end
#
#   def lose
#     @@user_wallet["LOSSES"] += 1
#     puts "Your new balance is: #{@@user_wallet["CASH"]}."
#     puts "Do you want to play again? Y/N"
#     user_input = gets.chomp.upcase
#     if user_input == "Y"
#       restart
#     else
#       puts "Thanks for the cash!"
#     end
#   end
#
#   def restart
#     start_menu
#   end
# end
#
# class Slots < Casino
#   def initialize
#     play_game
#   end
#
#   # Logic of the game
#   def play_game
#     spin
#     three_in_a_row
#   end
#
#   # generates the 3 numbers as well as check if 3 in a row
#   def three_in_a_row
#     wheel_1 = rand(1..9)
#     wheel_2 = rand(wheel_1..9)
#     wheel_3 = rand(wheel_2..9)
#
#     puts "    | #{wheel_1} | #{wheel_2} | #{wheel_3} |"
#
#     if (wheel_1 == wheel_2) && (wheel_2 == wheel_3)
#       p "3 in a ROW!"
#       if wheel_1 == 7
#         p "TRIPLE 777 Jackpot!!!"
#         win(@@bet * 5)
#       else
#         win(@@bet * 2)
#       end
#     else
#       p "You lost"
#       lose
#     end
#   end
#
#   # Animation effect
#   def spin
#     6.times do
#       puts "    | #{rand 1..9} | #{rand 1..9} | #{rand 1..9} |"
#       sleep 0.3
#
#       3.times do |x|
#         print x == 0 ?  "    ." : "."
#         sleep 0.05
#       end
#
#       puts ""
#     end
#     puts "#-----FINAL SPIN-----#"
#   end
#
# end
#
# Casino.new
