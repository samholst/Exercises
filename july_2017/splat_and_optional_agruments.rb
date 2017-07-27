def roster player_1, player_2, player_3
  puts player_1
  puts player_2
  puts player_3
end

roster 'Altuve', 'Gottis', 'Springer'

# Converts all arguments passed in to an array
def roster_splat *players
  puts players
end

roster_splat 'Altuve', 'Gottis', 'Springer'

# Creates a hash to use keyword value agruments
def roster_key_word_agrument **players_with_positions
  players_with_positions.each do |player, position|
    puts "Player: #{player}"
    puts "Position: #{position}"
    puts "\n"
  end
end

data = {
          "Altuve": "2nd Base",
          "Alex Bregman": "3rd Base",
          "Evan Gattis": "Catcher",
          "George Springer": "OF"
        }

roster_key_word_agrument data


# Optional Arguments
def invoice options={}
  puts options[:company]
  puts options[:total]
  puts options[:something_else]
end

invoice company: "Google", total: 100.00, something_else: "asfa"
invoice company: "Google", total: 100.00, state: "asfa"
