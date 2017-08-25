
@hits_and_misses_player_1 = {
                              "a" => ["-","-","-","-"],
                              "b" => ["-","-","X","-"],
                              "c" => ["-","X","-","-"],
                              "d" => ["-","-","-","-"]
                            }

x_count = 0

@hits_and_misses_player_1.map do |key, value|
  value.each { |letter| letter == 'X' ? x_count += 1 : '' }
end

p x_count


test_count = 0
#---------- WORKS ----------------#
@hits_and_misses_player_1.each_value do |column|
  p column
  column.map do |letter|
    letter == 'X' ? test_count += 1 : ''
  end
end

p test_count
