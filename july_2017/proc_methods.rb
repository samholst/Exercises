full_name = Proc.new { |first, last| first + " " + last }
p full_name["Jordan", "Hudgens"]
p full_name.call("Jordan", "Hudgens")