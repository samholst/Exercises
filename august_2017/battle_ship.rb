class BattleShip

  def initialize
    # Board Variables
    # Need instance variables, with a board hash of each grid square
    # A ship represents an 'S'
    @player_1_grid = {
      								"a" => [" "," "," "," "],
                      "b" => [" "," "," "," "],
                      "c" => [" "," "," "," "],
                      "d" => [" "," "," "," "]
      							}
    @comp_grid = {
                  "a" => [" "," "," "," "],
                  "b" => [" "," "," "," "],
                  "c" => [" "," "," "," "],
                  "d" => [" "," "," "," "]
                }

    @hits_and_misses_player_1 = {
      														"a" => ["-","-","-","-"],
                                  "b" => ["-","-","-","-"],
                                  "c" => ["-","-","-","-"],
      														"d" => ["-","-","-","-"]
      													}
    @hits_and_misses_comp = {
                              "a" => ["-","-","-","-"],
                              "b" => ["-","-","-","-"],
                              "c" => ["-","-","-","-"],
                              "d" => ["-","-","-","-"]
                            }
    play_game
  end

  def play_game # Colton
    @player_ships_sunk = 0
    @comp_ships_sunk = 0

    display_board
     	puts "Select three spaces in a row, in which you would you like to place your ship?"

    player_ship_placement
     	puts "Your opponite has positioned their ship on the field of battle. Prepare for battle."
    computer_ship_placement

    display_board

    until @player_ships_sunk == 1 || @comp_ships_sunk == 1
      puts "Select the target for your ballistic projectile"
      player_guess
      sleep 0.5
  			puts "   /^\\"
  		sleep 0.5
  			puts "  /   \\"
      sleep 0.5
        puts " /     x"
      sleep 0.75

      display_board
      ship_sunk? ? break : ''

      computer_guess
      sleep 0.5
  			puts "   /^\\"
  		sleep 0.5
  			puts "  /   \\"
      sleep 0.5
        puts " x     \\"
      sleep 0.75
      display_board
      ship_sunk? ? break : ''
     end
  end

  def display_board # Sam
     # Computer will attack on the top level board
     # Player 1 will attack on the bottom level board
     # Computer and players ship will not be displayed as of now
     # 'X' represents a hit, 'O' represents a miss. 'S' in the CONSTANT variables represents where the user has placed their ship
     print_ships
     puts "    A B C D  "
     puts "1 | #{@hits_and_misses_comp['a'][0]} #{@hits_and_misses_comp['b'][0]} #{@hits_and_misses_comp['c'][0]} #{@hits_and_misses_comp['d'][0]} |"
     puts "2 | #{@hits_and_misses_comp['a'][1]} #{@hits_and_misses_comp['b'][1]} #{@hits_and_misses_comp['c'][1]} #{@hits_and_misses_comp['d'][1]} |"
     puts "3 | #{@hits_and_misses_comp['a'][2]} #{@hits_and_misses_comp['b'][2]} #{@hits_and_misses_comp['c'][2]} #{@hits_and_misses_comp['d'][2]} |"
     puts "4 | #{@hits_and_misses_comp['a'][3]} #{@hits_and_misses_comp['b'][3]} #{@hits_and_misses_comp['c'][3]} #{@hits_and_misses_comp['d'][3]} |"
     puts "  ___________"
     puts "             "
     puts "1 | #{@hits_and_misses_player_1['a'][0]} #{@hits_and_misses_player_1['b'][0]} #{@hits_and_misses_player_1['c'][0]} #{@hits_and_misses_player_1['d'][0]} |"
     puts "2 | #{@hits_and_misses_player_1['a'][1]} #{@hits_and_misses_player_1['b'][1]} #{@hits_and_misses_player_1['c'][1]} #{@hits_and_misses_player_1['d'][1]} |"
     puts "3 | #{@hits_and_misses_player_1['a'][2]} #{@hits_and_misses_player_1['b'][2]} #{@hits_and_misses_player_1['c'][2]} #{@hits_and_misses_player_1['d'][2]} |"
     puts "4 | #{@hits_and_misses_player_1['a'][3]} #{@hits_and_misses_player_1['b'][3]} #{@hits_and_misses_player_1['c'][3]} #{@hits_and_misses_player_1['d'][3]} |"
   end

  def player_ship_placement # Deven
    puts "Select three spaces in a row, separated by a comma, in which you would you like to place your ship (ie: a1, a2, a3): "

    positions = gets.chomp.split(',')

    new_array = []

    positions.each do |e|
      e = e.split(//).delete_if {|x| x == ' '}
      new_array << e
    end

    positions = new_array.join().split(//)

    @player_1_grid[positions[0]][positions[1].to_i - 1] = "S"
    @player_1_grid[positions[2]][positions[3].to_i - 1] = "S"
    @player_1_grid[positions[4]][positions[5].to_i - 1] = "S"
  end

	# Values get passed in as 'a1' or 'b2' as a STRING
	def player_hit_miss_or_invalid(grid_position) # Michael
    values = grid_position.split(//)

    player_index = @hits_and_misses_player_1[values[0]][values[1].to_i - 1]
    comp_index = @comp_grid[values[0]][values[1].to_i - 1]

    if player_index == "-" && comp_index == 'S'
      # hit
      @hits_and_misses_player_1[values[0]][values[1].to_i - 1] = "X"
      puts "HIT! Commander, I hit their ship."
    elsif player_index == "-" && comp_index == ' '
      # miss
      @hits_and_misses_player_1[values[0]][values[1].to_i - 1] = "O"
      puts "Someone is looking out for him, I seem to have missed!"
    else
      # invalid
      puts "You have already guessed #{grid_position}. Try again."
      player_guess
    end
  end

	# Values get passed in as 'a1' or 'b2' as a STRING
	def comp_hit_miss_or_invalid(grid_position)
  	values = grid_position.split(//)

    comp_index = @hits_and_misses_comp[values[0]][values[1].to_i]
    player_index = @player_1_grid[values[0]][values[1].to_i]

    if comp_index == '-' && player_index == 'S'
      # hit
      @hits_and_misses_comp[values[0]][values[1].to_i] = "X"
      puts "HIT! Commander, they hit our ship."
    elsif comp_index == '-' && player_index == ' '
      # miss
      @hits_and_misses_comp[values[0]][values[1].to_i] = "O"
      puts "Someone is looking out for us, they seem to have missed!"
    else
      # invalid
      computer_guess
    end
  end

  def ship_sunk?
    x_player_count = 0
    x_comp_count = 0

    @hits_and_misses_player_1.map do |key, value|
      value.each { |letter| letter == 'X' ? x_player_count += 1 : '' }
    end

    @hits_and_misses_comp.map do |key, value|
      value.each { |letter| letter == 'X' ? x_comp_count += 1 : '' }
    end

    if x_comp_count >= 3
      puts "Bad news... our ship has been sunk!"
      @player_ships_sunk += 1
      return true
    elsif x_player_count >= 3
      puts "Good news... we have sunk his ship!"
      @comp_ships_sunk += 1
      return true
    else
      return false
    end
  end

  def computer_ship_placement2 # Cassidy
    #randomized placement
    # arr = []
    # letters = ['a','b','c','d']
    # arr  << letters.sample << rand(1..4).to_s
    # arr.join()
    # @comp_grid["a"][1] = "S"
    # @comp_grid["b"][1] = "S"
    # @comp_grid["c"][1] = "S"
  end

  def computer_ship_placement # Cassidy
    #randomized placement
    #Brayden typed some letters here
    @array = ['a1', 'a2', 'a3', 'a4', 'b1', 'b2', 'b3', 'b4', 'c1', 'c2', 'c3', 'c4', 'd1', 'd2', 'd3', 'd4']
    @choice = []
    letters = ['a','b','c','d']
    @choice  << letters.sample << rand(1..4)

    direction = rand(1..2)
    if direction == 1
      vertical
    else
      horizontal
    end
  end

  def vertical
      validation =  @choice[1] +2
      validation > 4 ? can_place = 'invalid' : can_place = 'valid'
    case can_place
      when 'invalid'
        @comp_grid[@choice[0]][@choice[1] ] = "S"
        @comp_grid[@choice[0]][@choice[1] - 1] = "S"
        @comp_grid[@choice[0]][@choice[1] - 2] = "S"
      when 'valid'
        @comp_grid[@choice[0]][@choice[1] ] = "S"
        @comp_grid[@choice[0]][@choice[1] + 1] = "S"
        @comp_grid[@choice[0]][@choice[1] + 2] = "S"
    end
  end

  def horizontal
      validation =  @choice[0].next.next
      validation > 'd' ? can_place = 'invalid' : can_place = 'valid'
    case can_place
      when 'invalid'
        @comp_grid[@choice[0]][@choice[1] ] = "S"
        @comp_grid[(@choice[0].ord-1).chr][@choice[1]] = "S"
        @comp_grid[(@choice[0].ord-2).chr][@choice[1]] = "S"
      when 'valid'
        @comp_grid[@choice[0]][@choice[1] ] = "S"
        @comp_grid[@choice[0].next][@choice[1]] = "S"
        @comp_grid[@choice[0].next.next][@choice[1]] = "S"
    end
  end

  def computer_guess # Austin
    comp_shot = []
    letters = ['a','b','c','d']
    comp_shot  << letters.sample << rand(0..3).to_s
    grid_position = comp_shot.join()

    puts "The computer fires on the coordinants #{grid_position}"
    comp_hit_miss_or_invalid(grid_position)
  end

  def player_guess # Kalani
    puts "Select your target, Commander.  example (d3)"
    player_shot = gets.chomp!.downcase
    puts "Coordinants #{player_shot}, FIRE!"
    player_hit_miss_or_invalid(player_shot)
  end

  def print_ships
    puts "GRID KEY"
    puts "    A B C D  "
    puts "1 | #{@player_1_grid['a'][0]} #{@player_1_grid['b'][0]} #{@player_1_grid['c'][0]} #{@player_1_grid['d'][0]} |"
    puts "2 | #{@player_1_grid['a'][1]} #{@player_1_grid['b'][1]} #{@player_1_grid['c'][1]} #{@player_1_grid['d'][1]} |"
    puts "3 | #{@player_1_grid['a'][2]} #{@player_1_grid['b'][2]} #{@player_1_grid['c'][2]} #{@player_1_grid['d'][2]} |"
    puts "4 | #{@player_1_grid['a'][3]} #{@player_1_grid['b'][3]} #{@player_1_grid['c'][3]} #{@player_1_grid['d'][3]} |"
    puts "  ___________"
    puts "             "
    puts "1 | #{@comp_grid['a'][0]} #{@comp_grid['b'][0]} #{@comp_grid['c'][0]} #{@comp_grid['d'][0]} |"
    puts "2 | #{@comp_grid['a'][1]} #{@comp_grid['b'][1]} #{@comp_grid['c'][1]} #{@comp_grid['d'][1]} |"
    puts "3 | #{@comp_grid['a'][2]} #{@comp_grid['b'][2]} #{@comp_grid['c'][2]} #{@comp_grid['d'][2]} |"
    puts "4 | #{@comp_grid['a'][3]} #{@comp_grid['b'][3]} #{@comp_grid['c'][3]} #{@comp_grid['d'][3]} |"
    puts "END GRID KEY"
    puts ""
  end

end

run = BattleShip.new
run
