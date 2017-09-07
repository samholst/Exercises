class String
  def censor bad_word
    self.gsub! "#{bad_word}", "CENSORED"
  end

  def num_of_char
    size
  end
end

p "The bunny was in trouble with the king's bunndy".censor("bunny")
p "The bunny was in trouble with the king's bunndy".num_of_char
