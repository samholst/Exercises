class Rpssl
  def initialize
    @game_hash = {
                "rock" => {
                  "loses_to" => ["paper", "spock"]
                },
                "paper" => {
                  "loses_to" => ["scissors", "lizard"]
                },
                "scissors" => {
                  "loses_to" => ["rock", "spock"]
                },
                "spock" => {
                  "loses_to" => ["lizard", "papers"]
                },
                "lizard" => {
                  "loses_to" => ["rock", "scissors"]
                  }
                }
    start_game
  end

  def start_game
    arguements = ["rock", "paper", "scissors", "spock", "lizard"]
    player_1 = arguements.sample
    player_2 = arguements.sample
    won player_1, player_2
  end

  def won player1, player2
    if @game_hash[player1]["loses_to"].include? player2
      puts "Player 2 has won! #{player2} > #{player1}"
    elsif @game_hash[player2]["loses_to"].include? player1
      puts "Player 1 has won! #{player1} > #{player2}"
    else
      puts "Stale mate!"
    end
  end
end

game = Rpssl.new
