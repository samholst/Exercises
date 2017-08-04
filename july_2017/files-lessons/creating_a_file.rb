# r - reading
# a - appending to a file
# w - just writing
# w+ - reading and writing
# a+ - open a file for reading and appending
# r+ - opening a file for updating, both reading and writing

File.open("files-lessons/teams.txt", 'w+') { |f| f.write("twins, yankees, nets") }

file_to_save = File.new("files-lessons/other_teams.txt" , 'w+')
file_to_save.puts("A's, Diamondbacks, Mariners, Marlins")
file_to_save.close
