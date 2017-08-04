teams = File.read("files_lessons/teams.txt")
teams_two = File.read("files_lessons/other_teams.txt")

p teams.split(',') + teams_two.split(',')

teams_master = teams.split(',') + teams_two.split(',')

teams_master.each do |team|
  p team.upcase
end
