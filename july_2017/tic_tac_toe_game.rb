class TicTacToe
  def initialize player_one_pick
    x_or_o player_one_pick
    @move_count = 9
    @game_board = {:s_1 => " ",
                   :s_2 => " ",
                   :s_3 => " ",
                   :s_4 => " ",
                   :s_5 => " ",
                   :s_6 => " ",
                   :s_7 => " ",
                   :s_8 => " ",
                   :s_9 => " "
                  }
    play_game
  end

  def play_game
    until three_in_a_row
       player_move @player_one_pick
       three_in_a_row
       player_move @player_two_pick
       three_in_a_row
    end
  end

  def player_move player
   print_board
   puts "#{player}'s, where would you like to move?       #{@move_count} options left."
   move = gets.chomp!
   move = "s_#{move}".intern

   if @game_board[move] == " "
    @game_board[move] = player
    @move_count -= 1
   else
    puts "That spot is already taken"
    player_move player
   end
  end

  def x_or_o player_one_pick
    if player_one_pick == "X"
      @player_one_pick = "X"
      @player_two_pick = "O"
      puts "Player 1 is: #{@player_one_pick}'s."
      puts "Player 2 is: #{@player_two_pick}'s.\n\n"
    else
      @player_one_pick = "O"
      @player_two_pick = "X"
      puts "Player 1 is: #{@player_one_pick}'s."
      puts "Player 2 is: #{@player_two_pick}'s.\n\n"
    end
  end

  def reset_game
    puts "Would you like to play again? (y/n)"
    answer = gets.chomp!.upcase

    if answer == "Y"
      puts "\n\nPlease pick x's or o's (x/o):"
      player_one_pick = gets.chomp!.upcase
      game_start = TicTacToe.new player_one_pick
    else
      puts "Ok...Have a nice day!"
      exit
    end
  end

  def tie_game
    if @move_count == 9
    puts "Cats Game!" 
    reset_game
    end
  end

  def print_board
    puts "\n\n"
    puts "| #{@game_board[:s_7]} | #{@game_board[:s_8]} | #{@game_board[:s_9]} |" + "        | 7 | 8 | 9 |"
    puts "  -   -   -  " + "          -   -   -  "
    puts "| #{@game_board[:s_4]} | #{@game_board[:s_5]} | #{@game_board[:s_6]} |" + "        | 4 | 5 | 6 |"
    puts "  -   -   -  " + "          -   -   -  "
    puts "| #{@game_board[:s_1]} | #{@game_board[:s_2]} | #{@game_board[:s_3]} |" + "        | 1 | 2 | 3 |"
    puts "\n\n"
  end

  def three_in_a_row
    if ([@game_board[:s_1],@game_board[:s_2],@game_board[:s_3]].uniq.length == 1) && 
        (@game_board[:s_1] != " " && @game_board[:s_2] != " " && @game_board[:s_3] != " ")
      print_board
      puts "#{@game_board[:s_1]}'s won!\n\n"
      true
      reset_game
    elsif ([@game_board[:s_4],@game_board[:s_5],@game_board[:s_6]].uniq.length == 1) && 
          (@game_board[:s_4] != " " && @game_board[:s_5] != " " && @game_board[:s_6] != " ")
      print_board
      puts "#{@game_board[:s_4]}'s won!\n\n"
      true
      reset_game
    elsif ([@game_board[:s_7],@game_board[:s_8],@game_board[:s_9]].uniq.length == 1) && 
          (@game_board[:s_7] != " " && @game_board[:s_8] != " " && @game_board[:s_9] != " ")
      print_board
      puts "#{@game_board[:s_7]}'s won!\n\n"
      true
      reset_game
    elsif ([@game_board[:s_1],@game_board[:s_4],@game_board[:s_7]].uniq.length == 1) && 
          (@game_board[:s_1] != " " && @game_board[:s_4] != " " && @game_board[:s_7] != " ")
      print_board
      puts "#{@game_board[:s_1]}'s won!\n\n"
      true
      reset_game
    elsif ([@game_board[:s_2],@game_board[:s_5],@game_board[:s_8]].uniq.length == 1) && 
          (@game_board[:s_2] != " " && @game_board[:s_5] != " " && @game_board[:s_8] != " ")
      print_board
      puts "#{@game_board[:s_2]}'s won!\n\n"
      true
      reset_game
    elsif ([@game_board[:s_3],@game_board[:s_6],@game_board[:s_9]].uniq.length == 1) && 
          (@game_board[:s_3] != " " && @game_board[:s_6] != " " && @game_board[:s_9] != " ")
      print_board
      puts "#{@game_board[:s_3]}'s won!\n\n"
      true
      reset_game
    elsif ([@game_board[:s_1],@game_board[:s_5],@game_board[:s_9]].uniq.length == 1) && 
          (@game_board[:s_1] != " " && @game_board[:s_5] != " " && @game_board[:s_9] != " ")
      print_board
      puts "#{@game_board[:s_1]}'s won!\n\n"
      true
      reset_game
    elsif ([@game_board[:s_3],@game_board[:s_5],@game_board[:s_7]].uniq.length == 1) && 
          (@game_board[:s_3] != " " && @game_board[:s_5] != " " && @game_board[:s_7] != " ")
      print_board
      puts "#{@game_board[:s_3]}'s won!\n\n"
      true
      reset_game 
    elsif @move_count == 0
      print_board
      true
      puts "Cats Game!" 
      reset_game      
    else
      false
    end
  end

  def computer_turn
  end
end

#----------------------------------------#

puts "Please pick x's or o's (x/o):"
player_one_pick = gets.chomp!.upcase
game_start = TicTacToe.new player_one_pick